################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.c \
../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.c \
../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.c \
../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.c \
../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.c \
../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.c 

OBJS += \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.o \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.o \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.o \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.o \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.o \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.o 

C_DEPS += \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.d \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.d \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.d \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.d \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.d \
./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X_1.0.4/ApiExample/examples/src/%.o Drivers/VL53L0X_1.0.4/ApiExample/examples/src/%.su Drivers/VL53L0X_1.0.4/ApiExample/examples/src/%.cyclo: ../Drivers/VL53L0X_1.0.4/ApiExample/examples/src/%.c Drivers/VL53L0X_1.0.4/ApiExample/examples/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-ApiExample-2f-examples-2f-src

clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-ApiExample-2f-examples-2f-src:
	-$(RM) ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.cyclo ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.d ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.o ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/get_nucleo_serial_comm.su ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.cyclo ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.d ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.o ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_ContinuousRanging_Example.su ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.cyclo ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.d ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.o ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Example.su ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.cyclo ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.d ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.o ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Accuracy_Example.su ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.cyclo ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.d ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.o ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_High_Speed_Example.su ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.cyclo ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.d ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.o ./Drivers/VL53L0X_1.0.4/ApiExample/examples/src/vl53l0x_SingleRanging_Long_Range_Example.su

.PHONY: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-ApiExample-2f-examples-2f-src

