#include "main.h"
#include <stdint.h> // used for uint_ types
#include<math.h>
#include "ringbuffer.h"
#include "lidarvl53.h"
#include "pid_controller.h"



#define Read_TS  110   //lidar sampling time [ms]
#define Prescaler_lidar 2
#define clock_freq 84000000
#define T_CONTROL 0.021
#define RESOLUTION 0.0314159



typedef struct system{

	ringbuffer_t q0; // angular position of the motor


	ringbuffer_t Ball_pos; // position of the ball on the beam [ 0 to Beam_Lenght]
	ringbuffer_t Ball_pos_filtered;
	ringbuffer_t Ball_vel;
	ringbuffer_t Ball_acc;


	float set_point;
	float last_pid_out;


	TIM_HandleTypeDef *htim_encoder1;
	TIM_HandleTypeDef *htim_PWM;
	TIM_HandleTypeDef *htim_HCSR04;



	pid_controller_t pid_pos;


}system_t;


extern uint8_t ready; // New measure ready Flag (correlated to GPIO interrupt)
extern system_t sys;
extern uint16_t mill;
extern float distance;
extern float disp1;

void setupReadingTimer(TIM_HandleTypeDef *htim);
void system_init(system_t *sys,uint8_t dir, uint32_t ts, TIM_HandleTypeDef *htim1,TIM_HandleTypeDef *htim2,TIM_HandleTypeDef *htim3,pid_controller_t pid_pos);

void measure_ball_position(system_t *sys);

void read_encoder(system_t *sys);

void apply_velocity_input(system_t *sys,TIM_HandleTypeDef *htim1);
void PID_controller_position(system_t *sys);

