   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  77                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  77                     ; 175 {
  79                     	switch	.text
  80  0000               _FLASH_SetProgrammingTime:
  84                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  86                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  88  0000 72115050      	bres	20560,#0
  89                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  91  0004 ca5050        	or	a,20560
  92  0007 c75050        	ld	20560,a
  93                     ; 181 }
  96  000a 81            	ret
 121                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 121                     ; 189 {
 122                     	switch	.text
 123  000b               _FLASH_GetProgrammingTime:
 127                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 129  000b c65050        	ld	a,20560
 130  000e a401          	and	a,#1
 133  0010 81            	ret
 189                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 189                     ; 204 {
 190                     	switch	.text
 191  0011               _FLASH_PowerWaitModeConfig:
 195                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 197                     ; 209   if(FLASH_Power != FLASH_Power_On)
 199  0011 a101          	cp	a,#1
 200  0013 2706          	jreq	L57
 201                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 203  0015 72145050      	bset	20560,#2
 205  0019 2004          	jra	L77
 206  001b               L57:
 207                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 209  001b 72155050      	bres	20560,#2
 210  001f               L77:
 211                     ; 218 }
 214  001f 81            	ret
 237                     ; 259 void FLASH_DeInit(void)
 237                     ; 260 {
 238                     	switch	.text
 239  0020               _FLASH_DeInit:
 243                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 245  0020 725f5050      	clr	20560
 246                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 248  0024 725f5051      	clr	20561
 249                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 251  0028 35405054      	mov	20564,#64
 252                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 254  002c c65054        	ld	a,20564
 255                     ; 265 }
 258  002f 81            	ret
 314                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 314                     ; 276 {
 315                     	switch	.text
 316  0030               _FLASH_Unlock:
 318  0030 88            	push	a
 319       00000000      OFST:	set	0
 322                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 324                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 326  0031 a1fd          	cp	a,#253
 327  0033 2608          	jrne	L731
 328                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 330  0035 35565052      	mov	20562,#86
 331                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 333  0039 35ae5052      	mov	20562,#174
 334  003d               L731:
 335                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 337  003d 7b01          	ld	a,(OFST+1,sp)
 338  003f a1f7          	cp	a,#247
 339  0041 2608          	jrne	L141
 340                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 342  0043 35ae5053      	mov	20563,#174
 343                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 345  0047 35565053      	mov	20563,#86
 346  004b               L141:
 347                     ; 293 }
 350  004b 84            	pop	a
 351  004c 81            	ret
 386                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 386                     ; 304 {
 387                     	switch	.text
 388  004d               _FLASH_Lock:
 392                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 394                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 396  004d c45054        	and	a,20564
 397  0050 c75054        	ld	20564,a
 398                     ; 310 }
 401  0053 81            	ret
 440                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 440                     ; 319 {
 441                     	switch	.text
 442  0054               _FLASH_ProgramByte:
 444       00000000      OFST:	set	0
 447                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 449                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 451  0054 7b07          	ld	a,(OFST+7,sp)
 452  0056 1e05          	ldw	x,(OFST+5,sp)
 453  0058 f7            	ld	(x),a
 454                     ; 324 }
 457  0059 81            	ret
 489                     ; 331 void FLASH_EraseByte(uint32_t Address)
 489                     ; 332 {
 490                     	switch	.text
 491  005a               _FLASH_EraseByte:
 493       00000000      OFST:	set	0
 496                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 498                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 500  005a 1e05          	ldw	x,(OFST+5,sp)
 501  005c 7f            	clr	(x)
 502                     ; 337 }
 505  005d 81            	ret
 544                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 544                     ; 346 {
 545                     	switch	.text
 546  005e               _FLASH_ProgramWord:
 548       00000000      OFST:	set	0
 551                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 553                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 555  005e 721c5051      	bset	20561,#6
 556                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 558  0062 7b07          	ld	a,(OFST+7,sp)
 559  0064 1e05          	ldw	x,(OFST+5,sp)
 560  0066 f7            	ld	(x),a
 561                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 563  0067 7b08          	ld	a,(OFST+8,sp)
 564  0069 1e05          	ldw	x,(OFST+5,sp)
 565  006b e701          	ld	(1,x),a
 566                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 568  006d 7b09          	ld	a,(OFST+9,sp)
 569  006f 1e05          	ldw	x,(OFST+5,sp)
 570  0071 e702          	ld	(2,x),a
 571                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 573  0073 7b0a          	ld	a,(OFST+10,sp)
 574  0075 1e05          	ldw	x,(OFST+5,sp)
 575  0077 e703          	ld	(3,x),a
 576                     ; 360 }
 579  0079 81            	ret
 611                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 611                     ; 368 {
 612                     	switch	.text
 613  007a               _FLASH_ReadByte:
 615       00000000      OFST:	set	0
 618                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 620  007a 1e05          	ldw	x,(OFST+5,sp)
 621  007c f6            	ld	a,(x)
 624  007d 81            	ret
 665                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 665                     ; 418 {
 666                     	switch	.text
 667  007e               _FLASH_ProgramOptionByte:
 669  007e 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 675                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 677  007f 721e5051      	bset	20561,#7
 678                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 680  0083 7b05          	ld	a,(OFST+5,sp)
 681  0085 1e01          	ldw	x,(OFST+1,sp)
 682  0087 f7            	ld	(x),a
 683                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 685  0088 a6fd          	ld	a,#253
 686  008a cd01cb        	call	_FLASH_WaitForLastOperation
 688                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 690  008d 721f5051      	bres	20561,#7
 691                     ; 432 }
 694  0091 85            	popw	x
 695  0092 81            	ret
 729                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 729                     ; 440 {
 730                     	switch	.text
 731  0093               _FLASH_EraseOptionByte:
 735                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 737                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 739  0093 721e5051      	bset	20561,#7
 740                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 742  0097 7f            	clr	(x)
 743                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 745  0098 a6fd          	ld	a,#253
 746  009a cd01cb        	call	_FLASH_WaitForLastOperation
 748                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 750  009d 721f5051      	bres	20561,#7
 751                     ; 454 }
 754  00a1 81            	ret
 811                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 811                     ; 463 {
 812                     	switch	.text
 813  00a2               _FLASH_GetReadOutProtectionStatus:
 815  00a2 88            	push	a
 816       00000001      OFST:	set	1
 819                     ; 464   FunctionalState state = DISABLE;
 821                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 823  00a3 c64800        	ld	a,18432
 824  00a6 a1aa          	cp	a,#170
 825  00a8 2606          	jrne	L523
 826                     ; 469     state =  ENABLE;
 828  00aa a601          	ld	a,#1
 829  00ac 6b01          	ld	(OFST+0,sp),a
 832  00ae 2002          	jra	L723
 833  00b0               L523:
 834                     ; 474     state =  DISABLE;
 836  00b0 0f01          	clr	(OFST+0,sp)
 838  00b2               L723:
 839                     ; 477   return state;
 841  00b2 7b01          	ld	a,(OFST+0,sp)
 844  00b4 5b01          	addw	sp,#1
 845  00b6 81            	ret
 877                     ; 485 uint16_t FLASH_GetBootSize(void)
 877                     ; 486 {
 878                     	switch	.text
 879  00b7               _FLASH_GetBootSize:
 881  00b7 89            	pushw	x
 882       00000002      OFST:	set	2
 885                     ; 487   uint16_t temp = 0;
 887                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 889  00b8 c64802        	ld	a,18434
 890  00bb 5f            	clrw	x
 891  00bc 97            	ld	xl,a
 892  00bd 4f            	clr	a
 893  00be 02            	rlwa	x,a
 894  00bf 44            	srl	a
 895  00c0 56            	rrcw	x
 896  00c1 1f01          	ldw	(OFST-1,sp),x
 898                     ; 493   if(OPT->UBC > 0x7F)
 900  00c3 c64802        	ld	a,18434
 901  00c6 a180          	cp	a,#128
 902  00c8 2505          	jrult	L543
 903                     ; 495     temp = 8192;
 905  00ca ae2000        	ldw	x,#8192
 906  00cd 1f01          	ldw	(OFST-1,sp),x
 908  00cf               L543:
 909                     ; 499   return(temp);
 911  00cf 1e01          	ldw	x,(OFST-1,sp)
 914  00d1 5b02          	addw	sp,#2
 915  00d3 81            	ret
 947                     ; 508 uint16_t FLASH_GetCodeSize(void)
 947                     ; 509 {
 948                     	switch	.text
 949  00d4               _FLASH_GetCodeSize:
 951  00d4 89            	pushw	x
 952       00000002      OFST:	set	2
 955                     ; 510   uint16_t temp = 0;
 957                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 959  00d5 c64807        	ld	a,18439
 960  00d8 5f            	clrw	x
 961  00d9 97            	ld	xl,a
 962  00da 4f            	clr	a
 963  00db 02            	rlwa	x,a
 964  00dc 44            	srl	a
 965  00dd 56            	rrcw	x
 966  00de 1f01          	ldw	(OFST-1,sp),x
 968                     ; 516   if(OPT->PCODESIZE > 0x7F)
 970  00e0 c64807        	ld	a,18439
 971  00e3 a180          	cp	a,#128
 972  00e5 2505          	jrult	L363
 973                     ; 518     temp = 8192;
 975  00e7 ae2000        	ldw	x,#8192
 976  00ea 1f01          	ldw	(OFST-1,sp),x
 978  00ec               L363:
 979                     ; 522   return(temp);
 981  00ec 1e01          	ldw	x,(OFST-1,sp)
 984  00ee 5b02          	addw	sp,#2
 985  00f0 81            	ret
1020                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1020                     ; 548 {
1021                     	switch	.text
1022  00f1               _FLASH_ITConfig:
1026                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1028                     ; 552   if(NewState != DISABLE)
1030  00f1 4d            	tnz	a
1031  00f2 2706          	jreq	L304
1032                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1034  00f4 72125050      	bset	20560,#1
1036  00f8 2004          	jra	L504
1037  00fa               L304:
1038                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1040  00fa 72135050      	bres	20560,#1
1041  00fe               L504:
1042                     ; 562 }
1045  00fe 81            	ret
1154                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1154                     ; 577 {
1155                     	switch	.text
1156  00ff               _FLASH_GetFlagStatus:
1158  00ff 88            	push	a
1159       00000001      OFST:	set	1
1162                     ; 578   FlagStatus status = RESET;
1164                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1166                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1168  0100 c45054        	and	a,20564
1169  0103 2706          	jreq	L754
1170                     ; 584     status = SET; /* Flash_FLAG is set*/
1172  0105 a601          	ld	a,#1
1173  0107 6b01          	ld	(OFST+0,sp),a
1176  0109 2002          	jra	L164
1177  010b               L754:
1178                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1180  010b 0f01          	clr	(OFST+0,sp)
1182  010d               L164:
1183                     ; 592   return status;
1185  010d 7b01          	ld	a,(OFST+0,sp)
1188  010f 5b01          	addw	sp,#1
1189  0111 81            	ret
1225                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1225                     ; 720 {
1226                     	switch	.text
1227  0112               _FLASH_PowerRunModeConfig:
1231                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1233                     ; 724   if(FLASH_Power != FLASH_Power_On)
1235  0112 a101          	cp	a,#1
1236  0114 2706          	jreq	L105
1237                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1239  0116 72165050      	bset	20560,#3
1241  011a 2004          	jra	L305
1242  011c               L105:
1243                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1245  011c 72175050      	bres	20560,#3
1246  0120               L305:
1247                     ; 732 }
1250  0120 81            	ret
1314                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1314                     ; 746 {
1315                     	switch	.text
1316  0121               _FLASH_GetPowerStatus:
1320                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1322  0121 c65050        	ld	a,20560
1323  0124 a40c          	and	a,#12
1326  0126 81            	ret
1424                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1424                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1424                     ; 767 {
1425                     	switch	.text
1426  0127               _FLASH_ProgramBlock:
1428  0127 89            	pushw	x
1429  0128 5206          	subw	sp,#6
1430       00000006      OFST:	set	6
1433                     ; 768   uint16_t Count = 0;
1435                     ; 769   uint32_t startaddress = 0;
1437                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1439                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1441                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1443  012a 7b0b          	ld	a,(OFST+5,sp)
1444  012c a1fd          	cp	a,#253
1445  012e 260c          	jrne	L575
1446                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1448                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1450  0130 ae8000        	ldw	x,#32768
1451  0133 1f03          	ldw	(OFST-3,sp),x
1452  0135 ae0000        	ldw	x,#0
1453  0138 1f01          	ldw	(OFST-5,sp),x
1456  013a 200a          	jra	L775
1457  013c               L575:
1458                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1460                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1462  013c ae1000        	ldw	x,#4096
1463  013f 1f03          	ldw	(OFST-3,sp),x
1464  0141 ae0000        	ldw	x,#0
1465  0144 1f01          	ldw	(OFST-5,sp),x
1467  0146               L775:
1468                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1470  0146 1e07          	ldw	x,(OFST+1,sp)
1471  0148 a640          	ld	a,#64
1472  014a cd0000        	call	c_cmulx
1474  014d 96            	ldw	x,sp
1475  014e 1c0001        	addw	x,#OFST-5
1476  0151 cd0000        	call	c_lgadd
1479                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1481  0154 0d0c          	tnz	(OFST+6,sp)
1482  0156 2606          	jrne	L106
1483                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1485  0158 72105051      	bset	20561,#0
1487  015c 2004          	jra	L306
1488  015e               L106:
1489                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1491  015e 72185051      	bset	20561,#4
1492  0162               L306:
1493                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1495  0162 5f            	clrw	x
1496  0163 1f05          	ldw	(OFST-1,sp),x
1498  0165               L506:
1499                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1501  0165 1e0d          	ldw	x,(OFST+7,sp)
1502  0167 72fb05        	addw	x,(OFST-1,sp)
1503  016a f6            	ld	a,(x)
1504  016b 1e03          	ldw	x,(OFST-3,sp)
1505  016d 72fb05        	addw	x,(OFST-1,sp)
1506  0170 f7            	ld	(x),a
1507                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1509  0171 1e05          	ldw	x,(OFST-1,sp)
1510  0173 1c0001        	addw	x,#1
1511  0176 1f05          	ldw	(OFST-1,sp),x
1515  0178 1e05          	ldw	x,(OFST-1,sp)
1516  017a a30040        	cpw	x,#64
1517  017d 25e6          	jrult	L506
1518                     ; 805 }
1521  017f 5b08          	addw	sp,#8
1522  0181 81            	ret
1581                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1581                     ; 818 {
1582                     	switch	.text
1583  0182               _FLASH_EraseBlock:
1585  0182 89            	pushw	x
1586  0183 5206          	subw	sp,#6
1587       00000006      OFST:	set	6
1590                     ; 819   uint32_t startaddress = 0;
1592                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1594                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1596  0185 7b0b          	ld	a,(OFST+5,sp)
1597  0187 a1fd          	cp	a,#253
1598  0189 260c          	jrne	L146
1599                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1601                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1603  018b ae8000        	ldw	x,#32768
1604  018e 1f05          	ldw	(OFST-1,sp),x
1605  0190 ae0000        	ldw	x,#0
1606  0193 1f03          	ldw	(OFST-3,sp),x
1609  0195 200a          	jra	L346
1610  0197               L146:
1611                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1613                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1615  0197 ae1000        	ldw	x,#4096
1616  019a 1f05          	ldw	(OFST-1,sp),x
1617  019c ae0000        	ldw	x,#0
1618  019f 1f03          	ldw	(OFST-3,sp),x
1620  01a1               L346:
1621                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1623  01a1 1e07          	ldw	x,(OFST+1,sp)
1624  01a3 a640          	ld	a,#64
1625  01a5 cd0000        	call	c_cmulx
1627  01a8 96            	ldw	x,sp
1628  01a9 1c0003        	addw	x,#OFST-3
1629  01ac cd0000        	call	c_ladd
1631  01af be02          	ldw	x,c_lreg+2
1632  01b1 1f01          	ldw	(OFST-5,sp),x
1634                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1636  01b3 721a5051      	bset	20561,#5
1637                     ; 855     *pwFlash = (uint32_t)0;  
1639  01b7 1e01          	ldw	x,(OFST-5,sp)
1640  01b9 a600          	ld	a,#0
1641  01bb e703          	ld	(3,x),a
1642  01bd a600          	ld	a,#0
1643  01bf e702          	ld	(2,x),a
1644  01c1 a600          	ld	a,#0
1645  01c3 e701          	ld	(1,x),a
1646  01c5 a600          	ld	a,#0
1647  01c7 f7            	ld	(x),a
1648                     ; 863 }
1651  01c8 5b08          	addw	sp,#8
1652  01ca 81            	ret
1733                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1733                     ; 876 {
1734                     	switch	.text
1735  01cb               _FLASH_WaitForLastOperation:
1737  01cb 5203          	subw	sp,#3
1738       00000003      OFST:	set	3
1741                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1743  01cd aeffff        	ldw	x,#65535
1744  01d0 1f01          	ldw	(OFST-2,sp),x
1746                     ; 878   uint8_t flagstatus = 0x00;
1748  01d2 0f03          	clr	(OFST+0,sp)
1750                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1752  01d4 a1fd          	cp	a,#253
1753  01d6 2628          	jrne	L717
1755  01d8 200e          	jra	L507
1756  01da               L307:
1757                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1757                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1759  01da c65054        	ld	a,20564
1760  01dd a405          	and	a,#5
1761  01df 6b03          	ld	(OFST+0,sp),a
1763                     ; 887       timeout--;
1765  01e1 1e01          	ldw	x,(OFST-2,sp)
1766  01e3 1d0001        	subw	x,#1
1767  01e6 1f01          	ldw	(OFST-2,sp),x
1769  01e8               L507:
1770                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1772  01e8 0d03          	tnz	(OFST+0,sp)
1773  01ea 261c          	jrne	L317
1775  01ec 1e01          	ldw	x,(OFST-2,sp)
1776  01ee 26ea          	jrne	L307
1777  01f0 2016          	jra	L317
1778  01f2               L517:
1779                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1779                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1781  01f2 c65054        	ld	a,20564
1782  01f5 a441          	and	a,#65
1783  01f7 6b03          	ld	(OFST+0,sp),a
1785                     ; 896       timeout--;
1787  01f9 1e01          	ldw	x,(OFST-2,sp)
1788  01fb 1d0001        	subw	x,#1
1789  01fe 1f01          	ldw	(OFST-2,sp),x
1791  0200               L717:
1792                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1794  0200 0d03          	tnz	(OFST+0,sp)
1795  0202 2604          	jrne	L317
1797  0204 1e01          	ldw	x,(OFST-2,sp)
1798  0206 26ea          	jrne	L517
1799  0208               L317:
1800                     ; 900   if(timeout == 0x00)
1802  0208 1e01          	ldw	x,(OFST-2,sp)
1803  020a 2604          	jrne	L527
1804                     ; 902     flagstatus = FLASH_Status_TimeOut;
1806  020c a602          	ld	a,#2
1807  020e 6b03          	ld	(OFST+0,sp),a
1809  0210               L527:
1810                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1812  0210 7b03          	ld	a,(OFST+0,sp)
1815  0212 5b03          	addw	sp,#3
1816  0214 81            	ret
1829                     	xdef	_FLASH_WaitForLastOperation
1830                     	xdef	_FLASH_EraseBlock
1831                     	xdef	_FLASH_ProgramBlock
1832                     	xdef	_FLASH_GetPowerStatus
1833                     	xdef	_FLASH_PowerRunModeConfig
1834                     	xdef	_FLASH_GetFlagStatus
1835                     	xdef	_FLASH_ITConfig
1836                     	xdef	_FLASH_EraseOptionByte
1837                     	xdef	_FLASH_ProgramOptionByte
1838                     	xdef	_FLASH_GetReadOutProtectionStatus
1839                     	xdef	_FLASH_GetCodeSize
1840                     	xdef	_FLASH_GetBootSize
1841                     	xdef	_FLASH_ReadByte
1842                     	xdef	_FLASH_ProgramWord
1843                     	xdef	_FLASH_EraseByte
1844                     	xdef	_FLASH_ProgramByte
1845                     	xdef	_FLASH_Lock
1846                     	xdef	_FLASH_Unlock
1847                     	xdef	_FLASH_DeInit
1848                     	xdef	_FLASH_PowerWaitModeConfig
1849                     	xdef	_FLASH_SetProgrammingTime
1850                     	xdef	_FLASH_GetProgrammingTime
1851                     	xref.b	c_lreg
1870                     	xref	c_ladd
1871                     	xref	c_lgadd
1872                     	xref	c_cmulx
1873                     	end
