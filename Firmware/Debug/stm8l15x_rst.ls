   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
  18                     ; 100 {
  19                     	scross	off
  20  0000               _RST_GetFlagStatus:
  22                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
  23                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
  24  0000 c450b1        	and	a,20657
  25  0003 2702          	jreq	L6
  26  0005 a601          	ld	a,#1
  27  0007               L6:
  29  0007 81            	ret	
  31                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
  31                     ; 121 {
  32  0008               _RST_ClearFlag:
  34                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
  35                     ; 125   RST->SR = (uint8_t)RST_Flag;
  36  0008 c750b1        	ld	20657,a
  37                     ; 126 }
  38  000b 81            	ret	
  40                     ; 149 void RST_GPOutputEnable(void)
  40                     ; 150 {
  41  000c               _RST_GPOutputEnable:
  43                     ; 152   RST->CR = RST_CR_MASK;
  44  000c 35d050b0      	mov	20656,#208
  45                     ; 153 }
  46  0010 81            	ret	
  48                     	xdef	_RST_GPOutputEnable
  49                     	xdef	_RST_ClearFlag
  50                     	xdef	_RST_GetFlagStatus
  51                     	end
