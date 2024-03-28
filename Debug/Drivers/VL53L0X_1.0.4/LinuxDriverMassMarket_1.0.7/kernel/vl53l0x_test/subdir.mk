################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.c 

OBJS += \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.o 

C_DEPS += \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/%.o Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/%.su Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/%.cyclo: ../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/%.c Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-vl53l0x_test

clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-vl53l0x_test:
	-$(RM) ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_parameter.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_reg.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/vl53l0x_test/vl53l0x_test.su

.PHONY: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-vl53l0x_test

