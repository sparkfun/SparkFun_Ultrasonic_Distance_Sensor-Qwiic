   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  18                     ; 120 {
  19                     	scross	off
  20  0000               _WWDG_Init:
  21  0000 89            	pushw	x
  22       00000000      OFST:	set	0
  24                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  25                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  26  0001 357f50d4      	mov	20692,#127
  27                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  28  0005 9e            	ld	a,xh
  29  0006 aa80          	or	a,#128
  30  0008 c750d3        	ld	20691,a
  31                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  32  000b 7b02          	ld	a,(OFST+2,sp)
  33  000d a47f          	and	a,#127
  34  000f c750d4        	ld	20692,a
  35                     ; 127 }
  36  0012 85            	popw	x
  37  0013 81            	ret	
  39                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
  39                     ; 136 {
  40  0014               _WWDG_SetWindowValue:
  41  0014 88            	push	a
  42       00000001      OFST:	set	1
  44                     ; 137   __IO uint8_t tmpreg = 0;
  45  0015 0f01          	clr	(OFST+0,sp)
  46                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  47                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
  48  0017 a47f          	and	a,#127
  49  0019 1a01          	or	a,(OFST+0,sp)
  50  001b 6b01          	ld	(OFST+0,sp),a
  51                     ; 146   WWDG->WR = tmpreg;
  52  001d 7b01          	ld	a,(OFST+0,sp)
  53  001f c750d4        	ld	20692,a
  54                     ; 147 }
  55  0022 84            	pop	a
  56  0023 81            	ret	
  58                     ; 156 void WWDG_SetCounter(uint8_t Counter)
  58                     ; 157 {
  59  0024               _WWDG_SetCounter:
  61                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
  62                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
  63  0024 a47f          	and	a,#127
  64  0026 c750d3        	ld	20691,a
  65                     ; 164 }
  66  0029 81            	ret	
  68                     ; 187 void WWDG_Enable(uint8_t Counter)
  68                     ; 188 {
  69  002a               _WWDG_Enable:
  71                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
  72                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  73  002a aa80          	or	a,#128
  74  002c c750d3        	ld	20691,a
  75                     ; 192 }
  76  002f 81            	ret	
  78                     ; 216 uint8_t WWDG_GetCounter(void)
  78                     ; 217 {
  79  0030               _WWDG_GetCounter:
  81                     ; 218   return(WWDG->CR);
  82  0030 c650d3        	ld	a,20691
  84  0033 81            	ret	
  86                     ; 226 void WWDG_SWReset(void)
  86                     ; 227 {
  87  0034               _WWDG_SWReset:
  89                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
  90  0034 358050d3      	mov	20691,#128
  91                     ; 229 }
  92  0038 81            	ret	
  94                     	xdef	_WWDG_SWReset
  95                     	xdef	_WWDG_GetCounter
  96                     	xdef	_WWDG_Enable
  97                     	xdef	_WWDG_SetCounter
  98                     	xdef	_WWDG_SetWindowValue
  99                     	xdef	_WWDG_Init
 100                     	end
