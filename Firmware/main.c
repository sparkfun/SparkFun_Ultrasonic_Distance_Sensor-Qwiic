/*******************************************************************************
***********************Zio Ultrasonic Distance Sensor***************************
***********************************ZIO.CC***************************************
*******************************************************************************/

#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "bsp.h"
#include "stm8l15x.h"
// #include <cstdint>

#define TIM4_PERIOD 16 * 10
#define BUFFER_SIZE 4
#define DISTANCE_READING 0x01
#define CHANGE_ADDRESS 0x04
#define I2CSPEED 10000
#define PERIPH_ADDRESS (0x2F << 1)

uint8_t COMMUNICATION_END = 0;
uint8_t userAddress;
volatile uint8_t peripheralBuffer[BUFFER_SIZE] = {0};

void ultrasonicGPIOSetup(void);
void ultrasonicI2CSetup(void);
void ultrasonicCLKSetup(void);
void changeAddress(uint8_t userAddress);

int main(void) {

  ultrasonicCLKSetup();
  ultrasonicGPIOSetup();
  ultrasonicI2CSetup();

  TIM2_DeInit();
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  TIM2_TimeBaseInit(TIM2_Prescaler_8, TIM2_CounterMode_Up, 0xFFFF);
  TIM2_ARRPreloadConfig(ENABLE);

  TIM3_DeInit();
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 5500);
  TIM3_ARRPreloadConfig(ENABLE);

  TIM4_DeInit();
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  TIM4_TimeBaseInit(TIM4_Prescaler_128, TIM4_PERIOD);
  TIM4_ARRPreloadConfig(ENABLE);
  // FLASH_DeInit();

  enableInterrupts();

  TIM2_ClearFlag(TIM2_FLAG_Update);
  TIM3_ClearFlag(TIM3_FLAG_Update);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  TIM3_ITConfig(TIM3_IT_Update, ENABLE);
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);

  // Raises the inverting pin on the op-amp, thus turning it off. 
  GPIO_ResetBits(GPIOB, GPIO_Pin_4);

  while (1) {
    // Loop until something comes in.
    while (!COMMUNICATION_END); 
    COMMUNICATION_END = 1;
      switch (peripheralBuffer[0]) {
      case DISTANCE_READING:
        pulseTransmitter();
        break;
      case CHANGE_ADDRESS:
        if (peripheralBuffer[1] != 0x00) {
          userAddress = peripheralBuffer[1];
          changeAddress(userAddress);
        }
        break;
      default:
        break;
      }
    }
}

void ultrasonicGPIOSetup(void) {
  GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast); // DIN2
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast); // DIN1
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast); // ECHO
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Slow); // PB4

  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_3, GPIO_Mode_In_FL_IT); // TRIG
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_5, GPIO_Mode_In_PU_IT); // ADDR_RST
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_6, GPIO_Mode_In_FL_IT); // INT

  // Exterinal interrups for TRIG, INT, ADDR_RST
  EXTI_DeInit();
  EXTI_SetPinSensitivity(EXTI_Pin_3, EXTI_Trigger_Rising);  // TRIG
  EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling); // ADDR_RST
  EXTI_SetPinSensitivity(EXTI_Pin_6, EXTI_Trigger_Rising);  // INT
}

void ultrasonicI2CSetup(void) {
  CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, I2CSPEED, PERIPH_ADDRESS, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  I2C_Cmd(I2C1, ENABLE);
}

void ultrasonicCLKSetup(void) {
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  CLK_HSICmd(ENABLE);
  while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET) ;
}

void changeAddress(uint8_t userAddress) {
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, I2CSPEED, userAddress, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  I2C_Cmd(I2C1, ENABLE);
}
