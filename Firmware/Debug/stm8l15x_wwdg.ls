   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  58                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  58                     ; 120 {
  60                     	switch	.text
  61  0000               _WWDG_Init:
  63  0000 89            	pushw	x
  64       00000000      OFST:	set	0
  67                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  69                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  71  0001 357f50d4      	mov	20692,#127
  72                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  74  0005 9e            	ld	a,xh
  75  0006 aa80          	or	a,#128
  76  0008 c750d3        	ld	20691,a
  77                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  79  000b 7b02          	ld	a,(OFST+2,sp)
  80  000d a47f          	and	a,#127
  81  000f c750d4        	ld	20692,a
  82                     ; 127 }
  85  0012 85            	popw	x
  86  0013 81            	ret
 128                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 128                     ; 136 {
 129                     	switch	.text
 130  0014               _WWDG_SetWindowValue:
 132  0014 88            	push	a
 133       00000001      OFST:	set	1
 136                     ; 137   __IO uint8_t tmpreg = 0;
 138  0015 0f01          	clr	(OFST+0,sp)
 140                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 142                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 144  0017 a47f          	and	a,#127
 145  0019 1a01          	or	a,(OFST+0,sp)
 146  001b 6b01          	ld	(OFST+0,sp),a
 148                     ; 146   WWDG->WR = tmpreg;
 150  001d 7b01          	ld	a,(OFST+0,sp)
 151  001f c750d4        	ld	20692,a
 152                     ; 147 }
 155  0022 84            	pop	a
 156  0023 81            	ret
 188                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 188                     ; 157 {
 189                     	switch	.text
 190  0024               _WWDG_SetCounter:
 194                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 196                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 198  0024 a47f          	and	a,#127
 199  0026 c750d3        	ld	20691,a
 200                     ; 164 }
 203  0029 81            	ret
 235                     ; 187 void WWDG_Enable(uint8_t Counter)
 235                     ; 188 {
 236                     	switch	.text
 237  002a               _WWDG_Enable:
 241                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 243                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 245  002a aa80          	or	a,#128
 246  002c c750d3        	ld	20691,a
 247                     ; 192 }
 250  002f 81            	ret
 273                     ; 216 uint8_t WWDG_GetCounter(void)
 273                     ; 217 {
 274                     	switch	.text
 275  0030               _WWDG_GetCounter:
 279                     ; 218   return(WWDG->CR);
 281  0030 c650d3        	ld	a,20691
 284  0033 81            	ret
 307                     ; 226 void WWDG_SWReset(void)
 307                     ; 227 {
 308                     	switch	.text
 309  0034               _WWDG_SWReset:
 313                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 315  0034 358050d3      	mov	20691,#128
 316                     ; 229 }
 319  0038 81            	ret
 332                     	xdef	_WWDG_SWReset
 333                     	xdef	_WWDG_GetCounter
 334                     	xdef	_WWDG_Enable
 335                     	xdef	_WWDG_SetCounter
 336                     	xdef	_WWDG_SetWindowValue
 337                     	xdef	_WWDG_Init
 356                     	end
