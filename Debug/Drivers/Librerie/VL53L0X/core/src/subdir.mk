################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.c \
../Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.c \
../Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.c \
../Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.c \
../Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.c 

OBJS += \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.o \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.o \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.o \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.o \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.o 

C_DEPS += \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.d \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.d \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.d \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.d \
./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Librerie/VL53L0X/core/src/%.o Drivers/Librerie/VL53L0X/core/src/%.su Drivers/Librerie/VL53L0X/core/src/%.cyclo: ../Drivers/Librerie/VL53L0X/core/src/%.c Drivers/Librerie/VL53L0X/core/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/vincenzo/Documents/UNI/Robotics/PROJECT/RangeTest/Drivers/Librerie/VL53L0X" -I"/Users/vincenzo/Documents/UNI/Robotics/PROJECT/RangeTest/Drivers/Librerie/VL53L0X/core/inc" -I"/Users/vincenzo/Documents/UNI/Robotics/PROJECT/RangeTest/Drivers/Librerie/VL53L0X/platform/inc" -include"/Users/vincenzo/Documents/UNI/Robotics/PROJECT/RangeTest/Drivers/Librerie/VL53L0X/platform/inc/vl53l0x_types.h" -include"/Users/vincenzo/Documents/UNI/Robotics/PROJECT/RangeTest/Drivers/Librerie/VL53L0X/platform/inc/vl53l0x_platform.h" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-Librerie-2f-VL53L0X-2f-core-2f-src

clean-Drivers-2f-Librerie-2f-VL53L0X-2f-core-2f-src:
	-$(RM) ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.cyclo ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.d ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.o ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api.su ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.cyclo ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.d ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.o ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_calibration.su ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.cyclo ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.d ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.o ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_core.su ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.cyclo ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.d ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.o ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_ranging.su ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.cyclo ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.d ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.o ./Drivers/Librerie/VL53L0X/core/src/vl53l0x_api_strings.su

.PHONY: clean-Drivers-2f-Librerie-2f-VL53L0X-2f-core-2f-src

