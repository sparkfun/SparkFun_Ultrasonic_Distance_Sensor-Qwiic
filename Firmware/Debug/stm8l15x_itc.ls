   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 56 uint8_t ITC_GetCPUCC(void)
  18                     ; 57 {
  19                     	scross	off
  20  0000               _ITC_GetCPUCC:
  22                     ; 59   _asm("push cc");
  24  0000 8a            	push	cc
  26                     ; 60   _asm("pop a");
  28  0001 84            	pop	a
  30                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  31  0002 81            	ret	
  33                     ; 87 void ITC_DeInit(void)
  33                     ; 88 {
  34  0003               _ITC_DeInit:
  36                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  37  0003 35ff7f70      	mov	32624,#255
  38                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  39  0007 35ff7f71      	mov	32625,#255
  40                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  41  000b 35ff7f72      	mov	32626,#255
  42                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  43  000f 35ff7f73      	mov	32627,#255
  44                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  45  0013 35ff7f74      	mov	32628,#255
  46                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  47  0017 35ff7f75      	mov	32629,#255
  48                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
  49  001b 35ff7f76      	mov	32630,#255
  50                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
  51  001f 35ff7f77      	mov	32631,#255
  52                     ; 97 }
  53  0023 81            	ret	
  55                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
  55                     ; 105 {
  56  0024               _ITC_GetSoftIntStatus:
  58                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
  59  0024 adda          	call	_ITC_GetCPUCC
  61  0026 a428          	and	a,#40
  63  0028 81            	ret	
  65                     .const:	section	.text
  66  0000               L22:
  67  0000 004b          	dc.w	L3
  68  0002 004b          	dc.w	L3
  69  0004 004b          	dc.w	L3
  70  0006 0050          	dc.w	L5
  71  0008 0050          	dc.w	L5
  72  000a 0050          	dc.w	L5
  73  000c 0050          	dc.w	L5
  74  000e 0055          	dc.w	L7
  75  0010 0055          	dc.w	L7
  76  0012 0055          	dc.w	L7
  77  0014 0055          	dc.w	L7
  78  0016 005a          	dc.w	L11
  79  0018 005a          	dc.w	L11
  80  001a 005a          	dc.w	L11
  81  001c 005a          	dc.w	L11
  82  001e 0075          	dc.w	L72
  83  0020 005f          	dc.w	L31
  84  0022 005f          	dc.w	L31
  85  0024 005f          	dc.w	L31
  86  0026 0064          	dc.w	L51
  87  0028 0064          	dc.w	L51
  88  002a 0064          	dc.w	L51
  89  002c 0075          	dc.w	L72
  90  002e 0075          	dc.w	L72
  91  0030 0069          	dc.w	L71
  92  0032 0069          	dc.w	L71
  93  0034 0069          	dc.w	L71
  94  0036 006e          	dc.w	L12
  95  0038 006e          	dc.w	L12
  96                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
  96                     ; 115 {
  97                     	switch	.text
  98  0029               _ITC_GetSoftwarePriority:
  99  0029 88            	push	a
 100  002a 89            	pushw	x
 101       00000002      OFST:	set	2
 103                     ; 116   uint8_t Value = 0;
 104  002b 0f02          	clr	(OFST+0,sp)
 105                     ; 117   uint8_t Mask = 0;
 106                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 107                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 108  002d a403          	and	a,#3
 109  002f 48            	sll	a
 110  0030 5f            	clrw	x
 111  0031 97            	ld	xl,a
 112  0032 a603          	ld	a,#3
 113  0034 5d            	tnzw	x
 114  0035 2704          	jreq	L41
 115  0037               L61:
 116  0037 48            	sll	a
 117  0038 5a            	decw	x
 118  0039 26fc          	jrne	L61
 119  003b               L41:
 120  003b 6b01          	ld	(OFST-1,sp),a
 121                     ; 125   switch (IRQn)
 122  003d 7b03          	ld	a,(OFST+1,sp)
 124                     ; 223     default:
 124                     ; 224       break;
 125  003f 4a            	dec	a
 126  0040 a11d          	cp	a,#29
 127  0042 2431          	jruge	L72
 128  0044 5f            	clrw	x
 129  0045 97            	ld	xl,a
 130  0046 58            	sllw	x
 131  0047 de0000        	ldw	x,(L22,x)
 132  004a fc            	jp	(x)
 133  004b               L3:
 134                     ; 127     case FLASH_IRQn:
 134                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 134                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 134                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 135  004b c67f70        	ld	a,32624
 136                     ; 131       break;
 137  004e 2021          	jp	LC001
 138  0050               L5:
 139                     ; 133     case EXTIE_F_PVD_IRQn:
 139                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 139                     ; 135     case RTC_IRQn:
 139                     ; 136     case EXTIB_IRQn:
 139                     ; 137     case EXTID_IRQn:
 139                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 139                     ; 139     case RTC_CSSLSE_IRQn:
 139                     ; 140     case EXTIB_IRQn:
 139                     ; 141     case EXTID_IRQn:
 139                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 139                     ; 143     case RTC_CSSLSE_IRQn:
 139                     ; 144     case EXTIB_G_IRQn:
 139                     ; 145     case EXTID_H_IRQn:
 139                     ; 146 #endif  /* STM8L15X_MD */
 139                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 140  0050 c67f71        	ld	a,32625
 141                     ; 148       break;
 142  0053 201c          	jp	LC001
 143  0055               L7:
 144                     ; 150     case EXTI0_IRQn:
 144                     ; 151     case EXTI1_IRQn:
 144                     ; 152     case EXTI2_IRQn:
 144                     ; 153     case EXTI3_IRQn:
 144                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 145  0055 c67f72        	ld	a,32626
 146                     ; 155       break;
 147  0058 2017          	jp	LC001
 148  005a               L11:
 149                     ; 157     case EXTI4_IRQn:
 149                     ; 158     case EXTI5_IRQn:
 149                     ; 159     case EXTI6_IRQn:
 149                     ; 160     case EXTI7_IRQn:
 149                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 150  005a c67f73        	ld	a,32627
 151                     ; 162       break;
 152  005d 2012          	jp	LC001
 153  005f               L31:
 154                     ; 165     case SWITCH_CSS_IRQn:
 154                     ; 166 #else
 154                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 154                     ; 168 #endif /* STM8L15X_LD */		
 154                     ; 169     case ADC1_COMP_IRQn:
 154                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 154                     ; 171     case LCD_IRQn:
 154                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 154                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 154                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 154                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 154                     ; 176     case LCD_AES_IRQn:
 154                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 154                     ; 178 #endif  /* STM8L15X_MD */
 154                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 155  005f c67f74        	ld	a,32628
 156                     ; 180       break;
 157  0062 200d          	jp	LC001
 158  0064               L51:
 159                     ; 187     case TIM2_CC_IRQn:
 159                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 159                     ; 189     case TIM3_CC_IRQn:
 159                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 159                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 159                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 159                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 159                     ; 194 #endif  /* STM8L15X_MD */
 159                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 160  0064 c67f75        	ld	a,32629
 161                     ; 196       break;
 162  0067 2008          	jp	LC001
 163  0069               L71:
 164                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 164                     ; 202     case SPI1_IRQn:
 164                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 164                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 164                     ; 205     case USART1_TX_IRQn:
 164                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 164                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 164                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 164                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 165  0069 c67f76        	ld	a,32630
 166                     ; 210       break;
 167  006c 2003          	jp	LC001
 168  006e               L12:
 169                     ; 214     case USART1_RX_IRQn:
 169                     ; 215     case I2C1_IRQn:
 169                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 169                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 169                     ; 218     case I2C1_SPI2_IRQn:
 169                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 169                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 170  006e c67f77        	ld	a,32631
 171  0071               LC001:
 172  0071 1401          	and	a,(OFST-1,sp)
 173  0073 6b02          	ld	(OFST+0,sp),a
 174                     ; 221       break;
 175                     ; 223     default:
 175                     ; 224       break;
 176  0075               L72:
 177                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 178  0075 7b03          	ld	a,(OFST+1,sp)
 179  0077 a403          	and	a,#3
 180  0079 48            	sll	a
 181  007a 5f            	clrw	x
 182  007b 97            	ld	xl,a
 183  007c 7b02          	ld	a,(OFST+0,sp)
 184  007e 5d            	tnzw	x
 185  007f 2704          	jreq	L42
 186  0081               L62:
 187  0081 44            	srl	a
 188  0082 5a            	decw	x
 189  0083 26fc          	jrne	L62
 190  0085               L42:
 191                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 193  0085 5b03          	addw	sp,#3
 194  0087 81            	ret	
 196                     	switch	.const
 197  003a               L44:
 198  003a 00bf          	dc.w	L13
 199  003c 00bf          	dc.w	L13
 200  003e 00bf          	dc.w	L13
 201  0040 00d1          	dc.w	L33
 202  0042 00d1          	dc.w	L33
 203  0044 00d1          	dc.w	L33
 204  0046 00d1          	dc.w	L33
 205  0048 00e3          	dc.w	L53
 206  004a 00e3          	dc.w	L53
 207  004c 00e3          	dc.w	L53
 208  004e 00e3          	dc.w	L53
 209  0050 00f5          	dc.w	L73
 210  0052 00f5          	dc.w	L73
 211  0054 00f5          	dc.w	L73
 212  0056 00f5          	dc.w	L73
 213  0058 014d          	dc.w	L55
 214  005a 0107          	dc.w	L14
 215  005c 0107          	dc.w	L14
 216  005e 0107          	dc.w	L14
 217  0060 0119          	dc.w	L34
 218  0062 0119          	dc.w	L34
 219  0064 0119          	dc.w	L34
 220  0066 014d          	dc.w	L55
 221  0068 014d          	dc.w	L55
 222  006a 012b          	dc.w	L54
 223  006c 012b          	dc.w	L54
 224  006e 012b          	dc.w	L54
 225  0070 013d          	dc.w	L74
 226  0072 013d          	dc.w	L74
 227                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 227                     ; 251 {
 228                     	switch	.text
 229  0088               _ITC_SetSoftwarePriority:
 230  0088 89            	pushw	x
 231  0089 89            	pushw	x
 232       00000002      OFST:	set	2
 234                     ; 252   uint8_t Mask = 0;
 235                     ; 253   uint8_t NewPriority = 0;
 236                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 237                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 238                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 239                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 240  008a 9e            	ld	a,xh
 241  008b a403          	and	a,#3
 242  008d 48            	sll	a
 243  008e 5f            	clrw	x
 244  008f 97            	ld	xl,a
 245  0090 a603          	ld	a,#3
 246  0092 5d            	tnzw	x
 247  0093 2704          	jreq	L23
 248  0095               L43:
 249  0095 48            	sll	a
 250  0096 5a            	decw	x
 251  0097 26fc          	jrne	L43
 252  0099               L23:
 253  0099 43            	cpl	a
 254  009a 6b01          	ld	(OFST-1,sp),a
 255                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 256  009c 7b03          	ld	a,(OFST+1,sp)
 257  009e a403          	and	a,#3
 258  00a0 48            	sll	a
 259  00a1 5f            	clrw	x
 260  00a2 97            	ld	xl,a
 261  00a3 7b04          	ld	a,(OFST+2,sp)
 262  00a5 5d            	tnzw	x
 263  00a6 2704          	jreq	L63
 264  00a8               L04:
 265  00a8 48            	sll	a
 266  00a9 5a            	decw	x
 267  00aa 26fc          	jrne	L04
 268  00ac               L63:
 269  00ac 6b02          	ld	(OFST+0,sp),a
 270                     ; 268   switch (IRQn)
 271  00ae 7b03          	ld	a,(OFST+1,sp)
 273                     ; 372     default:
 273                     ; 373       break;
 274  00b0 4a            	dec	a
 275  00b1 a11d          	cp	a,#29
 276  00b3 2503cc014d    	jruge	L55
 277  00b8 5f            	clrw	x
 278  00b9 97            	ld	xl,a
 279  00ba 58            	sllw	x
 280  00bb de003a        	ldw	x,(L44,x)
 281  00be fc            	jp	(x)
 282  00bf               L13:
 283                     ; 270     case FLASH_IRQn:
 283                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 283                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 283                     ; 273       ITC->ISPR1 &= Mask;
 284  00bf c67f70        	ld	a,32624
 285  00c2 1401          	and	a,(OFST-1,sp)
 286  00c4 c77f70        	ld	32624,a
 287                     ; 274       ITC->ISPR1 |= NewPriority;
 288  00c7 c67f70        	ld	a,32624
 289  00ca 1a02          	or	a,(OFST+0,sp)
 290  00cc c77f70        	ld	32624,a
 291                     ; 275       break;
 292  00cf 207c          	jra	L55
 293  00d1               L33:
 294                     ; 277     case EXTIE_F_PVD_IRQn:
 294                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 294                     ; 279     case RTC_IRQn:
 294                     ; 280     case EXTIB_IRQn:
 294                     ; 281     case EXTID_IRQn:
 294                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 294                     ; 283     case RTC_CSSLSE_IRQn:
 294                     ; 284     case EXTIB_IRQn:
 294                     ; 285     case EXTID_IRQn:
 294                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 294                     ; 287     case RTC_CSSLSE_IRQn:
 294                     ; 288     case EXTIB_G_IRQn:
 294                     ; 289     case EXTID_H_IRQn:
 294                     ; 290 #endif  /* STM8L15X_MD */
 294                     ; 291       ITC->ISPR2 &= Mask;
 295  00d1 c67f71        	ld	a,32625
 296  00d4 1401          	and	a,(OFST-1,sp)
 297  00d6 c77f71        	ld	32625,a
 298                     ; 292       ITC->ISPR2 |= NewPriority;
 299  00d9 c67f71        	ld	a,32625
 300  00dc 1a02          	or	a,(OFST+0,sp)
 301  00de c77f71        	ld	32625,a
 302                     ; 293       break;
 303  00e1 206a          	jra	L55
 304  00e3               L53:
 305                     ; 295     case EXTI0_IRQn:
 305                     ; 296     case EXTI1_IRQn:
 305                     ; 297     case EXTI2_IRQn:
 305                     ; 298     case EXTI3_IRQn:
 305                     ; 299       ITC->ISPR3 &= Mask;
 306  00e3 c67f72        	ld	a,32626
 307  00e6 1401          	and	a,(OFST-1,sp)
 308  00e8 c77f72        	ld	32626,a
 309                     ; 300       ITC->ISPR3 |= NewPriority;
 310  00eb c67f72        	ld	a,32626
 311  00ee 1a02          	or	a,(OFST+0,sp)
 312  00f0 c77f72        	ld	32626,a
 313                     ; 301       break;
 314  00f3 2058          	jra	L55
 315  00f5               L73:
 316                     ; 303     case EXTI4_IRQn:
 316                     ; 304     case EXTI5_IRQn:
 316                     ; 305     case EXTI6_IRQn:
 316                     ; 306     case EXTI7_IRQn:
 316                     ; 307       ITC->ISPR4 &= Mask;
 317  00f5 c67f73        	ld	a,32627
 318  00f8 1401          	and	a,(OFST-1,sp)
 319  00fa c77f73        	ld	32627,a
 320                     ; 308       ITC->ISPR4 |= NewPriority;
 321  00fd c67f73        	ld	a,32627
 322  0100 1a02          	or	a,(OFST+0,sp)
 323  0102 c77f73        	ld	32627,a
 324                     ; 309       break;
 325  0105 2046          	jra	L55
 326  0107               L14:
 327                     ; 313     case SWITCH_CSS_IRQn:
 327                     ; 314 #endif /*	STM8L15X_LD	*/
 327                     ; 315     case ADC1_COMP_IRQn:
 327                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 327                     ; 317     case LCD_IRQn:
 327                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 327                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 327                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 327                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 327                     ; 322     case LCD_AES_IRQn:
 327                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 327                     ; 324 #endif  /* STM8L15X_MD */
 327                     ; 325       ITC->ISPR5 &= Mask;
 328  0107 c67f74        	ld	a,32628
 329  010a 1401          	and	a,(OFST-1,sp)
 330  010c c77f74        	ld	32628,a
 331                     ; 326       ITC->ISPR5 |= NewPriority;
 332  010f c67f74        	ld	a,32628
 333  0112 1a02          	or	a,(OFST+0,sp)
 334  0114 c77f74        	ld	32628,a
 335                     ; 327       break;
 336  0117 2034          	jra	L55
 337  0119               L34:
 338                     ; 333     case TIM2_CC_IRQn:
 338                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 338                     ; 335     case TIM3_CC_IRQn:
 338                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 338                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 338                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 338                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 338                     ; 340 #endif  /* STM8L15X_MD */
 338                     ; 341       ITC->ISPR6 &= Mask;
 339  0119 c67f75        	ld	a,32629
 340  011c 1401          	and	a,(OFST-1,sp)
 341  011e c77f75        	ld	32629,a
 342                     ; 342       ITC->ISPR6 |= NewPriority;
 343  0121 c67f75        	ld	a,32629
 344  0124 1a02          	or	a,(OFST+0,sp)
 345  0126 c77f75        	ld	32629,a
 346                     ; 343       break;
 347  0129 2022          	jra	L55
 348  012b               L54:
 349                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 349                     ; 349     case SPI1_IRQn:
 349                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 349                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 349                     ; 352     case USART1_TX_IRQn:
 349                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 349                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 349                     ; 355 #endif  /* STM8L15X_MD */
 349                     ; 356       ITC->ISPR7 &= Mask;
 350  012b c67f76        	ld	a,32630
 351  012e 1401          	and	a,(OFST-1,sp)
 352  0130 c77f76        	ld	32630,a
 353                     ; 357       ITC->ISPR7 |= NewPriority;
 354  0133 c67f76        	ld	a,32630
 355  0136 1a02          	or	a,(OFST+0,sp)
 356  0138 c77f76        	ld	32630,a
 357                     ; 358       break;
 358  013b 2010          	jra	L55
 359  013d               L74:
 360                     ; 362     case USART1_RX_IRQn:
 360                     ; 363     case I2C1_IRQn:
 360                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 360                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 360                     ; 366     case I2C1_SPI2_IRQn:
 360                     ; 367 #endif  /* STM8L15X_MD */
 360                     ; 368       ITC->ISPR8 &= Mask;
 361  013d c67f77        	ld	a,32631
 362  0140 1401          	and	a,(OFST-1,sp)
 363  0142 c77f77        	ld	32631,a
 364                     ; 369       ITC->ISPR8 |= NewPriority;
 365  0145 c67f77        	ld	a,32631
 366  0148 1a02          	or	a,(OFST+0,sp)
 367  014a c77f77        	ld	32631,a
 368                     ; 370       break;
 369                     ; 372     default:
 369                     ; 373       break;
 370  014d               L55:
 371                     ; 375 }
 372  014d 5b04          	addw	sp,#4
 373  014f 81            	ret	
 375                     	xdef	_ITC_GetSoftwarePriority
 376                     	xdef	_ITC_SetSoftwarePriority
 377                     	xdef	_ITC_GetSoftIntStatus
 378                     	xdef	_ITC_GetCPUCC
 379                     	xdef	_ITC_DeInit
 380                     	end
