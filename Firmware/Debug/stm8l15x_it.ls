   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     	bsct
  19  0000               _i:
  20  0000 0000          	dc.w	0
  21  0002               _e:
  22  0002 0000          	dc.w	0
  23  0004               _k:
  24  0004 00            	dc.b	0
  25  0005               _Out_Range:
  26  0005 00            	dc.b	0
  27  0006               _Timer:
  28  0006 0000          	dc.w	0
  29  0008               _Distance:
  30  0008 0000          	dc.w	0
  31  000a               _Distance_H:
  32  000a 00            	dc.b	0
  33  000b               _Distance_L:
  34  000b 00            	dc.b	0
  35                     ; 56 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  35                     ; 57 {
  36                     	switch	.text
  37  0000               f_NonHandledInterrupt:
  39                     ; 61 }
  40  0000 80            	iret	
  41                     ; 63 void delay(uint16_t z)
  41                     ; 64 {
  42                     	scross	off
  43  0001               _delay:
  44  0001 89            	pushw	x
  45       00000000      OFST:	set	0
  47  0002               L5:
  48                     ; 65   while(z--);
  49  0002 1e01          	ldw	x,(OFST+1,sp)
  50  0004 5a            	decw	x
  51  0005 1f01          	ldw	(OFST+1,sp),x
  52  0007 5c            	incw	x
  53  0008 26f8          	jrne	L5
  54                     ; 66 }
  55  000a 85            	popw	x
  56  000b 81            	ret	
  58                     ; 74 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  58                     ; 75 {
  59                     	scross	on
  60  000c               f_TRAP_IRQHandler:
  62                     ; 79 }
  63  000c 80            	iret	
  64                     ; 85 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
  64                     ; 86 {
  65  000d               f_FLASH_IRQHandler:
  67                     ; 90 }
  68  000d 80            	iret	
  69                     ; 96 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
  69                     ; 97 {
  70  000e               f_DMA1_CHANNEL0_1_IRQHandler:
  72                     ; 101 }
  73  000e 80            	iret	
  74                     ; 107 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
  74                     ; 108 {
  75  000f               f_DMA1_CHANNEL2_3_IRQHandler:
  77                     ; 112 }
  78  000f 80            	iret	
  79                     ; 118 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
  79                     ; 119 {
  80  0010               f_RTC_CSSLSE_IRQHandler:
  82                     ; 123 }
  83  0010 80            	iret	
  84                     ; 129 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
  84                     ; 130 {
  85  0011               f_EXTIE_F_PVD_IRQHandler:
  87                     ; 134 }
  88  0011 80            	iret	
  89                     ; 141 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
  89                     ; 142 {
  90  0012               f_EXTIB_G_IRQHandler:
  92                     ; 146 }
  93  0012 80            	iret	
  94                     ; 153 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
  94                     ; 154 {
  95  0013               f_EXTID_H_IRQHandler:
  97                     ; 158 }
  98  0013 80            	iret	
  99                     ; 165 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
  99                     ; 166 {
 100  0014               f_EXTI0_IRQHandler:
 102                     ; 170 }
 103  0014 80            	iret	
 104                     ; 177 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 104                     ; 178 {
 105  0015               f_EXTI1_IRQHandler:
 107                     ; 182 }
 108  0015 80            	iret	
 109                     ; 189 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 109                     ; 190 {
 110  0016               f_EXTI2_IRQHandler:
 112                     ; 194 }
 113  0016 80            	iret	
 114                     ; 201 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 114                     ; 202 {
 115  0017               f_EXTI3_IRQHandler:
 116  0017 8a            	push	cc
 117  0018 84            	pop	a
 118  0019 a4bf          	and	a,#191
 119  001b 88            	push	a
 120  001c 86            	pop	cc
 121  001d 3b0002        	push	c_x+2
 122  0020 be00          	ldw	x,c_x
 123  0022 89            	pushw	x
 124  0023 3b0002        	push	c_y+2
 125  0026 be00          	ldw	x,c_y
 126  0028 89            	pushw	x
 128                     ; 206   EXTI_ClearITPendingBit (EXTI_IT_Pin3);
 129  0029 ae0008        	ldw	x,#8
 130  002c cd0000        	call	_EXTI_ClearITPendingBit
 132                     ; 207   TIM4_SetCounter(0);
 133  002f 4f            	clr	a
 134  0030 cd0000        	call	_TIM4_SetCounter
 136                     ; 208   TIM4_Cmd(ENABLE);
 137  0033 a601          	ld	a,#1
 138  0035 cd0000        	call	_TIM4_Cmd
 140                     ; 209   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 141  0038 4be0          	push	#224
 142  003a 4b10          	push	#16
 143  003c ae5005        	ldw	x,#20485
 144  003f cd0000        	call	_GPIO_Init
 146  0042 85            	popw	x
 147                     ; 210   GPIO_ResetBits(GPIOB,GPIO_Pin_4);
 148  0043 4b10          	push	#16
 149  0045 ae5005        	ldw	x,#20485
 150  0048 cd0000        	call	_GPIO_ResetBits
 152  004b ae0014        	ldw	x,#20
 153  004e 84            	pop	a
 154                     ; 211   delay(20);
 155  004f adb0          	call	_delay
 157                     ; 212   if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_3))
 158  0051 4b08          	push	#8
 159  0053 ae5005        	ldw	x,#20485
 160  0056 cd0000        	call	_GPIO_ReadInputDataBit
 162  0059 5b01          	addw	sp,#1
 163  005b 4d            	tnz	a
 164  005c 270c          	jreq	L11
 165                     ; 214      EIGHT();
 166  005e cd0000        	call	_EIGHT
 168                     ; 215      TIM3_SetCounter(0);
 169  0061 5f            	clrw	x
 170  0062 cd0000        	call	_TIM3_SetCounter
 172                     ; 216      TIM3_Cmd(ENABLE);
 173  0065 a601          	ld	a,#1
 174  0067 cd0000        	call	_TIM3_Cmd
 176  006a               L11:
 177                     ; 218 }
 178  006a 85            	popw	x
 179  006b bf00          	ldw	c_y,x
 180  006d 320002        	pop	c_y+2
 181  0070 85            	popw	x
 182  0071 bf00          	ldw	c_x,x
 183  0073 320002        	pop	c_x+2
 184  0076 80            	iret	
 185                     ; 225 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 185                     ; 226 {
 186  0077               f_EXTI4_IRQHandler:
 188                     ; 230 }
 189  0077 80            	iret	
 190                     ; 237 @svlreg INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 190                     ; 238 {
 191  0078               f_EXTI5_IRQHandler:
 192  0078 8a            	push	cc
 193  0079 84            	pop	a
 194  007a a4bf          	and	a,#191
 195  007c 88            	push	a
 196  007d 86            	pop	cc
 197  007e 3b0002        	push	c_x+2
 198  0081 be00          	ldw	x,c_x
 199  0083 89            	pushw	x
 200  0084 3b0002        	push	c_y+2
 201  0087 be00          	ldw	x,c_y
 202  0089 89            	pushw	x
 203  008a be02          	ldw	x,c_lreg+2
 204  008c 89            	pushw	x
 205  008d be00          	ldw	x,c_lreg
 206  008f 89            	pushw	x
 208                     ; 242   EXTI_ClearITPendingBit (EXTI_IT_Pin5);
 209  0090 ae0020        	ldw	x,#32
 210  0093 cd0000        	call	_EXTI_ClearITPendingBit
 212                     ; 243   EEPROM_WriteByte(0,0x00);
 213  0096 4b00          	push	#0
 214  0098 5f            	clrw	x
 215  0099 cd0000        	call	_EEPROM_WriteByte
 217  009c 5f            	clrw	x
 218  009d 84            	pop	a
 219                     ; 244   I2C_DeInit_Config(EEPROM_ReadByte(0));
 220  009e cd0000        	call	_EEPROM_ReadByte
 222  00a1 cd0000        	call	_I2C_DeInit_Config
 224                     ; 245   k=5;
 225  00a4 35050004      	mov	_k,#5
 226                     ; 246 }
 227  00a8 85            	popw	x
 228  00a9 bf00          	ldw	c_lreg,x
 229  00ab 85            	popw	x
 230  00ac bf02          	ldw	c_lreg+2,x
 231  00ae 85            	popw	x
 232  00af bf00          	ldw	c_y,x
 233  00b1 320002        	pop	c_y+2
 234  00b4 85            	popw	x
 235  00b5 bf00          	ldw	c_x,x
 236  00b7 320002        	pop	c_x+2
 237  00ba 80            	iret	
 238                     ; 253 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 238                     ; 254 {
 239  00bb               f_EXTI6_IRQHandler:
 240  00bb 8a            	push	cc
 241  00bc 84            	pop	a
 242  00bd a4bf          	and	a,#191
 243  00bf 88            	push	a
 244  00c0 86            	pop	cc
 245  00c1 3b0002        	push	c_x+2
 246  00c4 be00          	ldw	x,c_x
 247  00c6 89            	pushw	x
 248  00c7 3b0002        	push	c_y+2
 249  00ca be00          	ldw	x,c_y
 250  00cc 89            	pushw	x
 251  00cd be02          	ldw	x,c_lreg+2
 252  00cf 89            	pushw	x
 253  00d0 be00          	ldw	x,c_lreg
 254  00d2 89            	pushw	x
 256                     ; 258   Timer=TIM2_GetCounter();
 257  00d3 cd0000        	call	_TIM2_GetCounter
 259  00d6 bf06          	ldw	_Timer,x
 260                     ; 259   GPIO_ResetBits(GPIOB,GPIO_Pin_2);
 261  00d8 4b04          	push	#4
 262  00da ae5005        	ldw	x,#20485
 263  00dd cd0000        	call	_GPIO_ResetBits
 265  00e0 84            	pop	a
 266                     ; 260   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 267  00e1 4be0          	push	#224
 268  00e3 4b10          	push	#16
 269  00e5 ae5005        	ldw	x,#20485
 270  00e8 cd0000        	call	_GPIO_Init
 272  00eb 85            	popw	x
 273                     ; 261   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 274  00ec 4b10          	push	#16
 275  00ee ae5005        	ldw	x,#20485
 276  00f1 cd0000        	call	_GPIO_SetBits
 278  00f4 ae0040        	ldw	x,#64
 279  00f7 84            	pop	a
 280                     ; 262   EXTI_ClearITPendingBit (EXTI_IT_Pin6);
 281  00f8 cd0000        	call	_EXTI_ClearITPendingBit
 283                     ; 263   TIM2_Cmd(DISABLE);
 284  00fb 4f            	clr	a
 285  00fc cd0000        	call	_TIM2_Cmd
 287                     ; 264   TIM3_Cmd(DISABLE);
 288  00ff 4f            	clr	a
 289  0100 cd0000        	call	_TIM3_Cmd
 291                     ; 267   if(Out_Range==0)
 292  0103 3d05          	tnz	_Out_Range
 293  0105 2616          	jrne	L31
 294                     ; 269   Distance=(uint16_t) Timer*0.0862;
 295  0107 be06          	ldw	x,_Timer
 296  0109 cd0000        	call	c_uitof
 298  010c ae0000        	ldw	x,#L12
 299  010f cd0000        	call	c_fmul
 301  0112 cd0000        	call	c_ftoi
 303  0115 bf08          	ldw	_Distance,x
 304                     ; 270   Distance_H=(uint8_t)(Distance>>8);
 305  0117 45080a        	mov	_Distance_H,_Distance
 306                     ; 271   Distance_L=(uint8_t) Distance;
 307  011a 45090b        	mov	_Distance_L,_Distance+1
 308  011d               L31:
 309                     ; 273   Out_Range=0;
 310  011d 3f05          	clr	_Out_Range
 311                     ; 274 }
 312  011f 85            	popw	x
 313  0120 bf00          	ldw	c_lreg,x
 314  0122 85            	popw	x
 315  0123 bf02          	ldw	c_lreg+2,x
 316  0125 85            	popw	x
 317  0126 bf00          	ldw	c_y,x
 318  0128 320002        	pop	c_y+2
 319  012b 85            	popw	x
 320  012c bf00          	ldw	c_x,x
 321  012e 320002        	pop	c_x+2
 322  0131 80            	iret	
 323                     ; 281 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 323                     ; 282 {
 324  0132               f_EXTI7_IRQHandler:
 326                     ; 286 }
 327  0132 80            	iret	
 328                     ; 292 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 328                     ; 293 {
 329  0133               f_LCD_AES_IRQHandler:
 331                     ; 297 }
 332  0133 80            	iret	
 333                     ; 303 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 333                     ; 304 {
 334  0134               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 336                     ; 308 }
 337  0134 80            	iret	
 338                     ; 315 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 338                     ; 316 {
 339  0135               f_ADC1_COMP_IRQHandler:
 341                     ; 320 }
 342  0135 80            	iret	
 343                     ; 327 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 343                     ; 328 {
 344  0136               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 345  0136 8a            	push	cc
 346  0137 84            	pop	a
 347  0138 a4bf          	and	a,#191
 348  013a 88            	push	a
 349  013b 86            	pop	cc
 350  013c 3b0002        	push	c_x+2
 351  013f be00          	ldw	x,c_x
 352  0141 89            	pushw	x
 353  0142 3b0002        	push	c_y+2
 354  0145 be00          	ldw	x,c_y
 355  0147 89            	pushw	x
 357                     ; 332     TIM2_ClearITPendingBit(TIM2_IT_Update);
 358  0148 a601          	ld	a,#1
 359  014a cd0000        	call	_TIM2_ClearITPendingBit
 361                     ; 333     TIM2_Cmd(DISABLE);
 362  014d 4f            	clr	a
 363  014e cd0000        	call	_TIM2_Cmd
 365                     ; 334 }
 366  0151 85            	popw	x
 367  0152 bf00          	ldw	c_y,x
 368  0154 320002        	pop	c_y+2
 369  0157 85            	popw	x
 370  0158 bf00          	ldw	c_x,x
 371  015a 320002        	pop	c_x+2
 372  015d 80            	iret	
 373                     ; 341 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 373                     ; 342 {
 374  015e               f_TIM2_CC_USART2_RX_IRQHandler:
 376                     ; 346 }
 377  015e 80            	iret	
 378                     ; 354 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 378                     ; 355 {
 379  015f               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 380  015f 8a            	push	cc
 381  0160 84            	pop	a
 382  0161 a4bf          	and	a,#191
 383  0163 88            	push	a
 384  0164 86            	pop	cc
 385  0165 3b0002        	push	c_x+2
 386  0168 be00          	ldw	x,c_x
 387  016a 89            	pushw	x
 388  016b 3b0002        	push	c_y+2
 389  016e be00          	ldw	x,c_y
 390  0170 89            	pushw	x
 392                     ; 359   TIM3_ClearITPendingBit(TIM3_IT_Update);  
 393  0171 a601          	ld	a,#1
 394  0173 cd0000        	call	_TIM3_ClearITPendingBit
 396                     ; 360   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 397  0176 4be0          	push	#224
 398  0178 4b10          	push	#16
 399  017a ae5005        	ldw	x,#20485
 400  017d cd0000        	call	_GPIO_Init
 402  0180 85            	popw	x
 403                     ; 361   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 404  0181 4b10          	push	#16
 405  0183 ae5005        	ldw	x,#20485
 406  0186 cd0000        	call	_GPIO_SetBits
 408  0189 84            	pop	a
 409                     ; 362   TIM3_Cmd(DISABLE);
 410  018a 4f            	clr	a
 411  018b cd0000        	call	_TIM3_Cmd
 413                     ; 363   measure_flag=0;
 414  018e 5f            	clrw	x
 415  018f bf00          	ldw	_measure_flag,x
 416                     ; 364   Out_Range=1;
 417  0191 35010005      	mov	_Out_Range,#1
 418                     ; 365   GPIO_ResetBits(GPIOB,GPIO_Pin_2);
 419  0195 4b04          	push	#4
 420  0197 ae5005        	ldw	x,#20485
 421  019a cd0000        	call	_GPIO_ResetBits
 423  019d 84            	pop	a
 424                     ; 366 }
 425  019e 85            	popw	x
 426  019f bf00          	ldw	c_y,x
 427  01a1 320002        	pop	c_y+2
 428  01a4 85            	popw	x
 429  01a5 bf00          	ldw	c_x,x
 430  01a7 320002        	pop	c_x+2
 431  01aa 80            	iret	
 432                     ; 372 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 432                     ; 373 {
 433  01ab               f_TIM3_CC_USART3_RX_IRQHandler:
 435                     ; 377 }
 436  01ab 80            	iret	
 437                     ; 383 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 437                     ; 384 {
 438  01ac               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 440                     ; 388 }
 441  01ac 80            	iret	
 442                     ; 394 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 442                     ; 395 {
 443  01ad               f_TIM1_CC_IRQHandler:
 445                     ; 399 }
 446  01ad 80            	iret	
 447                     ; 406 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 447                     ; 407 {
 448  01ae               f_TIM4_UPD_OVF_TRG_IRQHandler:
 449  01ae 8a            	push	cc
 450  01af 84            	pop	a
 451  01b0 a4bf          	and	a,#191
 452  01b2 88            	push	a
 453  01b3 86            	pop	cc
 454  01b4 3b0002        	push	c_x+2
 455  01b7 be00          	ldw	x,c_x
 456  01b9 89            	pushw	x
 457  01ba 3b0002        	push	c_y+2
 458  01bd be00          	ldw	x,c_y
 459  01bf 89            	pushw	x
 461                     ; 412    TIM4_ClearITPendingBit(TIM4_IT_Update);
 462  01c0 a601          	ld	a,#1
 463  01c2 cd0000        	call	_TIM4_ClearITPendingBit
 465                     ; 413    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_In_FL_No_IT);
 466  01c5 4b00          	push	#0
 467  01c7 4b10          	push	#16
 468  01c9 ae5005        	ldw	x,#20485
 469  01cc cd0000        	call	_GPIO_Init
 471  01cf 4f            	clr	a
 472  01d0 85            	popw	x
 473                     ; 414    TIM4_Cmd(DISABLE);
 474  01d1 cd0000        	call	_TIM4_Cmd
 476                     ; 416 }
 477  01d4 85            	popw	x
 478  01d5 bf00          	ldw	c_y,x
 479  01d7 320002        	pop	c_y+2
 480  01da 85            	popw	x
 481  01db bf00          	ldw	c_x,x
 482  01dd 320002        	pop	c_x+2
 483  01e0 80            	iret	
 484                     ; 422 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 484                     ; 423 {
 485  01e1               f_SPI1_IRQHandler:
 487                     ; 427 }
 488  01e1 80            	iret	
 489                     ; 434 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 489                     ; 435 {
 490  01e2               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 492                     ; 439 }
 493  01e2 80            	iret	
 494                     ; 446 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 494                     ; 447 {
 495  01e3               f_USART1_RX_TIM5_CC_IRQHandler:
 497                     ; 451 }
 498  01e3 80            	iret	
 499                     	switch	.ubsct
 500  0000               L52_sr1:
 501  0000 00            	ds.b	1
 502  0001               L13_sr3:
 503  0001 00            	ds.b	1
 504  0002               L72_sr2:
 505  0002 00            	ds.b	1
 506                     ; 458 @svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
 506                     ; 459 {
 507                     	switch	.text
 508  01e4               f_I2C1_SPI2_IRQHandler:
 509  01e4 8a            	push	cc
 510  01e5 84            	pop	a
 511  01e6 a4bf          	and	a,#191
 512  01e8 88            	push	a
 513  01e9 86            	pop	cc
 514  01ea 3b0002        	push	c_x+2
 515  01ed be00          	ldw	x,c_x
 516  01ef 89            	pushw	x
 517  01f0 3b0002        	push	c_y+2
 518  01f3 be00          	ldw	x,c_y
 519  01f5 89            	pushw	x
 520  01f6 be02          	ldw	x,c_lreg+2
 521  01f8 89            	pushw	x
 522  01f9 be00          	ldw	x,c_lreg
 523  01fb 89            	pushw	x
 525                     ; 467 sr1 = I2C1->SR1;
 526  01fc 5552170000    	mov	L52_sr1,21015
 527                     ; 468 sr2 = I2C1->SR2;
 528  0201 5552180002    	mov	L72_sr2,21016
 529                     ; 469 sr3 = I2C1->SR3;
 530  0206 5552190001    	mov	L13_sr3,21017
 531                     ; 472 if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
 532  020b b602          	ld	a,L72_sr2
 533  020d a52b          	bcp	a,#43
 534  020f 270d          	jreq	L33
 535                     ; 475     I2C1->SR2= 0;                 // clear all error flags
 536  0211 725f5218      	clr	21016
 537                     ; 476      e=1;
 538  0215 ae0001        	ldw	x,#1
 539  0218 bf02          	ldw	_e,x
 540                     ; 477      Distance_H=0;
 541  021a 3f0a          	clr	_Distance_H
 542                     ; 478      Distance_L=0;
 543  021c 3f0b          	clr	_Distance_L
 544  021e               L33:
 545                     ; 482 if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
 546                     ; 488   if( (sr1 & I2C_SR1_RXNE)&&(sr3 &I2C_SR3_BUSY))
 547  021e 720d00006f    	btjf	L52_sr1,#6,L73
 549  0223 720300016a    	btjf	L13_sr3,#1,L73
 550                     ; 490       GPIOE->ODR^=0X80; 
 551  0228 901e5014      	bcpl	20500,#7
 552                     ; 491       SBUF=I2C1->DR;
 553  022c 5552160000    	mov	_SBUF,21014
 554                     ; 492       k=2;
 555  0231 35020004      	mov	_k,#2
 556                     ; 493       if(SBUF==1)
 557  0235 b600          	ld	a,_SBUF
 558  0237 a101          	cp	a,#1
 559  0239 2630          	jrne	L14
 560                     ; 495       measure_flag=1;
 561  023b ae0001        	ldw	x,#1
 562  023e bf00          	ldw	_measure_flag,x
 563                     ; 496       TIM4_SetCounter(0);
 564  0240 4f            	clr	a
 565  0241 cd0000        	call	_TIM4_SetCounter
 567                     ; 497       TIM4_Cmd(ENABLE);
 568  0244 a601          	ld	a,#1
 569  0246 cd0000        	call	_TIM4_Cmd
 571                     ; 498       GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 572  0249 4be0          	push	#224
 573  024b 4b10          	push	#16
 574  024d ae5005        	ldw	x,#20485
 575  0250 cd0000        	call	_GPIO_Init
 577  0253 85            	popw	x
 578                     ; 499       GPIO_ResetBits(GPIOB,GPIO_Pin_4);
 579  0254 4b10          	push	#16
 580  0256 ae5005        	ldw	x,#20485
 581  0259 cd0000        	call	_GPIO_ResetBits
 583  025c 84            	pop	a
 584                     ; 500       EIGHT();
 585  025d cd0000        	call	_EIGHT
 587                     ; 501       TIM3_SetCounter(0);
 588  0260 5f            	clrw	x
 589  0261 cd0000        	call	_TIM3_SetCounter
 591                     ; 502       TIM3_Cmd(ENABLE);
 592  0264 a601          	ld	a,#1
 593  0266 cd0000        	call	_TIM3_Cmd
 596  0269 2027          	jra	L73
 597  026b               L14:
 598                     ; 504       else if(0xA0<=SBUF<=0xAF)
 599  026b a1a0          	cp	a,#160
 600  026d 2505          	jrult	L612
 601  026f ae0001        	ldw	x,#1
 602  0272 2001          	jra	L022
 603  0274               L612:
 604  0274 5f            	clrw	x
 605  0275               L022:
 606  0275 a300b0        	cpw	x,#176
 607  0278 2e15          	jrsge	L54
 608                     ; 506        EEPROM_WriteByte(0,SBUF);
 609  027a 3b0000        	push	_SBUF
 610  027d 5f            	clrw	x
 611  027e cd0000        	call	_EEPROM_WriteByte
 613  0281 5f            	clrw	x
 614  0282 84            	pop	a
 615                     ; 507        I2C_DeInit_Config(EEPROM_ReadByte(0));
 616  0283 cd0000        	call	_EEPROM_ReadByte
 618  0286 cd0000        	call	_I2C_DeInit_Config
 620                     ; 508        k=1;
 621  0289 35010004      	mov	_k,#1
 623  028d 2003          	jra	L73
 624  028f               L54:
 625                     ; 510       else{measure_flag=0;}
 626  028f 5f            	clrw	x
 627  0290 bf00          	ldw	_measure_flag,x
 628  0292               L73:
 629                     ; 514 if (sr2 & I2C_SR2_AF)
 630  0292 7205000204    	btjf	L72_sr2,#2,L15
 631                     ; 516        I2C1->SR2 &= ~I2C_SR2_AF;          // clear AF
 632  0297 72155218      	bres	21016,#2
 633  029b               L15:
 634                     ; 520 if (sr1 & I2C_SR1_STOPF) 
 635  029b 7209000004    	btjf	L52_sr1,#4,L35
 636                     ; 522     I2C1->CR2 |= I2C_CR2_ACK;          // CR2 write to clear STOPF
 637  02a0 72145211      	bset	21009,#2
 638  02a4               L35:
 639                     ; 526 if( (sr1 & I2C_SR1_ADDR)&&(sr3 &I2C_SR3_BUSY)) 
 640  02a4 7203000009    	btjf	L52_sr1,#1,L55
 642  02a9 7203000104    	btjf	L13_sr3,#1,L55
 643                     ; 528     GPIOC->ODR^=0X80;
 644  02ae 901e500a      	bcpl	20490,#7
 645  02b2               L55:
 646                     ; 531 if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
 647                     ; 535 if (sr1 & I2C_SR1_TXE)
 648  02b2 720f00000a    	btjf	L52_sr1,#7,L36
 649                     ; 537  I2C1->DR =Distance_H;
 650  02b7 55000a5216    	mov	21014,_Distance_H
 651                     ; 538  I2C1->DR =Distance_L; 
 652  02bc 55000b5216    	mov	21014,_Distance_L
 654  02c1               L36:
 655                     ; 541 }
 656  02c1 85            	popw	x
 657  02c2 bf00          	ldw	c_lreg,x
 658  02c4 85            	popw	x
 659  02c5 bf02          	ldw	c_lreg+2,x
 660  02c7 85            	popw	x
 661  02c8 bf00          	ldw	c_y,x
 662  02ca 320002        	pop	c_y+2
 663  02cd 85            	popw	x
 664  02ce bf00          	ldw	c_x,x
 665  02d0 320002        	pop	c_x+2
 666  02d3 80            	iret	
 667                     	xdef	_delay
 668                     	xref.b	_measure_flag
 669                     	xref.b	_SBUF
 670                     	xdef	_Distance_L
 671                     	xdef	_Distance_H
 672                     	xdef	_Distance
 673                     	xdef	_Timer
 674                     	xdef	_Out_Range
 675                     	xdef	_k
 676                     	xdef	_e
 677                     	xdef	_i
 678                     	xref	_EEPROM_ReadByte
 679                     	xref	_EEPROM_WriteByte
 680                     	xref	_I2C_DeInit_Config
 681                     	xref	_EIGHT
 682                     	xdef	f_I2C1_SPI2_IRQHandler
 683                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
 684                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 685                     	xdef	f_SPI1_IRQHandler
 686                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 687                     	xdef	f_TIM1_CC_IRQHandler
 688                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 689                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
 690                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 691                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
 692                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 693                     	xdef	f_ADC1_COMP_IRQHandler
 694                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 695                     	xdef	f_LCD_AES_IRQHandler
 696                     	xdef	f_EXTI7_IRQHandler
 697                     	xdef	f_EXTI6_IRQHandler
 698                     	xdef	f_EXTI5_IRQHandler
 699                     	xdef	f_EXTI4_IRQHandler
 700                     	xdef	f_EXTI3_IRQHandler
 701                     	xdef	f_EXTI2_IRQHandler
 702                     	xdef	f_EXTI1_IRQHandler
 703                     	xdef	f_EXTI0_IRQHandler
 704                     	xdef	f_EXTID_H_IRQHandler
 705                     	xdef	f_EXTIB_G_IRQHandler
 706                     	xdef	f_EXTIE_F_PVD_IRQHandler
 707                     	xdef	f_RTC_CSSLSE_IRQHandler
 708                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
 709                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
 710                     	xdef	f_FLASH_IRQHandler
 711                     	xdef	f_TRAP_IRQHandler
 712                     	xdef	f_NonHandledInterrupt
 713                     	xref	_TIM4_ClearITPendingBit
 714                     	xref	_TIM4_Cmd
 715                     	xref	_TIM4_SetCounter
 716                     	xref	_TIM3_ClearITPendingBit
 717                     	xref	_TIM3_Cmd
 718                     	xref	_TIM3_SetCounter
 719                     	xref	_TIM2_ClearITPendingBit
 720                     	xref	_TIM2_Cmd
 721                     	xref	_TIM2_GetCounter
 722                     	xref	_GPIO_ReadInputDataBit
 723                     	xref	_GPIO_ResetBits
 724                     	xref	_GPIO_SetBits
 725                     	xref	_GPIO_Init
 726                     	xref	_EXTI_ClearITPendingBit
 727                     .const:	section	.text
 728  0000               L12:
 729  0000 3db089a0      	dc.w	15792,-30304
 730                     	xref.b	c_lreg
 731                     	xref.b	c_x
 732                     	xref.b	c_y
 733                     	xref	c_ftoi
 734                     	xref	c_fmul
 735                     	xref	c_uitof
 736                     	end
