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
		//HCSR04_Read();




		PID_controller_position(&sys);
		apply_velocity_input(&sys,sys.htim_PWM);


	}
}

// la lettura dal sensore lidar è effettuata ogni 20ms il loop di controllo ( usando Prescaler_lidar e ARR=55999) avviene all incirca ogni 1,3 ms

void setupReadingTimer(TIM_HandleTypeDef *htim){


	uint16_t ARR=55999;


	__HAL_TIM_SET_PRESCALER(htim, Prescaler_lidar);
	__HAL_TIM_SET_AUTORELOAD(htim, ARR);

	HAL_TIM_Base_Start_IT(htim); /* start the sampling timer */

	htim->Instance->EGR = TIM_EGR_UG;
}



void system_init(system_t *sys, uint8_t dir,uint32_t ts, TIM_HandleTypeDef *htim1,TIM_HandleTypeDef *htim2,TIM_HandleTypeDef *htim3,pid_controller_t pid_pos){

	uint8_t i;

	for (i=0; i<5; i++){

		rbclear( (((ringbuffer_t *) sys)+i ) );
	}

	//initializing lidar sensor
  	cont_lidar_init( dir, ts);// continuous reading inizializzation

  	sys->htim_encoder1=htim1;
  	sys->htim_PWM=htim2;
  	sys->htim_HCSR04=htim3;
  	sys->pid_pos=pid_pos;




}



// questo metodo di filtraggio dei dati anche se assicura una riduzione del rumore
//sui dati non viene utilizzato poichè rallenta troppo il loop di controllo

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

	// Poors man Kalman filter
	pos=0.40*pos_2+(1-0.40)*prec;
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



void apply_velocity_input(system_t *sys,TIM_HandleTypeDef *htim1){


	/* T_C = steps*clock_period */
    int8_t dir;
    uint32_t f;
    int32_t stepdir;
    uint32_t steps, ARR, CCR;
    uint16_t prescaler1;

    float u=sys->last_pid_out;


   prescaler1= (uint16_t) 5000;//30000;//12000 ;//8400;
   f=HAL_RCC_GetPCLK1Freq()*2;
   //ARR= fabs(u_ref) < 0.01 ? 0:(uint32_t)(RESOLUTION*f/(fabs(u_ref)*16*prescaler1));/// modificato 0.01
   ARR= (uint32_t)(RESOLUTION*f/(fabs(u)*16*prescaler1));
   CCR= ARR /2;
   __HAL_TIM_SET_PRESCALER(htim1, prescaler1);//2625
   __HAL_TIM_SET_AUTORELOAD(htim1, ARR);
   __HAL_TIM_SET_COMPARE(htim1, TIM_CHANNEL_1, CCR);
   htim1->Instance->EGR = TIM_EGR_UG;


    return;

}




void PID_controller_position(system_t *sys){

	  int8_t dir;
	  pid_controller_t *pid_pos;
	  pid_pos=&sys->pid_pos;

	float set_point1,lidar_measure,encoder_measure,alpha, u0,tc0,u_star;


    // definizione del set point
	set_point1=100.00;


	rblast(&sys->q0,&encoder_measure);// rappresenta l'angolo theta
	//rblast(&sys->Ball_pos_filtered,&lidar_measure);// rappresenta la posizione  filtrata
	rblast(&sys->Ball_pos,&lidar_measure);// rappresenta la posizione acquisita dal sensore


	PID_update(pid_pos,set_point1, lidar_measure,T_CONTROL);


	u0=pid_pos->out; // uscita del PID
	//printf(" PID_OUT %f\n",u0);
	// fflush(stdout);



    if(u0>0){

    	HAL_GPIO_WritePin( DirStepper_GPIO_Port, DirStepper_Pin, GPIO_PIN_SET);


    }else{

    	HAL_GPIO_WritePin( DirStepper_GPIO_Port, DirStepper_Pin, GPIO_PIN_RESET);//invertito

    }


    u_star=u0;




    if (fabs(u0-encoder_measure)<0.01){
    	tc0= 1000000;
    }else{
    //tc0 = sqrtf(2*M_PI*fabs(u0-encoder_measure)/0.9); // 0.9 è l'accellerazione massima
      tc0 = sqrtf(2*M_PI*fabs(u0-encoder_measure)/1.25);
    }

    u0=(fabs(u0-encoder_measure))/tc0;

    //--mostrare uscita cicloidale
    disp1=u0;
    sys->last_pid_out=u0;

    //uscita pid diretta senza traiettoria cicloidale

    //disp1=u_star;
    //sys->last_pid_out=u_star;

}




