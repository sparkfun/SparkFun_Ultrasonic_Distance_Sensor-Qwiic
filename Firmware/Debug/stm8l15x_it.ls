   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  14                     	switch	.data
  15  0000               _i:
  16  0000 0000          	dc.w	0
  17  0002               _e:
  18  0002 0000          	dc.w	0
  19  0004               _k:
  20  0004 00            	dc.b	0
  21  0005               _Out_Range:
  22  0005 00            	dc.b	0
  23  0006               _Timer:
  24  0006 0000          	dc.w	0
  25  0008               _Distance:
  26  0008 0000          	dc.w	0
  27  000a               _Distance_H:
  28  000a 00            	dc.b	0
  29  000b               _Distance_L:
  30  000b 00            	dc.b	0
  60                     ; 56 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  60                     ; 57 {
  61                     	switch	.text
  62  0000               f_NonHandledInterrupt:
  66                     ; 61 }
  69  0000 80            	iret
 100                     ; 63 void delay(uint16_t z)
 100                     ; 64 {
 102                     	switch	.text
 103  0001               _delay:
 105  0001 89            	pushw	x
 106       00000000      OFST:	set	0
 109  0002               L73:
 110                     ; 65   while(z--);
 112  0002 1e01          	ldw	x,(OFST+1,sp)
 113  0004 1d0001        	subw	x,#1
 114  0007 1f01          	ldw	(OFST+1,sp),x
 115  0009 1c0001        	addw	x,#1
 116  000c a30000        	cpw	x,#0
 117  000f 26f1          	jrne	L73
 118                     ; 66 }
 121  0011 85            	popw	x
 122  0012 81            	ret
 145                     ; 74 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 145                     ; 75 {
 147                     	switch	.text
 148  0013               f_TRAP_IRQHandler:
 152                     ; 79 }
 155  0013 80            	iret
 177                     ; 85 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 177                     ; 86 {
 178                     	switch	.text
 179  0014               f_FLASH_IRQHandler:
 183                     ; 90 }
 186  0014 80            	iret
 209                     ; 96 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 209                     ; 97 {
 210                     	switch	.text
 211  0015               f_DMA1_CHANNEL0_1_IRQHandler:
 215                     ; 101 }
 218  0015 80            	iret
 241                     ; 107 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 241                     ; 108 {
 242                     	switch	.text
 243  0016               f_DMA1_CHANNEL2_3_IRQHandler:
 247                     ; 112 }
 250  0016 80            	iret
 273                     ; 118 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 273                     ; 119 {
 274                     	switch	.text
 275  0017               f_RTC_CSSLSE_IRQHandler:
 279                     ; 123 }
 282  0017 80            	iret
 305                     ; 129 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 305                     ; 130 {
 306                     	switch	.text
 307  0018               f_EXTIE_F_PVD_IRQHandler:
 311                     ; 134 }
 314  0018 80            	iret
 336                     ; 141 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 336                     ; 142 {
 337                     	switch	.text
 338  0019               f_EXTIB_G_IRQHandler:
 342                     ; 146 }
 345  0019 80            	iret
 367                     ; 153 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 367                     ; 154 {
 368                     	switch	.text
 369  001a               f_EXTID_H_IRQHandler:
 373                     ; 158 }
 376  001a 80            	iret
 398                     ; 165 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 398                     ; 166 {
 399                     	switch	.text
 400  001b               f_EXTI0_IRQHandler:
 404                     ; 170 }
 407  001b 80            	iret
 429                     ; 177 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 429                     ; 178 {
 430                     	switch	.text
 431  001c               f_EXTI1_IRQHandler:
 435                     ; 182 }
 438  001c 80            	iret
 460                     ; 189 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 460                     ; 190 {
 461                     	switch	.text
 462  001d               f_EXTI2_IRQHandler:
 466                     ; 194 }
 469  001d 80            	iret
 501                     ; 201 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 501                     ; 202 {
 502                     	switch	.text
 503  001e               f_EXTI3_IRQHandler:
 505  001e 8a            	push	cc
 506  001f 84            	pop	a
 507  0020 a4bf          	and	a,#191
 508  0022 88            	push	a
 509  0023 86            	pop	cc
 510  0024 3b0002        	push	c_x+2
 511  0027 be00          	ldw	x,c_x
 512  0029 89            	pushw	x
 513  002a 3b0002        	push	c_y+2
 514  002d be00          	ldw	x,c_y
 515  002f 89            	pushw	x
 518                     ; 206   EXTI_ClearITPendingBit (EXTI_IT_Pin3);
 520  0030 ae0008        	ldw	x,#8
 521  0033 cd0000        	call	_EXTI_ClearITPendingBit
 523                     ; 207   TIM4_SetCounter(0);
 525  0036 4f            	clr	a
 526  0037 cd0000        	call	_TIM4_SetCounter
 528                     ; 208   TIM4_Cmd(ENABLE);
 530  003a a601          	ld	a,#1
 531  003c cd0000        	call	_TIM4_Cmd
 533                     ; 209   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 535  003f 4be0          	push	#224
 536  0041 4b10          	push	#16
 537  0043 ae5005        	ldw	x,#20485
 538  0046 cd0000        	call	_GPIO_Init
 540  0049 85            	popw	x
 541                     ; 210   GPIO_ResetBits(GPIOB,GPIO_Pin_4);
 543  004a 4b10          	push	#16
 544  004c ae5005        	ldw	x,#20485
 545  004f cd0000        	call	_GPIO_ResetBits
 547  0052 84            	pop	a
 548                     ; 211   delay(20);
 550  0053 ae0014        	ldw	x,#20
 551  0056 ada9          	call	_delay
 553                     ; 212   if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_3))
 555  0058 4b08          	push	#8
 556  005a ae5005        	ldw	x,#20485
 557  005d cd0000        	call	_GPIO_ReadInputDataBit
 559  0060 5b01          	addw	sp,#1
 560  0062 4d            	tnz	a
 561  0063 270c          	jreq	L302
 562                     ; 214      EIGHT();
 564  0065 cd0000        	call	_EIGHT
 566                     ; 215      TIM3_SetCounter(0);
 568  0068 5f            	clrw	x
 569  0069 cd0000        	call	_TIM3_SetCounter
 571                     ; 216      TIM3_Cmd(ENABLE);
 573  006c a601          	ld	a,#1
 574  006e cd0000        	call	_TIM3_Cmd
 576  0071               L302:
 577                     ; 218 }
 580  0071 85            	popw	x
 581  0072 bf00          	ldw	c_y,x
 582  0074 320002        	pop	c_y+2
 583  0077 85            	popw	x
 584  0078 bf00          	ldw	c_x,x
 585  007a 320002        	pop	c_x+2
 586  007d 80            	iret
 608                     ; 225 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 608                     ; 226 {
 609                     	switch	.text
 610  007e               f_EXTI4_IRQHandler:
 614                     ; 230 }
 617  007e 80            	iret
 644                     ; 237 @svlreg INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 644                     ; 238 {
 645                     	switch	.text
 646  007f               f_EXTI5_IRQHandler:
 648  007f 8a            	push	cc
 649  0080 84            	pop	a
 650  0081 a4bf          	and	a,#191
 651  0083 88            	push	a
 652  0084 86            	pop	cc
 653  0085 3b0002        	push	c_x+2
 654  0088 be00          	ldw	x,c_x
 655  008a 89            	pushw	x
 656  008b 3b0002        	push	c_y+2
 657  008e be00          	ldw	x,c_y
 658  0090 89            	pushw	x
 659  0091 be02          	ldw	x,c_lreg+2
 660  0093 89            	pushw	x
 661  0094 be00          	ldw	x,c_lreg
 662  0096 89            	pushw	x
 665                     ; 242   EXTI_ClearITPendingBit (EXTI_IT_Pin5);
 667  0097 ae0020        	ldw	x,#32
 668  009a cd0000        	call	_EXTI_ClearITPendingBit
 670                     ; 243   EEPROM_WriteByte(0,0x00);
 672  009d 4b00          	push	#0
 673  009f 5f            	clrw	x
 674  00a0 cd0000        	call	_EEPROM_WriteByte
 676  00a3 84            	pop	a
 677                     ; 244   I2C_DeInit_Config(EEPROM_ReadByte(0));
 679  00a4 5f            	clrw	x
 680  00a5 cd0000        	call	_EEPROM_ReadByte
 682  00a8 cd0000        	call	_I2C_DeInit_Config
 684                     ; 245   k=5;
 686  00ab 35050004      	mov	_k,#5
 687                     ; 246 }
 690  00af 85            	popw	x
 691  00b0 bf00          	ldw	c_lreg,x
 692  00b2 85            	popw	x
 693  00b3 bf02          	ldw	c_lreg+2,x
 694  00b5 85            	popw	x
 695  00b6 bf00          	ldw	c_y,x
 696  00b8 320002        	pop	c_y+2
 697  00bb 85            	popw	x
 698  00bc bf00          	ldw	c_x,x
 699  00be 320002        	pop	c_x+2
 700  00c1 80            	iret
 734                     ; 253 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 734                     ; 254 {
 735                     	switch	.text
 736  00c2               f_EXTI6_IRQHandler:
 738  00c2 8a            	push	cc
 739  00c3 84            	pop	a
 740  00c4 a4bf          	and	a,#191
 741  00c6 88            	push	a
 742  00c7 86            	pop	cc
 743  00c8 3b0002        	push	c_x+2
 744  00cb be00          	ldw	x,c_x
 745  00cd 89            	pushw	x
 746  00ce 3b0002        	push	c_y+2
 747  00d1 be00          	ldw	x,c_y
 748  00d3 89            	pushw	x
 749  00d4 be02          	ldw	x,c_lreg+2
 750  00d6 89            	pushw	x
 751  00d7 be00          	ldw	x,c_lreg
 752  00d9 89            	pushw	x
 755                     ; 258   Timer=TIM2_GetCounter();
 757  00da cd0000        	call	_TIM2_GetCounter
 759  00dd cf0006        	ldw	_Timer,x
 760                     ; 259   GPIO_ResetBits(GPIOB,GPIO_Pin_2);
 762  00e0 4b04          	push	#4
 763  00e2 ae5005        	ldw	x,#20485
 764  00e5 cd0000        	call	_GPIO_ResetBits
 766  00e8 84            	pop	a
 767                     ; 260   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
 769  00e9 4be0          	push	#224
 770  00eb 4b10          	push	#16
 771  00ed ae5005        	ldw	x,#20485
 772  00f0 cd0000        	call	_GPIO_Init
 774  00f3 85            	popw	x
 775                     ; 261   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 777  00f4 4b10          	push	#16
 778  00f6 ae5005        	ldw	x,#20485
 779  00f9 cd0000        	call	_GPIO_SetBits
 781  00fc 84            	pop	a
 782                     ; 262   EXTI_ClearITPendingBit (EXTI_IT_Pin6);
 784  00fd ae0040        	ldw	x,#64
 785  0100 cd0000        	call	_EXTI_ClearITPendingBit
 787                     ; 263   TIM2_Cmd(DISABLE);
 789  0103 4f            	clr	a
 790  0104 cd0000        	call	_TIM2_Cmd
 792                     ; 264   TIM3_Cmd(DISABLE);
 794  0107 4f            	clr	a
 795  0108 cd0000        	call	_TIM3_Cmd
 797                     ; 267   if(Out_Range==0)
 799  010b 725d0005      	tnz	_Out_Range
 800  010f 261c          	jrne	L532
 801                     ; 269   Distance=(uint16_t) Timer*0.0862;
 803  0111 ce0006        	ldw	x,_Timer
 804  0114 cd0000        	call	c_uitof
 806  0117 ae0000        	ldw	x,#L342
 807  011a cd0000        	call	c_fmul
 809  011d cd0000        	call	c_ftoi
 811  0120 cf0008        	ldw	_Distance,x
 812                     ; 270   Distance_H=(uint8_t)(Distance>>8);
 814  0123 550008000a    	mov	_Distance_H,_Distance
 815                     ; 271   Distance_L=(uint8_t) Distance;
 817  0128 550009000b    	mov	_Distance_L,_Distance+1
 818  012d               L532:
 819                     ; 273   Out_Range=0;
 821  012d 725f0005      	clr	_Out_Range
 822                     ; 274 }
 825  0131 85            	popw	x
 826  0132 bf00          	ldw	c_lreg,x
 827  0134 85            	popw	x
 828  0135 bf02          	ldw	c_lreg+2,x
 829  0137 85            	popw	x
 830  0138 bf00          	ldw	c_y,x
 831  013a 320002        	pop	c_y+2
 832  013d 85            	popw	x
 833  013e bf00          	ldw	c_x,x
 834  0140 320002        	pop	c_x+2
 835  0143 80            	iret
 857                     ; 281 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 857                     ; 282 {
 858                     	switch	.text
 859  0144               f_EXTI7_IRQHandler:
 863                     ; 286 }
 866  0144 80            	iret
 888                     ; 292 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 888                     ; 293 {
 889                     	switch	.text
 890  0145               f_LCD_AES_IRQHandler:
 894                     ; 297 }
 897  0145 80            	iret
 920                     ; 303 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 920                     ; 304 {
 921                     	switch	.text
 922  0146               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 926                     ; 308 }
 929  0146 80            	iret
 952                     ; 315 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 952                     ; 316 {
 953                     	switch	.text
 954  0147               f_ADC1_COMP_IRQHandler:
 958                     ; 320 }
 961  0147 80            	iret
 987                     ; 327 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 987                     ; 328 {
 988                     	switch	.text
 989  0148               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 991  0148 8a            	push	cc
 992  0149 84            	pop	a
 993  014a a4bf          	and	a,#191
 994  014c 88            	push	a
 995  014d 86            	pop	cc
 996  014e 3b0002        	push	c_x+2
 997  0151 be00          	ldw	x,c_x
 998  0153 89            	pushw	x
 999  0154 3b0002        	push	c_y+2
1000  0157 be00          	ldw	x,c_y
1001  0159 89            	pushw	x
1004                     ; 332     TIM2_ClearITPendingBit(TIM2_IT_Update);
1006  015a a601          	ld	a,#1
1007  015c cd0000        	call	_TIM2_ClearITPendingBit
1009                     ; 333     TIM2_Cmd(DISABLE);
1011  015f 4f            	clr	a
1012  0160 cd0000        	call	_TIM2_Cmd
1014                     ; 334 }
1017  0163 85            	popw	x
1018  0164 bf00          	ldw	c_y,x
1019  0166 320002        	pop	c_y+2
1020  0169 85            	popw	x
1021  016a bf00          	ldw	c_x,x
1022  016c 320002        	pop	c_x+2
1023  016f 80            	iret
1046                     ; 341 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
1046                     ; 342 {
1047                     	switch	.text
1048  0170               f_TIM2_CC_USART2_RX_IRQHandler:
1052                     ; 346 }
1055  0170 80            	iret
1086                     ; 354 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
1086                     ; 355 {
1087                     	switch	.text
1088  0171               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
1090  0171 8a            	push	cc
1091  0172 84            	pop	a
1092  0173 a4bf          	and	a,#191
1093  0175 88            	push	a
1094  0176 86            	pop	cc
1095  0177 3b0002        	push	c_x+2
1096  017a be00          	ldw	x,c_x
1097  017c 89            	pushw	x
1098  017d 3b0002        	push	c_y+2
1099  0180 be00          	ldw	x,c_y
1100  0182 89            	pushw	x
1103                     ; 359   TIM3_ClearITPendingBit(TIM3_IT_Update);  
1105  0183 a601          	ld	a,#1
1106  0185 cd0000        	call	_TIM3_ClearITPendingBit
1108                     ; 360   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
1110  0188 4be0          	push	#224
1111  018a 4b10          	push	#16
1112  018c ae5005        	ldw	x,#20485
1113  018f cd0000        	call	_GPIO_Init
1115  0192 85            	popw	x
1116                     ; 361   GPIO_SetBits(GPIOB,GPIO_Pin_4);
1118  0193 4b10          	push	#16
1119  0195 ae5005        	ldw	x,#20485
1120  0198 cd0000        	call	_GPIO_SetBits
1122  019b 84            	pop	a
1123                     ; 362   TIM3_Cmd(DISABLE);
1125  019c 4f            	clr	a
1126  019d cd0000        	call	_TIM3_Cmd
1128                     ; 363   measure_flag=0;
1130  01a0 5f            	clrw	x
1131  01a1 cf0000        	ldw	_measure_flag,x
1132                     ; 364   Out_Range=1;
1134  01a4 35010005      	mov	_Out_Range,#1
1135                     ; 365   GPIO_ResetBits(GPIOB,GPIO_Pin_2);
1137  01a8 4b04          	push	#4
1138  01aa ae5005        	ldw	x,#20485
1139  01ad cd0000        	call	_GPIO_ResetBits
1141  01b0 84            	pop	a
1142                     ; 366 }
1145  01b1 85            	popw	x
1146  01b2 bf00          	ldw	c_y,x
1147  01b4 320002        	pop	c_y+2
1148  01b7 85            	popw	x
1149  01b8 bf00          	ldw	c_x,x
1150  01ba 320002        	pop	c_x+2
1151  01bd 80            	iret
1174                     ; 372 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
1174                     ; 373 {
1175                     	switch	.text
1176  01be               f_TIM3_CC_USART3_RX_IRQHandler:
1180                     ; 377 }
1183  01be 80            	iret
1206                     ; 383 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
1206                     ; 384 {
1207                     	switch	.text
1208  01bf               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
1212                     ; 388 }
1215  01bf 80            	iret
1237                     ; 394 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
1237                     ; 395 {
1238                     	switch	.text
1239  01c0               f_TIM1_CC_IRQHandler:
1243                     ; 399 }
1246  01c0 80            	iret
1272                     ; 406 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
1272                     ; 407 {
1273                     	switch	.text
1274  01c1               f_TIM4_UPD_OVF_TRG_IRQHandler:
1276  01c1 8a            	push	cc
1277  01c2 84            	pop	a
1278  01c3 a4bf          	and	a,#191
1279  01c5 88            	push	a
1280  01c6 86            	pop	cc
1281  01c7 3b0002        	push	c_x+2
1282  01ca be00          	ldw	x,c_x
1283  01cc 89            	pushw	x
1284  01cd 3b0002        	push	c_y+2
1285  01d0 be00          	ldw	x,c_y
1286  01d2 89            	pushw	x
1289                     ; 412    TIM4_ClearITPendingBit(TIM4_IT_Update);
1291  01d3 a601          	ld	a,#1
1292  01d5 cd0000        	call	_TIM4_ClearITPendingBit
1294                     ; 413    GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_In_FL_No_IT);
1296  01d8 4b00          	push	#0
1297  01da 4b10          	push	#16
1298  01dc ae5005        	ldw	x,#20485
1299  01df cd0000        	call	_GPIO_Init
1301  01e2 85            	popw	x
1302                     ; 414    TIM4_Cmd(DISABLE);
1304  01e3 4f            	clr	a
1305  01e4 cd0000        	call	_TIM4_Cmd
1307                     ; 416 }
1310  01e7 85            	popw	x
1311  01e8 bf00          	ldw	c_y,x
1312  01ea 320002        	pop	c_y+2
1313  01ed 85            	popw	x
1314  01ee bf00          	ldw	c_x,x
1315  01f0 320002        	pop	c_x+2
1316  01f3 80            	iret
1338                     ; 422 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1338                     ; 423 {
1339                     	switch	.text
1340  01f4               f_SPI1_IRQHandler:
1344                     ; 427 }
1347  01f4 80            	iret
1371                     ; 434 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1371                     ; 435 {
1372                     	switch	.text
1373  01f5               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1377                     ; 439 }
1380  01f5 80            	iret
1403                     ; 446 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1403                     ; 447 {
1404                     	switch	.text
1405  01f6               f_USART1_RX_TIM5_CC_IRQHandler:
1409                     ; 451 }
1412  01f6 80            	iret
1414                     	switch	.bss
1415  0000               L724_sr1:
1416  0000 00            	ds.b	1
1417  0001               L334_sr3:
1418  0001 00            	ds.b	1
1419  0002               L134_sr2:
1420  0002 00            	ds.b	1
1481                     ; 458 @svlreg INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1481                     ; 459 {
1482                     	switch	.text
1483  01f7               f_I2C1_SPI2_IRQHandler:
1485  01f7 8a            	push	cc
1486  01f8 84            	pop	a
1487  01f9 a4bf          	and	a,#191
1488  01fb 88            	push	a
1489  01fc 86            	pop	cc
1490  01fd 3b0002        	push	c_x+2
1491  0200 be00          	ldw	x,c_x
1492  0202 89            	pushw	x
1493  0203 3b0002        	push	c_y+2
1494  0206 be00          	ldw	x,c_y
1495  0208 89            	pushw	x
1496  0209 be02          	ldw	x,c_lreg+2
1497  020b 89            	pushw	x
1498  020c be00          	ldw	x,c_lreg
1499  020e 89            	pushw	x
1502                     ; 467 sr1 = I2C1->SR1;
1505  020f 5552170000    	mov	L724_sr1,21015
1506                     ; 468 sr2 = I2C1->SR2;
1508  0214 5552180002    	mov	L134_sr2,21016
1509                     ; 469 sr3 = I2C1->SR3;
1511  0219 5552190001    	mov	L334_sr3,21017
1512                     ; 472 if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
1514  021e c60002        	ld	a,L134_sr2
1515  0221 a52b          	bcp	a,#43
1516  0223 2712          	jreq	L554
1517                     ; 475     I2C1->SR2= 0;                 // clear all error flags
1519  0225 725f5218      	clr	21016
1520                     ; 476      e=1;
1522  0229 ae0001        	ldw	x,#1
1523  022c cf0002        	ldw	_e,x
1524                     ; 477      Distance_H=0;
1526  022f 725f000a      	clr	_Distance_H
1527                     ; 478      Distance_L=0;
1529  0233 725f000b      	clr	_Distance_L
1530  0237               L554:
1531                     ; 482 if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
1533  0237 c60000        	ld	a,L724_sr1
1534  023a a444          	and	a,#68
1535  023c a144          	cp	a,#68
1536                     ; 488   if( (sr1 & I2C_SR1_RXNE)&&(sr3 &I2C_SR3_BUSY))
1538  023e c60000        	ld	a,L724_sr1
1539  0241 a540          	bcp	a,#64
1540  0243 2778          	jreq	L164
1542  0245 c60001        	ld	a,L334_sr3
1543  0248 a502          	bcp	a,#2
1544  024a 2771          	jreq	L164
1545                     ; 490       GPIOE->ODR^=0X80; 
1547  024c 901e5014      	bcpl	20500,#7
1548                     ; 491       SBUF=I2C1->DR;
1550  0250 5552160000    	mov	_SBUF,21014
1551                     ; 492       k=2;
1553  0255 35020004      	mov	_k,#2
1554                     ; 493       if(SBUF==1)
1556  0259 c60000        	ld	a,_SBUF
1557  025c a101          	cp	a,#1
1558  025e 2631          	jrne	L364
1559                     ; 495       measure_flag=1;
1561  0260 ae0001        	ldw	x,#1
1562  0263 cf0000        	ldw	_measure_flag,x
1563                     ; 496       TIM4_SetCounter(0);
1565  0266 4f            	clr	a
1566  0267 cd0000        	call	_TIM4_SetCounter
1568                     ; 497       TIM4_Cmd(ENABLE);
1570  026a a601          	ld	a,#1
1571  026c cd0000        	call	_TIM4_Cmd
1573                     ; 498       GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
1575  026f 4be0          	push	#224
1576  0271 4b10          	push	#16
1577  0273 ae5005        	ldw	x,#20485
1578  0276 cd0000        	call	_GPIO_Init
1580  0279 85            	popw	x
1581                     ; 499       GPIO_ResetBits(GPIOB,GPIO_Pin_4);
1583  027a 4b10          	push	#16
1584  027c ae5005        	ldw	x,#20485
1585  027f cd0000        	call	_GPIO_ResetBits
1587  0282 84            	pop	a
1588                     ; 500       EIGHT();
1590  0283 cd0000        	call	_EIGHT
1592                     ; 501       TIM3_SetCounter(0);
1594  0286 5f            	clrw	x
1595  0287 cd0000        	call	_TIM3_SetCounter
1597                     ; 502       TIM3_Cmd(ENABLE);
1599  028a a601          	ld	a,#1
1600  028c cd0000        	call	_TIM3_Cmd
1603  028f 202c          	jra	L164
1604  0291               L364:
1605                     ; 504       else if(0xA0<=SBUF<=0xAF)
1607  0291 9c            	rvf
1608  0292 c60000        	ld	a,_SBUF
1609  0295 a1a0          	cp	a,#160
1610  0297 2505          	jrult	L401
1611  0299 ae0001        	ldw	x,#1
1612  029c 2001          	jra	L601
1613  029e               L401:
1614  029e 5f            	clrw	x
1615  029f               L601:
1616  029f a300b0        	cpw	x,#176
1617  02a2 2e15          	jrsge	L764
1618                     ; 506        EEPROM_WriteByte(0,SBUF);
1620  02a4 3b0000        	push	_SBUF
1621  02a7 5f            	clrw	x
1622  02a8 cd0000        	call	_EEPROM_WriteByte
1624  02ab 84            	pop	a
1625                     ; 507        I2C_DeInit_Config(EEPROM_ReadByte(0));
1627  02ac 5f            	clrw	x
1628  02ad cd0000        	call	_EEPROM_ReadByte
1630  02b0 cd0000        	call	_I2C_DeInit_Config
1632                     ; 508        k=1;
1634  02b3 35010004      	mov	_k,#1
1636  02b7 2004          	jra	L164
1637  02b9               L764:
1638                     ; 510       else{measure_flag=0;}
1640  02b9 5f            	clrw	x
1641  02ba cf0000        	ldw	_measure_flag,x
1642  02bd               L164:
1643                     ; 514 if (sr2 & I2C_SR2_AF)
1645  02bd c60002        	ld	a,L134_sr2
1646  02c0 a504          	bcp	a,#4
1647  02c2 2704          	jreq	L374
1648                     ; 516        I2C1->SR2 &= ~I2C_SR2_AF;          // clear AF
1650  02c4 72155218      	bres	21016,#2
1651  02c8               L374:
1652                     ; 520 if (sr1 & I2C_SR1_STOPF) 
1654  02c8 c60000        	ld	a,L724_sr1
1655  02cb a510          	bcp	a,#16
1656  02cd 2704          	jreq	L574
1657                     ; 522     I2C1->CR2 |= I2C_CR2_ACK;          // CR2 write to clear STOPF
1659  02cf 72145211      	bset	21009,#2
1660  02d3               L574:
1661                     ; 526 if( (sr1 & I2C_SR1_ADDR)&&(sr3 &I2C_SR3_BUSY)) 
1663  02d3 c60000        	ld	a,L724_sr1
1664  02d6 a502          	bcp	a,#2
1665  02d8 270b          	jreq	L774
1667  02da c60001        	ld	a,L334_sr3
1668  02dd a502          	bcp	a,#2
1669  02df 2704          	jreq	L774
1670                     ; 528     GPIOC->ODR^=0X80;
1672  02e1 901e500a      	bcpl	20490,#7
1673  02e5               L774:
1674                     ; 531 if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
1676  02e5 c60000        	ld	a,L724_sr1
1677  02e8 a484          	and	a,#132
1678  02ea a184          	cp	a,#132
1679                     ; 535 if (sr1 & I2C_SR1_TXE)
1681  02ec c60000        	ld	a,L724_sr1
1682  02ef a580          	bcp	a,#128
1683  02f1 270a          	jreq	L505
1684                     ; 537  I2C1->DR =Distance_H;
1686  02f3 55000a5216    	mov	21014,_Distance_H
1687                     ; 538  I2C1->DR =Distance_L; 
1689  02f8 55000b5216    	mov	21014,_Distance_L
1691  02fd               L505:
1692                     ; 541 }
1696  02fd 85            	popw	x
1697  02fe bf00          	ldw	c_lreg,x
1698  0300 85            	popw	x
1699  0301 bf02          	ldw	c_lreg+2,x
1700  0303 85            	popw	x
1701  0304 bf00          	ldw	c_y,x
1702  0306 320002        	pop	c_y+2
1703  0309 85            	popw	x
1704  030a bf00          	ldw	c_x,x
1705  030c 320002        	pop	c_x+2
1706  030f 80            	iret
1776                     	xdef	_delay
1777                     	xref	_measure_flag
1778                     	xref	_SBUF
1779                     	xdef	_Distance_L
1780                     	xdef	_Distance_H
1781                     	xdef	_Distance
1782                     	xdef	_Timer
1783                     	xdef	_Out_Range
1784                     	xdef	_k
1785                     	xdef	_e
1786                     	xdef	_i
1787                     	xref	_EEPROM_ReadByte
1788                     	xref	_EEPROM_WriteByte
1789                     	xref	_I2C_DeInit_Config
1790                     	xref	_EIGHT
1791                     	xdef	f_I2C1_SPI2_IRQHandler
1792                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1793                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1794                     	xdef	f_SPI1_IRQHandler
1795                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1796                     	xdef	f_TIM1_CC_IRQHandler
1797                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1798                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1799                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1800                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1801                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1802                     	xdef	f_ADC1_COMP_IRQHandler
1803                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1804                     	xdef	f_LCD_AES_IRQHandler
1805                     	xdef	f_EXTI7_IRQHandler
1806                     	xdef	f_EXTI6_IRQHandler
1807                     	xdef	f_EXTI5_IRQHandler
1808                     	xdef	f_EXTI4_IRQHandler
1809                     	xdef	f_EXTI3_IRQHandler
1810                     	xdef	f_EXTI2_IRQHandler
1811                     	xdef	f_EXTI1_IRQHandler
1812                     	xdef	f_EXTI0_IRQHandler
1813                     	xdef	f_EXTID_H_IRQHandler
1814                     	xdef	f_EXTIB_G_IRQHandler
1815                     	xdef	f_EXTIE_F_PVD_IRQHandler
1816                     	xdef	f_RTC_CSSLSE_IRQHandler
1817                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1818                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1819                     	xdef	f_FLASH_IRQHandler
1820                     	xdef	f_TRAP_IRQHandler
1821                     	xdef	f_NonHandledInterrupt
1822                     	xref	_TIM4_ClearITPendingBit
1823                     	xref	_TIM4_Cmd
1824                     	xref	_TIM4_SetCounter
1825                     	xref	_TIM3_ClearITPendingBit
1826                     	xref	_TIM3_Cmd
1827                     	xref	_TIM3_SetCounter
1828                     	xref	_TIM2_ClearITPendingBit
1829                     	xref	_TIM2_Cmd
1830                     	xref	_TIM2_GetCounter
1831                     	xref	_GPIO_ReadInputDataBit
1832                     	xref	_GPIO_ResetBits
1833                     	xref	_GPIO_SetBits
1834                     	xref	_GPIO_Init
1835                     	xref	_EXTI_ClearITPendingBit
1836                     .const:	section	.text
1837  0000               L342:
1838  0000 3db089a0      	dc.w	15792,-30304
1839                     	xref.b	c_lreg
1840                     	xref.b	c_x
1841                     	xref.b	c_y
1861                     	xref	c_ftoi
1862                     	xref	c_fmul
1863                     	xref	c_uitof
1864                     	end
