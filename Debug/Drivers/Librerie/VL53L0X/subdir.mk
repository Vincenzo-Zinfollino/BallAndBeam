################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Librerie/VL53L0X/lidarvl53.c 

OBJS += \
./Drivers/Librerie/VL53L0X/lidarvl53.o 

C_DEPS += \
./Drivers/Librerie/VL53L0X/lidarvl53.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Librerie/VL53L0X/%.o Drivers/Librerie/VL53L0X/%.su Drivers/Librerie/VL53L0X/%.cyclo: ../Drivers/Librerie/VL53L0X/%.c Drivers/Librerie/VL53L0X/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X" -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/core/inc" -I"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/platform/inc" -include"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/platform/inc/vl53l0x_types.h" -include"H:/Workspace/STm/RangeTest/Drivers/Librerie/VL53L0X/platform/inc/vl53l0x_platform.h" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-Librerie-2f-VL53L0X

clean-Drivers-2f-Librerie-2f-VL53L0X:
	-$(RM) ./Drivers/Librerie/VL53L0X/lidarvl53.cyclo ./Drivers/Librerie/VL53L0X/lidarvl53.d ./Drivers/Librerie/VL53L0X/lidarvl53.o ./Drivers/Librerie/VL53L0X/lidarvl53.su

.PHONY: clean-Drivers-2f-Librerie-2f-VL53L0X

