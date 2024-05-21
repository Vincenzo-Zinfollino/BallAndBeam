/*
 * implementation.c
 *
 *  Created on: Mar 22, 2024
 *      Author: zinfo
 */

#include "implementation.h"
#include "main.h"
#include <stdint.h> // used for uint_ types
#include <math.h>
#include "ringbuffer.h"
#include "lidarvl53.h"
#include "pid_controller.h"

uint8_t ready=0;
uint16_t mill;
system_t sys;
pid_controller_t pid_pos;

float offset_encoder =0.f;
float u_ref;

uint16_t millimeter1;
float distance=0;





void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{

}


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim){

	if(htim->Instance== TIM10){
		 //printf("Inter \n");
		 //fflush(stdout);


		 read_encoder(&sys);


	}
}


void setupReadingTimer(TIM_HandleTypeDef *htim){

	uint16_t ARR=52500;

    //ARR=(Read_TS*clock_freq)/Prescaler_lidar;
	__HAL_TIM_SET_PRESCALER(htim, Prescaler_lidar);
	__HAL_TIM_SET_AUTORELOAD(htim, ARR);

	HAL_TIM_Base_Start_IT(htim); /* start the sampling timer */

	htim->Instance->EGR = TIM_EGR_UG;
}



void system_init(system_t *sys, uint8_t dir,uint32_t ts, TIM_HandleTypeDef *htim1){

	uint8_t i;

	for (i=0; i<5; i++){

		rbclear( (((ringbuffer_t *) sys)+i ) );
	}

	//initializing lidar sensor

	//lidar_init( dir);

  	cont_lidar_init( dir, ts);// continuous reading inizializzation

  	sys->htim_encoder1=htim1;



}

void measure_ball_position(system_t *sys){

	uint16_t pos=0;
	//pos=lidar_lee_mm(DIR_S);
	//mill=pos;

}


void ball_estimation(system_t *sys){

	float pos;
	float prec, succ;
	float vel=0;
	float vel_est;
	float acc=0;
	float acc_est;

	float pos_1,pos_2;

	uint8_t i=0;

	for(i=0; i<5;i++){

		rbget(&sys->Ball_pos,i,&pos);
		prec+=pos;
	}

	prec /=5; //  mean of the last 5 values of position in the buffer

	rblast(&sys->Ball_pos,&pos_2);
	rbget(&sys->Ball_pos, ((&sys->Ball_pos.tail)-1),&pos_1);

	pos=0.60*pos_2+(1-0.60)*prec; // Poors man Kalman filter
	rbpush(&sys->Ball_pos_filtered,pos);


    rblast(&sys->Ball_vel,&vel);

	vel_est=0.30*vel+(1-0.30)*((pos_2-pos_1)/Read_TS);
    //vel_est=0.80*vel+(1-0.8)*((pos-pos_1)/Read_TS);
	rbpush(&sys->Ball_vel,vel_est);


	rblast(&sys->Ball_acc,&acc);

	rbget(&sys->Ball_vel, (&sys->Ball_vel.tail)-1,&vel);

	acc_est=0.80*acc+(1+0.8)*((vel_est-vel)/Read_TS);

	rbpush(&sys->Ball_acc, acc_est);



}


void read_encoder(system_t *sys){

	uint16_t counter ;
	TIM_HandleTypeDef *htim1;
	float displacement;

	htim1=sys->htim_encoder1;

	 counter = (htim1->Instance->CNT);
	    if(counter >= htim1->Instance->ARR){
	        counter = (htim1->Instance->ARR-1) - (counter % 1<<16); /* handle underflow */
	        htim1->Instance->CNT = counter; /* correct cnt value */
	    }


	    displacement = (float) (2*M_PI*counter/(htim1->Instance->ARR)-offset_encoder);

	    if(displacement > 2*M_PI){
	       	displacement = 2*M_PI; /* clamping */
	   	}

	    if(displacement > M_PI){
			displacement = displacement - (2*M_PI); // redefining the domain between -PI and +PI
		}

	    rbpush(&sys->q0,displacement);


}



void apply_velocity_input(TIM_HandleTypeDef *htim1){


	/* T_C = steps*clock_period */
    int8_t dir;
    uint32_t f;
    int32_t stepdir;
    uint32_t steps, ARR, CCR;
    uint16_t prescaler1;




   //dir = u_ref > 0 ?  GPIO_PIN_SET : GPIO_PIN_RESET;
   //HAL_GPIO_WritePin(StepperDir_GPIO_Port, StepperDir_Pin, dir);

   prescaler1= (uint16_t) 42000;//12000 ;//8400;
   f=HAL_RCC_GetPCLK1Freq()*2;
   ARR= fabs(u_ref) < 0.01 ? 0:(uint32_t)(RESOLUTION*f/(fabs(u_ref)*16*prescaler1));
   CCR= ARR /2;
   __HAL_TIM_SET_PRESCALER(htim1, prescaler1);//2625
   __HAL_TIM_SET_AUTORELOAD(htim1, ARR);
   __HAL_TIM_SET_COMPARE(htim1, TIM_CHANNEL_1, CCR);
   htim1->Instance->EGR = TIM_EGR_UG;


    return;

}

/*void PID_controller_position(system_t *sys, pid_controller_t *pid , float setpoint){

	float set_point1,lidar_measure,encoder_measure,alpha, u0,tc0,u_star;
	float vcmi,vcme; //velocità del centro di massa della sfera

	float hi,hm,he,theta,x2;



	set_point1=setpoint;


	rblast(&sys->q0,&encoder_measure);// rappresenta l'angolo theta
	rblast(&sys->Ball_pos_filtered,&lidar_measure);// rappresenta la posizione misurata

	if(!encoder_measure==0){
		theta=encoder_measure;
	}else
		{
		theta=0.01;
		}

	alpha=(theta*MOTOR_ARM_LENGTH)/BEAM_LENGTH;

	hi=lidar_measure*sinf(alpha);
	hi =fabs(hi);

	vcmi=sqrtf((10/7)*G_CONST*hi);

	PID_update(pid,set_point1, lidar_measure,T_CONTROL);

	u0=pid->out;

	x2=lidar_measure+u0;

	he=fabs(x2*sinf(alpha));
	vcme=sqrtf((10/7)*G_CONST*he);

	//hm=(powf((vcme-vcmi),2)/G_CONST)*(7/10);
	hm=(((vcme-vcmi)*(vcme-vcmi))/G_CONST)*(7/10);
	u_star=asinf(hm/x1);


    if (fabs(u_star-encoder_measure)<0.01){
    	tc0= 1000000;
    }else{
    tc0 = sqrtf(2*M_PI*fabs(u_star-encoder_measure)/0.4);//1.05
    }

    u0=(u_star-encoder_measure)/tc0;


    u_ref=u0;


}

*/



void PID_controller_position(system_t *sys, pid_controller_t *pid , float setpoint){

	  int8_t dir;

	float set_point1,lidar_measure,encoder_measure,alpha, u0,tc0,u_star;
	float vcmi,vcme; //velocità del centro di massa della sfera

	float hi,hm,he,theta,x2;

	float alfa_star=0;

	set_point1=setpoint;


	rblast(&sys->q0,&encoder_measure);// rappresenta l'angolo theta
	//rblast(&sys->Ball_pos_filtered,&lidar_measure);// rappresenta la posizione misurata
	rblast(&sys->Ball_pos,&lidar_measure);



	PID_update(pid,set_point1, lidar_measure,T_CONTROL);

	u0=pid->out;




	//u0>0
    if(u0<0){

    	alfa_star= (u0-30)*(M_PI/6-0)/(400-30);
    	HAL_GPIO_WritePin( DirStepper_GPIO_Port, DirStepper_Pin, GPIO_PIN_RESET);
    	printf(" POS_Alfa %f\n",alfa_star);
    		 fflush(stdout);

    }else{
    	alfa_star= (u0-30)*(0-M_PI/6)/(400-30)+(-M_PI/6);
    	HAL_GPIO_WritePin( DirStepper_GPIO_Port, DirStepper_Pin, GPIO_PIN_SET);//invertito
    	printf(" NEG_Alfa %f\n",alfa_star);
    	    		 fflush(stdout);

    }

    u_star=(alfa_star*BEAM_LENGTH)/MOTOR_ARM_LENGTH;

   // dir = u0 > 0 ?  GPIO_PIN_SET : GPIO_PIN_RESET;
  // HAL_GPIO_WritePin(StepperDir_GPIO_Port, StepperDir_Pin, dir);


    if (fabs(u_star-encoder_measure)<0.01){
    	tc0= 1000000;
    }else{
    tc0 = sqrtf(2*M_PI*fabs(u_star-encoder_measure)/0.1);//0.4   1.05
    }

    u0=(u_star-encoder_measure)/tc0;

    disp1=u0;

    u_ref=u0;




}






