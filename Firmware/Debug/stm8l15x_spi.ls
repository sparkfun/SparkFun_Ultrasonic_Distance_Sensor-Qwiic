   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 135                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 135                     ; 129 {
 137                     	switch	.text
 138  0000               _SPI_DeInit:
 142                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 144  0000 7f            	clr	(x)
 145                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 147  0001 6f01          	clr	(1,x)
 148                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 150  0003 6f02          	clr	(2,x)
 151                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 153  0005 a602          	ld	a,#2
 154  0007 e703          	ld	(3,x),a
 155                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 157  0009 a607          	ld	a,#7
 158  000b e705          	ld	(5,x),a
 159                     ; 135 }
 162  000d 81            	ret
 486                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 486                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 486                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 486                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 486                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 486                     ; 182 {
 487                     	switch	.text
 488  000e               _SPI_Init:
 490  000e 89            	pushw	x
 491  000f 88            	push	a
 492       00000001      OFST:	set	1
 495                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 497                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 499                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 501                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 503                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 505                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 507                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 509                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 511                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 511                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 511                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 511                     ; 197                                   SPI_CPHA));
 513  0010 7b09          	ld	a,(OFST+8,sp)
 514  0012 1a0a          	or	a,(OFST+9,sp)
 515  0014 6b01          	ld	(OFST+0,sp),a
 517  0016 7b06          	ld	a,(OFST+5,sp)
 518  0018 1a07          	or	a,(OFST+6,sp)
 519  001a 1a01          	or	a,(OFST+0,sp)
 520  001c 1e02          	ldw	x,(OFST+1,sp)
 521  001e f7            	ld	(x),a
 522                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 524  001f 7b0b          	ld	a,(OFST+10,sp)
 525  0021 1a0c          	or	a,(OFST+11,sp)
 526  0023 1e02          	ldw	x,(OFST+1,sp)
 527  0025 e701          	ld	(1,x),a
 528                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 530  0027 7b08          	ld	a,(OFST+7,sp)
 531  0029 a104          	cp	a,#4
 532  002b 260a          	jrne	L362
 533                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 535  002d 1e02          	ldw	x,(OFST+1,sp)
 536  002f e601          	ld	a,(1,x)
 537  0031 aa01          	or	a,#1
 538  0033 e701          	ld	(1,x),a
 540  0035 2008          	jra	L562
 541  0037               L362:
 542                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 544  0037 1e02          	ldw	x,(OFST+1,sp)
 545  0039 e601          	ld	a,(1,x)
 546  003b a4fe          	and	a,#254
 547  003d e701          	ld	(1,x),a
 548  003f               L562:
 549                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 551  003f 1e02          	ldw	x,(OFST+1,sp)
 552  0041 f6            	ld	a,(x)
 553  0042 1a08          	or	a,(OFST+7,sp)
 554  0044 f7            	ld	(x),a
 555                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 557  0045 7b0d          	ld	a,(OFST+12,sp)
 558  0047 1e02          	ldw	x,(OFST+1,sp)
 559  0049 e705          	ld	(5,x),a
 560                     ; 216 }
 563  004b 5b03          	addw	sp,#3
 564  004d 81            	ret
 631                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 631                     ; 226 {
 632                     	switch	.text
 633  004e               _SPI_Cmd:
 635  004e 89            	pushw	x
 636       00000000      OFST:	set	0
 639                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 641                     ; 230   if (NewState != DISABLE)
 643  004f 0d05          	tnz	(OFST+5,sp)
 644  0051 2706          	jreq	L323
 645                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 647  0053 f6            	ld	a,(x)
 648  0054 aa40          	or	a,#64
 649  0056 f7            	ld	(x),a
 651  0057 2006          	jra	L523
 652  0059               L323:
 653                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 655  0059 1e01          	ldw	x,(OFST+1,sp)
 656  005b f6            	ld	a,(x)
 657  005c a4bf          	and	a,#191
 658  005e f7            	ld	(x),a
 659  005f               L523:
 660                     ; 238 }
 663  005f 85            	popw	x
 664  0060 81            	ret
 712                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 712                     ; 248 {
 713                     	switch	.text
 714  0061               _SPI_NSSInternalSoftwareCmd:
 716  0061 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 722                     ; 252   if (NewState != DISABLE)
 724  0062 0d05          	tnz	(OFST+5,sp)
 725  0064 2708          	jreq	L353
 726                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 728  0066 e601          	ld	a,(1,x)
 729  0068 aa01          	or	a,#1
 730  006a e701          	ld	(1,x),a
 732  006c 2008          	jra	L553
 733  006e               L353:
 734                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 736  006e 1e01          	ldw	x,(OFST+1,sp)
 737  0070 e601          	ld	a,(1,x)
 738  0072 a4fe          	and	a,#254
 739  0074 e701          	ld	(1,x),a
 740  0076               L553:
 741                     ; 260 }
 744  0076 85            	popw	x
 745  0077 81            	ret
 813                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 813                     ; 272 {
 814                     	switch	.text
 815  0078               _SPI_BiDirectionalLineConfig:
 817  0078 89            	pushw	x
 818       00000000      OFST:	set	0
 821                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 823                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 825  0079 0d05          	tnz	(OFST+5,sp)
 826  007b 2708          	jreq	L314
 827                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 829  007d e601          	ld	a,(1,x)
 830  007f aa40          	or	a,#64
 831  0081 e701          	ld	(1,x),a
 833  0083 2008          	jra	L514
 834  0085               L314:
 835                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 837  0085 1e01          	ldw	x,(OFST+1,sp)
 838  0087 e601          	ld	a,(1,x)
 839  0089 a4bf          	and	a,#191
 840  008b e701          	ld	(1,x),a
 841  008d               L514:
 842                     ; 284 }
 845  008d 85            	popw	x
 846  008e 81            	ret
 890                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 890                     ; 320 {
 891                     	switch	.text
 892  008f               _SPI_SendData:
 894  008f 89            	pushw	x
 895       00000000      OFST:	set	0
 898                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 900  0090 7b05          	ld	a,(OFST+5,sp)
 901  0092 1e01          	ldw	x,(OFST+1,sp)
 902  0094 e704          	ld	(4,x),a
 903                     ; 322 }
 906  0096 85            	popw	x
 907  0097 81            	ret
 944                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 944                     ; 330 {
 945                     	switch	.text
 946  0098               _SPI_ReceiveData:
 950                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 952  0098 e604          	ld	a,(4,x)
 955  009a 81            	ret
 992                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 992                     ; 415 {
 993                     	switch	.text
 994  009b               _SPI_TransmitCRC:
 998                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1000  009b e601          	ld	a,(1,x)
1001  009d aa10          	or	a,#16
1002  009f e701          	ld	(1,x),a
1003                     ; 417 }
1006  00a1 81            	ret
1055                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1055                     ; 427 {
1056                     	switch	.text
1057  00a2               _SPI_CalculateCRCCmd:
1059  00a2 89            	pushw	x
1060       00000000      OFST:	set	0
1063                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1065                     ; 432   SPI_Cmd(SPI1, DISABLE);
1067  00a3 4b00          	push	#0
1068  00a5 ae5200        	ldw	x,#20992
1069  00a8 ada4          	call	_SPI_Cmd
1071  00aa 84            	pop	a
1072                     ; 434   if (NewState != DISABLE)
1074  00ab 0d05          	tnz	(OFST+5,sp)
1075  00ad 270a          	jreq	L525
1076                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1078  00af 1e01          	ldw	x,(OFST+1,sp)
1079  00b1 e601          	ld	a,(1,x)
1080  00b3 aa20          	or	a,#32
1081  00b5 e701          	ld	(1,x),a
1083  00b7 2008          	jra	L725
1084  00b9               L525:
1085                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1087  00b9 1e01          	ldw	x,(OFST+1,sp)
1088  00bb e601          	ld	a,(1,x)
1089  00bd a4df          	and	a,#223
1090  00bf e701          	ld	(1,x),a
1091  00c1               L725:
1092                     ; 442 }
1095  00c1 85            	popw	x
1096  00c2 81            	ret
1170                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1170                     ; 454 {
1171                     	switch	.text
1172  00c3               _SPI_GetCRC:
1174  00c3 89            	pushw	x
1175  00c4 88            	push	a
1176       00000001      OFST:	set	1
1179                     ; 455   uint8_t crcreg = 0;
1181                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1183                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1185  00c5 0d06          	tnz	(OFST+5,sp)
1186  00c7 2706          	jreq	L765
1187                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1189  00c9 e607          	ld	a,(7,x)
1190  00cb 6b01          	ld	(OFST+0,sp),a
1193  00cd 2006          	jra	L175
1194  00cf               L765:
1195                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1197  00cf 1e02          	ldw	x,(OFST+1,sp)
1198  00d1 e606          	ld	a,(6,x)
1199  00d3 6b01          	ld	(OFST+0,sp),a
1201  00d5               L175:
1202                     ; 470   return crcreg;
1204  00d5 7b01          	ld	a,(OFST+0,sp)
1207  00d7 5b03          	addw	sp,#3
1208  00d9 81            	ret
1247                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1247                     ; 479 {
1248                     	switch	.text
1249  00da               _SPI_ResetCRC:
1251  00da 89            	pushw	x
1252       00000000      OFST:	set	0
1255                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1257  00db 4b01          	push	#1
1258  00dd adc3          	call	_SPI_CalculateCRCCmd
1260  00df 84            	pop	a
1261                     ; 485   SPI_Cmd(SPIx, ENABLE);
1263  00e0 4b01          	push	#1
1264  00e2 1e02          	ldw	x,(OFST+2,sp)
1265  00e4 cd004e        	call	_SPI_Cmd
1267  00e7 84            	pop	a
1268                     ; 486 }
1271  00e8 85            	popw	x
1272  00e9 81            	ret
1310                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1310                     ; 494 {
1311                     	switch	.text
1312  00ea               _SPI_GetCRCPolynomial:
1316                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1318  00ea e605          	ld	a,(5,x)
1321  00ec 81            	ret
1398                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1398                     ; 526 {
1399                     	switch	.text
1400  00ed               _SPI_DMACmd:
1402  00ed 89            	pushw	x
1403       00000000      OFST:	set	0
1406                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1408                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1410                     ; 531   if (NewState != DISABLE)
1412  00ee 0d06          	tnz	(OFST+6,sp)
1413  00f0 2708          	jreq	L376
1414                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1416  00f2 e602          	ld	a,(2,x)
1417  00f4 1a05          	or	a,(OFST+5,sp)
1418  00f6 e702          	ld	(2,x),a
1420  00f8 2009          	jra	L576
1421  00fa               L376:
1422                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1424  00fa 1e01          	ldw	x,(OFST+1,sp)
1425  00fc 7b05          	ld	a,(OFST+5,sp)
1426  00fe 43            	cpl	a
1427  00ff e402          	and	a,(2,x)
1428  0101 e702          	ld	(2,x),a
1429  0103               L576:
1430                     ; 541 }
1433  0103 85            	popw	x
1434  0104 81            	ret
1553                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1553                     ; 627 {
1554                     	switch	.text
1555  0105               _SPI_ITConfig:
1557  0105 89            	pushw	x
1558  0106 88            	push	a
1559       00000001      OFST:	set	1
1562                     ; 628   uint8_t itpos = 0;
1564                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1566                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1568                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1570  0107 7b06          	ld	a,(OFST+5,sp)
1571  0109 a40f          	and	a,#15
1572  010b 5f            	clrw	x
1573  010c 97            	ld	xl,a
1574  010d a601          	ld	a,#1
1575  010f 5d            	tnzw	x
1576  0110 2704          	jreq	L04
1577  0112               L24:
1578  0112 48            	sll	a
1579  0113 5a            	decw	x
1580  0114 26fc          	jrne	L24
1581  0116               L04:
1582  0116 6b01          	ld	(OFST+0,sp),a
1584                     ; 636   if (NewState != DISABLE)
1586  0118 0d07          	tnz	(OFST+6,sp)
1587  011a 270a          	jreq	L357
1588                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1590  011c 1e02          	ldw	x,(OFST+1,sp)
1591  011e e602          	ld	a,(2,x)
1592  0120 1a01          	or	a,(OFST+0,sp)
1593  0122 e702          	ld	(2,x),a
1595  0124 2009          	jra	L557
1596  0126               L357:
1597                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1599  0126 1e02          	ldw	x,(OFST+1,sp)
1600  0128 7b01          	ld	a,(OFST+0,sp)
1601  012a 43            	cpl	a
1602  012b e402          	and	a,(2,x)
1603  012d e702          	ld	(2,x),a
1604  012f               L557:
1605                     ; 644 }
1608  012f 5b03          	addw	sp,#3
1609  0131 81            	ret
1742                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1742                     ; 662 {
1743                     	switch	.text
1744  0132               _SPI_GetFlagStatus:
1746  0132 89            	pushw	x
1747  0133 88            	push	a
1748       00000001      OFST:	set	1
1751                     ; 663   FlagStatus status = RESET;
1753                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1755                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1757  0134 e603          	ld	a,(3,x)
1758  0136 1506          	bcp	a,(OFST+5,sp)
1759  0138 2706          	jreq	L1401
1760                     ; 670     status = SET; /* SPI_FLAG is set */
1762  013a a601          	ld	a,#1
1763  013c 6b01          	ld	(OFST+0,sp),a
1766  013e 2002          	jra	L3401
1767  0140               L1401:
1768                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1770  0140 0f01          	clr	(OFST+0,sp)
1772  0142               L3401:
1773                     ; 678   return status;
1775  0142 7b01          	ld	a,(OFST+0,sp)
1778  0144 5b03          	addw	sp,#3
1779  0146 81            	ret
1826                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1826                     ; 697 {
1827                     	switch	.text
1828  0147               _SPI_ClearFlag:
1830  0147 89            	pushw	x
1831       00000000      OFST:	set	0
1834                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1836                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1838  0148 7b05          	ld	a,(OFST+5,sp)
1839  014a 43            	cpl	a
1840  014b 1e01          	ldw	x,(OFST+1,sp)
1841  014d e703          	ld	(3,x),a
1842                     ; 701 }
1845  014f 85            	popw	x
1846  0150 81            	ret
1934                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1934                     ; 718 {
1935                     	switch	.text
1936  0151               _SPI_GetITStatus:
1938  0151 89            	pushw	x
1939  0152 5203          	subw	sp,#3
1940       00000003      OFST:	set	3
1943                     ; 719   ITStatus pendingbitstatus = RESET;
1945                     ; 720   uint8_t itpos = 0;
1947                     ; 721   uint8_t itmask1 = 0;
1949                     ; 722   uint8_t itmask2 = 0;
1951                     ; 723   __IO uint8_t enablestatus = 0;
1953  0154 0f02          	clr	(OFST-1,sp)
1955                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1957                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1959  0156 7b08          	ld	a,(OFST+5,sp)
1960  0158 a40f          	and	a,#15
1961  015a 5f            	clrw	x
1962  015b 97            	ld	xl,a
1963  015c a601          	ld	a,#1
1964  015e 5d            	tnzw	x
1965  015f 2704          	jreq	L25
1966  0161               L45:
1967  0161 48            	sll	a
1968  0162 5a            	decw	x
1969  0163 26fc          	jrne	L45
1970  0165               L25:
1971  0165 6b01          	ld	(OFST-2,sp),a
1973                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1975  0167 7b08          	ld	a,(OFST+5,sp)
1976  0169 4e            	swap	a
1977  016a a40f          	and	a,#15
1978  016c 6b03          	ld	(OFST+0,sp),a
1980                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1982  016e 7b03          	ld	a,(OFST+0,sp)
1983  0170 5f            	clrw	x
1984  0171 97            	ld	xl,a
1985  0172 a601          	ld	a,#1
1986  0174 5d            	tnzw	x
1987  0175 2704          	jreq	L65
1988  0177               L06:
1989  0177 48            	sll	a
1990  0178 5a            	decw	x
1991  0179 26fc          	jrne	L06
1992  017b               L65:
1993  017b 6b03          	ld	(OFST+0,sp),a
1995                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1997  017d 1e04          	ldw	x,(OFST+1,sp)
1998  017f e603          	ld	a,(3,x)
1999  0181 1403          	and	a,(OFST+0,sp)
2000  0183 6b02          	ld	(OFST-1,sp),a
2002                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2004  0185 1e04          	ldw	x,(OFST+1,sp)
2005  0187 e602          	ld	a,(2,x)
2006  0189 1501          	bcp	a,(OFST-2,sp)
2007  018b 270a          	jreq	L3311
2009  018d 0d02          	tnz	(OFST-1,sp)
2010  018f 2706          	jreq	L3311
2011                     ; 738     pendingbitstatus = SET;
2013  0191 a601          	ld	a,#1
2014  0193 6b03          	ld	(OFST+0,sp),a
2017  0195 2002          	jra	L5311
2018  0197               L3311:
2019                     ; 743     pendingbitstatus = RESET;
2021  0197 0f03          	clr	(OFST+0,sp)
2023  0199               L5311:
2024                     ; 746   return  pendingbitstatus;
2026  0199 7b03          	ld	a,(OFST+0,sp)
2029  019b 5b05          	addw	sp,#5
2030  019d 81            	ret
2085                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2085                     ; 765 {
2086                     	switch	.text
2087  019e               _SPI_ClearITPendingBit:
2089  019e 89            	pushw	x
2090  019f 88            	push	a
2091       00000001      OFST:	set	1
2094                     ; 766   uint8_t itpos = 0;
2096                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2098                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2100  01a0 7b06          	ld	a,(OFST+5,sp)
2101  01a2 a4f0          	and	a,#240
2102  01a4 4e            	swap	a
2103  01a5 a40f          	and	a,#15
2104  01a7 5f            	clrw	x
2105  01a8 97            	ld	xl,a
2106  01a9 a601          	ld	a,#1
2107  01ab 5d            	tnzw	x
2108  01ac 2704          	jreq	L46
2109  01ae               L66:
2110  01ae 48            	sll	a
2111  01af 5a            	decw	x
2112  01b0 26fc          	jrne	L66
2113  01b2               L46:
2114  01b2 6b01          	ld	(OFST+0,sp),a
2116                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2118  01b4 7b01          	ld	a,(OFST+0,sp)
2119  01b6 43            	cpl	a
2120  01b7 1e02          	ldw	x,(OFST+1,sp)
2121  01b9 e703          	ld	(3,x),a
2122                     ; 776 }
2125  01bb 5b03          	addw	sp,#3
2126  01bd 81            	ret
2139                     	xdef	_SPI_ClearITPendingBit
2140                     	xdef	_SPI_GetITStatus
2141                     	xdef	_SPI_ClearFlag
2142                     	xdef	_SPI_GetFlagStatus
2143                     	xdef	_SPI_ITConfig
2144                     	xdef	_SPI_DMACmd
2145                     	xdef	_SPI_GetCRCPolynomial
2146                     	xdef	_SPI_ResetCRC
2147                     	xdef	_SPI_GetCRC
2148                     	xdef	_SPI_CalculateCRCCmd
2149                     	xdef	_SPI_TransmitCRC
2150                     	xdef	_SPI_ReceiveData
2151                     	xdef	_SPI_SendData
2152                     	xdef	_SPI_BiDirectionalLineConfig
2153                     	xdef	_SPI_NSSInternalSoftwareCmd
2154                     	xdef	_SPI_Cmd
2155                     	xdef	_SPI_Init
2156                     	xdef	_SPI_DeInit
2175                     	end
