################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: OscilliscopeInterupt.axf

# Tool invocations
OscilliscopeInterupt.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"C:\Users\Jacob\Dropbox\ECEN 3000\Lab 3\CMSISv1p30_LPC11xx\Debug" -Xlinker -Map="OscilliscopeInterupt.map" -Xlinker --gc-sections -mcpu=cortex-m0 -mthumb -T "OscilliscopeInterupt_Debug.ld" -o "OscilliscopeInterupt.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) OscilliscopeInterupt.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "OscilliscopeInterupt.axf"; # arm-none-eabi-objcopy -O binary "OscilliscopeInterupt.axf" "OscilliscopeInterupt.bin" ; checksum -p LPC1114_302 -d "OscilliscopeInterupt.bin";
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
