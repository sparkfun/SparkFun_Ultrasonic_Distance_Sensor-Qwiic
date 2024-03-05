   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 95 void WFE_DeInit(void)
  18                     ; 96 {
  19                     	scross	off
  20  0000               _WFE_DeInit:
  22                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  23  0000 725f50a6      	clr	20646
  24                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  25  0004 725f50a7      	clr	20647
  26                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  27  0008 725f50a8      	clr	20648
  28                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  29  000c 725f50a9      	clr	20649
  30                     ; 101 }
  31  0010 81            	ret	
  33                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
  33                     ; 142 {
  34  0011               _WFE_WakeUpSourceEventCmd:
  35  0011 89            	pushw	x
  36  0012 88            	push	a
  37       00000001      OFST:	set	1
  39                     ; 143   uint8_t register_index = 0;
  40                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
  41                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
  42                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
  43  0013 9e            	ld	a,xh
  44  0014 6b01          	ld	(OFST+0,sp),a
  45                     ; 151   if (NewState != DISABLE)
  46  0016 0d06          	tnz	(OFST+5,sp)
  47  0018 2730          	jreq	L72
  48                     ; 153     switch (register_index)
  50                     ; 171       default:
  50                     ; 172         break;
  51  001a 4a            	dec	a
  52  001b 270b          	jreq	L3
  53  001d 4a            	dec	a
  54  001e 270f          	jreq	L5
  55  0020 4a            	dec	a
  56  0021 2716          	jreq	L7
  57  0023 4a            	dec	a
  58  0024 271d          	jreq	L11
  59  0026 2039          	jra	L53
  60  0028               L3:
  61                     ; 155       case 1:
  61                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
  62  0028 c650a6        	ld	a,20646
  63  002b 1a03          	or	a,(OFST+2,sp)
  64                     ; 157         break;
  65  002d 202f          	jp	LC001
  66  002f               L5:
  67                     ; 159       case 2:
  67                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
  68  002f c650a7        	ld	a,20647
  69  0032 1a03          	or	a,(OFST+2,sp)
  70  0034 c750a7        	ld	20647,a
  71                     ; 161         break;
  72  0037 2028          	jra	L53
  73  0039               L7:
  74                     ; 163       case 3:
  74                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
  75  0039 c650a8        	ld	a,20648
  76  003c 1a03          	or	a,(OFST+2,sp)
  77  003e c750a8        	ld	20648,a
  78                     ; 165         break;
  79  0041 201e          	jra	L53
  80  0043               L11:
  81                     ; 167       case 4:
  81                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
  82  0043 c650a9        	ld	a,20649
  83  0046 1a03          	or	a,(OFST+2,sp)
  84                     ; 169         break;
  85  0048 2036          	jp	LC002
  86                     ; 171       default:
  86                     ; 172         break;
  88  004a               L72:
  89                     ; 177     switch (register_index)
  91                     ; 195       default:
  91                     ; 196         break;
  92  004a 4a            	dec	a
  93  004b 270b          	jreq	L51
  94  004d 4a            	dec	a
  95  004e 2714          	jreq	L71
  96  0050 4a            	dec	a
  97  0051 271c          	jreq	L12
  98  0053 4a            	dec	a
  99  0054 2724          	jreq	L32
 100  0056 2009          	jra	L53
 101  0058               L51:
 102                     ; 179       case 1:
 102                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 103  0058 7b03          	ld	a,(OFST+2,sp)
 104  005a 43            	cpl	a
 105  005b c450a6        	and	a,20646
 106  005e               LC001:
 107  005e c750a6        	ld	20646,a
 108                     ; 181         break;
 109  0061               L53:
 110                     ; 199 }
 111  0061 5b03          	addw	sp,#3
 112  0063 81            	ret	
 113  0064               L71:
 114                     ; 183       case 2:
 114                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 115  0064 7b03          	ld	a,(OFST+2,sp)
 116  0066 43            	cpl	a
 117  0067 c450a7        	and	a,20647
 118  006a c750a7        	ld	20647,a
 119                     ; 185         break;
 120  006d 20f2          	jra	L53
 121  006f               L12:
 122                     ; 187       case 3:
 122                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 123  006f 7b03          	ld	a,(OFST+2,sp)
 124  0071 43            	cpl	a
 125  0072 c450a8        	and	a,20648
 126  0075 c750a8        	ld	20648,a
 127                     ; 189         break;
 128  0078 20e7          	jra	L53
 129  007a               L32:
 130                     ; 191       case 4:
 130                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 131  007a 7b03          	ld	a,(OFST+2,sp)
 132  007c 43            	cpl	a
 133  007d c450a9        	and	a,20649
 134  0080               LC002:
 135  0080 c750a9        	ld	20649,a
 136                     ; 193         break;
 137  0083 20dc          	jra	L53
 138                     ; 195       default:
 138                     ; 196         break;
 140                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 140                     ; 238 {
 141  0085               _WFE_GetWakeUpSourceEventStatus:
 142  0085 89            	pushw	x
 143  0086 88            	push	a
 144       00000001      OFST:	set	1
 146                     ; 239   FunctionalState status = DISABLE;
 147  0087 0f01          	clr	(OFST+0,sp)
 148                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 149                     ; 243   switch (WFE_Source)
 151                     ; 326     default:
 151                     ; 327       break;
 152  0089 1d0101        	subw	x,#257
 153  008c 2603cc0121    	jreq	L34
 154  0091 5a            	decw	x
 155  0092 27fa          	jreq	L34
 156  0094 1d0002        	subw	x,#2
 157  0097 27f5          	jreq	L34
 158  0099 1d0004        	subw	x,#4
 159  009c 27f0          	jreq	L34
 160  009e 1d0008        	subw	x,#8
 161  00a1 277e          	jreq	L34
 162  00a3 1d0010        	subw	x,#16
 163  00a6 2779          	jreq	L34
 164  00a8 1d0020        	subw	x,#32
 165  00ab 2774          	jreq	L34
 166  00ad 1d0040        	subw	x,#64
 167  00b0 276f          	jreq	L34
 168  00b2 1d0081        	subw	x,#129
 169  00b5 276f          	jreq	L54
 170  00b7 5a            	decw	x
 171  00b8 276c          	jreq	L54
 172  00ba 1d0002        	subw	x,#2
 173  00bd 2767          	jreq	L54
 174  00bf 1d0004        	subw	x,#4
 175  00c2 2762          	jreq	L54
 176  00c4 1d0008        	subw	x,#8
 177  00c7 275d          	jreq	L54
 178  00c9 1d0010        	subw	x,#16
 179  00cc 2758          	jreq	L54
 180  00ce 1d0020        	subw	x,#32
 181  00d1 2753          	jreq	L54
 182  00d3 1d0040        	subw	x,#64
 183  00d6 274e          	jreq	L54
 184  00d8 1d0081        	subw	x,#129
 185  00db 274e          	jreq	L74
 186  00dd 5a            	decw	x
 187  00de 274b          	jreq	L74
 188  00e0 1d0002        	subw	x,#2
 189  00e3 2746          	jreq	L74
 190  00e5 1d0004        	subw	x,#4
 191  00e8 2741          	jreq	L74
 192  00ea 1d0008        	subw	x,#8
 193  00ed 273c          	jreq	L74
 194  00ef 1d0010        	subw	x,#16
 195  00f2 2737          	jreq	L74
 196  00f4 1d0020        	subw	x,#32
 197  00f7 2732          	jreq	L74
 198  00f9 1d0040        	subw	x,#64
 199  00fc 272d          	jreq	L74
 200  00fe 1d0081        	subw	x,#129
 201  0101 2735          	jreq	L15
 202  0103 5a            	decw	x
 203  0104 2732          	jreq	L15
 204  0106 1d0002        	subw	x,#2
 205  0109 272d          	jreq	L15
 206  010b 1d0004        	subw	x,#4
 207  010e 2728          	jreq	L15
 208  0110 1d0008        	subw	x,#8
 209  0113 2723          	jreq	L15
 210  0115 1d0010        	subw	x,#16
 211  0118 271e          	jreq	L15
 212  011a 1d0020        	subw	x,#32
 213  011d 2719          	jreq	L15
 214  011f 2020          	jra	L75
 215  0121               L34:
 216                     ; 245     case WFE_Source_TIM2_EV0:
 216                     ; 246     case WFE_Source_TIM2_EV1:
 216                     ; 247     case WFE_Source_TIM1_EV0:
 216                     ; 248     case WFE_Source_TIM1_EV1:
 216                     ; 249     case WFE_Source_EXTI_EV0:
 216                     ; 250     case WFE_Source_EXTI_EV1:
 216                     ; 251     case WFE_Source_EXTI_EV2:
 216                     ; 252     case WFE_Source_EXTI_EV3:
 216                     ; 253 
 216                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 217  0121 c650a6        	ld	a,20646
 218                     ; 257         status = ENABLE;
 220  0124 2008          	jp	LC005
 221                     ; 262         status = DISABLE;
 222  0126               L54:
 223                     ; 266     case WFE_Source_EXTI_EV4:
 223                     ; 267     case WFE_Source_EXTI_EV5:
 223                     ; 268     case WFE_Source_EXTI_EV6:
 223                     ; 269     case WFE_Source_EXTI_EV7:
 223                     ; 270     case WFE_Source_EXTI_EVB_G:
 223                     ; 271     case WFE_Source_EXTI_EVD_H:
 223                     ; 272     case WFE_Source_EXTI_EVE_F:
 223                     ; 273     case WFE_Source_ADC1_COMP_EV:
 223                     ; 274 
 223                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 224  0126 c650a7        	ld	a,20647
 225                     ; 278         status = ENABLE;
 227  0129 2003          	jp	LC005
 228                     ; 283         status = DISABLE;
 229  012b               L74:
 230                     ; 286     case WFE_Source_TIM3_EV0:
 230                     ; 287     case WFE_Source_TIM3_EV1:
 230                     ; 288     case WFE_Source_TIM4_EV:
 230                     ; 289     case WFE_Source_SPI1_EV:
 230                     ; 290     case WFE_Source_I2C1_EV:
 230                     ; 291     case WFE_Source_USART1_EV:
 230                     ; 292     case WFE_Source_DMA1CH01_EV:
 230                     ; 293     case WFE_Source_DMA1CH23_EV:
 230                     ; 294 
 230                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 231  012b c650a8        	ld	a,20648
 232  012e               LC005:
 233  012e 1503          	bcp	a,(OFST+2,sp)
 234  0130 270d          	jreq	L57
 235                     ; 298         status = ENABLE;
 236  0132               LC004:
 237  0132 a601          	ld	a,#1
 238  0134 6b01          	ld	(OFST+0,sp),a
 240  0136 2009          	jra	L75
 241                     ; 303         status = DISABLE;
 242  0138               L15:
 243                     ; 307     case WFE_Source_TIM5_EV0:
 243                     ; 308     case WFE_Source_TIM5_EV1:
 243                     ; 309     case WFE_Source_AES_EV:
 243                     ; 310     case WFE_Source_SPI2_EV:
 243                     ; 311     case WFE_Source_USART2_EV:
 243                     ; 312     case WFE_Source_USART3_EV:
 243                     ; 313     case WFE_Source_RTC_CSS_EV:
 243                     ; 314 
 243                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 244  0138 c650a9        	ld	a,20649
 245  013b 1503          	bcp	a,(OFST+2,sp)
 246                     ; 318         status = ENABLE;
 248  013d 26f3          	jrne	LC004
 249  013f               L57:
 250                     ; 323         status = DISABLE;
 251  013f 0f01          	clr	(OFST+0,sp)
 252                     ; 326     default:
 252                     ; 327       break;
 253  0141               L75:
 254                     ; 329   return status;
 255  0141 7b01          	ld	a,(OFST+0,sp)
 257  0143 5b03          	addw	sp,#3
 258  0145 81            	ret	
 260                     	xdef	_WFE_GetWakeUpSourceEventStatus
 261                     	xdef	_WFE_WakeUpSourceEventCmd
 262                     	xdef	_WFE_DeInit
 263                     	end
