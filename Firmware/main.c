/*
 * SparkFun Ultrasonic Distance Sensor
 */
#include "main.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_exti.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_flash.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_gpio.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_i2c.h"
#include "STM8L15x_StdPeriph_Driver/inc/stm8l15x_tim2.h"

uint8_t outRange = 0;
uint8_t opAmpInterrupt = 0;
uint8_t addressInterrupt = 0;
uint8_t triggerInterrupt = 0;
uint8_t i2cInterrupt = 0;
uint8_t eepromIterator = 1;

uint8_t distanceH = 0, distanceL = 0;
uint8_t userAddress = 0x2F;
double totalTime = 0.0; 
double distance = 0.0;
uint16_t cycles = 0;
volatile uint8_t peripheralBuffer[kBufferSize] = {0};

// Needed for ST's perhiperhal library memory functions.
#ifdef _COSMIC_
 int _fctcpy(char name);
#endif /*_COSMIC_*/

int main(void) {

  initializeCLK();
  initializeTimers();
  initializeGPIO();

  //Fresh EEPROM has 0x00 stored within it's memory. 
  if(getAddr()  == 0x00)
    setAddr(kUltrasonicAddress);

  initializeI2C();

  enableInterrupts();
  setOpAmp(kDisableOpAmp);
  


  while (1) {
    // Loop until something comes in.
    if (i2cInterrupt == 1) {
      if (peripheralBuffer[0] == kCmdReadDistance) {
        setOpAmp(kEnableOpAmp);
        pulseTransmitter();
      }
      if (peripheralBuffer[0] == kCmdChangeAddress) {
        if (peripheralBuffer > 0x00 && peripheralBuffer[1] < 0x7F) {
          userAddress = peripheralBuffer[1];
          setAddr(userAddress);
          initializeI2C();
        }
      }
      i2cInterrupt = 0;
    }

    if (opAmpInterrupt == 1) {
      cycles = TIM2_GetCounter();
      TIM2_Cmd(DISABLE);
      TIM3_Cmd(DISABLE);
      GPIO_ResetBits(GPIOB, GPIO_Pin_2);
      //time = time per cycle(in seconds) * number of cycles
      totalTime = kTIM2CycleSeconds * (double)cycles;
      distance = (totalTime * (double)kSpeedOfSound * (double)kConvertMM)/2.0; 
      
      if(outRange == 0){
         distanceH = (uint16_t)(distance) >> 8;
         distanceL = (uint8_t)distance;
       }
      if(outRange == 1){
         distanceH = 0;
         distanceL = 0;
      }
      outRange = 0;
      opAmpInterrupt = 0;
    }

    if (triggerInterrupt == 1) {
      if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_3)) {
        setOpAmp(kEnableOpAmp);
        pulseTransmitter();
        TIM3_SetCounter(0);
        TIM3_Cmd(ENABLE);
      }
      triggerInterrupt = 0;
    }

    if (addressInterrupt == 1) {
      setAddr(kUltrasonicAddress);
      initializeI2C();
      addressInterrupt = 0;
    }
  }
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
 * @brief GPIO setup for the ultrasonic sensor: DIN1, DIN2, ECHO, TRIG,
 * ADDR_RST.
 * @param  None
 * @retval None
 */
void initializeGPIO(void) {
  GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_High_Fast); // DIN2
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_1, GPIO_Mode_Out_PP_High_Fast); // DIN1
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast); // ECHO
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Slow); // PB4
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_3, GPIO_Mode_In_FL_IT); // TRIG
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_5, GPIO_Mode_In_PU_IT); // ADDR_RST
  GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_6, GPIO_Mode_In_FL_IT); // INT

  // External interrups for TRIG, INT, ADDR_RST
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
void initializeI2C(void) {
  CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  I2C_DeInit(I2C1);
  I2C_Init(I2C1, kI2CSpeed, getAddr(), I2C_Mode_I2C, I2C_DutyCycle_2,
           I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  I2C_Cmd(I2C1, ENABLE);
}

/*
 * @brief Setup for the 16MHz internal High Speed Clock for the STM8L051F3.
 * @param  None
 * @retval None
 */
void initializeCLK(void) {
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  CLK_HSICmd(ENABLE);
  while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET)
    ;
}

/*
 * @brief Enables and configures timers two, three, and four.
 * @param  None
 * @retval None
 */
void initializeTimers(void) {

  // Clock used for calculating the transmitter's pulse distance.
  TIM2_DeInit();
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  TIM2_TimeBaseInit(TIM2_Prescaler_128, TIM2_CounterMode_Up, kTim2Period);
  TIM2_ClearFlag(TIM2_FLAG_Update);
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);

  // Clock used for determining time out with regards to the trigger pin. 
  TIM3_DeInit();
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, kTim3Period);
  TIM3_ClearFlag(TIM3_FLAG_Update);
  TIM3_ITConfig(TIM3_IT_Update, ENABLE);
  
  // Clock used to delay floating the inverting pin on the last stage (comparator)
  // of the op-amp.
  TIM4_DeInit();
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  TIM4_TimeBaseInit(TIM4_Prescaler_128, kTim4Period);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);
}

/*
 * @brief Pulse the transmitter at ~48kHz by toggline the pins on the tranmitter.
 * @param  None
 * @retval None
 */
void pulseTransmitter(void) {

  uint8_t i = 0;

  GPIO_ResetBits(GPIOB, GPIO_Pin_1);
  GPIO_SetBits(GPIOD, GPIO_Pin_0);

  for (i = 0; i < 4; i++) {

    GPIO_ResetBits(GPIOD, GPIO_Pin_0);
    GPIO_SetBits(GPIOB, GPIO_Pin_1);

    delay(kCycles48kHz);

    GPIO_SetBits(GPIOD, GPIO_Pin_0);
    GPIO_ResetBits(GPIOB, GPIO_Pin_1);

    delay(kCycles48kHz);
  }
  for (i = 0; i < 4; i++) {
  
    GPIO_ResetBits(GPIOD, GPIO_Pin_0);
    GPIO_SetBits(GPIOB, GPIO_Pin_1);
  
    delay(kCycles48kHz);
  
    GPIO_SetBits(GPIOD, GPIO_Pin_0);
    GPIO_ResetBits(GPIOB, GPIO_Pin_1);
  
    delay(kCycles48kHz);
  }
  // ECHO pin high
  GPIO_SetBits(GPIOB, GPIO_Pin_2);
  TIM2_SetCounter(0);
  TIM4_SetCounter(0);
  TIM2_Cmd(ENABLE);
  TIM4_Cmd(ENABLE);
}

/*
 * @brief Enable or disable the op-amp. The inverting pin of the op-amp changes state often, so it's 
 * reinitialized each time it's enabled/disabled.
 * @param  enable: 1 to enable, 0 to disable.
 * @retval None
 */
void setOpAmp(uint8_t enable) {
  if (enable) {
    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast); // PB4
    GPIO_ResetBits(GPIOB, GPIO_Pin_4);
  } else {
    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast); // PB4
    GPIO_SetBits(GPIOB, GPIO_Pin_4);
  }
}

/*
 * @brief Write the given I2C address to EEPROM.
 * @param  userAddr: The given I2C address for the Ultrasonic sensor.
 * @retval None
 */
void setAddr(uint8_t userAddr) {

  FLASH_DeInit();
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);

  FLASH_Unlock(FLASH_MemType_Program);
  while (FLASH_GetFlagStatus(FLASH_FLAG_PUL) == RESET)
    ;

  FLASH_Unlock(FLASH_MemType_Data);
  while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
    ;

  FLASH_ProgramByte(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS, userAddr);

  while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET)
    ;

  FLASH_Lock(FLASH_MemType_Data);
  FLASH_Lock(FLASH_MemType_Program);
}

/*
 * @brief Read the ultarsonic's I2C address byte from the EEPROM
 * @retval The I2C address of the Ultrasonic sensor.
 */
uint8_t getAddr(void) {
  
  uint8_t addr = 0;

  FLASH_DeInit();
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);

  FLASH_Unlock(FLASH_MemType_Program);
  while (FLASH_GetFlagStatus(FLASH_FLAG_PUL) == RESET)
    ;

  FLASH_Unlock(FLASH_MemType_Data);
  while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
    ;

  addr = FLASH_ReadByte(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS);

  FLASH_Lock(FLASH_MemType_Data);
  FLASH_Lock(FLASH_MemType_Program);

  return addr; 
}
