#include "main.h"
#include <stdint.h> // used for uint_ types
#include<math.h>
#include "ringbuffer.h"
#include "lidarvl53.h"
#include "pid_controller.h"




#define G_CONST 9.80306 //Gravity acceleration @Bari
#define BEAM_LENGTH 400 // Length of the beam [mm]
#define MOTOR_ARM_LENGTH 52  // Length of the motor arm [mm]
#define Ball_Mass 45 // Mass of the ball [g]
#define Ball_Radius 22.5 // Radius of the ball [mm]

#define Read_TS  110   //lidar sampling time [ms]
#define Prescaler_lidar 16
#define clock_freq 84000000
#define T_CONTROL 0.021
#define RESOLUTION 0.0314159


//PID Values

#define KP 20 //P=-13.2717
#define TI 0 //I=0 TI=KP/KI
#define TD -9.7801  //  D=1.3575 TD=KP/D
#define N 140.8703

typedef struct system{

	ringbuffer_t q0; // angular position of the motor


	ringbuffer_t Ball_pos; // position of the ball on the beam [ 0 to Beam_Lenght]
	ringbuffer_t Ball_pos_filtered;
	ringbuffer_t Ball_vel;
	ringbuffer_t Ball_acc;
	TIM_HandleTypeDef *htim_encoder1;


}system_t;


extern uint8_t ready; // New measure ready Flag (correlated to GPIO interrupt)
extern system_t sys;
extern uint16_t mill;
extern float distance;
extern float disp1;

void setupReadingTimer(TIM_HandleTypeDef *htim);
void system_init(system_t *sys,uint8_t dir, uint32_t ts, TIM_HandleTypeDef *htim1);

void measure_ball_position(system_t *sys);

void read_encoder(system_t *sys);

void apply_velocity_input(TIM_HandleTypeDef *htim1);
void PID_controller_position(system_t *sys, pid_controller_t *pid , float setpoint);

