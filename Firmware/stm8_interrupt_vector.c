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
  {0x82, (interrupt_handler_t)_stext},	// Reset 0x8000	              
  {0x82, (interrupt_handler_t)TRAP_IRQHandler}, // TRAP
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	//TLI 0
  {0x82, (interrupt_handler_t)FLASH_IRQHandler}, // Flash 0x008008    1
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, // DMA1 0/1       2
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, // DMA1 2/3       3
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	// RTC            4
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, // PVD            5
  {0x82, (interrupt_handler_t)NonHandledInterrupt},// EXTI PortB      6
  {0x82, (interrupt_handler_t)NonHandledInterrupt},// EXTI PortD     7
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	// EXT0           8
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	  // EXTI1          9
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	// EXTI2          10
  {0x82, (interrupt_handler_t)EXTI3_IRQHandler},    // EXTI3          11
  {0x82, (interrupt_handler_t)NonHandledInterrupt},    //               12
  {0x82, (interrupt_handler_t)EXTI5_IRQHandler},	//               13
  {0x82, (interrupt_handler_t)EXTI6_IRQHandler}, //               14
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, //               15
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, // CLK            16
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, // 17
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, //18
  {0x82, (interrupt_handler_t)TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler}, /* irq19 - TIM2 Update/Overflow/Trigger/Break / USART2 TX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt}, //20   
  {0x82, (interrupt_handler_t)TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler},/* irq21 - TIM3 Update/Overflow/Trigger/Break / USART3 TX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},	//22
  {0x82, (interrupt_handler_t)NonHandledInterrupt},     //23 
  {0x82, (interrupt_handler_t)NonHandledInterrupt},    //24 
  {0x82, (interrupt_handler_t)TIM4_UPD_OVF_TRG_IRQHandler}, //25
  {0x82, (interrupt_handler_t)NonHandledInterrupt},  //26 
  {0x82, (interrupt_handler_t)NonHandledInterrupt},  //27 
  {0x82, (interrupt_handler_t)NonHandledInterrupt},  //28 
  {0x82, (interrupt_handler_t)I2C1_SPI2_IRQHandler},      /* irq29 - I2C1 / SPI2 interrupt */
};

