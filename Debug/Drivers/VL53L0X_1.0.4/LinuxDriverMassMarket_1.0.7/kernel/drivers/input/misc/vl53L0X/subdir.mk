################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.c 

OBJS += \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.o 

C_DEPS += \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/%.o Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/%.su Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/%.cyclo: ../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/%.c Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-drivers-2f-input-2f-misc-2f-vl53L0X

clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-drivers-2f-input-2f-misc-2f-vl53L0X:
	-$(RM) ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-cci.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module-i2c.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/stmvl53l0x_module.su

.PHONY: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-drivers-2f-input-2f-misc-2f-vl53L0X

