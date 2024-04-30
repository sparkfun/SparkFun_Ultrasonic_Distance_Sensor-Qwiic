/***********************Zio Ultrasonic Distance
 *Sensor***************************
 ***********************************ZIO.CC***************************************
 *******************************************************************************/
#include "main.h"

int main(void) {

  ultrasonicCLKSetup();
  // ultrasonicGPIOSetup();
  ultrasonicI2CSetup();

  // TIM2_DeInit();
  // CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  // TIM2_TimeBaseInit(TIM2_Prescaler_8, TIM2_CounterMode_Up, 0xFFFF);
  // TIM2_ARRPreloadConfig(ENABLE);

  // TIM3_DeInit();
  // CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  // TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 5500);
  // TIM3_ARRPreloadConfig(ENABLE);

  // TIM4_DeInit();
  // CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  // TIM4_TimeBaseInit(TIM4_Prescaler_128, TIM4_PERIOD);
  // TIM4_ARRPreloadConfig(ENABLE);
  //// FLASH_DeInit();

  // enableInterrupts();

  // TIM2_ClearFlag(TIM2_FLAG_Update);
  // TIM3_ClearFlag(TIM3_FLAG_Update);
  // TIM4_ClearFlag(TIM4_FLAG_Update);
  //
  // TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  // TIM3_ITConfig(TIM3_IT_Update, ENABLE);
  // TIM4_ITConfig(TIM4_IT_Update, ENABLE);

  //enableOPAMP(0);

  while (1) {
    // Loop until something comes in.
    if(COMMUNICATION_START == 1){
      if(peripheralBuffer[0] == DISTANCE_READING){
        pulseTransmitter();
        }
      if(peripheralBuffer[0] ==  CHANGE_ADDRESS){
        if (peripheralBuffer[1] != 0x00) {
          userAddress = peripheralBuffer[1];
          changeAddress(userAddress);
        }
      }
      COMMUNICATION_START = 0;
    }

    if (TRIGGER_ENABLE == 1) {
      if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_3)) {
        pulseTransmitter();
        TIM3_SetCounter(0);
        TIM3_Cmd(ENABLE);
        enableOPAMP(0);
      }
      TRIGGER_ENABLE = 0;
    }

    if (RESET_ADDRESS) {
      changeAddress(0x2F);
      RESET_ADDRESS = 0;
      // EEPROM_WriteByte(0, 0x2F);
      // I2C_DeInit_Config(EEPROM_ReadByte(0));
    }

    if (OPAMP_INT_TRIGGER == 1) {
      Timer = TIM2_GetCounter();
      TIM2_Cmd(DISABLE);
      // TIM3_Cmd(DISABLE);
      //  ECHO pulled low
      GPIO_ResetBits(GPIOB, GPIO_Pin_2);
      enableOPAMP(0);
      //  Distance=Timer/58*5;
      if (OUT_RANGE == 0) {
        Distance = (uint16_t)Timer * 0.0862;
        Distance_H = (uint8_t)(Distance >> 8);
        Distance_L = (uint8_t)Distance;
      }
      OUT_RANGE = 0;
      OPAMP_INT_TRIGGER = 0;
    }

  }
  //while (1)
  //  ;
}

/*
 * @brief  delay function. 
 * @param  n : the time to delay
 * @retval None
*/
void delay(uint16_t n) {
  while (n--)
    ;
}

/*
 * @brief GPIO setup for the ultrasonic sensor: DIN1, DIN2, ECHO, TRIG, ADDR_RST.
 * @param  None
 * @retval None
*/
void ultrasonicGPIOSetup(void) {
  GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_Pin_0,
            GPIO_Mode_Out_PP_Low_Fast); // DIN2
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_0,
            GPIO_Mode_Out_PP_Low_Fast); // DIN1
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_2,
            GPIO_Mode_Out_PP_Low_Fast); // ECHO
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4,
            GPIO_Mode_Out_PP_Low_Slow); // PB4

  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_3, GPIO_Mode_In_FL_IT); // TRIG
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_5,
            GPIO_Mode_In_PU_IT); // ADDR_RST
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_6, GPIO_Mode_In_FL_IT); // INT

  // Exterinal interrups for TRIG, INT, ADDR_RST
  EXTI_DeInit();
  EXTI_SetPinSensitivity(EXTI_Pin_3, EXTI_Trigger_Rising);  // TRIG
  EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling); // ADDR_RST
  EXTI_SetPinSensitivity(EXTI_Pin_6, EXTI_Trigger_Rising);  // INT
}

/*
 * @brief I2C setup for the ultrasonic sensor.
 * @param  None
 * @retval None
*/
void ultrasonicI2CSetup(void) {
  CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, I2CSPEED, PERIPH_ADDRESS, I2C_Mode_I2C, I2C_DutyCycle_2,
           I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF),
               ENABLE);
  I2C_Cmd(I2C1, ENABLE);
}

/*
 * @brief Default clock setup for the ultrasonic sensor.
 * @param  None
 * @retval None
*/
void ultrasonicCLKSetup(void) {
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  CLK_HSICmd(ENABLE);
  while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET)
    ;
}

/*
 * @brief Change the I2C address of the ultrasonic sensor.
 * @param  address: The new address to be set.
 * @retval None
*/
void changeAddress(uint8_t address) {
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, I2CSPEED, address, I2C_Mode_I2C, I2C_DutyCycle_2,
           I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF),
               ENABLE);
  I2C_Cmd(I2C1, ENABLE);
}

/*
 * @brief Pulse the transmitter at 
 * @param  None
 * @retval None
*/
void pulseTransmitter(void) {

  uint8_t i = 0;
  GPIO_ResetBits(GPIOB, GPIO_Pin_0);
  enableOPAMP(1);

  for (i = 0; i < 4; i++) {

    GPIO_ResetBits(GPIOD, GPIO_Pin_0);
    GPIO_SetBits(GPIOB, GPIO_Pin_0);

    delay(22);

    GPIO_SetBits(GPIOD, GPIO_Pin_0);
    GPIO_ResetBits(GPIOB, GPIO_Pin_0);
    delay(22);
  }

  {

    GPIO_ResetBits(GPIOD, GPIO_Pin_0);
    GPIO_SetBits(GPIOB, GPIO_Pin_0);

    delay(22);

    GPIO_SetBits(GPIOD, GPIO_Pin_0);
    GPIO_ResetBits(GPIOB, GPIO_Pin_0);
    delay(22);
  }
  // ECHO pin high
  GPIO_SetBits(GPIOB, GPIO_Pin_2);
  TIM2_SetCounter(0);
  TIM2_Cmd(ENABLE);
}

/*
 * @brief Enable or disable the op-amp.
 * @param  enable: 1 to enable, 0 to disable.
 * @retval None
*/
void enableOPAMP(uint8_t enable) {
  if (enable) {
    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
    GPIO_SetBits(GPIOB, GPIO_Pin_4);
  } else {
    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
    GPIO_ResetBits(GPIOB, GPIO_Pin_4);
  }
}

/*
 * @brief Write a byte to the EEPROM, used to store the I2C address.
 * @param  Addr: The address to write to.
 * @param  Data: The data to write.
 * @retval None
*/
void EEPROM_WriteByte(uint16_t Addr, uint8_t Data) {

  uint8_t *Ptr_SegAddr; // Segment pointer

  Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS +
                            Addr); // Initialize  pointer

  FLASH_Unlock(FLASH_MemType_Data);

  while (!FLASH_IAPSR_DUL)
    // need timer here.
    ;

  disableInterrupts();

  *Ptr_SegAddr = Data;

  while (!FLASH_IAPSR_EOP)
    // need timer here.
    ;

  enableInterrupts();

  FLASH_Lock(FLASH_MemType_Data);
}

/*
 * @brief Read a byte from the EEPROM, used to read the I2C address.
 * @param  Addr: The address to read from.
 * @retval The data read.
*/
uint8_t EEPROM_ReadByte(uint16_t Addr) {

  uint16_t Data = 0;

  uint8_t *Ptr_SegAddr;

  Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS +
                            Addr); // Initialize  pointer

  Data = *Ptr_SegAddr;

  return Data;
}
