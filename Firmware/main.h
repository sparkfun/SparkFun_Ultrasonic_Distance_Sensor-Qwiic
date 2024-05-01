#ifndef _ULTRASONIC_MAIN_H
#define _ULTRASONIC_MAIN_H

#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "stm8l15x.h"


#define kTim4Period 16 * 10
#define kBufferSize 4
#define kI2CSpeed 10000 
#define kUltrasonicAddress (0x2F << 1) 
#define kDisableOpAmp 0x00
#define kEnableOpAmp 0x00
#define kCmdReadDistance 0x01
#define kCmdChangeAddress 0x04
#define kCmdResetAddress 0x06

void delay(uint16_t n);
void initializeGPIO(void);
void initializeI2C(void);
void initializeCLK(void);
void initializeTimers(void);
void changeAddress(uint8_t address);
void pulseTransmitter(void);
void EEPROM_WriteByte(uint16_t Addr,uint8_t Data);
uint8_t EEPROM_ReadByte(uint16_t Addr);
void setOpAmp(uint8_t enable);

#endif
