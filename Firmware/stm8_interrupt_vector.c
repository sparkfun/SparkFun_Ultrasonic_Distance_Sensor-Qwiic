/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2013 STMicroelectronics
 */


#include "stm8l15x_it.h"

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	uint8_t interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

struct interrupt_vector const _vectab[] = {
  {0x82, (interrupt_handler_t)_stext},		
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, 
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, 
  {0x82, (interrupt_handler_t)NonHandledInterrupt},  
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq20 - TIM2 Capture/Compare / USART2 RX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq22 - TIM3 Capture/Compare /USART3 RX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq23 - TIM1 Update/Overflow/Trigger/Commutation interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq24 - TIM1 Capture/Compare interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},   
  {0x82, (interrupt_handler_t)NonHandledInterrupt},    
  {0x82, (interrupt_handler_t)NonHandledInterrupt},     
  {0x82, (interrupt_handler_t)EXTI3_IRQHandler},	
  {0x82, (interrupt_handler_t)EXTI5_IRQHandler},    
  {0x82, (interrupt_handler_t)EXTI6_IRQHandler},    
  {0x82, (interrupt_handler_t)TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler}, /* irq19 - TIM2 Update/Overflow/Trigger/Break / USART2 TX interrupt */
  {0x82, (interrupt_handler_t)TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler},      /* irq21 - TIM3 Update/Overflow/Trigger/Break / USART3 TX interrupt */
  {0x82, (interrupt_handler_t)TIM4_UPD_OVF_TRG_IRQHandler},     /* irq25 - TIM4 Update/Overflow/Trigger interrupt */
  {0x82, (interrupt_handler_t)I2C1_SPI2_IRQHandler},      /* irq29 - I2C1 / SPI2 interrupt */

};
