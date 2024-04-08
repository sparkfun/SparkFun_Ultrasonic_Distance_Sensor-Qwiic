/**
 ******************************************************************************
 * @file    Project/STM8L15x_StdPeriph_Template/stm8l15x_it.c
 * @author  MCD Applicatin Team
 * @version V1.5.0
 * @date    13-May-2011
 * @brief   Main Interrupt Service Routines.
 *          This file provides template for all peripherals interrupt service
 *routine.
 ******************************************************************************
 * @attention
 *
 * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
 * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
 * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
 * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
 * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
 * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
 *
 * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "bsp.h"
//#include <stdint.h>

uint16_t Event = 0x00;
uint8_t Out_Range = 0;
uint16_t Timer = 0;
uint16_t Distance = 0;
uint8_t Distance_H = 0, Distance_L = 0;
volatile uint8_t rxIndex = 0;
volatile uint8_t txIndex = 0;
extern uint8_t PERIPH_ADDRESS;
extern uint8_t COMMUNICATION_END;
volatile extern uint8_t peripheralBuffer[4];
/** @addtogroup STM8L15x_StdPeriph_Template
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

#ifdef _COSMIC_
/**
 * @brief Dummy interrupt routine
 * @par Parameters:
 * None
 * @retval
 * None
 */
INTERRUPT_HANDLER(NonHandledInterrupt, 0) {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif

void delay(uint16_t z) {
  while (z--)
    ;
}

/**
 * @brief External IT PIN3 Interrupt routine, on the trigger pin.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(EXTI3_IRQHandler, 11) {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  EXTI_ClearITPendingBit(EXTI_IT_Pin3);
  TIM4_SetCounter(0);
  TIM4_Cmd(ENABLE);

  // Raises the inverting pin on the op-amp, thus turning it off. 
  //GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_SetBits(GPIOB, GPIO_Pin_4);
  delay(20);
  if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_3)) {
    pulseTransmitter();
    TIM3_SetCounter(0);
    TIM3_Cmd(ENABLE);
  }
}
/*
 * @brief External IT PIN5 Interrupt routine.
 * @param  None
 * @retval None
 */ 
@svlreg INTERRUPT_HANDLER(EXTI5_IRQHandler, 13) {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  EXTI_ClearITPendingBit(EXTI_IT_Pin5);
  // EEPROM_WriteByte(0, 0x2F);
  //  I2C_DeInit_Config(EEPROM_ReadByte(0));
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, 10000, 0x2F, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable,
           I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF),
               ENABLE);
  I2C_Cmd(I2C1, ENABLE);
}

/**
 * @brief Main Interrupt Pin triggered by the ultrasonic sensor.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(EXTI6_IRQHandler, 14) {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  EXTI_ClearITPendingBit(EXTI_IT_Pin6);
  Timer = TIM2_GetCounter();
  TIM2_Cmd(DISABLE);
  //IM3_Cmd(DISABLE);
  // ECHO pulled low
  GPIO_ResetBits(GPIOB, GPIO_Pin_2);
  // Raises the inverting pin on the op-amp, thus turning it off. 
  //GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_ResetBits(GPIOB, GPIO_Pin_4);
 //  Distance=Timer/58*5;
  if (Out_Range == 0) {
    Distance = (uint16_t)Timer * 0.0862;
    Distance_H = (uint8_t)(Distance >> 8);
    Distance_L = (uint8_t)Distance;
  }

  Out_Range = 0;
}

/**
 * @brief TIM2 Update/Overflow/Trigger/Break /USART2 TX Interrupt routine.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19) {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  TIM2_ClearITPendingBit(TIM2_IT_Update);
  TIM2_Cmd(DISABLE);
}

/**
 * @brief Timer3 Update/Overflow/Trigger/Break Interrupt routine.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21) {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  TIM3_ClearITPendingBit(TIM3_IT_Update);
  //TIM3_ClearFlag(TIM3_FLAG_Update);
  //GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_ResetBits(GPIOB, GPIO_Pin_4);
  TIM3_Cmd(DISABLE);
  GPIO_ResetBits(GPIOB, GPIO_Pin_2);
  Out_Range = 1;
}

/**
 * @brief TIM4 Update/Overflow/Trigger Interrupt routine.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25) {

  //TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_ClearITPendingBit(TIM4_IT_Update);
  //GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_In_FL_No_IT);
  GPIO_ResetBits(GPIOB, GPIO_Pin_4);
  TIM4_Cmd(DISABLE);
}

/**
 * @brief Interrupt routine for I2C and SPI2 events
 * @param  None
 * @retval None
 */
@svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29) {

  if (I2C_ReadRegister(I2C1, I2C_Register_SR2)) {
    // Clears SR2 register
    I2C1->SR2 = 0;
    Distance_H = 0;
    Distance_L = 0;
  }

  Event = I2C_GetLastEvent(I2C1);
  switch (Event) {
    /******* Slave transmitter ******/
    /* check on EV1 */
  case I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED:
    txIndex = 0;
    break;
    /* check on EV3 */
  case I2C_EVENT_SLAVE_BYTE_TRANSMITTING:
    I2C_SendData(I2C1, Distance_H);
    I2C_SendData(I2C1, Distance_L);
    break;
    /******* Slave receiver **********/
    /* check on EV1*/
  case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
    rxIndex = 0;
    break;
    /* Check on EV2*/
  case I2C_EVENT_SLAVE_BYTE_RECEIVED:
    COMMUNICATION_END = 0;
    peripheralBuffer[rxIndex++] = I2C_ReceiveData(I2C1);
    break;
    // NAK received
  case (I2C_EVENT_SLAVE_ACK_FAILURE):
    I2C1->SR2 &= ~I2C_SR2_AF; // clear AF
    break;
    /* Check on EV4 */
  case (I2C_EVENT_SLAVE_STOP_DETECTED):
    /* write to CR2 to clear STOPF flag */
    I2C1->CR2 |= I2C_CR2_ACK;
    rxIndex = 0;
    COMMUNICATION_END = 1;
    break;

  default:
    break;
  }
}

/**
 * @}
 */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF
   FILE****/
