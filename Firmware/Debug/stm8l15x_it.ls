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
  69                     ; 201 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
  69                     ; 202 {
  70  000e               f_EXTI3_IRQHandler:
  71  000e 8a            	push	cc
  72  000f 84            	pop	a
  73  0010 a4bf          	and	a,#191
  74  0012 88            	push	a
  75  0013 86            	pop	cc
  76  0014 3b0002        	push	c_x+2
  77  0017 be00          	ldw	x,c_x
  78  0019 89            	pushw	x
  79  001a 3b0002        	push	c_y+2
  80  001d be00          	ldw	x,c_y
  81  001f 89            	pushw	x
  83                     ; 206   EXTI_ClearITPendingBit (EXTI_IT_Pin3);
  84  0020 ae0008        	ldw	x,#8
  85  0023 cd0000        	call	_EXTI_ClearITPendingBit
  87                     ; 207   TIM4_SetCounter(0);
  88  0026 4f            	clr	a
  89  0027 cd0000        	call	_TIM4_SetCounter
  91                     ; 208   TIM4_Cmd(ENABLE);
  92  002a a601          	ld	a,#1
  93  002c cd0000        	call	_TIM4_Cmd
  95                     ; 209   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  96  002f 4be0          	push	#224
  97  0031 4b10          	push	#16
  98  0033 ae5005        	ldw	x,#20485
  99  0036 cd0000        	call	_GPIO_Init
 101  0039 85            	popw	x
 102                     ; 210   GPIO_ResetBits(GPIOB,GPIO_Pin_4);
 103  003a 4b10          	push	#16
 104  003c ae5005        	ldw	x,#20485
 105  003f cd0000        	call	_GPIO_ResetBits
 107  0042 ae0014        	ldw	x,#20
 108  0045 84            	pop	a
 109                     ; 211   delay(20);
 110  0046 adb9          	call	_delay
 112                     ; 212   if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_3))
 113  0048 4b08          	push	#8
 114  004a ae5005        	ldw	x,#20485
 115  004d cd0000        	call	_GPIO_ReadInputDataBit
 117  0050 5b01          	addw	sp,#1
 118  0052 4d            	tnz	a
 119  0053 270c          	jreq	L11
 120                     ; 214      EIGHT();
 121  0055 cd0000        	call	_EIGHT
 123                     ; 215      TIM3_SetCounter(0);
 124  0058 5f            	clrw	x
 125  0059 cd0000        	call	_TIM3_SetCounter
 127                     ; 216      TIM3_Cmd(ENABLE);
 128  005c a601          	ld	a,#1
 129  005e cd0000        	call	_TIM3_Cmd
 131  0061               L11:
 132                     ; 218 }
 133  0061 85            	popw	x
 134  0062 bf00          	ldw	c_y,x
 135  0064 320002        	pop	c_y+2
 136  0067 85            	popw	x
 137  0068 bf00          	ldw	c_x,x
 138  006a 320002        	pop	c_x+2
 139  006d 80            	iret	
 140                     ; 237 @svlreg INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 140                     ; 238 {
 141  006e               f_EXTI5_IRQHandler:
 142  006e 8a            	push	cc
 143  006f 84            	pop	a
 144  0070 a4bf          	and	a,#191
 145  0072 88            	push	a
 146  0073 86            	pop	cc
 147  0074 3b0002        	push	c_x+2
 148  0077 be00          	ldw	x,c_x
 149  0079 89            	pushw	x
 150  007a 3b0002        	push	c_y+2
 151  007d be00          	ldw	x,c_y
 152  007f 89            	pushw	x
 153  0080 be02          	ldw	x,c_lreg+2
 154  0082 89            	pushw	x
 155  0083 be00          	ldw	x,c_lreg
 156  0085 89            	pushw	x
 158                     ; 242   EXTI_ClearITPendingBit (EXTI_IT_Pin5);
 159  0086 ae0020        	ldw	x,#32
 160  0089 cd0000        	call	_EXTI_ClearITPendingBit
 162                     ; 243   EEPROM_WriteByte(0,0x00);
 163  008c 4b00          	push	#0
 164  008e 5f            	clrw	x
 165  008f cd0000        	call	_EEPROM_WriteByte
 167  0092 5f            	clrw	x
 168  0093 84            	pop	a
 169                     ; 244   I2C_DeInit_Config(EEPROM_ReadByte(0));
 170  0094 cd0000        	call	_EEPROM_ReadByte
 172  0097 cd0000        	call	_I2C_DeInit_Config
 174                     ; 245   k=5;
 175  009a 35050004      	mov	_k,#5
 176                     ; 246 }
 177  009e 85            	popw	x
 178  009f bf00          	ldw	c_lreg,x
 179  00a1 85            	popw	x
 180  00a2 bf02          	ldw	c_lreg+2,x
 181  00a4 85            	popw	x
 182  00a5 bf00          	ldw	c_y,x
 183  00a7 320002        	pop	c_y+2
 184  00aa 85            	popw	x
 185  00ab bf00          	ldw	c_x,x
 186  00ad 320002        	pop	c_x+2
 187  00b0 80            	iret	
 188                     ; 253 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 188                     ; 254 {
 189  00b1               f_EXTI6_IRQHandler:
 190  00b1 8a            	push	cc
 191  00b2 84            	pop	a
 192  00b3 a4bf          	and	a,#191
 193  00b5 88            	push	a
 194  00b6 86            	pop	cc
 195  00b7 3b0002        	push	c_x+2
 196  00ba be00          	ldw	x,c_x
 197  00bc 89            	pushw	x
 198  00bd 3b0002        	push	c_y+2
 199  00c0 be00          	ldw	x,c_y
 200  00c2 89            	pushw	x
 201  00c3 be02          	ldw	x,c_lreg+2
 202  00c5 89            	pushw	x
 203  00c6 be00          	ldw	x,c_lreg
 204  00c8 89            	pushw	x
 206                     ; 258   Timer=TIM2_GetCounter();
 207  00c9 cd0000        	call	_TIM2_GetCounter
 209  00cc bf06          	ldw	_Timer,x
 210                     ; 259   GPIO_ResetBits(GPIOB,GPIO_Pin_2);
 211  00ce 4b04          	push	#4
 212  00d0 ae5005        	ldw	x,#20485
 213  00d3 cd0000        	call	_GPIO_ResetBits
 215  00d6 84            	pop	a
 216                     ; 260   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 217  00d7 4be0          	push	#224
 218  00d9 4b10          	push	#16
 219  00db ae5005        	ldw	x,#20485
 220  00de cd0000        	call	_GPIO_Init
 222  00e1 85            	popw	x
 223                     ; 261   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 224  00e2 4b10          	push	#16
 225  00e4 ae5005        	ldw	x,#20485
 226  00e7 cd0000        	call	_GPIO_SetBits
 228  00ea ae0040        	ldw	x,#64
 229  00ed 84            	pop	a
 230                     ; 262   EXTI_ClearITPendingBit (EXTI_IT_Pin6);
 231  00ee cd0000        	call	_EXTI_ClearITPendingBit
 233                     ; 263   TIM2_Cmd(DISABLE);
 234  00f1 4f            	clr	a
 235  00f2 cd0000        	call	_TIM2_Cmd
 237                     ; 264   TIM3_Cmd(DISABLE);
 238  00f5 4f            	clr	a
 239  00f6 cd0000        	call	_TIM3_Cmd
 241                     ; 267   if(Out_Range==0)
 242  00f9 3d05          	tnz	_Out_Range
 243  00fb 2616          	jrne	L31
 244                     ; 269   Distance=(uint16_t) Timer*0.0862;
 245  00fd be06          	ldw	x,_Timer
 246  00ff cd0000        	call	c_uitof
 248  0102 ae0000        	ldw	x,#L12
 249  0105 cd0000        	call	c_fmul
 251  0108 cd0000        	call	c_ftoi
 253  010b bf08          	ldw	_Distance,x
 254                     ; 270   Distance_H=(uint8_t)(Distance>>8);
 255  010d 45080a        	mov	_Distance_H,_Distance
 256                     ; 271   Distance_L=(uint8_t) Distance;
 257  0110 45090b        	mov	_Distance_L,_Distance+1
 258  0113               L31:
 259                     ; 273   Out_Range=0;
 260  0113 3f05          	clr	_Out_Range
 261                     ; 274 }
 262  0115 85            	popw	x
 263  0116 bf00          	ldw	c_lreg,x
 264  0118 85            	popw	x
 265  0119 bf02          	ldw	c_lreg+2,x
 266  011b 85            	popw	x
 267  011c bf00          	ldw	c_y,x
 268  011e 320002        	pop	c_y+2
 269  0121 85            	popw	x
 270  0122 bf00          	ldw	c_x,x
 271  0124 320002        	pop	c_x+2
 272  0127 80            	iret	
 273                     ; 327 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 273                     ; 328 {
 274  0128               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 275  0128 8a            	push	cc
 276  0129 84            	pop	a
 277  012a a4bf          	and	a,#191
 278  012c 88            	push	a
 279  012d 86            	pop	cc
 280  012e 3b0002        	push	c_x+2
 281  0131 be00          	ldw	x,c_x
 282  0133 89            	pushw	x
 283  0134 3b0002        	push	c_y+2
 284  0137 be00          	ldw	x,c_y
 285  0139 89            	pushw	x
 287                     ; 332     TIM2_ClearITPendingBit(TIM2_IT_Update);
 288  013a a601          	ld	a,#1
 289  013c cd0000        	call	_TIM2_ClearITPendingBit
 291                     ; 333     TIM2_Cmd(DISABLE);
 292  013f 4f            	clr	a
 293  0140 cd0000        	call	_TIM2_Cmd
 295                     ; 334 }
 296  0143 85            	popw	x
 297  0144 bf00          	ldw	c_y,x
 298  0146 320002        	pop	c_y+2
 299  0149 85            	popw	x
 300  014a bf00          	ldw	c_x,x
 301  014c 320002        	pop	c_x+2
 302  014f 80            	iret	
 303                     ; 354 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 303                     ; 355 {
 304  0150               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 305  0150 8a            	push	cc
 306  0151 84            	pop	a
 307  0152 a4bf          	and	a,#191
 308  0154 88            	push	a
 309  0155 86            	pop	cc
 310  0156 3b0002        	push	c_x+2
 311  0159 be00          	ldw	x,c_x
 312  015b 89            	pushw	x
 313  015c 3b0002        	push	c_y+2
 314  015f be00          	ldw	x,c_y
 315  0161 89            	pushw	x
 317                     ; 359   TIM3_ClearITPendingBit(TIM3_IT_Update);  
 318  0162 a601          	ld	a,#1
 319  0164 cd0000        	call	_TIM3_ClearITPendingBit
 321                     ; 360   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 322  0167 4be0          	push	#224
 323  0169 4b10          	push	#16
 324  016b ae5005        	ldw	x,#20485
 325  016e cd0000        	call	_GPIO_Init
 327  0171 85            	popw	x
 328                     ; 361   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 329  0172 4b10          	push	#16
 330  0174 ae5005        	ldw	x,#20485
 331  0177 cd0000        	call	_GPIO_SetBits
 333  017a 84            	pop	a
 334                     ; 362   TIM3_Cmd(DISABLE);
 335  017b 4f            	clr	a
 336  017c cd0000        	call	_TIM3_Cmd
 338                     ; 363   measure_flag=0;
 339  017f 5f            	clrw	x
 340  0180 bf00          	ldw	_measure_flag,x
 341                     ; 364   Out_Range=1;
 342  0182 35010005      	mov	_Out_Range,#1
 343                     ; 365   GPIO_ResetBits(GPIOB,GPIO_Pin_2);
 344  0186 4b04          	push	#4
 345  0188 ae5005        	ldw	x,#20485
 346  018b cd0000        	call	_GPIO_ResetBits
 348  018e 84            	pop	a
 349                     ; 366 }
 350  018f 85            	popw	x
 351  0190 bf00          	ldw	c_y,x
 352  0192 320002        	pop	c_y+2
 353  0195 85            	popw	x
 354  0196 bf00          	ldw	c_x,x
 355  0198 320002        	pop	c_x+2
 356  019b 80            	iret	
 357                     ; 406 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 357                     ; 407 {
 358  019c               f_TIM4_UPD_OVF_TRG_IRQHandler:
 359  019c 8a            	push	cc
 360  019d 84            	pop	a
 361  019e a4bf          	and	a,#191
 362  01a0 88            	push	a
 363  01a1 86            	pop	cc
 364  01a2 3b0002        	push	c_x+2
 365  01a5 be00          	ldw	x,c_x
 366  01a7 89            	pushw	x
 367  01a8 3b0002        	push	c_y+2
 368  01ab be00          	ldw	x,c_y
 369  01ad 89            	pushw	x
 371                     ; 412    TIM4_ClearITPendingBit(TIM4_IT_Update);
 372  01ae a601          	ld	a,#1
 373  01b0 cd0000        	call	_TIM4_ClearITPendingBit
 375                     ; 413    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_In_FL_No_IT);
 376  01b3 4b00          	push	#0
 377  01b5 4b10          	push	#16
 378  01b7 ae5005        	ldw	x,#20485
 379  01ba cd0000        	call	_GPIO_Init
 381  01bd 4f            	clr	a
 382  01be 85            	popw	x
 383                     ; 414    TIM4_Cmd(DISABLE);
 384  01bf cd0000        	call	_TIM4_Cmd
 386                     ; 416 }
 387  01c2 85            	popw	x
 388  01c3 bf00          	ldw	c_y,x
 389  01c5 320002        	pop	c_y+2
 390  01c8 85            	popw	x
 391  01c9 bf00          	ldw	c_x,x
 392  01cb 320002        	pop	c_x+2
 393  01ce 80            	iret	
 394                     	switch	.ubsct
 395  0000               L52_sr1:
 396  0000 00            	ds.b	1
 397  0001               L13_sr3:
 398  0001 00            	ds.b	1
 399  0002               L72_sr2:
 400  0002 00            	ds.b	1
 401                     ; 458 @svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
 401                     ; 459 {
 402                     	switch	.text
 403  01cf               f_I2C1_SPI2_IRQHandler:
 404  01cf 8a            	push	cc
 405  01d0 84            	pop	a
 406  01d1 a4bf          	and	a,#191
 407  01d3 88            	push	a
 408  01d4 86            	pop	cc
 409  01d5 3b0002        	push	c_x+2
 410  01d8 be00          	ldw	x,c_x
 411  01da 89            	pushw	x
 412  01db 3b0002        	push	c_y+2
 413  01de be00          	ldw	x,c_y
 414  01e0 89            	pushw	x
 415  01e1 be02          	ldw	x,c_lreg+2
 416  01e3 89            	pushw	x
 417  01e4 be00          	ldw	x,c_lreg
 418  01e6 89            	pushw	x
 420                     ; 467 sr1 = I2C1->SR1;
 421  01e7 5552170000    	mov	L52_sr1,21015
 422                     ; 468 sr2 = I2C1->SR2;
 423  01ec 5552180002    	mov	L72_sr2,21016
 424                     ; 469 sr3 = I2C1->SR3;
 425  01f1 5552190001    	mov	L13_sr3,21017
 426                     ; 472 if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
 427  01f6 b602          	ld	a,L72_sr2
 428  01f8 a52b          	bcp	a,#43
 429  01fa 270d          	jreq	L33
 430                     ; 475     I2C1->SR2= 0;                 // clear all error flags
 431  01fc 725f5218      	clr	21016
 432                     ; 476      e=1;
 433  0200 ae0001        	ldw	x,#1
 434  0203 bf02          	ldw	_e,x
 435                     ; 477      Distance_H=0;
 436  0205 3f0a          	clr	_Distance_H
 437                     ; 478      Distance_L=0;
 438  0207 3f0b          	clr	_Distance_L
 439  0209               L33:
 440                     ; 482 if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
 441                     ; 488   if( (sr1 & I2C_SR1_RXNE)&&(sr3 &I2C_SR3_BUSY))
 442  0209 720d00006f    	btjf	L52_sr1,#6,L73
 444  020e 720300016a    	btjf	L13_sr3,#1,L73
 445                     ; 490       GPIOE->ODR^=0X80; 
 446  0213 901e5014      	bcpl	20500,#7
 447                     ; 491       SBUF=I2C1->DR;
 448  0217 5552160000    	mov	_SBUF,21014
 449                     ; 492       k=2;
 450  021c 35020004      	mov	_k,#2
 451                     ; 493       if(SBUF==1)
 452  0220 b600          	ld	a,_SBUF
 453  0222 a101          	cp	a,#1
 454  0224 2630          	jrne	L14
 455                     ; 495       measure_flag=1;
 456  0226 ae0001        	ldw	x,#1
 457  0229 bf00          	ldw	_measure_flag,x
 458                     ; 496       TIM4_SetCounter(0);
 459  022b 4f            	clr	a
 460  022c cd0000        	call	_TIM4_SetCounter
 462                     ; 497       TIM4_Cmd(ENABLE);
 463  022f a601          	ld	a,#1
 464  0231 cd0000        	call	_TIM4_Cmd
 466                     ; 498       GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 467  0234 4be0          	push	#224
 468  0236 4b10          	push	#16
 469  0238 ae5005        	ldw	x,#20485
 470  023b cd0000        	call	_GPIO_Init
 472  023e 85            	popw	x
 473                     ; 499       GPIO_ResetBits(GPIOB,GPIO_Pin_4);
 474  023f 4b10          	push	#16
 475  0241 ae5005        	ldw	x,#20485
 476  0244 cd0000        	call	_GPIO_ResetBits
 478  0247 84            	pop	a
 479                     ; 500       EIGHT();
 480  0248 cd0000        	call	_EIGHT
 482                     ; 501       TIM3_SetCounter(0);
 483  024b 5f            	clrw	x
 484  024c cd0000        	call	_TIM3_SetCounter
 486                     ; 502       TIM3_Cmd(ENABLE);
 487  024f a601          	ld	a,#1
 488  0251 cd0000        	call	_TIM3_Cmd
 491  0254 2027          	jra	L73
 492  0256               L14:
 493                     ; 504       else if(0xA0<=SBUF<=0xAF)
 494  0256 a1a0          	cp	a,#160
 495  0258 2505          	jrult	L441
 496  025a ae0001        	ldw	x,#1
 497  025d 2001          	jra	L641
 498  025f               L441:
 499  025f 5f            	clrw	x
 500  0260               L641:
 501  0260 a300b0        	cpw	x,#176
 502  0263 2e15          	jrsge	L54
 503                     ; 506        EEPROM_WriteByte(0,SBUF);
 504  0265 3b0000        	push	_SBUF
 505  0268 5f            	clrw	x
 506  0269 cd0000        	call	_EEPROM_WriteByte
 508  026c 5f            	clrw	x
 509  026d 84            	pop	a
 510                     ; 507        I2C_DeInit_Config(EEPROM_ReadByte(0));
 511  026e cd0000        	call	_EEPROM_ReadByte
 513  0271 cd0000        	call	_I2C_DeInit_Config
 515                     ; 508        k=1;
 516  0274 35010004      	mov	_k,#1
 518  0278 2003          	jra	L73
 519  027a               L54:
 520                     ; 510       else{measure_flag=0;}
 521  027a 5f            	clrw	x
 522  027b bf00          	ldw	_measure_flag,x
 523  027d               L73:
 524                     ; 514 if (sr2 & I2C_SR2_AF)
 525  027d 7205000204    	btjf	L72_sr2,#2,L15
 526                     ; 516        I2C1->SR2 &= ~I2C_SR2_AF;          // clear AF
 527  0282 72155218      	bres	21016,#2
 528  0286               L15:
 529                     ; 520 if (sr1 & I2C_SR1_STOPF) 
 530  0286 7209000004    	btjf	L52_sr1,#4,L35
 531                     ; 522     I2C1->CR2 |= I2C_CR2_ACK;          // CR2 write to clear STOPF
 532  028b 72145211      	bset	21009,#2
 533  028f               L35:
 534                     ; 526 if( (sr1 & I2C_SR1_ADDR)&&(sr3 &I2C_SR3_BUSY)) 
 535  028f 7203000009    	btjf	L52_sr1,#1,L55
 537  0294 7203000104    	btjf	L13_sr3,#1,L55
 538                     ; 528     GPIOC->ODR^=0X80;
 539  0299 901e500a      	bcpl	20490,#7
 540  029d               L55:
 541                     ; 531 if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
 542                     ; 535 if (sr1 & I2C_SR1_TXE)
 543  029d 720f00000a    	btjf	L52_sr1,#7,L36
 544                     ; 537  I2C1->DR =Distance_H;
 545  02a2 55000a5216    	mov	21014,_Distance_H
 546                     ; 538  I2C1->DR =Distance_L; 
 547  02a7 55000b5216    	mov	21014,_Distance_L
 549  02ac               L36:
 550                     ; 541 }
 551  02ac 85            	popw	x
 552  02ad bf00          	ldw	c_lreg,x
 553  02af 85            	popw	x
 554  02b0 bf02          	ldw	c_lreg+2,x
 555  02b2 85            	popw	x
 556  02b3 bf00          	ldw	c_y,x
 557  02b5 320002        	pop	c_y+2
 558  02b8 85            	popw	x
 559  02b9 bf00          	ldw	c_x,x
 560  02bb 320002        	pop	c_x+2
 561  02be 80            	iret	
 562                     	xdef	_delay
 563                     	xref.b	_measure_flag
 564                     	xref.b	_SBUF
 565                     	xdef	_Distance_L
 566                     	xdef	_Distance_H
 567                     	xdef	_Distance
 568                     	xdef	_Timer
 569                     	xdef	_Out_Range
 570                     	xdef	_k
 571                     	xdef	_e
 572                     	xdef	_i
 573                     	xref	_EEPROM_ReadByte
 574                     	xref	_EEPROM_WriteByte
 575                     	xref	_I2C_DeInit_Config
 576                     	xref	_EIGHT
 577                     	xdef	f_I2C1_SPI2_IRQHandler
 578                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 579                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 580                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 581                     	xdef	f_EXTI6_IRQHandler
 582                     	xdef	f_EXTI5_IRQHandler
 583                     	xdef	f_EXTI3_IRQHandler
 584                     	xdef	f_FLASH_IRQHandler
 585                     	xdef	f_TRAP_IRQHandler
 586                     	xdef	f_NonHandledInterrupt
 587                     	xref	_TIM4_ClearITPendingBit
 588                     	xref	_TIM4_Cmd
 589                     	xref	_TIM4_SetCounter
 590                     	xref	_TIM3_ClearITPendingBit
 591                     	xref	_TIM3_Cmd
 592                     	xref	_TIM3_SetCounter
 593                     	xref	_TIM2_ClearITPendingBit
 594                     	xref	_TIM2_Cmd
 595                     	xref	_TIM2_GetCounter
 596                     	xref	_GPIO_ReadInputDataBit
 597                     	xref	_GPIO_ResetBits
 598                     	xref	_GPIO_SetBits
 599                     	xref	_GPIO_Init
 600                     	xref	_EXTI_ClearITPendingBit
 601                     .const:	section	.text
 602  0000               L12:
 603  0000 3db089a0      	dc.w	15792,-30304
 604                     	xref.b	c_lreg
 605                     	xref.b	c_x
 606                     	xref.b	c_y
 607                     	xref	c_ftoi
 608                     	xref	c_fmul
 609                     	xref	c_uitof
 610                     	end
