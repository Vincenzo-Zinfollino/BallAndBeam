


#define lidar_max_mm 200

#ifndef LIBERRIAS_VL53L0X_LIDARVL53_H_
#define LIBERRIAS_VL53L0X_LIDARVL53_H_

#define DIR_S 0x52  //I2C Address of the sensor




#include "../../Librerie/VL53L0X/core/inc/vl53l0x_api.h"
#include "main.h"


void lidar_init(uint8_t dir);
void cont_lidar_init(uint8_t dir,uint32_t ts);
void startMeasurement();
uint16_t getRangeData();
uint16_t lidar_lee_mm(uint8_t dir);
float lidar_lee_cm(uint8_t dir);
uint8_t lidar_set_dir(uint8_t dir);

#endif /* LIBERRIAS_VL53L0X_LIDARVL53_H_ */
