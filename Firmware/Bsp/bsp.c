#include "bsp.h"

void Delay(uint16_t n)
{
  while(n--);
}
void pulseTransmitter(void)
{
   
  uint8_t i=0;
  GPIO_ResetBits(GPIOB,GPIO_Pin_0);
  // Lower the inverting pin on the op-amp, turning it on.   
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_ResetBits(GPIOB, GPIO_Pin_4);

  for(i=0;i<4;i++)
  {
   
   GPIO_ResetBits(GPIOD,GPIO_Pin_0);
   GPIO_SetBits(GPIOB,GPIO_Pin_0);
   
   Delay(22);
   
   GPIO_SetBits(GPIOD,GPIO_Pin_0);
   GPIO_ResetBits(GPIOB,GPIO_Pin_0);
   Delay(22);
   }
  

  {
   
   GPIO_ResetBits(GPIOD,GPIO_Pin_0);
   GPIO_SetBits(GPIOB,GPIO_Pin_0);
   
   Delay(22);
   
   GPIO_SetBits(GPIOD,GPIO_Pin_0);
   GPIO_ResetBits(GPIOB,GPIO_Pin_0);
   Delay(22);
   }
    //ECHO pin high
  GPIO_SetBits(GPIOB,GPIO_Pin_2);
  TIM2_SetCounter(0);
  TIM2_Cmd(ENABLE);
}

/******************************************************************************************************

*NAME:       void EEPROM_WriteByte(uint16_t Addr,uint8_t Data)

*FUNCTION£º  To specify an address to write a byte of data to EEPROM

*PARAMETER£º Addr:The offset address where data is stored

*           Data:Data to be written

*RETURN:    NONE
******************************************************************************************************/
void EEPROM_WriteByte(uint16_t Addr,uint8_t Data)

{

   uint8_t  *Ptr_SegAddr; //Segment pointer

   Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+Addr);  //Initialize  pointer

   FLASH_Unlock(FLASH_MemType_Data);

   while(!FLASH_IAPSR_DUL);

   disableInterrupts();

   *Ptr_SegAddr=Data; 

   while(!FLASH_IAPSR_EOP);

   enableInterrupts();

   FLASH_Lock(FLASH_MemType_Data);


}

/******************************************************************************************************

*NAME£º           uint8_t EEPROM_ReadByte(uint8_t Addr)

*FUNCTION£º       To read a byte of data from EEPROM

*PARAMETER£ºAddr:The offset address where data is stored

*RETURN£ºData£º  Read back data 


******************************************************************************************************/

uint8_t EEPROM_ReadByte(uint16_t Addr)

{

   uint16_t Data=0;

   uint8_t *Ptr_SegAddr;

   Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+Addr);  //Initialize  pointer

   Data=*Ptr_SegAddr;

   return Data;

}

/************************************************
NAME £º BSP_Initializes
FUNCTION £º Plate-level support package initialization
PARAMETER £º NONE
RETURN £º NONE
*************************************************/
void BSP_Initializes(void)
{
  pulseTransmitter();
}

