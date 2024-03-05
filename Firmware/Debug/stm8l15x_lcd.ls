   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  51                     ; 121 void LCD_DeInit(void)
  51                     ; 122 {
  53                     	switch	.text
  54  0000               _LCD_DeInit:
  56  0000 88            	push	a
  57       00000001      OFST:	set	1
  60                     ; 123   uint8_t counter = 0;
  62                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  64  0001 725f5400      	clr	21504
  65                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  67  0005 725f5401      	clr	21505
  68                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  70  0009 725f5402      	clr	21506
  71                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  73  000d 725f5403      	clr	21507
  74                     ; 130   for (counter = 0;counter < 0x05; counter++)
  76  0011 0f01          	clr	(OFST+0,sp)
  78  0013               L52:
  79                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  81  0013 7b01          	ld	a,(OFST+0,sp)
  82  0015 5f            	clrw	x
  83  0016 97            	ld	xl,a
  84  0017 724f5404      	clr	(21508,x)
  85                     ; 130   for (counter = 0;counter < 0x05; counter++)
  87  001b 0c01          	inc	(OFST+0,sp)
  91  001d 7b01          	ld	a,(OFST+0,sp)
  92  001f a105          	cp	a,#5
  93  0021 25f0          	jrult	L52
  94                     ; 135   for (counter = 0;counter < 0x16; counter++)
  96  0023 0f01          	clr	(OFST+0,sp)
  98  0025               L33:
  99                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 101  0025 7b01          	ld	a,(OFST+0,sp)
 102  0027 5f            	clrw	x
 103  0028 97            	ld	xl,a
 104  0029 724f540c      	clr	(21516,x)
 105                     ; 135   for (counter = 0;counter < 0x16; counter++)
 107  002d 0c01          	inc	(OFST+0,sp)
 111  002f 7b01          	ld	a,(OFST+0,sp)
 112  0031 a116          	cp	a,#22
 113  0033 25f0          	jrult	L33
 114                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 116  0035 725f542f      	clr	21551
 117                     ; 142 }
 120  0039 84            	pop	a
 121  003a 81            	ret
 524                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 524                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 524                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 524                     ; 203 {
 525                     	switch	.text
 526  003b               _LCD_Init:
 528  003b 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 534                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 536                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 538                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 540                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 542                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 544  003c c65403        	ld	a,21507
 545  003f a40f          	and	a,#15
 546  0041 c75403        	ld	21507,a
 547                     ; 212   LCD->FRQ |= LCD_Prescaler;
 549  0044 9e            	ld	a,xh
 550  0045 ca5403        	or	a,21507
 551  0048 c75403        	ld	21507,a
 552                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 554  004b c65403        	ld	a,21507
 555  004e a4f0          	and	a,#240
 556  0050 c75403        	ld	21507,a
 557                     ; 215   LCD->FRQ |= LCD_Divider;
 559  0053 9f            	ld	a,xl
 560  0054 ca5403        	or	a,21507
 561  0057 c75403        	ld	21507,a
 562                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 564  005a c65400        	ld	a,21504
 565  005d a4f9          	and	a,#249
 566  005f c75400        	ld	21504,a
 567                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 569  0062 7213542f      	bres	21551,#1
 570                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 572  0066 7b05          	ld	a,(OFST+5,sp)
 573  0068 a120          	cp	a,#32
 574  006a 260f          	jrne	L742
 575                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 577  006c 7b05          	ld	a,(OFST+5,sp)
 578  006e a4f0          	and	a,#240
 579  0070 4e            	swap	a
 580  0071 a40f          	and	a,#15
 581  0073 ca542f        	or	a,21551
 582  0076 c7542f        	ld	21551,a
 584  0079 200a          	jra	L152
 585  007b               L742:
 586                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 588  007b 7b05          	ld	a,(OFST+5,sp)
 589  007d a40f          	and	a,#15
 590  007f ca5400        	or	a,21504
 591  0082 c75400        	ld	21504,a
 592  0085               L152:
 593                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 595  0085 72115400      	bres	21504,#0
 596                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 598  0089 7211542f      	bres	21551,#0
 599                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 601  008d 7b06          	ld	a,(OFST+6,sp)
 602  008f a110          	cp	a,#16
 603  0091 2619          	jrne	L352
 604                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 606  0093 7b06          	ld	a,(OFST+6,sp)
 607  0095 a40f          	and	a,#15
 608  0097 ca5400        	or	a,21504
 609  009a c75400        	ld	21504,a
 610                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 612  009d 7b06          	ld	a,(OFST+6,sp)
 613  009f a4f0          	and	a,#240
 614  00a1 4e            	swap	a
 615  00a2 a40f          	and	a,#15
 616  00a4 ca542f        	or	a,21551
 617  00a7 c7542f        	ld	21551,a
 619  00aa 200a          	jra	L552
 620  00ac               L352:
 621                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 623  00ac 7b06          	ld	a,(OFST+6,sp)
 624  00ae a40f          	and	a,#15
 625  00b0 ca5400        	or	a,21504
 626  00b3 c75400        	ld	21504,a
 627  00b6               L552:
 628                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 630  00b6 72115401      	bres	21505,#0
 631                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 633  00ba c65401        	ld	a,21505
 634  00bd 1a07          	or	a,(OFST+7,sp)
 635  00bf c75401        	ld	21505,a
 636                     ; 247 }
 639  00c2 85            	popw	x
 640  00c3 81            	ret
 737                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 737                     ; 263 {
 738                     	switch	.text
 739  00c4               _LCD_PortMaskConfig:
 741  00c4 89            	pushw	x
 742       00000000      OFST:	set	0
 745                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 747                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 749  00c5 9e            	ld	a,xh
 750  00c6 5f            	clrw	x
 751  00c7 97            	ld	xl,a
 752  00c8 7b02          	ld	a,(OFST+2,sp)
 753  00ca d75404        	ld	(21508,x),a
 754                     ; 270 }
 757  00cd 85            	popw	x
 758  00ce 81            	ret
 813                     ; 279 void LCD_Cmd(FunctionalState NewState)
 813                     ; 280 {
 814                     	switch	.text
 815  00cf               _LCD_Cmd:
 819                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 821                     ; 284   if (NewState != DISABLE)
 823  00cf 4d            	tnz	a
 824  00d0 2706          	jreq	L543
 825                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 827  00d2 721c5402      	bset	21506,#6
 829  00d6 2004          	jra	L743
 830  00d8               L543:
 831                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 833  00d8 721d5402      	bres	21506,#6
 834  00dc               L743:
 835                     ; 292 }
 838  00dc 81            	ret
 873                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 873                     ; 306 {
 874                     	switch	.text
 875  00dd               _LCD_HighDriveCmd:
 879                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 881                     ; 310   if (NewState != DISABLE)
 883  00dd 4d            	tnz	a
 884  00de 2706          	jreq	L763
 885                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 887  00e0 72185401      	bset	21505,#4
 889  00e4 2004          	jra	L173
 890  00e6               L763:
 891                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 893  00e6 72195401      	bres	21505,#4
 894  00ea               L173:
 895                     ; 318 }
 898  00ea 81            	ret
1005                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1005                     ; 336 {
1006                     	switch	.text
1007  00eb               _LCD_PulseOnDurationConfig:
1009  00eb 88            	push	a
1010       00000000      OFST:	set	0
1013                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1015                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1017  00ec c65401        	ld	a,21505
1018  00ef a41f          	and	a,#31
1019  00f1 c75401        	ld	21505,a
1020                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1022  00f4 c65401        	ld	a,21505
1023  00f7 1a01          	or	a,(OFST+1,sp)
1024  00f9 c75401        	ld	21505,a
1025                     ; 342 }
1028  00fc 84            	pop	a
1029  00fd 81            	ret
1126                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1126                     ; 359 {
1127                     	switch	.text
1128  00fe               _LCD_DeadTimeConfig:
1130  00fe 88            	push	a
1131       00000000      OFST:	set	0
1134                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1136                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1138  00ff c65402        	ld	a,21506
1139  0102 a4f8          	and	a,#248
1140  0104 c75402        	ld	21506,a
1141                     ; 365   LCD->CR3 |= LCD_DeadTime;
1143  0107 c65402        	ld	a,21506
1144  010a 1a01          	or	a,(OFST+1,sp)
1145  010c c75402        	ld	21506,a
1146                     ; 367 }
1149  010f 84            	pop	a
1150  0110 81            	ret
1302                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1302                     ; 392 {
1303                     	switch	.text
1304  0111               _LCD_BlinkConfig:
1308                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1310                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1312                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1314  0111 c65400        	ld	a,21504
1315  0114 a43f          	and	a,#63
1316  0116 c75400        	ld	21504,a
1317                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1319  0119 9e            	ld	a,xh
1320  011a ca5400        	or	a,21504
1321  011d c75400        	ld	21504,a
1322                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1324  0120 c65400        	ld	a,21504
1325  0123 a4c7          	and	a,#199
1326  0125 c75400        	ld	21504,a
1327                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1329  0128 9f            	ld	a,xl
1330  0129 ca5400        	or	a,21504
1331  012c c75400        	ld	21504,a
1332                     ; 403 }
1335  012f 81            	ret
1440                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1440                     ; 420 {
1441                     	switch	.text
1442  0130               _LCD_ContrastConfig:
1444  0130 88            	push	a
1445       00000000      OFST:	set	0
1448                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1450                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1452  0131 c65401        	ld	a,21505
1453  0134 a4f1          	and	a,#241
1454  0136 c75401        	ld	21505,a
1455                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1457  0139 c65401        	ld	a,21505
1458  013c 1a01          	or	a,(OFST+1,sp)
1459  013e c75401        	ld	21505,a
1460                     ; 427 }
1463  0141 84            	pop	a
1464  0142 81            	ret
1666                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1666                     ; 475 {
1667                     	switch	.text
1668  0143               _LCD_WriteRAM:
1670  0143 89            	pushw	x
1671       00000000      OFST:	set	0
1674                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1676                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1678  0144 9e            	ld	a,xh
1679  0145 5f            	clrw	x
1680  0146 97            	ld	xl,a
1681  0147 7b02          	ld	a,(OFST+2,sp)
1682  0149 d7540c        	ld	(21516,x),a
1683                     ; 482 }
1686  014c 85            	popw	x
1687  014d 81            	ret
1744                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1744                     ; 493 {
1745                     	switch	.text
1746  014e               _LCD_PageSelect:
1750                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1752                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1754  014e 7215542f      	bres	21551,#2
1755                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1757  0152 ca542f        	or	a,21551
1758  0155 c7542f        	ld	21551,a
1759                     ; 500 }
1762  0158 81            	ret
1797                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1797                     ; 526 {
1798                     	switch	.text
1799  0159               _LCD_ITConfig:
1803                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1805                     ; 530   if (NewState != DISABLE)
1807  0159 4d            	tnz	a
1808  015a 2706          	jreq	L767
1809                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1811  015c 721a5402      	bset	21506,#5
1813  0160 2004          	jra	L177
1814  0162               L767:
1815                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1817  0162 721b5402      	bres	21506,#5
1818  0166               L177:
1819                     ; 539 }
1822  0166 81            	ret
1878                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1878                     ; 547 {
1879                     	switch	.text
1880  0167               _LCD_GetFlagStatus:
1882  0167 88            	push	a
1883       00000001      OFST:	set	1
1886                     ; 548   FlagStatus status = RESET;
1888                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1890  0168 c65402        	ld	a,21506
1891  016b a510          	bcp	a,#16
1892  016d 2706          	jreq	L1201
1893                     ; 553     status = SET; /* Flag is set */
1895  016f a601          	ld	a,#1
1896  0171 6b01          	ld	(OFST+0,sp),a
1899  0173 2002          	jra	L3201
1900  0175               L1201:
1901                     ; 557     status = RESET; /* Flag is reset*/
1903  0175 0f01          	clr	(OFST+0,sp)
1905  0177               L3201:
1906                     ; 560   return status;
1908  0177 7b01          	ld	a,(OFST+0,sp)
1911  0179 5b01          	addw	sp,#1
1912  017b 81            	ret
1935                     ; 569 void LCD_ClearFlag(void)
1935                     ; 570 {
1936                     	switch	.text
1937  017c               _LCD_ClearFlag:
1941                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1943  017c 72165402      	bset	21506,#3
1944                     ; 574 }
1947  0180 81            	ret
1990                     ; 582 ITStatus LCD_GetITStatus(void)
1990                     ; 583 {
1991                     	switch	.text
1992  0181               _LCD_GetITStatus:
1994  0181 88            	push	a
1995       00000001      OFST:	set	1
1998                     ; 584   ITStatus pendingbitstatus = RESET;
2000                     ; 585   uint8_t enablestatus = 0;
2002                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2004  0182 c65402        	ld	a,21506
2005  0185 a420          	and	a,#32
2006  0187 6b01          	ld	(OFST+0,sp),a
2008                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2010  0189 c65402        	ld	a,21506
2011  018c a510          	bcp	a,#16
2012  018e 270a          	jreq	L5501
2014  0190 0d01          	tnz	(OFST+0,sp)
2015  0192 2706          	jreq	L5501
2016                     ; 592     pendingbitstatus = SET;
2018  0194 a601          	ld	a,#1
2019  0196 6b01          	ld	(OFST+0,sp),a
2022  0198 2002          	jra	L7501
2023  019a               L5501:
2024                     ; 597     pendingbitstatus = RESET;
2026  019a 0f01          	clr	(OFST+0,sp)
2028  019c               L7501:
2029                     ; 600   return  pendingbitstatus;
2031  019c 7b01          	ld	a,(OFST+0,sp)
2034  019e 5b01          	addw	sp,#1
2035  01a0 81            	ret
2059                     ; 609 void LCD_ClearITPendingBit(void)
2059                     ; 610 {
2060                     	switch	.text
2061  01a1               _LCD_ClearITPendingBit:
2065                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2067  01a1 72165402      	bset	21506,#3
2068                     ; 614 }
2071  01a5 81            	ret
2084                     	xdef	_LCD_ClearITPendingBit
2085                     	xdef	_LCD_GetITStatus
2086                     	xdef	_LCD_ClearFlag
2087                     	xdef	_LCD_GetFlagStatus
2088                     	xdef	_LCD_ITConfig
2089                     	xdef	_LCD_PageSelect
2090                     	xdef	_LCD_WriteRAM
2091                     	xdef	_LCD_ContrastConfig
2092                     	xdef	_LCD_BlinkConfig
2093                     	xdef	_LCD_DeadTimeConfig
2094                     	xdef	_LCD_PulseOnDurationConfig
2095                     	xdef	_LCD_HighDriveCmd
2096                     	xdef	_LCD_Cmd
2097                     	xdef	_LCD_PortMaskConfig
2098                     	xdef	_LCD_Init
2099                     	xdef	_LCD_DeInit
2118                     	end
