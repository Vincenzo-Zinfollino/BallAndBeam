
#include "lidarvl53.h"

VL53L0X_RangingMeasurementData_t RangingData;
VL53L0X_Dev_t  vl53l0x_c; // center module
VL53L0X_DEV    Dev = &vl53l0x_c;
uint32_t refSpadCount;
  uint8_t isApertureSpads;
  uint8_t VhvSettings;
  uint8_t PhaseCal;

extern I2C_HandleTypeDef hi2c1;


void lidar_init(uint8_t dir)
{
	  Dev->I2cHandle = &hi2c1;// i2c port to be used
	  Dev->I2cDevAddr = dir;
      Dev->comms_type=1;
      Dev->comms_speed_khz=100;//  i2c a 400khz prima era 400  variato a 100

      VL53L0X_WaitDeviceBooted( Dev );
	  VL53L0X_DataInit( Dev );
	  VL53L0X_StaticInit( Dev );
	  VL53L0X_PerformRefCalibration(Dev, &VhvSettings, &PhaseCal);
	  VL53L0X_PerformRefSpadManagement(Dev, &refSpadCount, &isApertureSpads);
	  VL53L0X_SetDeviceMode(Dev, VL53L0X_DEVICEMODE_SINGLE_RANGING);
	  VL53L0X_SetLimitCheckEnable(Dev, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, 1);
	  VL53L0X_SetLimitCheckEnable(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, 1);
	  //VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, (FixPoint1616_t)(0.1*65536)); //long range timing
	  VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, (FixPoint1616_t)(0.25*65536)); //high accuracy
	  VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, (FixPoint1616_t)(18*65536));
	  VL53L0X_SetMeasurementTimingBudgetMicroSeconds(Dev, 20000);
	  VL53L0X_SetVcselPulsePeriod(Dev, VL53L0X_VCSEL_PERIOD_PRE_RANGE, 18);
	  VL53L0X_SetVcselPulsePeriod(Dev, VL53L0X_VCSEL_PERIOD_FINAL_RANGE, 14);
	  VL53L0X_SetGpioConfig(Dev,LidarTrigger_Pin, VL53L0X_HISTOGRAMMODE_DISABLED,VL53L0X_REG_SYSTEM_INTERRUPT_GPIO_NEW_SAMPLE_READY,VL53L0X_INTERRUPTPOLARITY_HIGH);
	  VL53L0X_SetRangeFractionEnable( Dev, 1);

}

void cont_lidar_init(uint8_t dir, uint32_t ts)
{
	  Dev->I2cHandle = &hi2c1;// i2c port to be used
	  Dev->I2cDevAddr = dir;
      Dev->comms_type=1;
      Dev->comms_speed_khz=100;//  i2c a 400khz prima era 400  variato a 100

      VL53L0X_WaitDeviceBooted( Dev );
	  VL53L0X_DataInit( Dev );
	  VL53L0X_StaticInit( Dev );
	  VL53L0X_PerformRefCalibration(Dev, &VhvSettings, &PhaseCal);
	  VL53L0X_PerformRefSpadManagement(Dev, &refSpadCount, &isApertureSpads);
	  VL53L0X_SetDeviceMode(Dev, VL53L0X_DEVICEMODE_CONTINUOUS_TIMED_RANGING);
	  VL53L0X_SetLimitCheckEnable(Dev, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, 1);
	  VL53L0X_SetLimitCheckEnable(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, 1);
	  //VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, (FixPoint1616_t)(0.1*65536)); //long range timing
	  VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, (FixPoint1616_t)(0.25*65536)); //high accuracy
	  VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, (FixPoint1616_t)(18*65536));
	  VL53L0X_SetMeasurementTimingBudgetMicroSeconds(Dev, 200000);
	  VL53L0X_SetVcselPulsePeriod(Dev, VL53L0X_VCSEL_PERIOD_PRE_RANGE, 18);
	  VL53L0X_SetVcselPulsePeriod(Dev, VL53L0X_VCSEL_PERIOD_FINAL_RANGE, 14);
	 // VL53L0X_SetInterMeasurementPeriodMilliSeconds ( Dev, 250);
	  VL53L0X_SetInterMeasurementPeriodMilliSeconds ( Dev, ts);
	  VL53L0X_SetGpioConfig(Dev,LidarTrigger_Pin, VL53L0X_HISTOGRAMMODE_DISABLED,VL53L0X_REG_SYSTEM_INTERRUPT_GPIO_NEW_SAMPLE_READY,VL53L0X_INTERRUPTPOLARITY_HIGH);
	 // VL53L0X_SetRangeFractionEnable( Dev, 1);

}


uint16_t lidar_lee_mm(uint8_t dir)
{
	uint16_t lidarmill;
	Dev->I2cDevAddr = dir;
 	VL53L0X_PerformSingleRangingMeasurement(Dev, &RangingData);
    lidarmill=RangingData.RangeMilliMeter;
    if (lidarmill>lidar_max_mm) lidarmill=lidar_max_mm;
 	return(lidarmill);
    }


float lidar_lee_cm(uint8_t dir)
{
	return((float)lidar_lee_mm(dir)/10.0);
}

uint8_t lidar_set_dir(uint8_t dir)
{
	uint8_t status = VL53L0X_SetDeviceAddress(Dev, dir << 1);
	return(status);

}


void clearInterrupt()
{
	VL53L0X_ClearInterruptMask(DIR_S,1);
}

void startMeasurement()
{
	 VL53L0X_StartMeasurement( Dev);


}

void stopMeasurement()
{
	 VL53L0X_StopMeasurement ( Dev);

}


uint16_t getRangeData(){

	uint16_t lidarmill=0;


		Dev->I2cDevAddr = DIR_S;
		VL53L0X_GetRangingMeasurementData(Dev, &RangingData);
	    lidarmill=RangingData.RangeMilliMeter;
	   if (lidarmill>lidar_max_mm) lidarmill=lidar_max_mm;
	    VL53L0X_ClearInterruptMask(Dev, 0);

	 	return(lidarmill);


}




