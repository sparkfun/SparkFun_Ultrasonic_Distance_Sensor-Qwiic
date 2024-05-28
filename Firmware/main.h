/*
 * SparkFun Ulrasonic Distance Sensor  
 *
 * SPDX-License-Identifier: MIT
 *  
 * Copyright (c) 2024 SparkFun Electronics
*/

#ifndef _ULTRASONIC_MAIN_H
#define _ULTRASONIC_MAIN_H

#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "stm8l15x.h"

// I2C related variables
#define kBufferSize 4
#define kI2CSpeed 100000 
#define kUltrasonicAddress (0x2F << 1) 
#define kDefaultEEPROMValue 0x00
#define kCmdReadDistance 0x01
#define kCmdChangeAddress 0x04

// Op-Amp related variables
#define kDisableOpAmp 0x00
#define kEnableOpAmp 0x01

// Timer period values
#define kTim2Period 0xFFFF
#define kTIM2Prescaler 128
#define kTim3Period 0xFFFF
#define kTim4Period 0x7C

// High Speed Internal Clock (HSI) value (16 MHz)
#define kHSIClock 16000000

// Variables used for calculating distance
#define kSpeedOfSound 343.0 //Speed of sound in m/s at 20 degrees Celsius
#define kTIM2CycleTime (kHSIClock / kTIM2Prescaler)
#define kConvertMM 1000
#define kCycles48kHz 15
#define kTIM2CycleSeconds (1.0/(double)kTIM2CycleTime)

void delay(uint16_t n);
void initializeGPIO(void);
void initializeI2C(void);
void initializeCLK(void);
void initializeTimers(void);
void pulseTransmitter(void);
void setOpAmp(uint8_t enable);
void setAddr(uint8_t userAddr);
uint8_t getAddr(void);

#endif
