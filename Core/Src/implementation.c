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

uint8_t ready=0;
uint16_t mill;
system_t sys;

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if(GPIO_Pin == LidarTrigger_Pin) // If The INT Source Is EXTI Line9 (A9 Pin)
    {
     ready=1; // lidar new lecture ready
     //mill=lidar_lee_mm(DIR_S);


    }
}


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim){

	if(htim->Instance== TIM10){
		 printf("Inter \n");
		 fflush(stdout);

		//mill= lidar_lee_mm(DIR_S);

		 if (ready==1){

			 printf("Inter1 \n");
			fflush(stdout);

			measure_ball_position(&sys);
			//ready=0;

		}
	}
}


void setupReadingTimer(TIM_HandleTypeDef *htim){

	uint16_t ARR=62499;

  //	ARR=(Read_TS*clock_freq)/Prescaler_lidar;
	__HAL_TIM_SET_PRESCALER(htim, Prescaler_lidar);
	__HAL_TIM_SET_AUTORELOAD(htim, ARR);

	HAL_TIM_Base_Start_IT(htim); /* start the sampling timer */

	htim->Instance->EGR = TIM_EGR_UG;
}



void system_init(system_t *sys, uint8_t dir,uint32_t ts){

	uint8_t i;

	for (i=0; i<4; i++){

		rbclear( (((ringbuffer_t *) sys)+i ) );
	}

	//initializing lidar sensor

	//lidar_init( dir);

  	cont_lidar_init( dir, ts);


}

void measure_ball_position(system_t *sys){

	uint16_t pos=0;
	//pos=lidar_lee_mm(DIR_S);
	//mill=pos;

}


void ball_estimation(system_t *sys){

	float pos;
	float prec, succ;
	float vel;
	float velest;

	float pos_1,pos_2;


	uint8_t i=0;

	for(i=0; i<5;i++){

		rbget(&sys->Ball_pos,i,&pos);
		prec+=pos;

	}

	for(i=0;i<5;i++){
		rbget(&sys->Ball_pos,5+i,&pos);
		succ+=pos;
	}

	prec /=5;

	rblast(&sys->Ball_pos,&pos_2);
	rbget(&sys->Ball_pos, &sys->Ball_pos.tail-1,&pos_1);


    rblast(&sys->Ball_vel,&vel);

	velest=0.80*vel+(1-0.8)*((pos_2-pos_1)/Read_TS);



	rblast(&sys->Ball_pos,&pos_2);





	rbget(&sys->Ball_pos,1,&pos);









}

