/* �����ֹ�ݹ���� ----------------------------------------------------------*/
#ifndef _BSP_H
#define _BSP_H

#define I2CSPEED 100000
/* ������ͷ�ļ� --------------------------------------------------------------*/
#include "stm8l15x.h"
//#include "stm8l15x_itc.h"

/* �궨�� --------------------------------------------------------------------*/




/* �������� ------------------------------------------------------------------*/

void EIGHT(void);
//void I2C_DeInit_Config(uint8_t SLAVE_ADDR);
void EEPROM_WriteByte(uint16_t Addr,uint8_t Data);
uint8_t EEPROM_ReadByte(uint16_t Addr);

#endif /* _BSP_H */

