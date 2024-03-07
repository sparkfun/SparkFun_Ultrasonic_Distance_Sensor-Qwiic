/*******************************************************************************
***********************Zio Ultrasonic Distance Sensor***************************
***********************************ZIO.CC***************************************
*******************************************************************************/



#include "stm8l15x.h"
#include "bsp.h"

#define TIM4_PERIOD   16*10
//#define SLAVE_ADDR 0x00

//extern uint8_t SLAVE_ADDRESS[10]={0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9};
extern uint8_t SLAVE_ADDR=0x00;

extern char SBUF=0;
extern uint16_t measure_flag=0;


/*******************************************************************************
****Parameter In��None
****Parameter Out��None
****Fuction��main
****Author��Harry
*******************************************************************************/
int main( void )
{
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);    
  CLK_HSICmd(ENABLE);                      
  
  GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast); // DIN2
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast); // DIN1
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast); // ECHO
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast); //PB4, INPUT
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_3, GPIO_Mode_In_FL_IT); // TRIG
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_6, GPIO_Mode_In_FL_IT); // INT
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_5, GPIO_Mode_In_PU_IT); // ADDR_RST
  EXTI_DeInit (); 
  EXTI_SetPinSensitivity (EXTI_Pin_3, EXTI_Trigger_Rising);
  EXTI_SetPinSensitivity (EXTI_Pin_6, EXTI_Trigger_Rising);
  EXTI_SetPinSensitivity (EXTI_Pin_5, EXTI_Trigger_Falling);
  
  
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2,ENABLE);         
  TIM2_DeInit();    
  TIM2_TimeBaseInit(TIM2_Prescaler_8, TIM2_CounterMode_Up, 65535);         
  TIM2_ARRPreloadConfig(ENABLE);    
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
//  TIM2_Cmd(ENABLE);


  CLK_PeripheralClockConfig(CLK_Peripheral_TIM3,ENABLE);         
  TIM3_DeInit();    
  TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 5500); 
  TIM3_ARRPreloadConfig(ENABLE);    
  TIM3_ITConfig(TIM3_IT_Update, ENABLE);    
//  TIM3_Cmd(ENABLE); 
  
  CLK_PeripheralClockConfig (CLK_Peripheral_TIM4,ENABLE); 
  TIM4_DeInit();
  TIM4_TimeBaseInit(TIM4_Prescaler_128, TIM4_PERIOD);
  TIM4_ARRPreloadConfig(ENABLE);
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);
//  TIM4_Cmd(ENABLE);
  
  FLASH_DeInit();
    /* I2C  clock Enable*/
  //I2C_DeInit_Config(0x00);
  GPIO_SetBits(GPIOB,GPIO_Pin_4);

  CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, I2CSPEED, 0x2F, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  I2C_Cmd(I2C1, ENABLE);
  enableInterrupts();
  
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_High_Fast); // I2C does not need to be configured
  //GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_Pin_1, GPIO_Mode_Out_PP_High_Fast); // I2C does not need to be configured
  while(1)
  {

  }
    
    
}

/*******************************************************************************
***********************Zio Ultrasonic Distance Sensor***************************
***********************************ZIO.CC***************************************
*******************************************************************************/
