   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 142 void DAC_DeInit(void)
  42                     ; 143 {
  44                     	switch	.text
  45  0000               _DAC_DeInit:
  49                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  51  0000 725f5380      	clr	21376
  52                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  54  0004 725f5381      	clr	21377
  55                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  57  0008 725f5382      	clr	21378
  58                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  60  000c 725f5383      	clr	21379
  61                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  63  0010 725f5384      	clr	21380
  64                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  66  0014 35ff5385      	mov	21381,#255
  67                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  69  0018 725f5388      	clr	21384
  70                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  72  001c 725f5389      	clr	21385
  73                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  75  0020 725f538c      	clr	21388
  76                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  78  0024 725f538d      	clr	21389
  79                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  81  0028 725f5390      	clr	21392
  82                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  84  002c 725f5394      	clr	21396
  85                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  87  0030 725f5395      	clr	21397
  88                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  90  0034 725f5398      	clr	21400
  91                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  93  0038 725f5399      	clr	21401
  94                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  96  003c 725f539c      	clr	21404
  97                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  99  0040 725f53a0      	clr	21408
 100                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 102  0044 725f53a1      	clr	21409
 103                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 105  0048 725f53a2      	clr	21410
 106                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 108  004c 725f53a3      	clr	21411
 109                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 111  0050 725f53a4      	clr	21412
 112                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 114  0054 725f53a5      	clr	21413
 115                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 117  0058 725f53a6      	clr	21414
 118                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 120  005c 725f53a7      	clr	21415
 121                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 123  0060 725f53a8      	clr	21416
 124                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 126  0064 725f53a9      	clr	21417
 127                     ; 187 }
 130  0068 81            	ret
 285                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 285                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 285                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 285                     ; 211 {
 286                     	switch	.text
 287  0069               _DAC_Init:
 289  0069 89            	pushw	x
 290  006a 5203          	subw	sp,#3
 291       00000003      OFST:	set	3
 294                     ; 212   uint8_t tmpreg = 0;
 296                     ; 213   uint16_t tmpreg2 = 0;
 298                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 300                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 302                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 304                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 306  006c 9e            	ld	a,xh
 307  006d 48            	sll	a
 308  006e 5f            	clrw	x
 309  006f 97            	ld	xl,a
 310  0070 1f01          	ldw	(OFST-2,sp),x
 312                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 314  0072 1e01          	ldw	x,(OFST-2,sp)
 315  0074 d65380        	ld	a,(21376,x)
 316  0077 6b03          	ld	(OFST+0,sp),a
 318                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 320  0079 7b03          	ld	a,(OFST+0,sp)
 321  007b a4c1          	and	a,#193
 322  007d 6b03          	ld	(OFST+0,sp),a
 324                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 326  007f 7b03          	ld	a,(OFST+0,sp)
 327  0081 1a08          	or	a,(OFST+5,sp)
 328  0083 6b03          	ld	(OFST+0,sp),a
 330                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 332  0085 7b05          	ld	a,(OFST+2,sp)
 333  0087 a130          	cp	a,#48
 334  0089 2708          	jreq	L111
 335                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 337  008b 7b05          	ld	a,(OFST+2,sp)
 338  008d aa04          	or	a,#4
 339  008f 1a03          	or	a,(OFST+0,sp)
 340  0091 6b03          	ld	(OFST+0,sp),a
 342  0093               L111:
 343                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 345  0093 7b03          	ld	a,(OFST+0,sp)
 346  0095 1e01          	ldw	x,(OFST-2,sp)
 347  0097 d75380        	ld	(21376,x),a
 348                     ; 240 }
 351  009a 5b05          	addw	sp,#5
 352  009c 81            	ret
 424                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 424                     ; 255 {
 425                     	switch	.text
 426  009d               _DAC_Cmd:
 428  009d 89            	pushw	x
 429  009e 89            	pushw	x
 430       00000002      OFST:	set	2
 433                     ; 256   uint16_t cr1addr = 0;
 435                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 437                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 439                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 441  009f 9e            	ld	a,xh
 442  00a0 48            	sll	a
 443  00a1 5f            	clrw	x
 444  00a2 97            	ld	xl,a
 445  00a3 1c5380        	addw	x,#21376
 446  00a6 1f01          	ldw	(OFST-1,sp),x
 448                     ; 264   if (NewState != DISABLE)
 450  00a8 0d04          	tnz	(OFST+2,sp)
 451  00aa 2708          	jreq	L741
 452                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 454  00ac 1e01          	ldw	x,(OFST-1,sp)
 455  00ae f6            	ld	a,(x)
 456  00af aa01          	or	a,#1
 457  00b1 f7            	ld	(x),a
 459  00b2 2006          	jra	L151
 460  00b4               L741:
 461                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 463  00b4 1e01          	ldw	x,(OFST-1,sp)
 464  00b6 f6            	ld	a,(x)
 465  00b7 a4fe          	and	a,#254
 466  00b9 f7            	ld	(x),a
 467  00ba               L151:
 468                     ; 274 }
 471  00ba 5b04          	addw	sp,#4
 472  00bc 81            	ret
 518                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 518                     ; 287 {
 519                     	switch	.text
 520  00bd               _DAC_SoftwareTriggerCmd:
 522  00bd 89            	pushw	x
 523       00000000      OFST:	set	0
 526                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 528                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 530                     ; 292   if (NewState != DISABLE)
 532  00be 9f            	ld	a,xl
 533  00bf 4d            	tnz	a
 534  00c0 2714          	jreq	L571
 535                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 537  00c2 9e            	ld	a,xh
 538  00c3 5f            	clrw	x
 539  00c4 97            	ld	xl,a
 540  00c5 a601          	ld	a,#1
 541  00c7 5d            	tnzw	x
 542  00c8 2704          	jreq	L41
 543  00ca               L61:
 544  00ca 48            	sll	a
 545  00cb 5a            	decw	x
 546  00cc 26fc          	jrne	L61
 547  00ce               L41:
 548  00ce ca5384        	or	a,21380
 549  00d1 c75384        	ld	21380,a
 551  00d4 2014          	jra	L771
 552  00d6               L571:
 553                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 555  00d6 7b01          	ld	a,(OFST+1,sp)
 556  00d8 5f            	clrw	x
 557  00d9 97            	ld	xl,a
 558  00da a601          	ld	a,#1
 559  00dc 5d            	tnzw	x
 560  00dd 2704          	jreq	L02
 561  00df               L22:
 562  00df 48            	sll	a
 563  00e0 5a            	decw	x
 564  00e1 26fc          	jrne	L22
 565  00e3               L02:
 566  00e3 43            	cpl	a
 567  00e4 c45384        	and	a,21380
 568  00e7 c75384        	ld	21380,a
 569  00ea               L771:
 570                     ; 302 }
 573  00ea 85            	popw	x
 574  00eb 81            	ret
 610                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 610                     ; 312 {
 611                     	switch	.text
 612  00ec               _DAC_DualSoftwareTriggerCmd:
 616                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 618                     ; 316   if (NewState != DISABLE)
 620  00ec 4d            	tnz	a
 621  00ed 270a          	jreq	L712
 622                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 624  00ef c65384        	ld	a,21380
 625  00f2 aa03          	or	a,#3
 626  00f4 c75384        	ld	21380,a
 628  00f7 2008          	jra	L122
 629  00f9               L712:
 630                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 632  00f9 c65384        	ld	a,21380
 633  00fc a4fc          	and	a,#252
 634  00fe c75384        	ld	21380,a
 635  0101               L122:
 636                     ; 326 }
 639  0101 81            	ret
 722                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 722                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 722                     ; 344                            FunctionalState NewState)
 722                     ; 345 {
 723                     	switch	.text
 724  0102               _DAC_WaveGenerationCmd:
 726  0102 89            	pushw	x
 727  0103 88            	push	a
 728       00000001      OFST:	set	1
 731                     ; 346   uint8_t tmpreg = 0;
 733                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 735                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 737                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 739                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 741  0104 9e            	ld	a,xh
 742  0105 48            	sll	a
 743  0106 5f            	clrw	x
 744  0107 97            	ld	xl,a
 745  0108 d65380        	ld	a,(21376,x)
 746  010b a43f          	and	a,#63
 747  010d 6b01          	ld	(OFST+0,sp),a
 749                     ; 356   if (NewState != DISABLE)
 751  010f 0d06          	tnz	(OFST+5,sp)
 752  0111 2706          	jreq	L362
 753                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 755  0113 7b01          	ld	a,(OFST+0,sp)
 756  0115 1a03          	or	a,(OFST+2,sp)
 757  0117 6b01          	ld	(OFST+0,sp),a
 759  0119               L362:
 760                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 762  0119 7b02          	ld	a,(OFST+1,sp)
 763  011b 48            	sll	a
 764  011c 5f            	clrw	x
 765  011d 97            	ld	xl,a
 766  011e 7b01          	ld	a,(OFST+0,sp)
 767  0120 d75380        	ld	(21376,x),a
 768                     ; 364 }
 771  0123 5b03          	addw	sp,#3
 772  0125 81            	ret
 934                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 934                     ; 389 {
 935                     	switch	.text
 936  0126               _DAC_SetNoiseWaveLFSR:
 938  0126 89            	pushw	x
 939  0127 5203          	subw	sp,#3
 940       00000003      OFST:	set	3
 943                     ; 390   uint8_t tmpreg = 0;
 945                     ; 391   uint16_t cr2addr = 0;
 947                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 949                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 951                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 953  0129 9e            	ld	a,xh
 954  012a 48            	sll	a
 955  012b 5f            	clrw	x
 956  012c 97            	ld	xl,a
 957  012d 1c5381        	addw	x,#21377
 958  0130 1f02          	ldw	(OFST-1,sp),x
 960                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 962  0132 1e02          	ldw	x,(OFST-1,sp)
 963  0134 f6            	ld	a,(x)
 964  0135 a4f0          	and	a,#240
 965  0137 6b01          	ld	(OFST-2,sp),a
 967                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 969  0139 7b01          	ld	a,(OFST-2,sp)
 970  013b 1a05          	or	a,(OFST+2,sp)
 971  013d 1e02          	ldw	x,(OFST-1,sp)
 972  013f f7            	ld	(x),a
 973                     ; 403 }
 976  0140 5b05          	addw	sp,#5
 977  0142 81            	ret
1140                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1140                     ; 428 {
1141                     	switch	.text
1142  0143               _DAC_SetTriangleWaveAmplitude:
1144  0143 89            	pushw	x
1145  0144 5203          	subw	sp,#3
1146       00000003      OFST:	set	3
1149                     ; 429   uint8_t tmpreg = 0;
1151                     ; 430   uint16_t cr2addr = 0;
1153                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1155                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1157                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1159  0146 9e            	ld	a,xh
1160  0147 48            	sll	a
1161  0148 5f            	clrw	x
1162  0149 97            	ld	xl,a
1163  014a 1c5381        	addw	x,#21377
1164  014d 1f02          	ldw	(OFST-1,sp),x
1166                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1168  014f 1e02          	ldw	x,(OFST-1,sp)
1169  0151 f6            	ld	a,(x)
1170  0152 a4f0          	and	a,#240
1171  0154 6b01          	ld	(OFST-2,sp),a
1173                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1175  0156 7b01          	ld	a,(OFST-2,sp)
1176  0158 1a05          	or	a,(OFST+2,sp)
1177  015a 1e02          	ldw	x,(OFST-1,sp)
1178  015c f7            	ld	(x),a
1179                     ; 443 }
1182  015d 5b05          	addw	sp,#5
1183  015f 81            	ret
1253                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1253                     ; 456 {
1254                     	switch	.text
1255  0160               _DAC_SetChannel1Data:
1257  0160 88            	push	a
1258       00000000      OFST:	set	0
1261                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1263                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1265  0161 a108          	cp	a,#8
1266  0163 2712          	jreq	L364
1267                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1269  0165 5f            	clrw	x
1270  0166 97            	ld	xl,a
1271  0167 7b04          	ld	a,(OFST+4,sp)
1272  0169 d75388        	ld	(21384,x),a
1273                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1275  016c 7b01          	ld	a,(OFST+1,sp)
1276  016e 5f            	clrw	x
1277  016f 97            	ld	xl,a
1278  0170 7b05          	ld	a,(OFST+5,sp)
1279  0172 d75389        	ld	(21385,x),a
1281  0175 2005          	jra	L564
1282  0177               L364:
1283                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1285                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1287  0177 7b05          	ld	a,(OFST+5,sp)
1288  0179 c75390        	ld	21392,a
1289  017c               L564:
1290                     ; 474 }
1293  017c 84            	pop	a
1294  017d 81            	ret
1337                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1337                     ; 487 {
1338                     	switch	.text
1339  017e               _DAC_SetChannel2Data:
1341  017e 88            	push	a
1342       00000000      OFST:	set	0
1345                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1347                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1349  017f a108          	cp	a,#8
1350  0181 2712          	jreq	L705
1351                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1353  0183 5f            	clrw	x
1354  0184 97            	ld	xl,a
1355  0185 7b04          	ld	a,(OFST+4,sp)
1356  0187 d75394        	ld	(21396,x),a
1357                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1359  018a 7b01          	ld	a,(OFST+1,sp)
1360  018c 5f            	clrw	x
1361  018d 97            	ld	xl,a
1362  018e 7b05          	ld	a,(OFST+5,sp)
1363  0190 d75395        	ld	(21397,x),a
1365  0193 2005          	jra	L115
1366  0195               L705:
1367                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1369                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1371  0195 7b05          	ld	a,(OFST+5,sp)
1372  0197 c7539c        	ld	21404,a
1373  019a               L115:
1374                     ; 505 }
1377  019a 84            	pop	a
1378  019b 81            	ret
1435                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1435                     ; 523 {
1436                     	switch	.text
1437  019c               _DAC_SetDualChannelData:
1439  019c 88            	push	a
1440  019d 89            	pushw	x
1441       00000002      OFST:	set	2
1444                     ; 524   uint16_t dchxrdhrhaddr = 0;
1446                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1448                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1450  019e a108          	cp	a,#8
1451  01a0 2720          	jreq	L735
1452                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1454  01a2 5f            	clrw	x
1455  01a3 97            	ld	xl,a
1456  01a4 1c53a0        	addw	x,#21408
1457  01a7 1f01          	ldw	(OFST-1,sp),x
1459                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1461  01a9 7b08          	ld	a,(OFST+6,sp)
1462  01ab 1e01          	ldw	x,(OFST-1,sp)
1463  01ad f7            	ld	(x),a
1464                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1466  01ae 7b09          	ld	a,(OFST+7,sp)
1467  01b0 1e01          	ldw	x,(OFST-1,sp)
1468  01b2 e701          	ld	(1,x),a
1469                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1471  01b4 7b06          	ld	a,(OFST+4,sp)
1472  01b6 1e01          	ldw	x,(OFST-1,sp)
1473  01b8 e702          	ld	(2,x),a
1474                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1476  01ba 7b07          	ld	a,(OFST+5,sp)
1477  01bc 1e01          	ldw	x,(OFST-1,sp)
1478  01be e703          	ld	(3,x),a
1480  01c0 200a          	jra	L145
1481  01c2               L735:
1482                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1484                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1486  01c2 7b09          	ld	a,(OFST+7,sp)
1487  01c4 c753a8        	ld	21416,a
1488                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1490  01c7 7b07          	ld	a,(OFST+5,sp)
1491  01c9 c753a9        	ld	21417,a
1492  01cc               L145:
1493                     ; 549 }
1496  01cc 5b03          	addw	sp,#3
1497  01ce 81            	ret
1547                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1547                     ; 560 {
1548                     	switch	.text
1549  01cf               _DAC_GetDataOutputValue:
1551  01cf 89            	pushw	x
1552       00000002      OFST:	set	2
1555                     ; 561   uint16_t outputdata = 0;
1557                     ; 562   uint16_t tmp = 0;
1559                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1561                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1563  01d0 4d            	tnz	a
1564  01d1 2619          	jrne	L565
1565                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1567  01d3 c653ac        	ld	a,21420
1568  01d6 5f            	clrw	x
1569  01d7 97            	ld	xl,a
1570  01d8 4f            	clr	a
1571  01d9 02            	rlwa	x,a
1572  01da 1f01          	ldw	(OFST-1,sp),x
1574                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1576  01dc c653ad        	ld	a,21421
1577  01df 5f            	clrw	x
1578  01e0 97            	ld	xl,a
1579  01e1 01            	rrwa	x,a
1580  01e2 1a02          	or	a,(OFST+0,sp)
1581  01e4 01            	rrwa	x,a
1582  01e5 1a01          	or	a,(OFST-1,sp)
1583  01e7 01            	rrwa	x,a
1584  01e8 1f01          	ldw	(OFST-1,sp),x
1587  01ea 2017          	jra	L765
1588  01ec               L565:
1589                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1591  01ec c653b0        	ld	a,21424
1592  01ef 5f            	clrw	x
1593  01f0 97            	ld	xl,a
1594  01f1 4f            	clr	a
1595  01f2 02            	rlwa	x,a
1596  01f3 1f01          	ldw	(OFST-1,sp),x
1598                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1600  01f5 c653b1        	ld	a,21425
1601  01f8 5f            	clrw	x
1602  01f9 97            	ld	xl,a
1603  01fa 01            	rrwa	x,a
1604  01fb 1a02          	or	a,(OFST+0,sp)
1605  01fd 01            	rrwa	x,a
1606  01fe 1a01          	or	a,(OFST-1,sp)
1607  0200 01            	rrwa	x,a
1608  0201 1f01          	ldw	(OFST-1,sp),x
1610  0203               L765:
1611                     ; 581   return (uint16_t)outputdata;
1613  0203 1e01          	ldw	x,(OFST-1,sp)
1616  0205 5b02          	addw	sp,#2
1617  0207 81            	ret
1669                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1669                     ; 614 {
1670                     	switch	.text
1671  0208               _DAC_DMACmd:
1673  0208 89            	pushw	x
1674  0209 89            	pushw	x
1675       00000002      OFST:	set	2
1678                     ; 615   uint16_t cr2addr = 0;
1680                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1682                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1684                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1686  020a 9e            	ld	a,xh
1687  020b 48            	sll	a
1688  020c 5f            	clrw	x
1689  020d 97            	ld	xl,a
1690  020e 1c5381        	addw	x,#21377
1691  0211 1f01          	ldw	(OFST-1,sp),x
1693                     ; 624   if (NewState != DISABLE)
1695  0213 0d04          	tnz	(OFST+2,sp)
1696  0215 2708          	jreq	L516
1697                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1699  0217 1e01          	ldw	x,(OFST-1,sp)
1700  0219 f6            	ld	a,(x)
1701  021a aa10          	or	a,#16
1702  021c f7            	ld	(x),a
1704  021d 2006          	jra	L716
1705  021f               L516:
1706                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1708  021f 1e01          	ldw	x,(OFST-1,sp)
1709  0221 f6            	ld	a,(x)
1710  0222 a4ef          	and	a,#239
1711  0224 f7            	ld	(x),a
1712  0225               L716:
1713                     ; 634 }
1716  0225 5b04          	addw	sp,#4
1717  0227 81            	ret
1792                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1792                     ; 668 {
1793                     	switch	.text
1794  0228               _DAC_ITConfig:
1796  0228 89            	pushw	x
1797  0229 89            	pushw	x
1798       00000002      OFST:	set	2
1801                     ; 669   uint16_t cr2addr = 0;
1803                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1805                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1807                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1809                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1811  022a 9e            	ld	a,xh
1812  022b 48            	sll	a
1813  022c 5f            	clrw	x
1814  022d 97            	ld	xl,a
1815  022e 1c5381        	addw	x,#21377
1816  0231 1f01          	ldw	(OFST-1,sp),x
1818                     ; 679   if (NewState != DISABLE)
1820  0233 0d07          	tnz	(OFST+5,sp)
1821  0235 2708          	jreq	L756
1822                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1824  0237 1e01          	ldw	x,(OFST-1,sp)
1825  0239 f6            	ld	a,(x)
1826  023a 1a04          	or	a,(OFST+2,sp)
1827  023c f7            	ld	(x),a
1829  023d 2007          	jra	L166
1830  023f               L756:
1831                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1833  023f 1e01          	ldw	x,(OFST-1,sp)
1834  0241 7b04          	ld	a,(OFST+2,sp)
1835  0243 43            	cpl	a
1836  0244 f4            	and	a,(x)
1837  0245 f7            	ld	(x),a
1838  0246               L166:
1839                     ; 689 }
1842  0246 5b04          	addw	sp,#4
1843  0248 81            	ret
1939                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1939                     ; 705 {
1940                     	switch	.text
1941  0249               _DAC_GetFlagStatus:
1943  0249 89            	pushw	x
1944  024a 88            	push	a
1945       00000001      OFST:	set	1
1948                     ; 706   FlagStatus flagstatus = RESET;
1950                     ; 707   uint8_t flag = 0;
1952                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1954                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1956                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1958  024b 9e            	ld	a,xh
1959  024c 5f            	clrw	x
1960  024d 97            	ld	xl,a
1961  024e 7b03          	ld	a,(OFST+2,sp)
1962  0250 5d            	tnzw	x
1963  0251 2704          	jreq	L25
1964  0253               L45:
1965  0253 48            	sll	a
1966  0254 5a            	decw	x
1967  0255 26fc          	jrne	L45
1968  0257               L25:
1969  0257 6b01          	ld	(OFST+0,sp),a
1971                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
1973  0259 c65385        	ld	a,21381
1974  025c 1501          	bcp	a,(OFST+0,sp)
1975  025e 2706          	jreq	L137
1976                     ; 719     flagstatus = SET;
1978  0260 a601          	ld	a,#1
1979  0262 6b01          	ld	(OFST+0,sp),a
1982  0264 2002          	jra	L337
1983  0266               L137:
1984                     ; 724     flagstatus = RESET;
1986  0266 0f01          	clr	(OFST+0,sp)
1988  0268               L337:
1989                     ; 728   return  flagstatus;
1991  0268 7b01          	ld	a,(OFST+0,sp)
1994  026a 5b03          	addw	sp,#3
1995  026c 81            	ret
2047                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2047                     ; 743 {
2048                     	switch	.text
2049  026d               _DAC_ClearFlag:
2051  026d 89            	pushw	x
2052  026e 88            	push	a
2053       00000001      OFST:	set	1
2056                     ; 744   uint8_t flag = 0;
2058                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2060                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2062                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2064  026f 9e            	ld	a,xh
2065  0270 5f            	clrw	x
2066  0271 97            	ld	xl,a
2067  0272 7b03          	ld	a,(OFST+2,sp)
2068  0274 5d            	tnzw	x
2069  0275 2704          	jreq	L06
2070  0277               L26:
2071  0277 48            	sll	a
2072  0278 5a            	decw	x
2073  0279 26fc          	jrne	L26
2074  027b               L06:
2075  027b 6b01          	ld	(OFST+0,sp),a
2077                     ; 754   DAC->SR = (uint8_t)(~flag);
2079  027d 7b01          	ld	a,(OFST+0,sp)
2080  027f 43            	cpl	a
2081  0280 c75385        	ld	21381,a
2082                     ; 755 }
2085  0283 5b03          	addw	sp,#3
2086  0285 81            	ret
2163                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2163                     ; 771 {
2164                     	switch	.text
2165  0286               _DAC_GetITStatus:
2167  0286 89            	pushw	x
2168  0287 89            	pushw	x
2169       00000002      OFST:	set	2
2172                     ; 772   ITStatus itstatus = RESET;
2174                     ; 773   uint8_t enablestatus = 0;
2176                     ; 774   uint8_t flagstatus = 0;
2178                     ; 775   uint8_t tempreg = 0;
2180                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2182                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2184                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2186  0288 9e            	ld	a,xh
2187  0289 48            	sll	a
2188  028a 48            	sll	a
2189  028b 5f            	clrw	x
2190  028c 97            	ld	xl,a
2191  028d d65381        	ld	a,(21377,x)
2192  0290 6b02          	ld	(OFST+0,sp),a
2194                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2196  0292 7b03          	ld	a,(OFST+1,sp)
2197  0294 5f            	clrw	x
2198  0295 97            	ld	xl,a
2199  0296 7b04          	ld	a,(OFST+2,sp)
2200  0298 5d            	tnzw	x
2201  0299 2704          	jreq	L66
2202  029b               L07:
2203  029b 48            	sll	a
2204  029c 5a            	decw	x
2205  029d 26fc          	jrne	L07
2206  029f               L66:
2207  029f 1402          	and	a,(OFST+0,sp)
2208  02a1 6b01          	ld	(OFST-1,sp),a
2210                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2212  02a3 a605          	ld	a,#5
2213  02a5 1003          	sub	a,(OFST+1,sp)
2214  02a7 5f            	clrw	x
2215  02a8 97            	ld	xl,a
2216  02a9 7b04          	ld	a,(OFST+2,sp)
2217  02ab 5d            	tnzw	x
2218  02ac 2704          	jreq	L27
2219  02ae               L47:
2220  02ae 44            	srl	a
2221  02af 5a            	decw	x
2222  02b0 26fc          	jrne	L47
2223  02b2               L27:
2224  02b2 c45385        	and	a,21381
2225  02b5 6b02          	ld	(OFST+0,sp),a
2227                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2229  02b7 0d02          	tnz	(OFST+0,sp)
2230  02b9 270a          	jreq	L5101
2232  02bb 0d01          	tnz	(OFST-1,sp)
2233  02bd 2706          	jreq	L5101
2234                     ; 790     itstatus = SET;
2236  02bf a601          	ld	a,#1
2237  02c1 6b02          	ld	(OFST+0,sp),a
2240  02c3 2002          	jra	L7101
2241  02c5               L5101:
2242                     ; 795     itstatus = RESET;
2244  02c5 0f02          	clr	(OFST+0,sp)
2246  02c7               L7101:
2247                     ; 799   return  itstatus;
2249  02c7 7b02          	ld	a,(OFST+0,sp)
2252  02c9 5b04          	addw	sp,#4
2253  02cb 81            	ret
2299                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2299                     ; 814 {
2300                     	switch	.text
2301  02cc               _DAC_ClearITPendingBit:
2303  02cc 89            	pushw	x
2304       00000000      OFST:	set	0
2307                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2309                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2311                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2313  02cd 9e            	ld	a,xh
2314  02ce a005          	sub	a,#5
2315  02d0 40            	neg	a
2316  02d1 5f            	clrw	x
2317  02d2 97            	ld	xl,a
2318  02d3 7b02          	ld	a,(OFST+2,sp)
2319  02d5 5d            	tnzw	x
2320  02d6 2704          	jreq	L001
2321  02d8               L201:
2322  02d8 44            	srl	a
2323  02d9 5a            	decw	x
2324  02da 26fc          	jrne	L201
2325  02dc               L001:
2326  02dc 43            	cpl	a
2327  02dd c75385        	ld	21381,a
2328                     ; 821 }
2331  02e0 85            	popw	x
2332  02e1 81            	ret
2345                     	xdef	_DAC_ClearITPendingBit
2346                     	xdef	_DAC_GetITStatus
2347                     	xdef	_DAC_ClearFlag
2348                     	xdef	_DAC_GetFlagStatus
2349                     	xdef	_DAC_ITConfig
2350                     	xdef	_DAC_DMACmd
2351                     	xdef	_DAC_GetDataOutputValue
2352                     	xdef	_DAC_SetDualChannelData
2353                     	xdef	_DAC_SetChannel2Data
2354                     	xdef	_DAC_SetChannel1Data
2355                     	xdef	_DAC_SetTriangleWaveAmplitude
2356                     	xdef	_DAC_SetNoiseWaveLFSR
2357                     	xdef	_DAC_WaveGenerationCmd
2358                     	xdef	_DAC_DualSoftwareTriggerCmd
2359                     	xdef	_DAC_SoftwareTriggerCmd
2360                     	xdef	_DAC_Cmd
2361                     	xdef	_DAC_Init
2362                     	xdef	_DAC_DeInit
2381                     	end
