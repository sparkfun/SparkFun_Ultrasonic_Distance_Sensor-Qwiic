   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 119 void SYSCFG_RIDeInit(void)
  42                     ; 120 {
  44                     	switch	.text
  45  0000               _SYSCFG_RIDeInit:
  49                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  51  0000 725f5431      	clr	21553
  52                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  54  0004 725f5432      	clr	21554
  55                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  57  0008 725f5439      	clr	21561
  58                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  60  000c 725f543a      	clr	21562
  61                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  63  0010 725f543b      	clr	21563
  64                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  66  0014 725f5457      	clr	21591
  67                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  69  0018 725f543d      	clr	21565
  70                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  72  001c 725f543e      	clr	21566
  73                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  75  0020 725f543f      	clr	21567
  76                     ; 130 }
  79  0024 81            	ret
 338                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 338                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 338                     ; 144 {
 339                     	switch	.text
 340  0025               _SYSCFG_RITIMInputCaptureConfig:
 342  0025 89            	pushw	x
 343       00000000      OFST:	set	0
 346                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 348                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 350                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 352  0026 9e            	ld	a,xh
 353  0027 a102          	cp	a,#2
 354  0029 2606          	jrne	L531
 355                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 357  002b 9f            	ld	a,xl
 358  002c c75431        	ld	21553,a
 360  002f 2005          	jra	L731
 361  0031               L531:
 362                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 364  0031 7b02          	ld	a,(OFST+2,sp)
 365  0033 c75432        	ld	21554,a
 366  0036               L731:
 367                     ; 161 }
 370  0036 85            	popw	x
 371  0037 81            	ret
 549                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 549                     ; 185                                  FunctionalState NewState)
 549                     ; 186 {
 550                     	switch	.text
 551  0038               _SYSCFG_RIAnalogSwitchConfig:
 553  0038 89            	pushw	x
 554  0039 89            	pushw	x
 555       00000002      OFST:	set	2
 558                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 560                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 562                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 564                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 566  003a 9e            	ld	a,xh
 567  003b a4f0          	and	a,#240
 568  003d 6b01          	ld	(OFST-1,sp),a
 570                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 572  003f 7b03          	ld	a,(OFST+1,sp)
 573  0041 a40f          	and	a,#15
 574  0043 6b02          	ld	(OFST+0,sp),a
 576                     ; 199   if (NewState != DISABLE)
 578  0045 0d04          	tnz	(OFST+2,sp)
 579  0047 2730          	jreq	L532
 580                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 582  0049 7b01          	ld	a,(OFST-1,sp)
 583  004b a110          	cp	a,#16
 584  004d 2615          	jrne	L732
 585                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 587  004f 7b02          	ld	a,(OFST+0,sp)
 588  0051 5f            	clrw	x
 589  0052 97            	ld	xl,a
 590  0053 a601          	ld	a,#1
 591  0055 5d            	tnzw	x
 592  0056 2704          	jreq	L21
 593  0058               L41:
 594  0058 48            	sll	a
 595  0059 5a            	decw	x
 596  005a 26fc          	jrne	L41
 597  005c               L21:
 598  005c ca543d        	or	a,21565
 599  005f c7543d        	ld	21565,a
 601  0062 2045          	jra	L342
 602  0064               L732:
 603                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 605  0064 7b02          	ld	a,(OFST+0,sp)
 606  0066 5f            	clrw	x
 607  0067 97            	ld	xl,a
 608  0068 a601          	ld	a,#1
 609  006a 5d            	tnzw	x
 610  006b 2704          	jreq	L61
 611  006d               L02:
 612  006d 48            	sll	a
 613  006e 5a            	decw	x
 614  006f 26fc          	jrne	L02
 615  0071               L61:
 616  0071 ca543e        	or	a,21566
 617  0074 c7543e        	ld	21566,a
 618  0077 2030          	jra	L342
 619  0079               L532:
 620                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 622  0079 7b01          	ld	a,(OFST-1,sp)
 623  007b a110          	cp	a,#16
 624  007d 2616          	jrne	L542
 625                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 627  007f 7b02          	ld	a,(OFST+0,sp)
 628  0081 5f            	clrw	x
 629  0082 97            	ld	xl,a
 630  0083 a601          	ld	a,#1
 631  0085 5d            	tnzw	x
 632  0086 2704          	jreq	L22
 633  0088               L42:
 634  0088 48            	sll	a
 635  0089 5a            	decw	x
 636  008a 26fc          	jrne	L42
 637  008c               L22:
 638  008c 43            	cpl	a
 639  008d c4543d        	and	a,21565
 640  0090 c7543d        	ld	21565,a
 642  0093 2014          	jra	L342
 643  0095               L542:
 644                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 646  0095 7b02          	ld	a,(OFST+0,sp)
 647  0097 5f            	clrw	x
 648  0098 97            	ld	xl,a
 649  0099 a601          	ld	a,#1
 650  009b 5d            	tnzw	x
 651  009c 2704          	jreq	L62
 652  009e               L03:
 653  009e 48            	sll	a
 654  009f 5a            	decw	x
 655  00a0 26fc          	jrne	L03
 656  00a2               L62:
 657  00a2 43            	cpl	a
 658  00a3 c4543e        	and	a,21566
 659  00a6 c7543e        	ld	21566,a
 660  00a9               L342:
 661                     ; 225 }
 664  00a9 5b04          	addw	sp,#4
 665  00ab 81            	ret
 927                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 927                     ; 235                              FunctionalState NewState)
 927                     ; 236 {
 928                     	switch	.text
 929  00ac               _SYSCFG_RIIOSwitchConfig:
 931  00ac 89            	pushw	x
 932  00ad 89            	pushw	x
 933       00000002      OFST:	set	2
 936                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 938                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 940                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 942                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 944  00ae 9e            	ld	a,xh
 945  00af a40f          	and	a,#15
 946  00b1 6b02          	ld	(OFST+0,sp),a
 948                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 950  00b3 7b03          	ld	a,(OFST+1,sp)
 951  00b5 a4f0          	and	a,#240
 952  00b7 6b01          	ld	(OFST-1,sp),a
 954                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 956  00b9 7b01          	ld	a,(OFST-1,sp)
 957  00bb a110          	cp	a,#16
 958  00bd 2633          	jrne	L373
 959                     ; 252     if (NewState != DISABLE)
 961  00bf 0d04          	tnz	(OFST+2,sp)
 962  00c1 2717          	jreq	L573
 963                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 965  00c3 7b02          	ld	a,(OFST+0,sp)
 966  00c5 5f            	clrw	x
 967  00c6 97            	ld	xl,a
 968  00c7 a601          	ld	a,#1
 969  00c9 5d            	tnzw	x
 970  00ca 2704          	jreq	L43
 971  00cc               L63:
 972  00cc 48            	sll	a
 973  00cd 5a            	decw	x
 974  00ce 26fc          	jrne	L63
 975  00d0               L43:
 976  00d0 ca5439        	or	a,21561
 977  00d3 c75439        	ld	21561,a
 979  00d6 ac890189      	jpf	L104
 980  00da               L573:
 981                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 983  00da 7b02          	ld	a,(OFST+0,sp)
 984  00dc 5f            	clrw	x
 985  00dd 97            	ld	xl,a
 986  00de a601          	ld	a,#1
 987  00e0 5d            	tnzw	x
 988  00e1 2704          	jreq	L04
 989  00e3               L24:
 990  00e3 48            	sll	a
 991  00e4 5a            	decw	x
 992  00e5 26fc          	jrne	L24
 993  00e7               L04:
 994  00e7 43            	cpl	a
 995  00e8 c45439        	and	a,21561
 996  00eb c75439        	ld	21561,a
 997  00ee ac890189      	jpf	L104
 998  00f2               L373:
 999                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1001  00f2 7b01          	ld	a,(OFST-1,sp)
1002  00f4 a120          	cp	a,#32
1003  00f6 262f          	jrne	L304
1004                     ; 267     if (NewState != DISABLE)
1006  00f8 0d04          	tnz	(OFST+2,sp)
1007  00fa 2715          	jreq	L504
1008                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1010  00fc 7b02          	ld	a,(OFST+0,sp)
1011  00fe 5f            	clrw	x
1012  00ff 97            	ld	xl,a
1013  0100 a601          	ld	a,#1
1014  0102 5d            	tnzw	x
1015  0103 2704          	jreq	L44
1016  0105               L64:
1017  0105 48            	sll	a
1018  0106 5a            	decw	x
1019  0107 26fc          	jrne	L64
1020  0109               L44:
1021  0109 ca543a        	or	a,21562
1022  010c c7543a        	ld	21562,a
1024  010f 2078          	jra	L104
1025  0111               L504:
1026                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1028  0111 7b02          	ld	a,(OFST+0,sp)
1029  0113 5f            	clrw	x
1030  0114 97            	ld	xl,a
1031  0115 a601          	ld	a,#1
1032  0117 5d            	tnzw	x
1033  0118 2704          	jreq	L05
1034  011a               L25:
1035  011a 48            	sll	a
1036  011b 5a            	decw	x
1037  011c 26fc          	jrne	L25
1038  011e               L05:
1039  011e 43            	cpl	a
1040  011f c4543a        	and	a,21562
1041  0122 c7543a        	ld	21562,a
1042  0125 2062          	jra	L104
1043  0127               L304:
1044                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1046  0127 7b01          	ld	a,(OFST-1,sp)
1047  0129 a130          	cp	a,#48
1048  012b 262f          	jrne	L314
1049                     ; 282     if (NewState != DISABLE)
1051  012d 0d04          	tnz	(OFST+2,sp)
1052  012f 2715          	jreq	L514
1053                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1055  0131 7b02          	ld	a,(OFST+0,sp)
1056  0133 5f            	clrw	x
1057  0134 97            	ld	xl,a
1058  0135 a601          	ld	a,#1
1059  0137 5d            	tnzw	x
1060  0138 2704          	jreq	L45
1061  013a               L65:
1062  013a 48            	sll	a
1063  013b 5a            	decw	x
1064  013c 26fc          	jrne	L65
1065  013e               L45:
1066  013e ca543b        	or	a,21563
1067  0141 c7543b        	ld	21563,a
1069  0144 2043          	jra	L104
1070  0146               L514:
1071                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1073  0146 7b02          	ld	a,(OFST+0,sp)
1074  0148 5f            	clrw	x
1075  0149 97            	ld	xl,a
1076  014a a601          	ld	a,#1
1077  014c 5d            	tnzw	x
1078  014d 2704          	jreq	L06
1079  014f               L26:
1080  014f 48            	sll	a
1081  0150 5a            	decw	x
1082  0151 26fc          	jrne	L26
1083  0153               L06:
1084  0153 43            	cpl	a
1085  0154 c4543b        	and	a,21563
1086  0157 c7543b        	ld	21563,a
1087  015a 202d          	jra	L104
1088  015c               L314:
1089                     ; 297     if (NewState != DISABLE)
1091  015c 0d04          	tnz	(OFST+2,sp)
1092  015e 2715          	jreq	L324
1093                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1095  0160 7b02          	ld	a,(OFST+0,sp)
1096  0162 5f            	clrw	x
1097  0163 97            	ld	xl,a
1098  0164 a601          	ld	a,#1
1099  0166 5d            	tnzw	x
1100  0167 2704          	jreq	L46
1101  0169               L66:
1102  0169 48            	sll	a
1103  016a 5a            	decw	x
1104  016b 26fc          	jrne	L66
1105  016d               L46:
1106  016d ca5457        	or	a,21591
1107  0170 c75457        	ld	21591,a
1109  0173 2014          	jra	L104
1110  0175               L324:
1111                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1113  0175 7b02          	ld	a,(OFST+0,sp)
1114  0177 5f            	clrw	x
1115  0178 97            	ld	xl,a
1116  0179 a601          	ld	a,#1
1117  017b 5d            	tnzw	x
1118  017c 2704          	jreq	L07
1119  017e               L27:
1120  017e 48            	sll	a
1121  017f 5a            	decw	x
1122  0180 26fc          	jrne	L27
1123  0182               L07:
1124  0182 43            	cpl	a
1125  0183 c45457        	and	a,21591
1126  0186 c75457        	ld	21591,a
1127  0189               L104:
1128                     ; 308 }
1131  0189 5b04          	addw	sp,#4
1132  018b 81            	ret
1212                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1212                     ; 321 {
1213                     	switch	.text
1214  018c               _SYSCFG_RIResistorConfig:
1216  018c 89            	pushw	x
1217       00000000      OFST:	set	0
1220                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1222                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1224                     ; 326   if (NewState != DISABLE)
1226  018d 9f            	ld	a,xl
1227  018e 4d            	tnz	a
1228  018f 2709          	jreq	L564
1229                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1231  0191 9e            	ld	a,xh
1232  0192 ca543f        	or	a,21567
1233  0195 c7543f        	ld	21567,a
1235  0198 2009          	jra	L764
1236  019a               L564:
1237                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1239  019a 7b01          	ld	a,(OFST+1,sp)
1240  019c 43            	cpl	a
1241  019d c4543f        	and	a,21567
1242  01a0 c7543f        	ld	21567,a
1243  01a3               L764:
1244                     ; 336 }
1247  01a3 85            	popw	x
1248  01a4 81            	ret
1271                     ; 368 void SYSCFG_REMAPDeInit(void)
1271                     ; 369 {
1272                     	switch	.text
1273  01a5               _SYSCFG_REMAPDeInit:
1277                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1279  01a5 350c509e      	mov	20638,#12
1280                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1282  01a9 725f509f      	clr	20639
1283                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1285  01ad 725f509d      	clr	20637
1286                     ; 378 }
1289  01b1 81            	ret
1505                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1505                     ; 412 {
1506                     	switch	.text
1507  01b2               _SYSCFG_REMAPPinConfig:
1509  01b2 89            	pushw	x
1510  01b3 88            	push	a
1511       00000001      OFST:	set	1
1514                     ; 413   uint8_t regindex = 0;
1516                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1518                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1520                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1522  01b4 9e            	ld	a,xh
1523  01b5 6b01          	ld	(OFST+0,sp),a
1525                     ; 422   if (regindex == 0x01)
1527  01b7 7b01          	ld	a,(OFST+0,sp)
1528  01b9 a101          	cp	a,#1
1529  01bb 261e          	jrne	L106
1530                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1532  01bd 9f            	ld	a,xl
1533  01be 97            	ld	xl,a
1534  01bf a610          	ld	a,#16
1535  01c1 42            	mul	x,a
1536  01c2 9f            	ld	a,xl
1537  01c3 aa0f          	or	a,#15
1538  01c5 c4509e        	and	a,20638
1539  01c8 c7509e        	ld	20638,a
1540                     ; 425     if (NewState != DISABLE)
1542  01cb 0d06          	tnz	(OFST+5,sp)
1543  01cd 2742          	jreq	L506
1544                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1546  01cf 7b03          	ld	a,(OFST+2,sp)
1547  01d1 a4f0          	and	a,#240
1548  01d3 ca509e        	or	a,20638
1549  01d6 c7509e        	ld	20638,a
1550  01d9 2036          	jra	L506
1551  01db               L106:
1552                     ; 431   else if (regindex == 0x02)
1554  01db 7b01          	ld	a,(OFST+0,sp)
1555  01dd a102          	cp	a,#2
1556  01df 2619          	jrne	L706
1557                     ; 433     if (NewState != DISABLE)
1559  01e1 0d06          	tnz	(OFST+5,sp)
1560  01e3 270a          	jreq	L116
1561                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1563  01e5 c6509f        	ld	a,20639
1564  01e8 1a03          	or	a,(OFST+2,sp)
1565  01ea c7509f        	ld	20639,a
1567  01ed 2022          	jra	L506
1568  01ef               L116:
1569                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1571  01ef 7b03          	ld	a,(OFST+2,sp)
1572  01f1 43            	cpl	a
1573  01f2 c4509f        	and	a,20639
1574  01f5 c7509f        	ld	20639,a
1575  01f8 2017          	jra	L506
1576  01fa               L706:
1577                     ; 445     if (NewState != DISABLE)
1579  01fa 0d06          	tnz	(OFST+5,sp)
1580  01fc 270a          	jreq	L716
1581                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1583  01fe c6509d        	ld	a,20637
1584  0201 1a03          	or	a,(OFST+2,sp)
1585  0203 c7509d        	ld	20637,a
1587  0206 2009          	jra	L506
1588  0208               L716:
1589                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1591  0208 7b03          	ld	a,(OFST+2,sp)
1592  020a 43            	cpl	a
1593  020b c4509d        	and	a,20637
1594  020e c7509d        	ld	20637,a
1595  0211               L506:
1596                     ; 454 }
1599  0211 5b03          	addw	sp,#3
1600  0213 81            	ret
1706                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1706                     ; 471 {
1707                     	switch	.text
1708  0214               _SYSCFG_REMAPDMAChannelConfig:
1710  0214 88            	push	a
1711       00000000      OFST:	set	0
1714                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1716                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1718  0215 a5f0          	bcp	a,#240
1719  0217 270a          	jreq	L566
1720                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1722  0219 c6509e        	ld	a,20638
1723  021c a4f3          	and	a,#243
1724  021e c7509e        	ld	20638,a
1726  0221 2008          	jra	L766
1727  0223               L566:
1728                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1730  0223 c6509e        	ld	a,20638
1731  0226 a4fc          	and	a,#252
1732  0228 c7509e        	ld	20638,a
1733  022b               L766:
1734                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1736  022b 7b01          	ld	a,(OFST+1,sp)
1737  022d a40f          	and	a,#15
1738  022f ca509e        	or	a,20638
1739  0232 c7509e        	ld	20638,a
1740                     ; 489 }
1743  0235 84            	pop	a
1744  0236 81            	ret
1757                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1758                     	xdef	_SYSCFG_REMAPPinConfig
1759                     	xdef	_SYSCFG_REMAPDeInit
1760                     	xdef	_SYSCFG_RIResistorConfig
1761                     	xdef	_SYSCFG_RIIOSwitchConfig
1762                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1763                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1764                     	xdef	_SYSCFG_RIDeInit
1783                     	end
