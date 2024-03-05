   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 111 void COMP_DeInit(void)
  42                     ; 112 {
  44                     	switch	.text
  45  0000               _COMP_DeInit:
  49                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  51  0000 725f5440      	clr	21568
  52                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  54  0004 725f5441      	clr	21569
  55                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  57  0008 35c05442      	mov	21570,#192
  58                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  60  000c 725f5443      	clr	21571
  61                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  63  0010 725f5444      	clr	21572
  64                     ; 127 }
  67  0014 81            	ret
 243                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 243                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 243                     ; 155 {
 244                     	switch	.text
 245  0015               _COMP_Init:
 247  0015 89            	pushw	x
 248       00000000      OFST:	set	0
 251                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 253                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 255                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 257                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 259  0016 c65442        	ld	a,21570
 260  0019 a4c7          	and	a,#199
 261  001b c75442        	ld	21570,a
 262                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 264  001e 9e            	ld	a,xh
 265  001f ca5442        	or	a,21570
 266  0022 c75442        	ld	21570,a
 267                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 269  0025 c65442        	ld	a,21570
 270  0028 a43f          	and	a,#63
 271  002a c75442        	ld	21570,a
 272                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 274  002d 9f            	ld	a,xl
 275  002e ca5442        	or	a,21570
 276  0031 c75442        	ld	21570,a
 277                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 279  0034 72155441      	bres	21569,#2
 280                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 282  0038 c65441        	ld	a,21569
 283  003b 1a05          	or	a,(OFST+5,sp)
 284  003d c75441        	ld	21569,a
 285                     ; 175 }
 288  0040 85            	popw	x
 289  0041 81            	ret
 345                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 345                     ; 184 {
 346                     	switch	.text
 347  0042               _COMP_VrefintToCOMP1Connect:
 351                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 353                     ; 188   if (NewState != DISABLE)
 355  0042 4d            	tnz	a
 356  0043 2706          	jreq	L341
 357                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 359  0045 72145442      	bset	21570,#2
 361  0049 2004          	jra	L541
 362  004b               L341:
 363                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 365  004b 72155442      	bres	21570,#2
 366  004f               L541:
 367                     ; 198 }
 370  004f 81            	ret
 465                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 465                     ; 213 {
 466                     	switch	.text
 467  0050               _COMP_EdgeConfig:
 469  0050 89            	pushw	x
 470       00000000      OFST:	set	0
 473                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 475                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 477                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 479  0051 9e            	ld	a,xh
 480  0052 a101          	cp	a,#1
 481  0054 2611          	jrne	L312
 482                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 484  0056 c65440        	ld	a,21568
 485  0059 a4fc          	and	a,#252
 486  005b c75440        	ld	21568,a
 487                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 489  005e 9f            	ld	a,xl
 490  005f ca5440        	or	a,21568
 491  0062 c75440        	ld	21568,a
 493  0065 2010          	jra	L512
 494  0067               L312:
 495                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 497  0067 c65441        	ld	a,21569
 498  006a a4fc          	and	a,#252
 499  006c c75441        	ld	21569,a
 500                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 502  006f c65441        	ld	a,21569
 503  0072 1a02          	or	a,(OFST+2,sp)
 504  0074 c75441        	ld	21569,a
 505  0077               L512:
 506                     ; 236 }
 509  0077 85            	popw	x
 510  0078 81            	ret
 576                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 576                     ; 252 {
 577                     	switch	.text
 578  0079               _COMP_GetOutputLevel:
 580  0079 88            	push	a
 581       00000001      OFST:	set	1
 584                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 586                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 588  007a a101          	cp	a,#1
 589  007c 2611          	jrne	L742
 590                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 592  007e c65440        	ld	a,21568
 593  0081 a508          	bcp	a,#8
 594  0083 2706          	jreq	L152
 595                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 597  0085 a601          	ld	a,#1
 598  0087 6b01          	ld	(OFST+0,sp),a
 601  0089 2013          	jra	L552
 602  008b               L152:
 603                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 605  008b 0f01          	clr	(OFST+0,sp)
 607  008d 200f          	jra	L552
 608  008f               L742:
 609                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 611  008f c65441        	ld	a,21569
 612  0092 a508          	bcp	a,#8
 613  0094 2706          	jreq	L752
 614                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 616  0096 a601          	ld	a,#1
 617  0098 6b01          	ld	(OFST+0,sp),a
 620  009a 2002          	jra	L552
 621  009c               L752:
 622                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 624  009c 0f01          	clr	(OFST+0,sp)
 626  009e               L552:
 627                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 629  009e 7b01          	ld	a,(OFST+0,sp)
 632  00a0 5b01          	addw	sp,#1
 633  00a2 81            	ret
 668                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 668                     ; 325 {
 669                     	switch	.text
 670  00a3               _COMP_WindowCmd:
 674                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 676                     ; 329   if (NewState != DISABLE)
 678  00a3 4d            	tnz	a
 679  00a4 2706          	jreq	L103
 680                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 682  00a6 72125442      	bset	21570,#1
 684  00aa 2004          	jra	L303
 685  00ac               L103:
 686                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 688  00ac 72135442      	bres	21570,#1
 689  00b0               L303:
 690                     ; 339 }
 693  00b0 81            	ret
 729                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 729                     ; 363 {
 730                     	switch	.text
 731  00b1               _COMP_VrefintOutputCmd:
 735                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 737                     ; 367   if (NewState != DISABLE)
 739  00b1 4d            	tnz	a
 740  00b2 2706          	jreq	L323
 741                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 743  00b4 72105442      	bset	21570,#0
 745  00b8 2004          	jra	L523
 746  00ba               L323:
 747                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 749  00ba 72115442      	bres	21570,#0
 750  00be               L523:
 751                     ; 377 }
 754  00be 81            	ret
 790                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 790                     ; 402 {
 791                     	switch	.text
 792  00bf               _COMP_SchmittTriggerCmd:
 796                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 798                     ; 406   if (NewState != DISABLE)
 800  00bf 4d            	tnz	a
 801  00c0 2706          	jreq	L543
 802                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 804  00c2 72145440      	bset	21568,#2
 806  00c6 2004          	jra	L743
 807  00c8               L543:
 808                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 810  00c8 72155440      	bres	21568,#2
 811  00cc               L743:
 812                     ; 416 }
 815  00cc 81            	ret
 935                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 935                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 935                     ; 437                         FunctionalState NewState)
 935                     ; 438 {
 936                     	switch	.text
 937  00cd               _COMP_TriggerConfig:
 939  00cd 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 945                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 947                     ; 443   switch (COMP_TriggerGroup)
 949  00ce 9e            	ld	a,xh
 951                     ; 490     default:
 951                     ; 491       break;
 952  00cf 4a            	dec	a
 953  00d0 270b          	jreq	L153
 954  00d2 4a            	dec	a
 955  00d3 2721          	jreq	L353
 956  00d5 4a            	dec	a
 957  00d6 273d          	jreq	L553
 958  00d8 4a            	dec	a
 959  00d9 2753          	jreq	L753
 960  00db 206e          	jra	L144
 961  00dd               L153:
 962                     ; 445     case COMP_TriggerGroup_InvertingInput:
 962                     ; 446 
 962                     ; 447       if (NewState != DISABLE)
 964  00dd 0d05          	tnz	(OFST+5,sp)
 965  00df 270b          	jreq	L344
 966                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 968  00e1 7b02          	ld	a,(OFST+2,sp)
 969  00e3 43            	cpl	a
 970  00e4 c45443        	and	a,21571
 971  00e7 c75443        	ld	21571,a
 973  00ea 205f          	jra	L144
 974  00ec               L344:
 975                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 977  00ec c65443        	ld	a,21571
 978  00ef 1a02          	or	a,(OFST+2,sp)
 979  00f1 c75443        	ld	21571,a
 980  00f4 2055          	jra	L144
 981  00f6               L353:
 982                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 982                     ; 458       if (NewState != DISABLE)
 984  00f6 0d05          	tnz	(OFST+5,sp)
 985  00f8 270e          	jreq	L744
 986                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 988  00fa 7b02          	ld	a,(OFST+2,sp)
 989  00fc 48            	sll	a
 990  00fd 48            	sll	a
 991  00fe 48            	sll	a
 992  00ff 43            	cpl	a
 993  0100 c45443        	and	a,21571
 994  0103 c75443        	ld	21571,a
 996  0106 2043          	jra	L144
 997  0108               L744:
 998                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1000  0108 7b02          	ld	a,(OFST+2,sp)
1001  010a 48            	sll	a
1002  010b 48            	sll	a
1003  010c 48            	sll	a
1004  010d ca5443        	or	a,21571
1005  0110 c75443        	ld	21571,a
1006  0113 2036          	jra	L144
1007  0115               L553:
1008                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1008                     ; 469       if (NewState != DISABLE)
1010  0115 0d05          	tnz	(OFST+5,sp)
1011  0117 270b          	jreq	L354
1012                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1014  0119 7b02          	ld	a,(OFST+2,sp)
1015  011b 43            	cpl	a
1016  011c c45444        	and	a,21572
1017  011f c75444        	ld	21572,a
1019  0122 2027          	jra	L144
1020  0124               L354:
1021                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1023  0124 c65444        	ld	a,21572
1024  0127 1a02          	or	a,(OFST+2,sp)
1025  0129 c75444        	ld	21572,a
1026  012c 201d          	jra	L144
1027  012e               L753:
1028                     ; 479     case COMP_TriggerGroup_DACOutput:
1028                     ; 480       if (NewState != DISABLE)
1030  012e 0d05          	tnz	(OFST+5,sp)
1031  0130 270e          	jreq	L754
1032                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1034  0132 7b02          	ld	a,(OFST+2,sp)
1035  0134 48            	sll	a
1036  0135 48            	sll	a
1037  0136 48            	sll	a
1038  0137 43            	cpl	a
1039  0138 c45444        	and	a,21572
1040  013b c75444        	ld	21572,a
1042  013e 200b          	jra	L144
1043  0140               L754:
1044                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1046  0140 7b02          	ld	a,(OFST+2,sp)
1047  0142 48            	sll	a
1048  0143 48            	sll	a
1049  0144 48            	sll	a
1050  0145 ca5444        	or	a,21572
1051  0148 c75444        	ld	21572,a
1052  014b               L163:
1053                     ; 490     default:
1053                     ; 491       break;
1055  014b               L144:
1056                     ; 493 }
1059  014b 85            	popw	x
1060  014c 81            	ret
1105                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1105                     ; 522 {
1106                     	switch	.text
1107  014d               _COMP_ITConfig:
1109  014d 89            	pushw	x
1110       00000000      OFST:	set	0
1113                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1115                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1117                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1119  014e 9e            	ld	a,xh
1120  014f a101          	cp	a,#1
1121  0151 2610          	jrne	L505
1122                     ; 530     if (NewState != DISABLE)
1124  0153 9f            	ld	a,xl
1125  0154 4d            	tnz	a
1126  0155 2706          	jreq	L705
1127                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1129  0157 721a5440      	bset	21568,#5
1131  015b 2014          	jra	L315
1132  015d               L705:
1133                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1135  015d 721b5440      	bres	21568,#5
1136  0161 200e          	jra	L315
1137  0163               L505:
1138                     ; 543     if (NewState != DISABLE)
1140  0163 0d02          	tnz	(OFST+2,sp)
1141  0165 2706          	jreq	L515
1142                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1144  0167 721a5441      	bset	21569,#5
1146  016b 2004          	jra	L315
1147  016d               L515:
1148                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1150  016d 721b5441      	bres	21569,#5
1151  0171               L315:
1152                     ; 554 }
1155  0171 85            	popw	x
1156  0172 81            	ret
1222                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1222                     ; 565 {
1223                     	switch	.text
1224  0173               _COMP_GetFlagStatus:
1226  0173 88            	push	a
1227       00000001      OFST:	set	1
1230                     ; 566   FlagStatus bitstatus = RESET;
1232                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1234                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1236  0174 a101          	cp	a,#1
1237  0176 2611          	jrne	L355
1238                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1240  0178 c65440        	ld	a,21568
1241  017b a510          	bcp	a,#16
1242  017d 2706          	jreq	L555
1243                     ; 577       bitstatus = SET;
1245  017f a601          	ld	a,#1
1246  0181 6b01          	ld	(OFST+0,sp),a
1249  0183 2013          	jra	L165
1250  0185               L555:
1251                     ; 582       bitstatus = RESET;
1253  0185 0f01          	clr	(OFST+0,sp)
1255  0187 200f          	jra	L165
1256  0189               L355:
1257                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1259  0189 c65441        	ld	a,21569
1260  018c a510          	bcp	a,#16
1261  018e 2706          	jreq	L365
1262                     ; 590       bitstatus = SET;
1264  0190 a601          	ld	a,#1
1265  0192 6b01          	ld	(OFST+0,sp),a
1268  0194 2002          	jra	L165
1269  0196               L365:
1270                     ; 595       bitstatus = RESET;
1272  0196 0f01          	clr	(OFST+0,sp)
1274  0198               L165:
1275                     ; 600   return (FlagStatus)(bitstatus);
1277  0198 7b01          	ld	a,(OFST+0,sp)
1280  019a 5b01          	addw	sp,#1
1281  019c 81            	ret
1316                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1316                     ; 612 {
1317                     	switch	.text
1318  019d               _COMP_ClearFlag:
1322                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1324                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1326  019d a101          	cp	a,#1
1327  019f 2606          	jrne	L506
1328                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1330  01a1 72195440      	bres	21568,#4
1332  01a5 2004          	jra	L706
1333  01a7               L506:
1334                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1336  01a7 72195441      	bres	21569,#4
1337  01ab               L706:
1338                     ; 626 }
1341  01ab 81            	ret
1401                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1401                     ; 637 {
1402                     	switch	.text
1403  01ac               _COMP_GetITStatus:
1405  01ac 89            	pushw	x
1406       00000002      OFST:	set	2
1409                     ; 638   ITStatus bitstatus = RESET;
1411                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1415                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1417                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1419  01ad a101          	cp	a,#1
1420  01af 2620          	jrne	L736
1421                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1423  01b1 c65440        	ld	a,21568
1424  01b4 a410          	and	a,#16
1425  01b6 6b01          	ld	(OFST-1,sp),a
1427                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1429  01b8 c65440        	ld	a,21568
1430  01bb a420          	and	a,#32
1431  01bd 6b02          	ld	(OFST+0,sp),a
1433                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1435  01bf 0d01          	tnz	(OFST-1,sp)
1436  01c1 270a          	jreq	L146
1438  01c3 0d02          	tnz	(OFST+0,sp)
1439  01c5 2706          	jreq	L146
1440                     ; 655       bitstatus = SET;
1442  01c7 a601          	ld	a,#1
1443  01c9 6b02          	ld	(OFST+0,sp),a
1446  01cb 2022          	jra	L546
1447  01cd               L146:
1448                     ; 660       bitstatus = RESET;
1450  01cd 0f02          	clr	(OFST+0,sp)
1452  01cf 201e          	jra	L546
1453  01d1               L736:
1454                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1456  01d1 c65441        	ld	a,21569
1457  01d4 a410          	and	a,#16
1458  01d6 6b01          	ld	(OFST-1,sp),a
1460                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1462  01d8 c65441        	ld	a,21569
1463  01db a420          	and	a,#32
1464  01dd 6b02          	ld	(OFST+0,sp),a
1466                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1468  01df 0d01          	tnz	(OFST-1,sp)
1469  01e1 270a          	jreq	L746
1471  01e3 0d02          	tnz	(OFST+0,sp)
1472  01e5 2706          	jreq	L746
1473                     ; 674       bitstatus = SET;
1475  01e7 a601          	ld	a,#1
1476  01e9 6b02          	ld	(OFST+0,sp),a
1479  01eb 2002          	jra	L546
1480  01ed               L746:
1481                     ; 679       bitstatus = RESET;
1483  01ed 0f02          	clr	(OFST+0,sp)
1485  01ef               L546:
1486                     ; 684   return (ITStatus) bitstatus;
1488  01ef 7b02          	ld	a,(OFST+0,sp)
1491  01f1 85            	popw	x
1492  01f2 81            	ret
1528                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1528                     ; 696 {
1529                     	switch	.text
1530  01f3               _COMP_ClearITPendingBit:
1534                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1536                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1538  01f3 a101          	cp	a,#1
1539  01f5 2606          	jrne	L176
1540                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1542  01f7 72195440      	bres	21568,#4
1544  01fb 2004          	jra	L376
1545  01fd               L176:
1546                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1548  01fd 72195441      	bres	21569,#4
1549  0201               L376:
1550                     ; 710 }
1553  0201 81            	ret
1566                     	xdef	_COMP_ClearITPendingBit
1567                     	xdef	_COMP_GetITStatus
1568                     	xdef	_COMP_ClearFlag
1569                     	xdef	_COMP_GetFlagStatus
1570                     	xdef	_COMP_ITConfig
1571                     	xdef	_COMP_TriggerConfig
1572                     	xdef	_COMP_SchmittTriggerCmd
1573                     	xdef	_COMP_VrefintOutputCmd
1574                     	xdef	_COMP_WindowCmd
1575                     	xdef	_COMP_GetOutputLevel
1576                     	xdef	_COMP_EdgeConfig
1577                     	xdef	_COMP_VrefintToCOMP1Connect
1578                     	xdef	_COMP_Init
1579                     	xdef	_COMP_DeInit
1598                     	end
