################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.c \
../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.c 

OBJS += \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.o \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.o 

C_DEPS += \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.d \
./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/%.o Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/%.su Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/%.cyclo: ../Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/%.c Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-drivers-2f-input-2f-misc-2f-vl53L0X-2f-src

clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-drivers-2f-input-2f-misc-2f-vl53L0X-2f-src:
	-$(RM) ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_calibration.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_core.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_ranging.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_api_strings.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_i2c_platform.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_platform.su ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.cyclo ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.d ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.o ./Drivers/VL53L0X_1.0.4/LinuxDriverMassMarket_1.0.7/kernel/drivers/input/misc/vl53L0X/src/vl53l0x_port_i2c.su

.PHONY: clean-Drivers-2f-VL53L0X_1-2e-0-2e-4-2f-LinuxDriverMassMarket_1-2e-0-2e-7-2f-kernel-2f-drivers-2f-input-2f-misc-2f-vl53L0X-2f-src

