#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "stm8l15x.h"

#define TIM4_PERIOD 16 * 10
#define BUFFER_SIZE 4
#define I2C_SPEED 10000
#define PERIPH_ADDRESS (0x2F << 1)

#define CMD_READ_DISTANCE 0x01
#define CMD_CHANGE_ADDRESS 0x04
#define CMD_RESET_ADDRESS 0x06

uint8_t OUT_RANGE = 0;
uint8_t OPAMP_INTERRUPT = 0;
uint8_t ADDRESS_INTERRUPT = 0;
uint8_t TRIGGER_INTERRUPT = 0;
uint8_t I2C_INTERRUPT = 0;

uint8_t userAddress;
uint8_t Distance_H = 0, Distance_L = 0;
uint16_t Distance = 0;
uint16_t Timer = 0;
volatile uint8_t peripheralBuffer[BUFFER_SIZE] = {0};

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
