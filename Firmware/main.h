#ifndef _ULTRASONIC_MAIN_H
#define _ULTRASONIC_MAIN_H

#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "stm8l15x.h"

#define kBufferSize 4
#define kI2CSpeed 100000 
#define kUltrasonicAddress (0x2F << 1) 
#define kDisableOpAmp 0x00
#define kEnableOpAmp 0x01
#define kCmdReadDistance 0x01
#define kCmdChangeAddress 0x04
#define kCmdResetAddress 0x06
#define kTim2Period 0xFFFF
#define kTim3Period 0xFFFF
#define kTim4Period 0x7C

void delay(uint16_t n);
void initializeGPIO(void);
void initializeI2C(void);
void initializeCLK(void);
void initializeTimers(void);
void changeAddress(uint8_t address);
void pulseTransmitter(void);
void setAddr(uint8_t addr);
uint8_t getAddr(void);
void setOpAmp(uint8_t enable);

#endif
