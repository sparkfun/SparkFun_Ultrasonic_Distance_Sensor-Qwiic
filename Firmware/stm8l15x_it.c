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
#include "main.h"
//#include "stm8l15x_it.h"
//#include <stdint.h>

uint16_t Event = 0x00;
volatile uint8_t rxIndex = 0;
volatile uint8_t txIndex = 0;

extern uint8_t OUT_RANGE;
extern uint8_t OPAMP_INTERRUPT;
extern uint8_t ADDRESS_INTERRUPT ;
extern uint8_t TRIGGER_INTERRUPT;
extern uint8_t I2C_INTERRUPT ;

extern uint8_t userAddress;
extern uint8_t Distance_H, Distance_L;
extern uint16_t Distance;
extern uint16_t Timer ;
extern volatile uint8_t peripheralBuffer[BUFFER_SIZE];

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

/**
 * @brief External IT PIN3 Interrupt routine, on the trigger pin.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(EXTI3_IRQHandler, 11) {
  EXTI_ClearITPendingBit(EXTI_IT_Pin3);
  TIM4_SetCounter(0);
  TIM4_Cmd(ENABLE);
  TRIGGER_INTERRUPT = 1;
}

/*
 * @brief External IT PIN5 Interrupt routine.
 * @param  None
 * @retval None
 */

@svlreg INTERRUPT_HANDLER(EXTI5_IRQHandler, 13) {
  EXTI_ClearITPendingBit(EXTI_IT_Pin5);
  ADDRESS_INTERRUPT = 1;
}

/**
 * @brief Main Interrupt Pin triggered by the ultrasonic sensor.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(EXTI6_IRQHandler, 14) {
  EXTI_ClearITPendingBit(EXTI_IT_Pin6);
  OPAMP_INTERRUPT = 1;
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
  TIM3_Cmd(DISABLE);
  enableOPAMP(0);
  GPIO_SetBits(GPIOB, GPIO_Pin_2);
  OUT_RANGE = 1;
}

/**
 * @brief TIM4 Update/Overflow/Trigger Interrupt routine.
 * @param  None
 * @retval None
 */
INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25) {

  // TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_ClearITPendingBit(TIM4_IT_Update);
  enableOPAMP(0);
  TIM4_Cmd(DISABLE);
}

/**
 * @brief Interrupt routine for I2C and SPI2 events
 * @param  None
 * @retval None
 */
//@svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29) {
//
//  if (I2C_ReadRegister(I2C1, I2C_Register_SR2)) {
//    // Clears SR2 register
//    I2C1->SR2 = 0;
//    Distance_H = 0;
//    Distance_L = 0;
//  }
//
//  Event = I2C_GetLastEvent(I2C1);
//  switch (Event) {
//    /******* Slave transmitter ******/
//    /* check on EV1 */
//  case I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED:
//    txIndex = 0;
//    break;
//    /* check on EV3 */
//  case I2C_EVENT_SLAVE_BYTE_TRANSMITTING:
//    I2C_SendData(I2C1, Distance_H);
//    // I2C_SendData(I2C1, Distance_L);
//    break;
//    /******* Slave receiver **********/
//    /* check on EV1*/
//  case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
//    rxIndex = 0;
//    break;
//    /* Check on EV2*/
//  case I2C_EVENT_SLAVE_BYTE_RECEIVED:
//    I2C_START = 0;
//    peripheralBuffer[rxIndex++] = I2C_ReceiveData(I2C1);
//    break;
//    // NAK received
//  case (I2C_EVENT_SLAVE_ACK_FAILURE):
//    I2C1->SR2 &= ~I2C_SR2_AF; // clear AF
//    break;
//    /* Check on EV4 */
//  case (I2C_EVENT_SLAVE_STOP_DETECTED):
//    /* write to CR2 to clear STOPF flag */
//    I2C1->CR2 |= I2C_CR2_ACK;
//    rxIndex = 0;
//    I2C_START = 1;
//    break;
//
//  default:
//    break;
//  }
//}

@svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29) {

  if (I2C_ReadRegister(I2C1, I2C_Register_SR2)) {
    // Clears SR2 register
    I2C1->SR2 = 0;
    Distance_H = 0;
    Distance_L = 0;
  }

  Event = I2C_GetLastEvent(I2C1);

  if (Event == I2C_EVENT_SLAVE_ACK_FAILURE) {
  }
  //Slave transmitter 
  //Check on EV1
  if (Event == I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED) {
    txIndex = 0;
  }
  // Check on EV3 
  if (Event == I2C_EVENT_SLAVE_BYTE_TRANSMITTING) {
    I2C_SendData(I2C1, Distance_H);
    // I2C_SendData(I2C1, Distance_L);
  }
  // Slave receiver 
  /* check on EV1*/
  if (Event == I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED) {
    rxIndex = 0;
    /* Check on EV2*/
  }
  if (Event == I2C_EVENT_SLAVE_BYTE_RECEIVED) {
    I2C_INTERRUPT = 0;
    peripheralBuffer[rxIndex++] = I2C_ReceiveData(I2C1);
  }
  // NAK received
  if (Event == (I2C_EVENT_SLAVE_ACK_FAILURE)) {
    I2C1->SR2 &= ~I2C_SR2_AF; // clear AF
    /* Check on EV4 */
  }
  if (Event == (I2C_EVENT_SLAVE_STOP_DETECTED)) {
    /* write to CR2 to clear STOPF flag */
    I2C1->CR2 |= I2C_CR2_ACK;
    rxIndex = 0;
    I2C_INTERRUPT = 1;
  }
}
/**
 * @}
 */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF
   FILE****/
