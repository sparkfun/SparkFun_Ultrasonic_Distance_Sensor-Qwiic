   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 140 void DMA_GlobalDeInit(void)
  42                     ; 141 {
  44                     	switch	.text
  45  0000               _DMA_GlobalDeInit:
  49                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  51  0000 72115070      	bres	20592,#0
  52                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  54  0004 35fc5070      	mov	20592,#252
  55                     ; 147 }
  58  0008 81            	ret
 174                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 174                     ; 156 {
 175                     	switch	.text
 176  0009               _DMA_DeInit:
 178  0009 89            	pushw	x
 179       00000000      OFST:	set	0
 182                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 184                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 186  000a f6            	ld	a,(x)
 187  000b a4fe          	and	a,#254
 188  000d f7            	ld	(x),a
 189                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 191  000e 7f            	clr	(x)
 192                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 194  000f 6f02          	clr	(2,x)
 195                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 197  0011 a35093        	cpw	x,#20627
 198  0014 2608          	jrne	L501
 199                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 201  0016 a640          	ld	a,#64
 202  0018 e703          	ld	(3,x),a
 203                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 205  001a 6f05          	clr	(5,x)
 207  001c 2006          	jra	L701
 208  001e               L501:
 209                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 211  001e 1e01          	ldw	x,(OFST+1,sp)
 212  0020 a652          	ld	a,#82
 213  0022 e703          	ld	(3,x),a
 214  0024               L701:
 215                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 217  0024 1e01          	ldw	x,(OFST+1,sp)
 218  0026 6f04          	clr	(4,x)
 219                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 221  0028 1e01          	ldw	x,(OFST+1,sp)
 222  002a 6f06          	clr	(6,x)
 223                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 225  002c 1e01          	ldw	x,(OFST+1,sp)
 226  002e 6f07          	clr	(7,x)
 227                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 229  0030 1e01          	ldw	x,(OFST+1,sp)
 230  0032 6f01          	clr	(1,x)
 231                     ; 187 }
 234  0034 85            	popw	x
 235  0035 81            	ret
 475                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 475                     ; 225               uint32_t DMA_Memory0BaseAddr,
 475                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 475                     ; 227               uint8_t DMA_BufferSize,
 475                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 475                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 475                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 475                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 475                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 475                     ; 233 {
 476                     	switch	.text
 477  0036               _DMA_Init:
 479  0036 89            	pushw	x
 480       00000000      OFST:	set	0
 483                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 485                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 487                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 489                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 491                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 493                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 495                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 497  0037 f6            	ld	a,(x)
 498  0038 a4fe          	and	a,#254
 499  003a f7            	ld	(x),a
 500                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 502  003b 7f            	clr	(x)
 503                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 503                     ; 251                                            (uint8_t)DMA_Mode) | \
 503                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 505  003c 7b0c          	ld	a,(OFST+12,sp)
 506  003e 1a0d          	or	a,(OFST+13,sp)
 507  0040 1a0e          	or	a,(OFST+14,sp)
 508  0042 fa            	or	a,(x)
 509  0043 f7            	ld	(x),a
 510                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 512  0044 e601          	ld	a,(1,x)
 513  0046 a4c7          	and	a,#199
 514  0048 e701          	ld	(1,x),a
 515                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 515                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 517  004a 7b0f          	ld	a,(OFST+15,sp)
 518  004c 1a10          	or	a,(OFST+16,sp)
 519  004e ea01          	or	a,(1,x)
 520  0050 e701          	ld	(1,x),a
 521                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 523  0052 7b0b          	ld	a,(OFST+11,sp)
 524  0054 1e01          	ldw	x,(OFST+1,sp)
 525  0056 e702          	ld	(2,x),a
 526                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 528  0058 7b09          	ld	a,(OFST+9,sp)
 529  005a 1e01          	ldw	x,(OFST+1,sp)
 530  005c e703          	ld	(3,x),a
 531                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 533  005e 7b0a          	ld	a,(OFST+10,sp)
 534  0060 1e01          	ldw	x,(OFST+1,sp)
 535  0062 e704          	ld	(4,x),a
 536                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 538  0064 1e01          	ldw	x,(OFST+1,sp)
 539  0066 a35093        	cpw	x,#20627
 540  0069 2606          	jrne	L142
 541                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 543  006b 7b06          	ld	a,(OFST+6,sp)
 544  006d 1e01          	ldw	x,(OFST+1,sp)
 545  006f e705          	ld	(5,x),a
 546  0071               L142:
 547                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 549  0071 7b07          	ld	a,(OFST+7,sp)
 550  0073 1e01          	ldw	x,(OFST+1,sp)
 551  0075 e706          	ld	(6,x),a
 552                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 554  0077 7b08          	ld	a,(OFST+8,sp)
 555  0079 1e01          	ldw	x,(OFST+1,sp)
 556  007b e707          	ld	(7,x),a
 557                     ; 280 }
 560  007d 85            	popw	x
 561  007e 81            	ret
 616                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 616                     ; 289 {
 617                     	switch	.text
 618  007f               _DMA_GlobalCmd:
 622                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 624                     ; 293   if (NewState != DISABLE)
 626  007f 4d            	tnz	a
 627  0080 2706          	jreq	L172
 628                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 630  0082 72105070      	bset	20592,#0
 632  0086 2004          	jra	L372
 633  0088               L172:
 634                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 636  0088 72115070      	bres	20592,#0
 637  008c               L372:
 638                     ; 303 }
 641  008c 81            	ret
 688                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 688                     ; 315 {
 689                     	switch	.text
 690  008d               _DMA_Cmd:
 692  008d 89            	pushw	x
 693       00000000      OFST:	set	0
 696                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 698                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 700                     ; 320   if (NewState != DISABLE)
 702  008e 0d05          	tnz	(OFST+5,sp)
 703  0090 2706          	jreq	L123
 704                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 706  0092 f6            	ld	a,(x)
 707  0093 aa01          	or	a,#1
 708  0095 f7            	ld	(x),a
 710  0096 2006          	jra	L323
 711  0098               L123:
 712                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 714  0098 1e01          	ldw	x,(OFST+1,sp)
 715  009a f6            	ld	a,(x)
 716  009b a4fe          	and	a,#254
 717  009d f7            	ld	(x),a
 718  009e               L323:
 719                     ; 330 }
 722  009e 85            	popw	x
 723  009f 81            	ret
 755                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 755                     ; 343 {
 756                     	switch	.text
 757  00a0               _DMA_SetTimeOut:
 761                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 763                     ; 348   DMA1->GCSR = 0;
 765  00a0 725f5070      	clr	20592
 766                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 768  00a4 48            	sll	a
 769  00a5 48            	sll	a
 770  00a6 c75070        	ld	20592,a
 771                     ; 351 }
 774  00a9 81            	ret
 819                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 819                     ; 402 {
 820                     	switch	.text
 821  00aa               _DMA_SetCurrDataCounter:
 823  00aa 89            	pushw	x
 824       00000000      OFST:	set	0
 827                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 829                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 831  00ab 7b05          	ld	a,(OFST+5,sp)
 832  00ad 1e01          	ldw	x,(OFST+1,sp)
 833  00af e702          	ld	(2,x),a
 834                     ; 408 }
 837  00b1 85            	popw	x
 838  00b2 81            	ret
 876                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 876                     ; 416 {
 877                     	switch	.text
 878  00b3               _DMA_GetCurrDataCounter:
 882                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 884                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 886  00b3 e602          	ld	a,(2,x)
 889  00b5 81            	ret
 966                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 966                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 966                     ; 484                   FunctionalState NewState)
 966                     ; 485 {
 967                     	switch	.text
 968  00b6               _DMA_ITConfig:
 970  00b6 89            	pushw	x
 971       00000000      OFST:	set	0
 974                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 976                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 978                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 980                     ; 491   if (NewState != DISABLE)
 982  00b7 0d06          	tnz	(OFST+6,sp)
 983  00b9 2706          	jreq	L344
 984                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 986  00bb f6            	ld	a,(x)
 987  00bc 1a05          	or	a,(OFST+5,sp)
 988  00be f7            	ld	(x),a
 990  00bf 2007          	jra	L544
 991  00c1               L344:
 992                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 994  00c1 1e01          	ldw	x,(OFST+1,sp)
 995  00c3 7b05          	ld	a,(OFST+5,sp)
 996  00c5 43            	cpl	a
 997  00c6 f4            	and	a,(x)
 998  00c7 f7            	ld	(x),a
 999  00c8               L544:
1000                     ; 501 }
1003  00c8 85            	popw	x
1004  00c9 81            	ret
1249                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1249                     ; 531 {
1250                     	switch	.text
1251  00ca               _DMA_GetFlagStatus:
1253  00ca 89            	pushw	x
1254  00cb 5204          	subw	sp,#4
1255       00000004      OFST:	set	4
1258                     ; 532   FlagStatus flagstatus = RESET;
1260                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1262                     ; 534   uint8_t tmpgir1 = 0;
1264                     ; 535   uint8_t tmpgcsr = 0;
1266                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1268                     ; 541   tmpgcsr = DMA1->GCSR;
1270  00cd c65070        	ld	a,20592
1271  00d0 6b04          	ld	(OFST+0,sp),a
1273                     ; 542   tmpgir1 = DMA1->GIR1;
1275  00d2 c65071        	ld	a,20593
1276  00d5 6b01          	ld	(OFST-3,sp),a
1278                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1280  00d7 01            	rrwa	x,a
1281  00d8 9f            	ld	a,xl
1282  00d9 a40f          	and	a,#15
1283  00db 97            	ld	xl,a
1284  00dc 4f            	clr	a
1285  00dd 02            	rlwa	x,a
1286  00de 5d            	tnzw	x
1287  00df 2736          	jreq	L175
1288                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1290  00e1 7b05          	ld	a,(OFST+1,sp)
1291  00e3 a501          	bcp	a,#1
1292  00e5 2707          	jreq	L375
1293                     ; 549       DMA_Channelx = DMA1_Channel0;
1295  00e7 ae5075        	ldw	x,#20597
1296  00ea 1f02          	ldw	(OFST-2,sp),x
1299  00ec 201f          	jra	L575
1300  00ee               L375:
1301                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1303  00ee 7b05          	ld	a,(OFST+1,sp)
1304  00f0 a502          	bcp	a,#2
1305  00f2 2707          	jreq	L775
1306                     ; 553       DMA_Channelx = DMA1_Channel1;
1308  00f4 ae507f        	ldw	x,#20607
1309  00f7 1f02          	ldw	(OFST-2,sp),x
1312  00f9 2012          	jra	L575
1313  00fb               L775:
1314                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1316  00fb 7b05          	ld	a,(OFST+1,sp)
1317  00fd a504          	bcp	a,#4
1318  00ff 2707          	jreq	L306
1319                     ; 557       DMA_Channelx = DMA1_Channel2;
1321  0101 ae5089        	ldw	x,#20617
1322  0104 1f02          	ldw	(OFST-2,sp),x
1325  0106 2005          	jra	L575
1326  0108               L306:
1327                     ; 561       DMA_Channelx = DMA1_Channel3;
1329  0108 ae5093        	ldw	x,#20627
1330  010b 1f02          	ldw	(OFST-2,sp),x
1332  010d               L575:
1333                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1335  010d 1e02          	ldw	x,(OFST-2,sp)
1336  010f e601          	ld	a,(1,x)
1337  0111 1406          	and	a,(OFST+2,sp)
1338  0113 6b04          	ld	(OFST+0,sp),a
1341  0115 2014          	jra	L706
1342  0117               L175:
1343                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1345  0117 7b05          	ld	a,(OFST+1,sp)
1346  0119 a510          	bcp	a,#16
1347  011b 2708          	jreq	L116
1348                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1350  011d 7b06          	ld	a,(OFST+2,sp)
1351  011f 1401          	and	a,(OFST-3,sp)
1352  0121 6b04          	ld	(OFST+0,sp),a
1355  0123 2006          	jra	L706
1356  0125               L116:
1357                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1359  0125 7b04          	ld	a,(OFST+0,sp)
1360  0127 a402          	and	a,#2
1361  0129 6b04          	ld	(OFST+0,sp),a
1363  012b               L706:
1364                     ; 579   return (flagstatus);
1366  012b 7b04          	ld	a,(OFST+0,sp)
1369  012d 5b06          	addw	sp,#6
1370  012f 81            	ret
1417                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1417                     ; 598 {
1418                     	switch	.text
1419  0130               _DMA_ClearFlag:
1421  0130 89            	pushw	x
1422  0131 89            	pushw	x
1423       00000002      OFST:	set	2
1426                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1428                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1430                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1432  0132 01            	rrwa	x,a
1433  0133 9f            	ld	a,xl
1434  0134 a401          	and	a,#1
1435  0136 97            	ld	xl,a
1436  0137 4f            	clr	a
1437  0138 02            	rlwa	x,a
1438  0139 5d            	tnzw	x
1439  013a 2707          	jreq	L146
1440                     ; 607     DMA_Channelx = DMA1_Channel0;
1442  013c ae5075        	ldw	x,#20597
1443  013f 1f01          	ldw	(OFST-1,sp),x
1446  0141 201f          	jra	L346
1447  0143               L146:
1448                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1450  0143 7b03          	ld	a,(OFST+1,sp)
1451  0145 a502          	bcp	a,#2
1452  0147 2707          	jreq	L546
1453                     ; 613       DMA_Channelx = DMA1_Channel1;
1455  0149 ae507f        	ldw	x,#20607
1456  014c 1f01          	ldw	(OFST-1,sp),x
1459  014e 2012          	jra	L346
1460  0150               L546:
1461                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1463  0150 7b03          	ld	a,(OFST+1,sp)
1464  0152 a504          	bcp	a,#4
1465  0154 2707          	jreq	L156
1466                     ; 619         DMA_Channelx = DMA1_Channel2;
1468  0156 ae5089        	ldw	x,#20617
1469  0159 1f01          	ldw	(OFST-1,sp),x
1472  015b 2005          	jra	L346
1473  015d               L156:
1474                     ; 623         DMA_Channelx = DMA1_Channel3;
1476  015d ae5093        	ldw	x,#20627
1477  0160 1f01          	ldw	(OFST-1,sp),x
1479  0162               L346:
1480                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1482  0162 1e01          	ldw	x,(OFST-1,sp)
1483  0164 7b04          	ld	a,(OFST+2,sp)
1484  0166 a406          	and	a,#6
1485  0168 43            	cpl	a
1486  0169 e401          	and	a,(1,x)
1487  016b e701          	ld	(1,x),a
1488                     ; 630 }
1491  016d 5b04          	addw	sp,#4
1492  016f 81            	ret
1626                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1626                     ; 647 {
1627                     	switch	.text
1628  0170               _DMA_GetITStatus:
1630  0170 88            	push	a
1631  0171 5204          	subw	sp,#4
1632       00000004      OFST:	set	4
1635                     ; 648   ITStatus itstatus = RESET;
1637                     ; 649   uint8_t tmpreg = 0;
1639                     ; 650   uint8_t tmp2 = 0;
1641                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1643                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1645                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1647  0173 a510          	bcp	a,#16
1648  0175 2707          	jreq	L537
1649                     ; 659     DMA_Channelx = DMA1_Channel0;
1651  0177 ae5075        	ldw	x,#20597
1652  017a 1f03          	ldw	(OFST-1,sp),x
1655  017c 201f          	jra	L737
1656  017e               L537:
1657                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1659  017e 7b05          	ld	a,(OFST+1,sp)
1660  0180 a520          	bcp	a,#32
1661  0182 2707          	jreq	L147
1662                     ; 665       DMA_Channelx = DMA1_Channel1;
1664  0184 ae507f        	ldw	x,#20607
1665  0187 1f03          	ldw	(OFST-1,sp),x
1668  0189 2012          	jra	L737
1669  018b               L147:
1670                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1672  018b 7b05          	ld	a,(OFST+1,sp)
1673  018d a540          	bcp	a,#64
1674  018f 2707          	jreq	L547
1675                     ; 671         DMA_Channelx = DMA1_Channel2;
1677  0191 ae5089        	ldw	x,#20617
1678  0194 1f03          	ldw	(OFST-1,sp),x
1681  0196 2005          	jra	L737
1682  0198               L547:
1683                     ; 675         DMA_Channelx = DMA1_Channel3;
1685  0198 ae5093        	ldw	x,#20627
1686  019b 1f03          	ldw	(OFST-1,sp),x
1688  019d               L737:
1689                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1691  019d 1e03          	ldw	x,(OFST-1,sp)
1692  019f e601          	ld	a,(1,x)
1693  01a1 6b01          	ld	(OFST-3,sp),a
1695                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1697  01a3 1e03          	ldw	x,(OFST-1,sp)
1698  01a5 7b01          	ld	a,(OFST-3,sp)
1699  01a7 f4            	and	a,(x)
1700  01a8 6b01          	ld	(OFST-3,sp),a
1702                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1704  01aa 7b05          	ld	a,(OFST+1,sp)
1705  01ac a406          	and	a,#6
1706  01ae 6b02          	ld	(OFST-2,sp),a
1708                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1710  01b0 7b01          	ld	a,(OFST-3,sp)
1711  01b2 1402          	and	a,(OFST-2,sp)
1712  01b4 6b02          	ld	(OFST-2,sp),a
1714                     ; 686   return (itstatus);
1716  01b6 7b02          	ld	a,(OFST-2,sp)
1719  01b8 5b05          	addw	sp,#5
1720  01ba 81            	ret
1768                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1768                     ; 705 {
1769                     	switch	.text
1770  01bb               _DMA_ClearITPendingBit:
1772  01bb 88            	push	a
1773  01bc 89            	pushw	x
1774       00000002      OFST:	set	2
1777                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1779                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1781                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1783  01bd a510          	bcp	a,#16
1784  01bf 2707          	jreq	L577
1785                     ; 713     DMA_Channelx = DMA1_Channel0;
1787  01c1 ae5075        	ldw	x,#20597
1788  01c4 1f01          	ldw	(OFST-1,sp),x
1791  01c6 201f          	jra	L777
1792  01c8               L577:
1793                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1795  01c8 7b03          	ld	a,(OFST+1,sp)
1796  01ca a520          	bcp	a,#32
1797  01cc 2707          	jreq	L1001
1798                     ; 719       DMA_Channelx = DMA1_Channel1;
1800  01ce ae507f        	ldw	x,#20607
1801  01d1 1f01          	ldw	(OFST-1,sp),x
1804  01d3 2012          	jra	L777
1805  01d5               L1001:
1806                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1808  01d5 7b03          	ld	a,(OFST+1,sp)
1809  01d7 a540          	bcp	a,#64
1810  01d9 2707          	jreq	L5001
1811                     ; 725         DMA_Channelx = DMA1_Channel2;
1813  01db ae5089        	ldw	x,#20617
1814  01de 1f01          	ldw	(OFST-1,sp),x
1817  01e0 2005          	jra	L777
1818  01e2               L5001:
1819                     ; 729         DMA_Channelx = DMA1_Channel3;
1821  01e2 ae5093        	ldw	x,#20627
1822  01e5 1f01          	ldw	(OFST-1,sp),x
1824  01e7               L777:
1825                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1827  01e7 1e01          	ldw	x,(OFST-1,sp)
1828  01e9 7b03          	ld	a,(OFST+1,sp)
1829  01eb a406          	and	a,#6
1830  01ed 43            	cpl	a
1831  01ee e401          	and	a,(1,x)
1832  01f0 e701          	ld	(1,x),a
1833                     ; 735 }
1836  01f2 5b03          	addw	sp,#3
1837  01f4 81            	ret
1850                     	xdef	_DMA_ClearITPendingBit
1851                     	xdef	_DMA_GetITStatus
1852                     	xdef	_DMA_ClearFlag
1853                     	xdef	_DMA_GetFlagStatus
1854                     	xdef	_DMA_ITConfig
1855                     	xdef	_DMA_GetCurrDataCounter
1856                     	xdef	_DMA_SetCurrDataCounter
1857                     	xdef	_DMA_SetTimeOut
1858                     	xdef	_DMA_Cmd
1859                     	xdef	_DMA_GlobalCmd
1860                     	xdef	_DMA_Init
1861                     	xdef	_DMA_DeInit
1862                     	xdef	_DMA_GlobalDeInit
1881                     	end
