#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "stm8l15x.h"

#define TIM4_PERIOD 16 * 10
#define BUFFER_SIZE 4
#define I2CSPEED 10000
#define PERIPH_ADDRESS (0x2F << 1)

#define DISTANCE_READING 0x01
#define TRIGGER_ENABLE 0x02
#define CHANGE_ADDRESS 0x04
#define RESET_ADDRESS 0x06

uint8_t COMMUNICATION_START = 0;
uint8_t OUT_RANGE = 0;
uint8_t OPAMP_INT_TRIGGER = 0;

uint8_t userAddress;
volatile uint8_t peripheralBuffer[BUFFER_SIZE] = {0};
uint8_t Distance_H = 0, Distance_L = 0;
uint16_t Distance = 0;
uint16_t Timer = 0;

void delay(uint16_t n);
void setGPIO(void);
void setI2C(void);
void setCLK(void);
void setTimers(void);
void changeAddress(uint8_t address);
void pulseTransmitter(void);
void EEPROM_WriteByte(uint16_t Addr,uint8_t Data);
uint8_t EEPROM_ReadByte(uint16_t Addr);
void enableOPAMP(uint8_t enable);
