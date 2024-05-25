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

#define kTim2Period 0xFFFF
#define kTim3Period 0xFFFF
#define kTim4Period 0x7C

#define kSpeedOfSound 343.0 //Speed of sound in m/s at 20 degrees Celsius
#define kTIM2Prescaler 128
#define kHSIClock 16000000
#define kTIM2CycleTime (kHSIClock / kTIM2Prescaler)
#define kConvertMM 1000
#define kCycles48kHz 15
#define kTIM2CycleSeconds (1.0/(double)kTIM2CycleTime)

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
