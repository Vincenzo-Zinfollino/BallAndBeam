################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.c \
../Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.c 

OBJS += \
./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.o \
./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.o 

C_DEPS += \
./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.d \
./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Librerie/VL53L0X/platform/src/%.o Drivers/Librerie/VL53L0X/platform/src/%.su Drivers/Librerie/VL53L0X/platform/src/%.cyclo: ../Drivers/Librerie/VL53L0X/platform/src/%.c Drivers/Librerie/VL53L0X/platform/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X" -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/core/inc" -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/core/src" -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/platform/inc" -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/platform/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-Librerie-2f-VL53L0X-2f-platform-2f-src

clean-Drivers-2f-Librerie-2f-VL53L0X-2f-platform-2f-src:
	-$(RM) ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.cyclo ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.d ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.o ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform.su ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.cyclo ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.d ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.o ./Drivers/Librerie/VL53L0X/platform/src/vl53l0x_platform_log.su

.PHONY: clean-Drivers-2f-Librerie-2f-VL53L0X-2f-platform-2f-src

