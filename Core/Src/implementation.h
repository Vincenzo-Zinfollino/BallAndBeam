#include "main.h"
#include <stdint.h> // used for uint_ types
#include<math.h>
#include "ringbuffer.h"
#include "lidarvl53.h"




#define g 9.80306 //Gravity acceleration @Bari
#define Beam_Lenght 400 // Length of the beam [mm]
#define Ball_Mass 15 // Mass of the ball [g]
#define Ball_Radius 22.5 // Radius of the ball [mm]

#define Read_TS  210   //lidar sampling time [ms]
#define Prescaler_lidar 1343
#define clock_freq 84000000


typedef struct system{

	ringbuffer_t q0; // angular position of the motor


	ringbuffer_t Ball_pos; // position of the ball on the beam [ 0 to Beam_Lenght]
	ringbuffer_t Ball_pos_filtered;
	ringbuffer_t Ball_vel;
	ringbuffer_t Ball_acc;


}system_t;


extern uint8_t ready; // New measure ready Flag (correlated to GPIO interrupt)
extern system_t sys;
extern uint16_t mill;

void setupReadingTimer(TIM_HandleTypeDef *htim);
void system_init(system_t *sys,uint8_t dir, uint32_t ts);

void measure_ball_position(system_t *sys);
