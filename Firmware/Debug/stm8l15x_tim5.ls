   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 168 void TIM5_DeInit(void)
  42                     ; 169 {
  44                     	switch	.text
  45  0000               _TIM5_DeInit:
  49                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  51  0000 725f5300      	clr	21248
  52                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  54  0004 725f5301      	clr	21249
  55                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  57  0008 725f5302      	clr	21250
  58                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  60  000c 725f5303      	clr	21251
  61                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  63  0010 725f5305      	clr	21253
  64                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  66  0014 725f5307      	clr	21255
  67                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  69  0018 725f530b      	clr	21259
  70                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  72  001c 35015309      	mov	21257,#1
  73                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  75  0020 3501530a      	mov	21258,#1
  76                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  78  0024 725f530b      	clr	21259
  79                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  81  0028 725f5309      	clr	21257
  82                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  84  002c 725f530a      	clr	21258
  85                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  87  0030 725f530c      	clr	21260
  88                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  90  0034 725f530d      	clr	21261
  91                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  93  0038 725f530e      	clr	21262
  94                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  96  003c 35ff530f      	mov	21263,#255
  97                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
  99  0040 35ff5310      	mov	21264,#255
 100                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 102  0044 725f5311      	clr	21265
 103                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 105  0048 725f5312      	clr	21266
 106                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 108  004c 725f5313      	clr	21267
 109                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 111  0050 725f5314      	clr	21268
 112                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 114  0054 725f5316      	clr	21270
 115                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 117  0058 35015308      	mov	21256,#1
 118                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 120  005c 725f5315      	clr	21269
 121                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 123  0060 725f5306      	clr	21254
 124                     ; 206 }
 127  0064 81            	ret
 287                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 287                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 287                     ; 233                        uint16_t TIM5_Period)
 287                     ; 234 {
 288                     	switch	.text
 289  0065               _TIM5_TimeBaseInit:
 291  0065 89            	pushw	x
 292       00000000      OFST:	set	0
 295                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 297                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 299                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 301  0066 7b05          	ld	a,(OFST+5,sp)
 302  0068 c7530f        	ld	21263,a
 303                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 305  006b 7b06          	ld	a,(OFST+6,sp)
 306  006d c75310        	ld	21264,a
 307                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 309  0070 9e            	ld	a,xh
 310  0071 c7530e        	ld	21262,a
 311                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 313  0074 c65300        	ld	a,21248
 314  0077 a48f          	and	a,#143
 315  0079 c75300        	ld	21248,a
 316                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 318  007c 9f            	ld	a,xl
 319  007d ca5300        	or	a,21248
 320  0080 c75300        	ld	21248,a
 321                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 323  0083 35015308      	mov	21256,#1
 324                     ; 254 }
 327  0087 85            	popw	x
 328  0088 81            	ret
 396                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 396                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 396                     ; 276 {
 397                     	switch	.text
 398  0089               _TIM5_PrescalerConfig:
 402                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 404                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 406                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 408  0089 9e            	ld	a,xh
 409  008a c7530e        	ld	21262,a
 410                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 412  008d 9f            	ld	a,xl
 413  008e a101          	cp	a,#1
 414  0090 2606          	jrne	L541
 415                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 417  0092 72105308      	bset	21256,#0
 419  0096 2004          	jra	L741
 420  0098               L541:
 421                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 423  0098 72115308      	bres	21256,#0
 424  009c               L741:
 425                     ; 293 }
 428  009c 81            	ret
 471                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 471                     ; 307 {
 472                     	switch	.text
 473  009d               _TIM5_CounterModeConfig:
 475  009d 88            	push	a
 476  009e 88            	push	a
 477       00000001      OFST:	set	1
 480                     ; 308   uint8_t tmpcr1 = 0;
 482                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 484                     ; 313   tmpcr1 = TIM5->CR1;
 486  009f c65300        	ld	a,21248
 487  00a2 6b01          	ld	(OFST+0,sp),a
 489                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 491  00a4 7b01          	ld	a,(OFST+0,sp)
 492  00a6 a48f          	and	a,#143
 493  00a8 6b01          	ld	(OFST+0,sp),a
 495                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 497  00aa 7b01          	ld	a,(OFST+0,sp)
 498  00ac 1a02          	or	a,(OFST+1,sp)
 499  00ae 6b01          	ld	(OFST+0,sp),a
 501                     ; 321   TIM5->CR1 = tmpcr1;
 503  00b0 7b01          	ld	a,(OFST+0,sp)
 504  00b2 c75300        	ld	21248,a
 505                     ; 322 }
 508  00b5 85            	popw	x
 509  00b6 81            	ret
 541                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 541                     ; 331 {
 542                     	switch	.text
 543  00b7               _TIM5_SetCounter:
 547                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 549  00b7 9e            	ld	a,xh
 550  00b8 c7530c        	ld	21260,a
 551                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 553  00bb 9f            	ld	a,xl
 554  00bc c7530d        	ld	21261,a
 555                     ; 336 }
 558  00bf 81            	ret
 590                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 590                     ; 345 {
 591                     	switch	.text
 592  00c0               _TIM5_SetAutoreload:
 596                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 598  00c0 9e            	ld	a,xh
 599  00c1 c7530f        	ld	21263,a
 600                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 602  00c4 9f            	ld	a,xl
 603  00c5 c75310        	ld	21264,a
 604                     ; 349 }
 607  00c8 81            	ret
 653                     ; 356 uint16_t TIM5_GetCounter(void)
 653                     ; 357 {
 654                     	switch	.text
 655  00c9               _TIM5_GetCounter:
 657  00c9 5204          	subw	sp,#4
 658       00000004      OFST:	set	4
 661                     ; 358   uint16_t tmpcnt = 0;
 663                     ; 361   tmpcntrh = TIM5->CNTRH;
 665  00cb c6530c        	ld	a,21260
 666  00ce 6b02          	ld	(OFST-2,sp),a
 668                     ; 362   tmpcntrl = TIM5->CNTRL;
 670  00d0 c6530d        	ld	a,21261
 671  00d3 6b01          	ld	(OFST-3,sp),a
 673                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 675  00d5 7b01          	ld	a,(OFST-3,sp)
 676  00d7 5f            	clrw	x
 677  00d8 97            	ld	xl,a
 678  00d9 1f03          	ldw	(OFST-1,sp),x
 680                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 682  00db 7b02          	ld	a,(OFST-2,sp)
 683  00dd 5f            	clrw	x
 684  00de 97            	ld	xl,a
 685  00df 4f            	clr	a
 686  00e0 02            	rlwa	x,a
 687  00e1 01            	rrwa	x,a
 688  00e2 1a04          	or	a,(OFST+0,sp)
 689  00e4 01            	rrwa	x,a
 690  00e5 1a03          	or	a,(OFST-1,sp)
 691  00e7 01            	rrwa	x,a
 692  00e8 1f03          	ldw	(OFST-1,sp),x
 694                     ; 367   return ((uint16_t)tmpcnt);
 696  00ea 1e03          	ldw	x,(OFST-1,sp)
 699  00ec 5b04          	addw	sp,#4
 700  00ee 81            	ret
 724                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 724                     ; 384 {
 725                     	switch	.text
 726  00ef               _TIM5_GetPrescaler:
 730                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 732  00ef c6530e        	ld	a,21262
 735  00f2 81            	ret
 791                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 791                     ; 397 {
 792                     	switch	.text
 793  00f3               _TIM5_UpdateDisableConfig:
 797                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 799                     ; 402   if (NewState != DISABLE)
 801  00f3 4d            	tnz	a
 802  00f4 2706          	jreq	L772
 803                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 805  00f6 72125300      	bset	21248,#1
 807  00fa 2004          	jra	L103
 808  00fc               L772:
 809                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 811  00fc 72135300      	bres	21248,#1
 812  0100               L103:
 813                     ; 410 }
 816  0100 81            	ret
 874                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 874                     ; 421 {
 875                     	switch	.text
 876  0101               _TIM5_UpdateRequestConfig:
 880                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 882                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 884  0101 a101          	cp	a,#1
 885  0103 2606          	jrne	L133
 886                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 888  0105 72145300      	bset	21248,#2
 890  0109 2004          	jra	L333
 891  010b               L133:
 892                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 894  010b 72155300      	bres	21248,#2
 895  010f               L333:
 896                     ; 434 }
 899  010f 81            	ret
 935                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 935                     ; 443 {
 936                     	switch	.text
 937  0110               _TIM5_ARRPreloadConfig:
 941                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 943                     ; 448   if (NewState != DISABLE)
 945  0110 4d            	tnz	a
 946  0111 2706          	jreq	L353
 947                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 949  0113 721e5300      	bset	21248,#7
 951  0117 2004          	jra	L553
 952  0119               L353:
 953                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 955  0119 721f5300      	bres	21248,#7
 956  011d               L553:
 957                     ; 456 }
 960  011d 81            	ret
1017                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1017                     ; 467 {
1018                     	switch	.text
1019  011e               _TIM5_SelectOnePulseMode:
1023                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1025                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1027  011e a101          	cp	a,#1
1028  0120 2606          	jrne	L504
1029                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1031  0122 72165300      	bset	21248,#3
1033  0126 2004          	jra	L704
1034  0128               L504:
1035                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1037  0128 72175300      	bres	21248,#3
1038  012c               L704:
1039                     ; 480 }
1042  012c 81            	ret
1077                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1077                     ; 489 {
1078                     	switch	.text
1079  012d               _TIM5_Cmd:
1083                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1085                     ; 494   if (NewState != DISABLE)
1087  012d 4d            	tnz	a
1088  012e 2706          	jreq	L724
1089                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1091  0130 72105300      	bset	21248,#0
1093  0134 2004          	jra	L134
1094  0136               L724:
1095                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1097  0136 72115300      	bres	21248,#0
1098  013a               L134:
1099                     ; 502 }
1102  013a 81            	ret
1296                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1296                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1296                     ; 580                   uint16_t TIM5_Pulse,
1296                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1296                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1296                     ; 583 {
1297                     	switch	.text
1298  013b               _TIM5_OC1Init:
1300  013b 89            	pushw	x
1301  013c 88            	push	a
1302       00000001      OFST:	set	1
1305                     ; 584   uint8_t tmpccmr1 = 0;
1307                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1309                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1311                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1313                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1315                     ; 592   tmpccmr1 = TIM5->CCMR1;
1317  013d c65309        	ld	a,21257
1318  0140 6b01          	ld	(OFST+0,sp),a
1320                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1322  0142 7211530b      	bres	21259,#0
1323                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1325  0146 7b01          	ld	a,(OFST+0,sp)
1326  0148 a48f          	and	a,#143
1327  014a 6b01          	ld	(OFST+0,sp),a
1329                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1331  014c 9e            	ld	a,xh
1332  014d 1a01          	or	a,(OFST+0,sp)
1333  014f 6b01          	ld	(OFST+0,sp),a
1335                     ; 602   TIM5->CCMR1 = tmpccmr1;
1337  0151 7b01          	ld	a,(OFST+0,sp)
1338  0153 c75309        	ld	21257,a
1339                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1341  0156 9f            	ld	a,xl
1342  0157 a101          	cp	a,#1
1343  0159 2606          	jrne	L145
1344                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1346  015b 7210530b      	bset	21259,#0
1348  015f 2004          	jra	L345
1349  0161               L145:
1350                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1352  0161 7211530b      	bres	21259,#0
1353  0165               L345:
1354                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1356  0165 7b08          	ld	a,(OFST+7,sp)
1357  0167 a101          	cp	a,#1
1358  0169 2606          	jrne	L545
1359                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1361  016b 7212530b      	bset	21259,#1
1363  016f 2004          	jra	L745
1364  0171               L545:
1365                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1367  0171 7213530b      	bres	21259,#1
1368  0175               L745:
1369                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1371  0175 7b09          	ld	a,(OFST+8,sp)
1372  0177 a101          	cp	a,#1
1373  0179 2606          	jrne	L155
1374                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1376  017b 72105316      	bset	21270,#0
1378  017f 2004          	jra	L355
1379  0181               L155:
1380                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1382  0181 72115316      	bres	21270,#0
1383  0185               L355:
1384                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1386  0185 7b06          	ld	a,(OFST+5,sp)
1387  0187 c75311        	ld	21265,a
1388                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1390  018a 7b07          	ld	a,(OFST+6,sp)
1391  018c c75312        	ld	21266,a
1392                     ; 637 }
1395  018f 5b03          	addw	sp,#3
1396  0191 81            	ret
1475                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1475                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1475                     ; 666                   uint16_t TIM5_Pulse,
1475                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1475                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1475                     ; 669 {
1476                     	switch	.text
1477  0192               _TIM5_OC2Init:
1479  0192 89            	pushw	x
1480  0193 88            	push	a
1481       00000001      OFST:	set	1
1484                     ; 670   uint8_t tmpccmr2 = 0;
1486                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1488                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1490                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1492                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1494                     ; 678   tmpccmr2 = TIM5->CCMR2;
1496  0194 c6530a        	ld	a,21258
1497  0197 6b01          	ld	(OFST+0,sp),a
1499                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1501  0199 7219530b      	bres	21259,#4
1502                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1504  019d 7b01          	ld	a,(OFST+0,sp)
1505  019f a48f          	and	a,#143
1506  01a1 6b01          	ld	(OFST+0,sp),a
1508                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1510  01a3 9e            	ld	a,xh
1511  01a4 1a01          	or	a,(OFST+0,sp)
1512  01a6 6b01          	ld	(OFST+0,sp),a
1514                     ; 689   TIM5->CCMR2 = tmpccmr2;
1516  01a8 7b01          	ld	a,(OFST+0,sp)
1517  01aa c7530a        	ld	21258,a
1518                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1520  01ad 9f            	ld	a,xl
1521  01ae a101          	cp	a,#1
1522  01b0 2606          	jrne	L316
1523                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1525  01b2 7218530b      	bset	21259,#4
1527  01b6 2004          	jra	L516
1528  01b8               L316:
1529                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1531  01b8 7219530b      	bres	21259,#4
1532  01bc               L516:
1533                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1535  01bc 7b08          	ld	a,(OFST+7,sp)
1536  01be a101          	cp	a,#1
1537  01c0 2606          	jrne	L716
1538                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1540  01c2 721a530b      	bset	21259,#5
1542  01c6 2004          	jra	L126
1543  01c8               L716:
1544                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1546  01c8 721b530b      	bres	21259,#5
1547  01cc               L126:
1548                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1550  01cc 7b09          	ld	a,(OFST+8,sp)
1551  01ce a101          	cp	a,#1
1552  01d0 2606          	jrne	L326
1553                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1555  01d2 72145316      	bset	21270,#2
1557  01d6 2004          	jra	L526
1558  01d8               L326:
1559                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1561  01d8 72155316      	bres	21270,#2
1562  01dc               L526:
1563                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1565  01dc 7b06          	ld	a,(OFST+5,sp)
1566  01de c75313        	ld	21267,a
1567                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1569  01e1 7b07          	ld	a,(OFST+6,sp)
1570  01e3 c75314        	ld	21268,a
1571                     ; 725 }
1574  01e6 5b03          	addw	sp,#3
1575  01e8 81            	ret
1773                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1773                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1773                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1773                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1773                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1773                     ; 759 
1773                     ; 760 {
1774                     	switch	.text
1775  01e9               _TIM5_BKRConfig:
1777  01e9 89            	pushw	x
1778  01ea 88            	push	a
1779       00000001      OFST:	set	1
1782                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1784                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1786                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1788                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1790                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1792                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1792                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1792                     ; 774                                   TIM5_AutomaticOutput));
1794  01eb 7b06          	ld	a,(OFST+5,sp)
1795  01ed 1a07          	or	a,(OFST+6,sp)
1796  01ef 6b01          	ld	(OFST+0,sp),a
1798  01f1 9f            	ld	a,xl
1799  01f2 1a02          	or	a,(OFST+1,sp)
1800  01f4 1a01          	or	a,(OFST+0,sp)
1801  01f6 1a08          	or	a,(OFST+7,sp)
1802  01f8 c75315        	ld	21269,a
1803                     ; 775 }
1806  01fb 5b03          	addw	sp,#3
1807  01fd 81            	ret
1843                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1843                     ; 784 {
1844                     	switch	.text
1845  01fe               _TIM5_CtrlPWMOutputs:
1849                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1851                     ; 790   if (NewState != DISABLE)
1853  01fe 4d            	tnz	a
1854  01ff 2706          	jreq	L757
1855                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1857  0201 721e5315      	bset	21269,#7
1859  0205 2004          	jra	L167
1860  0207               L757:
1861                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1863  0207 721f5315      	bres	21269,#7
1864  020b               L167:
1865                     ; 798 }
1868  020b 81            	ret
1933                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1933                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1933                     ; 820 {
1934                     	switch	.text
1935  020c               _TIM5_SelectOCxM:
1937  020c 89            	pushw	x
1938       00000000      OFST:	set	0
1941                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1943                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1945                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1947  020d 9e            	ld	a,xh
1948  020e 4d            	tnz	a
1949  020f 2615          	jrne	L5101
1950                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1952  0211 7211530b      	bres	21259,#0
1953                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1955  0215 c65309        	ld	a,21257
1956  0218 a48f          	and	a,#143
1957  021a c75309        	ld	21257,a
1958                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1960  021d 9f            	ld	a,xl
1961  021e ca5309        	or	a,21257
1962  0221 c75309        	ld	21257,a
1964  0224 2014          	jra	L7101
1965  0226               L5101:
1966                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1968  0226 7219530b      	bres	21259,#4
1969                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1971  022a c6530a        	ld	a,21258
1972  022d a48f          	and	a,#143
1973  022f c7530a        	ld	21258,a
1974                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1976  0232 c6530a        	ld	a,21258
1977  0235 1a02          	or	a,(OFST+2,sp)
1978  0237 c7530a        	ld	21258,a
1979  023a               L7101:
1980                     ; 847 }
1983  023a 85            	popw	x
1984  023b 81            	ret
2016                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2016                     ; 856 {
2017                     	switch	.text
2018  023c               _TIM5_SetCompare1:
2022                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2024  023c 9e            	ld	a,xh
2025  023d c75311        	ld	21265,a
2026                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2028  0240 9f            	ld	a,xl
2029  0241 c75312        	ld	21266,a
2030                     ; 860 }
2033  0244 81            	ret
2065                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2065                     ; 869 {
2066                     	switch	.text
2067  0245               _TIM5_SetCompare2:
2071                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2073  0245 9e            	ld	a,xh
2074  0246 c75313        	ld	21267,a
2075                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2077  0249 9f            	ld	a,xl
2078  024a c75314        	ld	21268,a
2079                     ; 873 }
2082  024d 81            	ret
2147                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2147                     ; 884 {
2148                     	switch	.text
2149  024e               _TIM5_ForcedOC1Config:
2151  024e 88            	push	a
2152  024f 88            	push	a
2153       00000001      OFST:	set	1
2156                     ; 885   uint8_t tmpccmr1 = 0;
2158                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2160                     ; 890   tmpccmr1 = TIM5->CCMR1;
2162  0250 c65309        	ld	a,21257
2163  0253 6b01          	ld	(OFST+0,sp),a
2165                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2167  0255 7b01          	ld	a,(OFST+0,sp)
2168  0257 a48f          	and	a,#143
2169  0259 6b01          	ld	(OFST+0,sp),a
2171                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2173  025b 7b01          	ld	a,(OFST+0,sp)
2174  025d 1a02          	or	a,(OFST+1,sp)
2175  025f 6b01          	ld	(OFST+0,sp),a
2177                     ; 898   TIM5->CCMR1 = tmpccmr1;
2179  0261 7b01          	ld	a,(OFST+0,sp)
2180  0263 c75309        	ld	21257,a
2181                     ; 899 }
2184  0266 85            	popw	x
2185  0267 81            	ret
2228                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2228                     ; 910 {
2229                     	switch	.text
2230  0268               _TIM5_ForcedOC2Config:
2232  0268 88            	push	a
2233  0269 88            	push	a
2234       00000001      OFST:	set	1
2237                     ; 911   uint8_t tmpccmr2 = 0;
2239                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2241                     ; 916   tmpccmr2 = TIM5->CCMR2;
2243  026a c6530a        	ld	a,21258
2244  026d 6b01          	ld	(OFST+0,sp),a
2246                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2248  026f 7b01          	ld	a,(OFST+0,sp)
2249  0271 a48f          	and	a,#143
2250  0273 6b01          	ld	(OFST+0,sp),a
2252                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2254  0275 7b01          	ld	a,(OFST+0,sp)
2255  0277 1a02          	or	a,(OFST+1,sp)
2256  0279 6b01          	ld	(OFST+0,sp),a
2258                     ; 924   TIM5->CCMR2 = tmpccmr2;
2260  027b 7b01          	ld	a,(OFST+0,sp)
2261  027d c7530a        	ld	21258,a
2262                     ; 925 }
2265  0280 85            	popw	x
2266  0281 81            	ret
2302                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2302                     ; 934 {
2303                     	switch	.text
2304  0282               _TIM5_OC1PreloadConfig:
2308                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2310                     ; 939   if (NewState != DISABLE)
2312  0282 4d            	tnz	a
2313  0283 2706          	jreq	L7311
2314                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2316  0285 72165309      	bset	21257,#3
2318  0289 2004          	jra	L1411
2319  028b               L7311:
2320                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2322  028b 72175309      	bres	21257,#3
2323  028f               L1411:
2324                     ; 947 }
2327  028f 81            	ret
2363                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2363                     ; 956 {
2364                     	switch	.text
2365  0290               _TIM5_OC2PreloadConfig:
2369                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2371                     ; 961   if (NewState != DISABLE)
2373  0290 4d            	tnz	a
2374  0291 2706          	jreq	L1611
2375                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2377  0293 7216530a      	bset	21258,#3
2379  0297 2004          	jra	L3611
2380  0299               L1611:
2381                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2383  0299 7217530a      	bres	21258,#3
2384  029d               L3611:
2385                     ; 969 }
2388  029d 81            	ret
2423                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2423                     ; 978 {
2424                     	switch	.text
2425  029e               _TIM5_OC1FastConfig:
2429                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2431                     ; 983   if (NewState != DISABLE)
2433  029e 4d            	tnz	a
2434  029f 2706          	jreq	L3021
2435                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2437  02a1 72145309      	bset	21257,#2
2439  02a5 2004          	jra	L5021
2440  02a7               L3021:
2441                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2443  02a7 72155309      	bres	21257,#2
2444  02ab               L5021:
2445                     ; 991 }
2448  02ab 81            	ret
2483                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2483                     ; 1001 {
2484                     	switch	.text
2485  02ac               _TIM5_OC2FastConfig:
2489                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2491                     ; 1006   if (NewState != DISABLE)
2493  02ac 4d            	tnz	a
2494  02ad 2706          	jreq	L5221
2495                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2497  02af 7214530a      	bset	21258,#2
2499  02b3 2004          	jra	L7221
2500  02b5               L5221:
2501                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2503  02b5 7215530a      	bres	21258,#2
2504  02b9               L7221:
2505                     ; 1014 }
2508  02b9 81            	ret
2544                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2544                     ; 1025 {
2545                     	switch	.text
2546  02ba               _TIM5_OC1PolarityConfig:
2550                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2552                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2554  02ba a101          	cp	a,#1
2555  02bc 2606          	jrne	L7421
2556                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2558  02be 7212530b      	bset	21259,#1
2560  02c2 2004          	jra	L1521
2561  02c4               L7421:
2562                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2564  02c4 7213530b      	bres	21259,#1
2565  02c8               L1521:
2566                     ; 1038 }
2569  02c8 81            	ret
2605                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2605                     ; 1049 {
2606                     	switch	.text
2607  02c9               _TIM5_OC2PolarityConfig:
2611                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2613                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2615  02c9 a101          	cp	a,#1
2616  02cb 2606          	jrne	L1721
2617                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2619  02cd 721a530b      	bset	21259,#5
2621  02d1 2004          	jra	L3721
2622  02d3               L1721:
2623                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2625  02d3 721b530b      	bres	21259,#5
2626  02d7               L3721:
2627                     ; 1062 }
2630  02d7 81            	ret
2675                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2675                     ; 1075                  FunctionalState NewState)
2675                     ; 1076 {
2676                     	switch	.text
2677  02d8               _TIM5_CCxCmd:
2679  02d8 89            	pushw	x
2680       00000000      OFST:	set	0
2683                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2685                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2687                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2689  02d9 9e            	ld	a,xh
2690  02da 4d            	tnz	a
2691  02db 2610          	jrne	L7131
2692                     ; 1084     if (NewState != DISABLE)
2694  02dd 9f            	ld	a,xl
2695  02de 4d            	tnz	a
2696  02df 2706          	jreq	L1231
2697                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2699  02e1 7210530b      	bset	21259,#0
2701  02e5 2014          	jra	L5231
2702  02e7               L1231:
2703                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2705  02e7 7211530b      	bres	21259,#0
2706  02eb 200e          	jra	L5231
2707  02ed               L7131:
2708                     ; 1097     if (NewState != DISABLE)
2710  02ed 0d02          	tnz	(OFST+2,sp)
2711  02ef 2706          	jreq	L7231
2712                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2714  02f1 7218530b      	bset	21259,#4
2716  02f5 2004          	jra	L5231
2717  02f7               L7231:
2718                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2720  02f7 7219530b      	bres	21259,#4
2721  02fb               L5231:
2722                     ; 1106 }
2725  02fb 85            	popw	x
2726  02fc 81            	ret
2888                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2888                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2888                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2888                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2888                     ; 1188                  uint8_t TIM5_ICFilter)
2888                     ; 1189 {
2889                     	switch	.text
2890  02fd               _TIM5_ICInit:
2892  02fd 89            	pushw	x
2893       00000000      OFST:	set	0
2896                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2898                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2900  02fe 9e            	ld	a,xh
2901  02ff 4d            	tnz	a
2902  0300 2614          	jrne	L5241
2903                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2905  0302 7b07          	ld	a,(OFST+7,sp)
2906  0304 88            	push	a
2907  0305 7b06          	ld	a,(OFST+6,sp)
2908  0307 97            	ld	xl,a
2909  0308 7b03          	ld	a,(OFST+3,sp)
2910  030a 95            	ld	xh,a
2911  030b cd060d        	call	L3_TI1_Config
2913  030e 84            	pop	a
2914                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2916  030f 7b06          	ld	a,(OFST+6,sp)
2917  0311 cd03e3        	call	_TIM5_SetIC1Prescaler
2920  0314 2012          	jra	L7241
2921  0316               L5241:
2922                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2924  0316 7b07          	ld	a,(OFST+7,sp)
2925  0318 88            	push	a
2926  0319 7b06          	ld	a,(OFST+6,sp)
2927  031b 97            	ld	xl,a
2928  031c 7b03          	ld	a,(OFST+3,sp)
2929  031e 95            	ld	xh,a
2930  031f cd064a        	call	L5_TI2_Config
2932  0322 84            	pop	a
2933                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2935  0323 7b06          	ld	a,(OFST+6,sp)
2936  0325 cd03fd        	call	_TIM5_SetIC2Prescaler
2938  0328               L7241:
2939                     ; 1209 }
2942  0328 85            	popw	x
2943  0329 81            	ret
3033                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3033                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3033                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3033                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3033                     ; 1239                      uint8_t TIM5_ICFilter)
3033                     ; 1240 {
3034                     	switch	.text
3035  032a               _TIM5_PWMIConfig:
3037  032a 89            	pushw	x
3038  032b 89            	pushw	x
3039       00000002      OFST:	set	2
3042                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3044                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3046                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3048                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3050  032c 9f            	ld	a,xl
3051  032d 4d            	tnz	a
3052  032e 2606          	jrne	L1741
3053                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3055  0330 a601          	ld	a,#1
3056  0332 6b01          	ld	(OFST-1,sp),a
3059  0334 2002          	jra	L3741
3060  0336               L1741:
3061                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3063  0336 0f01          	clr	(OFST-1,sp)
3065  0338               L3741:
3066                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3068  0338 7b07          	ld	a,(OFST+5,sp)
3069  033a a101          	cp	a,#1
3070  033c 2606          	jrne	L5741
3071                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3073  033e a602          	ld	a,#2
3074  0340 6b02          	ld	(OFST+0,sp),a
3077  0342 2004          	jra	L7741
3078  0344               L5741:
3079                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3081  0344 a601          	ld	a,#1
3082  0346 6b02          	ld	(OFST+0,sp),a
3084  0348               L7741:
3085                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3087  0348 0d03          	tnz	(OFST+1,sp)
3088  034a 2626          	jrne	L1051
3089                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3089                     ; 1271                TIM5_ICFilter);
3091  034c 7b09          	ld	a,(OFST+7,sp)
3092  034e 88            	push	a
3093  034f 7b08          	ld	a,(OFST+6,sp)
3094  0351 97            	ld	xl,a
3095  0352 7b05          	ld	a,(OFST+3,sp)
3096  0354 95            	ld	xh,a
3097  0355 cd060d        	call	L3_TI1_Config
3099  0358 84            	pop	a
3100                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3102  0359 7b08          	ld	a,(OFST+6,sp)
3103  035b cd03e3        	call	_TIM5_SetIC1Prescaler
3105                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3107  035e 7b09          	ld	a,(OFST+7,sp)
3108  0360 88            	push	a
3109  0361 7b03          	ld	a,(OFST+1,sp)
3110  0363 97            	ld	xl,a
3111  0364 7b02          	ld	a,(OFST+0,sp)
3112  0366 95            	ld	xh,a
3113  0367 cd064a        	call	L5_TI2_Config
3115  036a 84            	pop	a
3116                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3118  036b 7b08          	ld	a,(OFST+6,sp)
3119  036d cd03fd        	call	_TIM5_SetIC2Prescaler
3122  0370 2022          	jra	L3051
3123  0372               L1051:
3124                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3124                     ; 1286                TIM5_ICFilter);
3126  0372 7b09          	ld	a,(OFST+7,sp)
3127  0374 88            	push	a
3128  0375 7b08          	ld	a,(OFST+6,sp)
3129  0377 97            	ld	xl,a
3130  0378 7b05          	ld	a,(OFST+3,sp)
3131  037a 95            	ld	xh,a
3132  037b cd064a        	call	L5_TI2_Config
3134  037e 84            	pop	a
3135                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3137  037f 7b08          	ld	a,(OFST+6,sp)
3138  0381 ad7a          	call	_TIM5_SetIC2Prescaler
3140                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3142  0383 7b09          	ld	a,(OFST+7,sp)
3143  0385 88            	push	a
3144  0386 7b03          	ld	a,(OFST+1,sp)
3145  0388 97            	ld	xl,a
3146  0389 7b02          	ld	a,(OFST+0,sp)
3147  038b 95            	ld	xh,a
3148  038c cd060d        	call	L3_TI1_Config
3150  038f 84            	pop	a
3151                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3153  0390 7b08          	ld	a,(OFST+6,sp)
3154  0392 ad4f          	call	_TIM5_SetIC1Prescaler
3156  0394               L3051:
3157                     ; 1297 }
3160  0394 5b04          	addw	sp,#4
3161  0396 81            	ret
3207                     ; 1304 uint16_t TIM5_GetCapture1(void)
3207                     ; 1305 {
3208                     	switch	.text
3209  0397               _TIM5_GetCapture1:
3211  0397 5204          	subw	sp,#4
3212       00000004      OFST:	set	4
3215                     ; 1306   uint16_t tmpccr1 = 0;
3217                     ; 1309   tmpccr1h = TIM5->CCR1H;
3219  0399 c65311        	ld	a,21265
3220  039c 6b02          	ld	(OFST-2,sp),a
3222                     ; 1310   tmpccr1l = TIM5->CCR1L;
3224  039e c65312        	ld	a,21266
3225  03a1 6b01          	ld	(OFST-3,sp),a
3227                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3229  03a3 7b01          	ld	a,(OFST-3,sp)
3230  03a5 5f            	clrw	x
3231  03a6 97            	ld	xl,a
3232  03a7 1f03          	ldw	(OFST-1,sp),x
3234                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3236  03a9 7b02          	ld	a,(OFST-2,sp)
3237  03ab 5f            	clrw	x
3238  03ac 97            	ld	xl,a
3239  03ad 4f            	clr	a
3240  03ae 02            	rlwa	x,a
3241  03af 01            	rrwa	x,a
3242  03b0 1a04          	or	a,(OFST+0,sp)
3243  03b2 01            	rrwa	x,a
3244  03b3 1a03          	or	a,(OFST-1,sp)
3245  03b5 01            	rrwa	x,a
3246  03b6 1f03          	ldw	(OFST-1,sp),x
3248                     ; 1315   return ((uint16_t)tmpccr1);
3250  03b8 1e03          	ldw	x,(OFST-1,sp)
3253  03ba 5b04          	addw	sp,#4
3254  03bc 81            	ret
3300                     ; 1323 uint16_t TIM5_GetCapture2(void)
3300                     ; 1324 {
3301                     	switch	.text
3302  03bd               _TIM5_GetCapture2:
3304  03bd 5204          	subw	sp,#4
3305       00000004      OFST:	set	4
3308                     ; 1325   uint16_t tmpccr2 = 0;
3310                     ; 1328   tmpccr2h = TIM5->CCR2H;
3312  03bf c65313        	ld	a,21267
3313  03c2 6b02          	ld	(OFST-2,sp),a
3315                     ; 1329   tmpccr2l = TIM5->CCR2L;
3317  03c4 c65314        	ld	a,21268
3318  03c7 6b01          	ld	(OFST-3,sp),a
3320                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3322  03c9 7b01          	ld	a,(OFST-3,sp)
3323  03cb 5f            	clrw	x
3324  03cc 97            	ld	xl,a
3325  03cd 1f03          	ldw	(OFST-1,sp),x
3327                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3329  03cf 7b02          	ld	a,(OFST-2,sp)
3330  03d1 5f            	clrw	x
3331  03d2 97            	ld	xl,a
3332  03d3 4f            	clr	a
3333  03d4 02            	rlwa	x,a
3334  03d5 01            	rrwa	x,a
3335  03d6 1a04          	or	a,(OFST+0,sp)
3336  03d8 01            	rrwa	x,a
3337  03d9 1a03          	or	a,(OFST-1,sp)
3338  03db 01            	rrwa	x,a
3339  03dc 1f03          	ldw	(OFST-1,sp),x
3341                     ; 1334   return ((uint16_t)tmpccr2);
3343  03de 1e03          	ldw	x,(OFST-1,sp)
3346  03e0 5b04          	addw	sp,#4
3347  03e2 81            	ret
3390                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3390                     ; 1348 {
3391                     	switch	.text
3392  03e3               _TIM5_SetIC1Prescaler:
3394  03e3 88            	push	a
3395  03e4 88            	push	a
3396       00000001      OFST:	set	1
3399                     ; 1349   uint8_t tmpccmr1 = 0;
3401                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3403                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3405  03e5 c65309        	ld	a,21257
3406  03e8 6b01          	ld	(OFST+0,sp),a
3408                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3410  03ea 7b01          	ld	a,(OFST+0,sp)
3411  03ec a4f3          	and	a,#243
3412  03ee 6b01          	ld	(OFST+0,sp),a
3414                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3416  03f0 7b01          	ld	a,(OFST+0,sp)
3417  03f2 1a02          	or	a,(OFST+1,sp)
3418  03f4 6b01          	ld	(OFST+0,sp),a
3420                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3422  03f6 7b01          	ld	a,(OFST+0,sp)
3423  03f8 c75309        	ld	21257,a
3424                     ; 1363 }
3427  03fb 85            	popw	x
3428  03fc 81            	ret
3471                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3471                     ; 1376 {
3472                     	switch	.text
3473  03fd               _TIM5_SetIC2Prescaler:
3475  03fd 88            	push	a
3476  03fe 88            	push	a
3477       00000001      OFST:	set	1
3480                     ; 1377   uint8_t tmpccmr2 = 0;
3482                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3484                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3486  03ff c6530a        	ld	a,21258
3487  0402 6b01          	ld	(OFST+0,sp),a
3489                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3491  0404 7b01          	ld	a,(OFST+0,sp)
3492  0406 a4f3          	and	a,#243
3493  0408 6b01          	ld	(OFST+0,sp),a
3495                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3497  040a 7b01          	ld	a,(OFST+0,sp)
3498  040c 1a02          	or	a,(OFST+1,sp)
3499  040e 6b01          	ld	(OFST+0,sp),a
3501                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3503  0410 7b01          	ld	a,(OFST+0,sp)
3504  0412 c7530a        	ld	21258,a
3505                     ; 1391 }
3508  0415 85            	popw	x
3509  0416 81            	ret
3595                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3595                     ; 1423 {
3596                     	switch	.text
3597  0417               _TIM5_ITConfig:
3599  0417 89            	pushw	x
3600       00000000      OFST:	set	0
3603                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3605                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3607                     ; 1428   if (NewState != DISABLE)
3609  0418 9f            	ld	a,xl
3610  0419 4d            	tnz	a
3611  041a 2709          	jreq	L5461
3612                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3614  041c 9e            	ld	a,xh
3615  041d ca5305        	or	a,21253
3616  0420 c75305        	ld	21253,a
3618  0423 2009          	jra	L7461
3619  0425               L5461:
3620                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3622  0425 7b01          	ld	a,(OFST+1,sp)
3623  0427 43            	cpl	a
3624  0428 c45305        	and	a,21253
3625  042b c75305        	ld	21253,a
3626  042e               L7461:
3627                     ; 1438 }
3630  042e 85            	popw	x
3631  042f 81            	ret
3712                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3712                     ; 1452 {
3713                     	switch	.text
3714  0430               _TIM5_GenerateEvent:
3718                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3720                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3722  0430 ca5308        	or	a,21256
3723  0433 c75308        	ld	21256,a
3724                     ; 1458 }
3727  0436 81            	ret
3862                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3862                     ; 1474 {
3863                     	switch	.text
3864  0437               _TIM5_GetFlagStatus:
3866  0437 89            	pushw	x
3867  0438 89            	pushw	x
3868       00000002      OFST:	set	2
3871                     ; 1475   FlagStatus bitstatus = RESET;
3873                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3877                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3879                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3881  0439 9f            	ld	a,xl
3882  043a c45306        	and	a,21254
3883  043d 6b01          	ld	(OFST-1,sp),a
3885                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3887  043f c65307        	ld	a,21255
3888  0442 1403          	and	a,(OFST+1,sp)
3889  0444 6b02          	ld	(OFST+0,sp),a
3891                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3893  0446 7b01          	ld	a,(OFST-1,sp)
3894  0448 1a02          	or	a,(OFST+0,sp)
3895  044a 2706          	jreq	L5671
3896                     ; 1486     bitstatus = SET;
3898  044c a601          	ld	a,#1
3899  044e 6b02          	ld	(OFST+0,sp),a
3902  0450 2002          	jra	L7671
3903  0452               L5671:
3904                     ; 1490     bitstatus = RESET;
3906  0452 0f02          	clr	(OFST+0,sp)
3908  0454               L7671:
3909                     ; 1492   return ((FlagStatus)bitstatus);
3911  0454 7b02          	ld	a,(OFST+0,sp)
3914  0456 5b04          	addw	sp,#4
3915  0458 81            	ret
3950                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3950                     ; 1507 {
3951                     	switch	.text
3952  0459               _TIM5_ClearFlag:
3954  0459 89            	pushw	x
3955       00000000      OFST:	set	0
3958                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3960                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3962  045a 9f            	ld	a,xl
3963  045b 43            	cpl	a
3964  045c c75306        	ld	21254,a
3965                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3967  045f 7b01          	ld	a,(OFST+1,sp)
3968  0461 43            	cpl	a
3969  0462 c75307        	ld	21255,a
3970                     ; 1513 }
3973  0465 85            	popw	x
3974  0466 81            	ret
4034                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4034                     ; 1527 {
4035                     	switch	.text
4036  0467               _TIM5_GetITStatus:
4038  0467 88            	push	a
4039  0468 89            	pushw	x
4040       00000002      OFST:	set	2
4043                     ; 1528   ITStatus bitstatus = RESET;
4045                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4049                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4051                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4053  0469 c45306        	and	a,21254
4054  046c 6b01          	ld	(OFST-1,sp),a
4056                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4058  046e c65305        	ld	a,21253
4059  0471 1403          	and	a,(OFST+1,sp)
4060  0473 6b02          	ld	(OFST+0,sp),a
4062                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4064  0475 0d01          	tnz	(OFST-1,sp)
4065  0477 270a          	jreq	L5302
4067  0479 0d02          	tnz	(OFST+0,sp)
4068  047b 2706          	jreq	L5302
4069                     ; 1541     bitstatus = (ITStatus)SET;
4071  047d a601          	ld	a,#1
4072  047f 6b02          	ld	(OFST+0,sp),a
4075  0481 2002          	jra	L7302
4076  0483               L5302:
4077                     ; 1545     bitstatus = (ITStatus)RESET;
4079  0483 0f02          	clr	(OFST+0,sp)
4081  0485               L7302:
4082                     ; 1547   return ((ITStatus)bitstatus);
4084  0485 7b02          	ld	a,(OFST+0,sp)
4087  0487 5b03          	addw	sp,#3
4088  0489 81            	ret
4124                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4124                     ; 1562 {
4125                     	switch	.text
4126  048a               _TIM5_ClearITPendingBit:
4130                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4132                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4134  048a 43            	cpl	a
4135  048b c75306        	ld	21254,a
4136                     ; 1568 }
4139  048e 81            	ret
4212                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4212                     ; 1582 {
4213                     	switch	.text
4214  048f               _TIM5_DMACmd:
4216  048f 89            	pushw	x
4217       00000000      OFST:	set	0
4220                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4222                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4224                     ; 1587   if (NewState != DISABLE)
4226  0490 9f            	ld	a,xl
4227  0491 4d            	tnz	a
4228  0492 2709          	jreq	L3112
4229                     ; 1590     TIM5->DER |= TIM5_DMASource;
4231  0494 9e            	ld	a,xh
4232  0495 ca5304        	or	a,21252
4233  0498 c75304        	ld	21252,a
4235  049b 2009          	jra	L5112
4236  049d               L3112:
4237                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4239  049d 7b01          	ld	a,(OFST+1,sp)
4240  049f 43            	cpl	a
4241  04a0 c45304        	and	a,21252
4242  04a3 c75304        	ld	21252,a
4243  04a6               L5112:
4244                     ; 1597 }
4247  04a6 85            	popw	x
4248  04a7 81            	ret
4283                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4283                     ; 1606 {
4284                     	switch	.text
4285  04a8               _TIM5_SelectCCDMA:
4289                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4291                     ; 1610   if (NewState != DISABLE)
4293  04a8 4d            	tnz	a
4294  04a9 2706          	jreq	L5312
4295                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4297  04ab 72165301      	bset	21249,#3
4299  04af 2004          	jra	L7312
4300  04b1               L5312:
4301                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4303  04b1 72175301      	bres	21249,#3
4304  04b5               L7312:
4305                     ; 1620 }
4308  04b5 81            	ret
4332                     ; 1644 void TIM5_InternalClockConfig(void)
4332                     ; 1645 {
4333                     	switch	.text
4334  04b6               _TIM5_InternalClockConfig:
4338                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4340  04b6 c65302        	ld	a,21250
4341  04b9 a4f8          	and	a,#248
4342  04bb c75302        	ld	21250,a
4343                     ; 1648 }
4346  04be 81            	ret
4433                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4433                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4433                     ; 1667                                  uint8_t ICFilter)
4433                     ; 1668 {
4434                     	switch	.text
4435  04bf               _TIM5_TIxExternalClockConfig:
4437  04bf 89            	pushw	x
4438       00000000      OFST:	set	0
4441                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4443                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4445                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4447                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4449  04c0 9e            	ld	a,xh
4450  04c1 a160          	cp	a,#96
4451  04c3 260e          	jrne	L7022
4452                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4454  04c5 7b05          	ld	a,(OFST+5,sp)
4455  04c7 88            	push	a
4456  04c8 9f            	ld	a,xl
4457  04c9 ae0001        	ldw	x,#1
4458  04cc 95            	ld	xh,a
4459  04cd cd064a        	call	L5_TI2_Config
4461  04d0 84            	pop	a
4463  04d1 200d          	jra	L1122
4464  04d3               L7022:
4465                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4467  04d3 7b05          	ld	a,(OFST+5,sp)
4468  04d5 88            	push	a
4469  04d6 7b03          	ld	a,(OFST+3,sp)
4470  04d8 ae0001        	ldw	x,#1
4471  04db 95            	ld	xh,a
4472  04dc cd060d        	call	L3_TI1_Config
4474  04df 84            	pop	a
4475  04e0               L1122:
4476                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4478  04e0 7b01          	ld	a,(OFST+1,sp)
4479  04e2 ad4b          	call	_TIM5_SelectInputTrigger
4481                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4483  04e4 c65302        	ld	a,21250
4484  04e7 aa07          	or	a,#7
4485  04e9 c75302        	ld	21250,a
4486                     ; 1689 }
4489  04ec 85            	popw	x
4490  04ed 81            	ret
4605                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4605                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4605                     ; 1709                               uint8_t ExtTRGFilter)
4605                     ; 1710 {
4606                     	switch	.text
4607  04ee               _TIM5_ETRClockMode1Config:
4609  04ee 89            	pushw	x
4610       00000000      OFST:	set	0
4613                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4615  04ef 7b05          	ld	a,(OFST+5,sp)
4616  04f1 88            	push	a
4617  04f2 9f            	ld	a,xl
4618  04f3 97            	ld	xl,a
4619  04f4 7b02          	ld	a,(OFST+2,sp)
4620  04f6 95            	ld	xh,a
4621  04f7 cd058b        	call	_TIM5_ETRConfig
4623  04fa 84            	pop	a
4624                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4626  04fb c65302        	ld	a,21250
4627  04fe a4f8          	and	a,#248
4628  0500 c75302        	ld	21250,a
4629                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4631  0503 c65302        	ld	a,21250
4632  0506 aa07          	or	a,#7
4633  0508 c75302        	ld	21250,a
4634                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4636  050b c65302        	ld	a,21250
4637  050e a48f          	and	a,#143
4638  0510 c75302        	ld	21250,a
4639                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4641  0513 c65302        	ld	a,21250
4642  0516 aa70          	or	a,#112
4643  0518 c75302        	ld	21250,a
4644                     ; 1721 }
4647  051b 85            	popw	x
4648  051c 81            	ret
4704                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4704                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4704                     ; 1741                               uint8_t ExtTRGFilter)
4704                     ; 1742 {
4705                     	switch	.text
4706  051d               _TIM5_ETRClockMode2Config:
4708  051d 89            	pushw	x
4709       00000000      OFST:	set	0
4712                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4714  051e 7b05          	ld	a,(OFST+5,sp)
4715  0520 88            	push	a
4716  0521 9f            	ld	a,xl
4717  0522 97            	ld	xl,a
4718  0523 7b02          	ld	a,(OFST+2,sp)
4719  0525 95            	ld	xh,a
4720  0526 ad63          	call	_TIM5_ETRConfig
4722  0528 84            	pop	a
4723                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4725  0529 721c5303      	bset	21251,#6
4726                     ; 1748 }
4729  052d 85            	popw	x
4730  052e 81            	ret
4844                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4844                     ; 1800 {
4845                     	switch	.text
4846  052f               _TIM5_SelectInputTrigger:
4848  052f 88            	push	a
4849  0530 88            	push	a
4850       00000001      OFST:	set	1
4853                     ; 1801   uint8_t tmpsmcr = 0;
4855                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4857                     ; 1806   tmpsmcr = TIM5->SMCR;
4859  0531 c65302        	ld	a,21250
4860  0534 6b01          	ld	(OFST+0,sp),a
4862                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4864  0536 7b01          	ld	a,(OFST+0,sp)
4865  0538 a48f          	and	a,#143
4866  053a 6b01          	ld	(OFST+0,sp),a
4868                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4870  053c 7b01          	ld	a,(OFST+0,sp)
4871  053e 1a02          	or	a,(OFST+1,sp)
4872  0540 6b01          	ld	(OFST+0,sp),a
4874                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4876  0542 7b01          	ld	a,(OFST+0,sp)
4877  0544 c75302        	ld	21250,a
4878                     ; 1813 }
4881  0547 85            	popw	x
4882  0548 81            	ret
4979                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4979                     ; 1828 {
4980                     	switch	.text
4981  0549               _TIM5_SelectOutputTrigger:
4983  0549 88            	push	a
4984  054a 88            	push	a
4985       00000001      OFST:	set	1
4988                     ; 1829   uint8_t tmpcr2 = 0;
4990                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4992                     ; 1834   tmpcr2 = TIM5->CR2;
4994  054b c65301        	ld	a,21249
4995  054e 6b01          	ld	(OFST+0,sp),a
4997                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4999  0550 7b01          	ld	a,(OFST+0,sp)
5000  0552 a48f          	and	a,#143
5001  0554 6b01          	ld	(OFST+0,sp),a
5003                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
5005  0556 7b01          	ld	a,(OFST+0,sp)
5006  0558 1a02          	or	a,(OFST+1,sp)
5007  055a 6b01          	ld	(OFST+0,sp),a
5009                     ; 1842   TIM5->CR2 = tmpcr2;
5011  055c 7b01          	ld	a,(OFST+0,sp)
5012  055e c75301        	ld	21249,a
5013                     ; 1843 }
5016  0561 85            	popw	x
5017  0562 81            	ret
5098                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5098                     ; 1856 {
5099                     	switch	.text
5100  0563               _TIM5_SelectSlaveMode:
5102  0563 88            	push	a
5103  0564 88            	push	a
5104       00000001      OFST:	set	1
5107                     ; 1857   uint8_t tmpsmcr = 0;
5109                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5111                     ; 1862   tmpsmcr = TIM5->SMCR;
5113  0565 c65302        	ld	a,21250
5114  0568 6b01          	ld	(OFST+0,sp),a
5116                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5118  056a 7b01          	ld	a,(OFST+0,sp)
5119  056c a4f8          	and	a,#248
5120  056e 6b01          	ld	(OFST+0,sp),a
5122                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5124  0570 7b01          	ld	a,(OFST+0,sp)
5125  0572 1a02          	or	a,(OFST+1,sp)
5126  0574 6b01          	ld	(OFST+0,sp),a
5128                     ; 1870   TIM5->SMCR = tmpsmcr;
5130  0576 7b01          	ld	a,(OFST+0,sp)
5131  0578 c75302        	ld	21250,a
5132                     ; 1871 }
5135  057b 85            	popw	x
5136  057c 81            	ret
5172                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5172                     ; 1880 {
5173                     	switch	.text
5174  057d               _TIM5_SelectMasterSlaveMode:
5178                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5180                     ; 1885   if (NewState != DISABLE)
5182  057d 4d            	tnz	a
5183  057e 2706          	jreq	L5642
5184                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5186  0580 721e5302      	bset	21250,#7
5188  0584 2004          	jra	L7642
5189  0586               L5642:
5190                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5192  0586 721f5302      	bres	21250,#7
5193  058a               L7642:
5194                     ; 1893 }
5197  058a 81            	ret
5251                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5251                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5251                     ; 1913                     uint8_t ExtTRGFilter)
5251                     ; 1914 {
5252                     	switch	.text
5253  058b               _TIM5_ETRConfig:
5255  058b 89            	pushw	x
5256       00000000      OFST:	set	0
5259                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5261                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5263                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5265                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5265                     ; 1922                          | (uint8_t)ExtTRGFilter);
5267  058c 9f            	ld	a,xl
5268  058d 1a01          	or	a,(OFST+1,sp)
5269  058f 1a05          	or	a,(OFST+5,sp)
5270  0591 ca5303        	or	a,21251
5271  0594 c75303        	ld	21251,a
5272                     ; 1923 }
5275  0597 85            	popw	x
5276  0598 81            	ret
5383                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5383                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5383                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5383                     ; 1961 {
5384                     	switch	.text
5385  0599               _TIM5_EncoderInterfaceConfig:
5387  0599 89            	pushw	x
5388  059a 5203          	subw	sp,#3
5389       00000003      OFST:	set	3
5392                     ; 1962   uint8_t tmpsmcr = 0;
5394                     ; 1963   uint8_t tmpccmr1 = 0;
5396                     ; 1964   uint8_t tmpccmr2 = 0;
5398                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5400                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5402                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5404                     ; 1971   tmpsmcr = TIM5->SMCR;
5406  059c c65302        	ld	a,21250
5407  059f 6b01          	ld	(OFST-2,sp),a
5409                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5411  05a1 c65309        	ld	a,21257
5412  05a4 6b02          	ld	(OFST-1,sp),a
5414                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5416  05a6 c6530a        	ld	a,21258
5417  05a9 6b03          	ld	(OFST+0,sp),a
5419                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5421  05ab 7b01          	ld	a,(OFST-2,sp)
5422  05ad a4f0          	and	a,#240
5423  05af 6b01          	ld	(OFST-2,sp),a
5425                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5427  05b1 9e            	ld	a,xh
5428  05b2 1a01          	or	a,(OFST-2,sp)
5429  05b4 6b01          	ld	(OFST-2,sp),a
5431                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5433  05b6 7b02          	ld	a,(OFST-1,sp)
5434  05b8 a4fc          	and	a,#252
5435  05ba 6b02          	ld	(OFST-1,sp),a
5437                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5439  05bc 7b03          	ld	a,(OFST+0,sp)
5440  05be a4fc          	and	a,#252
5441  05c0 6b03          	ld	(OFST+0,sp),a
5443                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5445  05c2 7b02          	ld	a,(OFST-1,sp)
5446  05c4 aa01          	or	a,#1
5447  05c6 6b02          	ld	(OFST-1,sp),a
5449                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5451  05c8 7b03          	ld	a,(OFST+0,sp)
5452  05ca aa01          	or	a,#1
5453  05cc 6b03          	ld	(OFST+0,sp),a
5455                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5457  05ce 9f            	ld	a,xl
5458  05cf a101          	cp	a,#1
5459  05d1 2606          	jrne	L3652
5460                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5462  05d3 7212530b      	bset	21259,#1
5464  05d7 2004          	jra	L5652
5465  05d9               L3652:
5466                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5468  05d9 7213530b      	bres	21259,#1
5469  05dd               L5652:
5470                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5472  05dd 7b08          	ld	a,(OFST+5,sp)
5473  05df a101          	cp	a,#1
5474  05e1 2606          	jrne	L7652
5475                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5477  05e3 721a530b      	bset	21259,#5
5479  05e7 2004          	jra	L1752
5480  05e9               L7652:
5481                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5483  05e9 721b530b      	bres	21259,#5
5484  05ed               L1752:
5485                     ; 2004   TIM5->SMCR = tmpsmcr;
5487  05ed 7b01          	ld	a,(OFST-2,sp)
5488  05ef c75302        	ld	21250,a
5489                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5491  05f2 7b02          	ld	a,(OFST-1,sp)
5492  05f4 c75309        	ld	21257,a
5493                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5495  05f7 7b03          	ld	a,(OFST+0,sp)
5496  05f9 c7530a        	ld	21258,a
5497                     ; 2007 }
5500  05fc 5b05          	addw	sp,#5
5501  05fe 81            	ret
5537                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5537                     ; 2016 {
5538                     	switch	.text
5539  05ff               _TIM5_SelectHallSensor:
5543                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5545                     ; 2021   if (NewState != DISABLE)
5547  05ff 4d            	tnz	a
5548  0600 2706          	jreq	L1162
5549                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5551  0602 721e5301      	bset	21249,#7
5553  0606 2004          	jra	L3162
5554  0608               L1162:
5555                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5557  0608 721f5301      	bres	21249,#7
5558  060c               L3162:
5559                     ; 2029 }
5562  060c 81            	ret
5628                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5628                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5628                     ; 2052                        uint8_t TIM5_ICFilter)
5628                     ; 2053 {
5629                     	switch	.text
5630  060d               L3_TI1_Config:
5632  060d 89            	pushw	x
5633  060e 89            	pushw	x
5634       00000002      OFST:	set	2
5637                     ; 2054   uint8_t tmpccmr1 = 0;
5639                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5641  060f 9e            	ld	a,xh
5642  0610 6b01          	ld	(OFST-1,sp),a
5644                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5646  0612 c65309        	ld	a,21257
5647  0615 6b02          	ld	(OFST+0,sp),a
5649                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5651                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5653                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5655                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5657  0617 7211530b      	bres	21259,#0
5658                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5660  061b 7b02          	ld	a,(OFST+0,sp)
5661  061d a40c          	and	a,#12
5662  061f 6b02          	ld	(OFST+0,sp),a
5664                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5666  0621 7b07          	ld	a,(OFST+5,sp)
5667  0623 97            	ld	xl,a
5668  0624 a610          	ld	a,#16
5669  0626 42            	mul	x,a
5670  0627 9f            	ld	a,xl
5671  0628 1a04          	or	a,(OFST+2,sp)
5672  062a 1a02          	or	a,(OFST+0,sp)
5673  062c 6b02          	ld	(OFST+0,sp),a
5675                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5677  062e 7b02          	ld	a,(OFST+0,sp)
5678  0630 c75309        	ld	21257,a
5679                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5681  0633 7b01          	ld	a,(OFST-1,sp)
5682  0635 a101          	cp	a,#1
5683  0637 2606          	jrne	L5462
5684                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5686  0639 7212530b      	bset	21259,#1
5688  063d 2004          	jra	L7462
5689  063f               L5462:
5690                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5692  063f 7213530b      	bres	21259,#1
5693  0643               L7462:
5694                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5696  0643 7210530b      	bset	21259,#0
5697                     ; 2084 }
5700  0647 5b04          	addw	sp,#4
5701  0649 81            	ret
5767                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5767                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5767                     ; 2103                        uint8_t TIM5_ICFilter)
5767                     ; 2104 {
5768                     	switch	.text
5769  064a               L5_TI2_Config:
5771  064a 89            	pushw	x
5772  064b 89            	pushw	x
5773       00000002      OFST:	set	2
5776                     ; 2105   uint8_t tmpccmr2 = 0;
5778                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5780  064c 9e            	ld	a,xh
5781  064d 6b01          	ld	(OFST-1,sp),a
5783                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5785                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5787                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5789                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5791  064f c6530a        	ld	a,21258
5792  0652 6b02          	ld	(OFST+0,sp),a
5794                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5796  0654 7219530b      	bres	21259,#4
5797                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5799  0658 7b02          	ld	a,(OFST+0,sp)
5800  065a a40c          	and	a,#12
5801  065c 6b02          	ld	(OFST+0,sp),a
5803                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5805  065e 7b07          	ld	a,(OFST+5,sp)
5806  0660 97            	ld	xl,a
5807  0661 a610          	ld	a,#16
5808  0663 42            	mul	x,a
5809  0664 9f            	ld	a,xl
5810  0665 1a04          	or	a,(OFST+2,sp)
5811  0667 1a02          	or	a,(OFST+0,sp)
5812  0669 6b02          	ld	(OFST+0,sp),a
5814                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5816  066b 7b02          	ld	a,(OFST+0,sp)
5817  066d c7530a        	ld	21258,a
5818                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5820  0670 7b01          	ld	a,(OFST-1,sp)
5821  0672 a101          	cp	a,#1
5822  0674 2606          	jrne	L1072
5823                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5825  0676 721a530b      	bset	21259,#5
5827  067a 2004          	jra	L3072
5828  067c               L1072:
5829                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5831  067c 721b530b      	bres	21259,#5
5832  0680               L3072:
5833                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5835  0680 7218530b      	bset	21259,#4
5836                     ; 2136 }
5839  0684 5b04          	addw	sp,#4
5840  0686 81            	ret
5853                     	xdef	_TIM5_SelectHallSensor
5854                     	xdef	_TIM5_EncoderInterfaceConfig
5855                     	xdef	_TIM5_ETRConfig
5856                     	xdef	_TIM5_SelectMasterSlaveMode
5857                     	xdef	_TIM5_SelectSlaveMode
5858                     	xdef	_TIM5_SelectOutputTrigger
5859                     	xdef	_TIM5_SelectInputTrigger
5860                     	xdef	_TIM5_ETRClockMode2Config
5861                     	xdef	_TIM5_ETRClockMode1Config
5862                     	xdef	_TIM5_TIxExternalClockConfig
5863                     	xdef	_TIM5_InternalClockConfig
5864                     	xdef	_TIM5_SelectCCDMA
5865                     	xdef	_TIM5_DMACmd
5866                     	xdef	_TIM5_ClearITPendingBit
5867                     	xdef	_TIM5_GetITStatus
5868                     	xdef	_TIM5_ClearFlag
5869                     	xdef	_TIM5_GetFlagStatus
5870                     	xdef	_TIM5_GenerateEvent
5871                     	xdef	_TIM5_ITConfig
5872                     	xdef	_TIM5_SetIC2Prescaler
5873                     	xdef	_TIM5_SetIC1Prescaler
5874                     	xdef	_TIM5_GetCapture2
5875                     	xdef	_TIM5_GetCapture1
5876                     	xdef	_TIM5_PWMIConfig
5877                     	xdef	_TIM5_ICInit
5878                     	xdef	_TIM5_CCxCmd
5879                     	xdef	_TIM5_OC2PolarityConfig
5880                     	xdef	_TIM5_OC1PolarityConfig
5881                     	xdef	_TIM5_OC2FastConfig
5882                     	xdef	_TIM5_OC1FastConfig
5883                     	xdef	_TIM5_OC2PreloadConfig
5884                     	xdef	_TIM5_OC1PreloadConfig
5885                     	xdef	_TIM5_ForcedOC2Config
5886                     	xdef	_TIM5_ForcedOC1Config
5887                     	xdef	_TIM5_SetCompare2
5888                     	xdef	_TIM5_SetCompare1
5889                     	xdef	_TIM5_SelectOCxM
5890                     	xdef	_TIM5_CtrlPWMOutputs
5891                     	xdef	_TIM5_BKRConfig
5892                     	xdef	_TIM5_OC2Init
5893                     	xdef	_TIM5_OC1Init
5894                     	xdef	_TIM5_Cmd
5895                     	xdef	_TIM5_SelectOnePulseMode
5896                     	xdef	_TIM5_ARRPreloadConfig
5897                     	xdef	_TIM5_UpdateRequestConfig
5898                     	xdef	_TIM5_UpdateDisableConfig
5899                     	xdef	_TIM5_GetPrescaler
5900                     	xdef	_TIM5_GetCounter
5901                     	xdef	_TIM5_SetAutoreload
5902                     	xdef	_TIM5_SetCounter
5903                     	xdef	_TIM5_CounterModeConfig
5904                     	xdef	_TIM5_PrescalerConfig
5905                     	xdef	_TIM5_TimeBaseInit
5906                     	xdef	_TIM5_DeInit
5925                     	end
