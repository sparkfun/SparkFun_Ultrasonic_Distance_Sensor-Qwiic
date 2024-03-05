   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  77                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  77                     ; 129 {
  79                     	switch	.text
  80  0000               _IWDG_WriteAccessCmd:
  84                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  86                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  88  0000 c750e0        	ld	20704,a
  89                     ; 133 }
  92  0003 81            	ret
 182                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 182                     ; 149 {
 183                     	switch	.text
 184  0004               _IWDG_SetPrescaler:
 188                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 190                     ; 152   IWDG->PR = IWDG_Prescaler;
 192  0004 c750e1        	ld	20705,a
 193                     ; 153 }
 196  0007 81            	ret
 228                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 228                     ; 163 {
 229                     	switch	.text
 230  0008               _IWDG_SetReload:
 234                     ; 164   IWDG->RLR = IWDG_Reload;
 236  0008 c750e2        	ld	20706,a
 237                     ; 165 }
 240  000b 81            	ret
 263                     ; 173 void IWDG_ReloadCounter(void)
 263                     ; 174 {
 264                     	switch	.text
 265  000c               _IWDG_ReloadCounter:
 269                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 271  000c 35aa50e0      	mov	20704,#170
 272                     ; 176 }
 275  0010 81            	ret
 298                     ; 199 void IWDG_Enable(void)
 298                     ; 200 {
 299                     	switch	.text
 300  0011               _IWDG_Enable:
 304                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 306  0011 35cc50e0      	mov	20704,#204
 307                     ; 202 }
 310  0015 81            	ret
 323                     	xdef	_IWDG_Enable
 324                     	xdef	_IWDG_ReloadCounter
 325                     	xdef	_IWDG_SetReload
 326                     	xdef	_IWDG_SetPrescaler
 327                     	xdef	_IWDG_WriteAccessCmd
 346                     	end
