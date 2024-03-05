   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  18                     ; 129 {
  19                     	scross	off
  20  0000               _IWDG_WriteAccessCmd:
  22                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  23                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  24  0000 c750e0        	ld	20704,a
  25                     ; 133 }
  26  0003 81            	ret	
  28                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
  28                     ; 149 {
  29  0004               _IWDG_SetPrescaler:
  31                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
  32                     ; 152   IWDG->PR = IWDG_Prescaler;
  33  0004 c750e1        	ld	20705,a
  34                     ; 153 }
  35  0007 81            	ret	
  37                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
  37                     ; 163 {
  38  0008               _IWDG_SetReload:
  40                     ; 164   IWDG->RLR = IWDG_Reload;
  41  0008 c750e2        	ld	20706,a
  42                     ; 165 }
  43  000b 81            	ret	
  45                     ; 173 void IWDG_ReloadCounter(void)
  45                     ; 174 {
  46  000c               _IWDG_ReloadCounter:
  48                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
  49  000c 35aa50e0      	mov	20704,#170
  50                     ; 176 }
  51  0010 81            	ret	
  53                     ; 199 void IWDG_Enable(void)
  53                     ; 200 {
  54  0011               _IWDG_Enable:
  56                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
  57  0011 35cc50e0      	mov	20704,#204
  58                     ; 202 }
  59  0015 81            	ret	
  61                     	xdef	_IWDG_Enable
  62                     	xdef	_IWDG_ReloadCounter
  63                     	xdef	_IWDG_SetReload
  64                     	xdef	_IWDG_SetPrescaler
  65                     	xdef	_IWDG_WriteAccessCmd
  66                     	end
