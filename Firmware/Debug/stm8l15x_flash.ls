   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  18                     ; 175 {
  19                     	scross	off
  20  0000               _FLASH_SetProgrammingTime:
  22                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  23                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  24  0000 72115050      	bres	20560,#0
  25                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  26  0004 ca5050        	or	a,20560
  27  0007 c75050        	ld	20560,a
  28                     ; 181 }
  29  000a 81            	ret	
  31                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
  31                     ; 189 {
  32  000b               _FLASH_GetProgrammingTime:
  34                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
  35  000b c65050        	ld	a,20560
  36  000e a401          	and	a,#1
  38  0010 81            	ret	
  40                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
  40                     ; 204 {
  41  0011               _FLASH_PowerWaitModeConfig:
  43                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
  44                     ; 209   if(FLASH_Power != FLASH_Power_On)
  45  0011 4a            	dec	a
  46  0012 2705          	jreq	L3
  47                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
  48  0014 72145050      	bset	20560,#2
  50  0018 81            	ret	
  51  0019               L3:
  52                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
  53  0019 72155050      	bres	20560,#2
  54                     ; 218 }
  55  001d 81            	ret	
  57                     ; 259 void FLASH_DeInit(void)
  57                     ; 260 {
  58  001e               _FLASH_DeInit:
  60                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
  61  001e 725f5050      	clr	20560
  62                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
  63  0022 725f5051      	clr	20561
  64                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
  65  0026 35405054      	mov	20564,#64
  66                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
  67  002a c65054        	ld	a,20564
  68                     ; 265 }
  69  002d 81            	ret	
  71                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  71                     ; 276 {
  72  002e               _FLASH_Unlock:
  73       00000000      OFST:	set	0
  75                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
  76                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
  77  002e a1fd          	cp	a,#253
  78  0030 2608          	jrne	L7
  79                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
  80  0032 35565052      	mov	20562,#86
  81                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
  82  0036 35ae5052      	mov	20562,#174
  83  003a               L7:
  84                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
  85  003a a1f7          	cp	a,#247
  86  003c 2608          	jrne	L11
  87                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  88  003e 35ae5053      	mov	20563,#174
  89                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
  90  0042 35565053      	mov	20563,#86
  91  0046               L11:
  92                     ; 293 }
  93  0046 81            	ret	
  95                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
  95                     ; 304 {
  96  0047               _FLASH_Lock:
  98                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
  99                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 100  0047 c45054        	and	a,20564
 101  004a c75054        	ld	20564,a
 102                     ; 310 }
 103  004d 81            	ret	
 105                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 105                     ; 319 {
 106  004e               _FLASH_ProgramByte:
 107       00000000      OFST:	set	0
 109                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 110                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 111  004e 1e05          	ldw	x,(OFST+5,sp)
 112  0050 7b07          	ld	a,(OFST+7,sp)
 113  0052 f7            	ld	(x),a
 114                     ; 324 }
 115  0053 81            	ret	
 117                     ; 331 void FLASH_EraseByte(uint32_t Address)
 117                     ; 332 {
 118  0054               _FLASH_EraseByte:
 119       00000000      OFST:	set	0
 121                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 122                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 123  0054 1e05          	ldw	x,(OFST+5,sp)
 124  0056 7f            	clr	(x)
 125                     ; 337 }
 126  0057 81            	ret	
 128                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 128                     ; 346 {
 129  0058               _FLASH_ProgramWord:
 130       00000000      OFST:	set	0
 132                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 133                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 134  0058 721c5051      	bset	20561,#6
 135                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 136  005c 1e05          	ldw	x,(OFST+5,sp)
 137  005e 7b07          	ld	a,(OFST+7,sp)
 138  0060 f7            	ld	(x),a
 139                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 140  0061 7b08          	ld	a,(OFST+8,sp)
 141  0063 e701          	ld	(1,x),a
 142                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 143  0065 7b09          	ld	a,(OFST+9,sp)
 144  0067 e702          	ld	(2,x),a
 145                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 146  0069 7b0a          	ld	a,(OFST+10,sp)
 147  006b e703          	ld	(3,x),a
 148                     ; 360 }
 149  006d 81            	ret	
 151                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 151                     ; 368 {
 152  006e               _FLASH_ReadByte:
 153       00000000      OFST:	set	0
 155                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 156  006e 1e05          	ldw	x,(OFST+5,sp)
 157  0070 f6            	ld	a,(x)
 159  0071 81            	ret	
 161                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 161                     ; 418 {
 162  0072               _FLASH_ProgramOptionByte:
 163  0072 89            	pushw	x
 164       00000000      OFST:	set	0
 166                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 167                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 168  0073 721e5051      	bset	20561,#7
 169                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 170  0077 7b05          	ld	a,(OFST+5,sp)
 171  0079 f7            	ld	(x),a
 172                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 173  007a a6fd          	ld	a,#253
 174  007c cd0173        	call	_FLASH_WaitForLastOperation
 176                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 177  007f 721f5051      	bres	20561,#7
 178                     ; 432 }
 179  0083 85            	popw	x
 180  0084 81            	ret	
 182                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 182                     ; 440 {
 183  0085               _FLASH_EraseOptionByte:
 185                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 186                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 187  0085 721e5051      	bset	20561,#7
 188                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 189  0089 7f            	clr	(x)
 190                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 191  008a a6fd          	ld	a,#253
 192  008c cd0173        	call	_FLASH_WaitForLastOperation
 194                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 195  008f 721f5051      	bres	20561,#7
 196                     ; 454 }
 197  0093 81            	ret	
 199                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 199                     ; 463 {
 200  0094               _FLASH_GetReadOutProtectionStatus:
 201       00000001      OFST:	set	1
 203                     ; 464   FunctionalState state = DISABLE;
 204                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 205  0094 c64800        	ld	a,18432
 206  0097 a1aa          	cp	a,#170
 207  0099 2603          	jrne	L31
 208                     ; 469     state =  ENABLE;
 209  009b a601          	ld	a,#1
 211  009d 81            	ret	
 212  009e               L31:
 213                     ; 474     state =  DISABLE;
 214  009e 4f            	clr	a
 215                     ; 477   return state;
 217  009f 81            	ret	
 219                     ; 485 uint16_t FLASH_GetBootSize(void)
 219                     ; 486 {
 220  00a0               _FLASH_GetBootSize:
 221       00000002      OFST:	set	2
 223                     ; 487   uint16_t temp = 0;
 224                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 225  00a0 c64802        	ld	a,18434
 226  00a3 5f            	clrw	x
 227  00a4 97            	ld	xl,a
 228  00a5 4f            	clr	a
 229  00a6 02            	rlwa	x,a
 230  00a7 44            	srl	a
 231  00a8 56            	rrcw	x
 232                     ; 493   if(OPT->UBC > 0x7F)
 233  00a9 c64802        	ld	a,18434
 234  00ac a180          	cp	a,#128
 235  00ae 2503          	jrult	L71
 236                     ; 495     temp = 8192;
 237  00b0 ae2000        	ldw	x,#8192
 238  00b3               L71:
 239                     ; 499   return(temp);
 241  00b3 81            	ret	
 243                     ; 508 uint16_t FLASH_GetCodeSize(void)
 243                     ; 509 {
 244  00b4               _FLASH_GetCodeSize:
 245       00000002      OFST:	set	2
 247                     ; 510   uint16_t temp = 0;
 248                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 249  00b4 c64807        	ld	a,18439
 250  00b7 5f            	clrw	x
 251  00b8 97            	ld	xl,a
 252  00b9 4f            	clr	a
 253  00ba 02            	rlwa	x,a
 254  00bb 44            	srl	a
 255  00bc 56            	rrcw	x
 256                     ; 516   if(OPT->PCODESIZE > 0x7F)
 257  00bd c64807        	ld	a,18439
 258  00c0 a180          	cp	a,#128
 259  00c2 2503          	jrult	L12
 260                     ; 518     temp = 8192;
 261  00c4 ae2000        	ldw	x,#8192
 262  00c7               L12:
 263                     ; 522   return(temp);
 265  00c7 81            	ret	
 267                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
 267                     ; 548 {
 268  00c8               _FLASH_ITConfig:
 270                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
 271                     ; 552   if(NewState != DISABLE)
 272  00c8 4d            	tnz	a
 273  00c9 2705          	jreq	L32
 274                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
 275  00cb 72125050      	bset	20560,#1
 277  00cf 81            	ret	
 278  00d0               L32:
 279                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
 280  00d0 72135050      	bres	20560,#1
 281                     ; 562 }
 282  00d4 81            	ret	
 284                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 284                     ; 577 {
 285  00d5               _FLASH_GetFlagStatus:
 286       00000001      OFST:	set	1
 288                     ; 578   FlagStatus status = RESET;
 289                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 290                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 291  00d5 c45054        	and	a,20564
 292  00d8 2702          	jreq	L72
 293                     ; 584     status = SET; /* Flash_FLAG is set*/
 294  00da a601          	ld	a,#1
 296  00dc               L72:
 297                     ; 588     status = RESET; /* Flash_FLAG is reset*/
 298                     ; 592   return status;
 300  00dc 81            	ret	
 302                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
 302                     ; 720 {
 303  00dd               _FLASH_PowerRunModeConfig:
 305                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
 306                     ; 724   if(FLASH_Power != FLASH_Power_On)
 307  00dd 4a            	dec	a
 308  00de 2705          	jreq	L33
 309                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
 310  00e0 72165050      	bset	20560,#3
 312  00e4 81            	ret	
 313  00e5               L33:
 314                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
 315  00e5 72175050      	bres	20560,#3
 316                     ; 732 }
 317  00e9 81            	ret	
 319                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
 319                     ; 746 {
 320  00ea               _FLASH_GetPowerStatus:
 322                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
 323  00ea c65050        	ld	a,20560
 324  00ed a40c          	and	a,#12
 326  00ef 81            	ret	
 328                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
 328                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
 328                     ; 767 {
 329  00f0               _FLASH_ProgramBlock:
 330  00f0 89            	pushw	x
 331  00f1 5206          	subw	sp,#6
 332       00000006      OFST:	set	6
 334                     ; 768   uint16_t Count = 0;
 335                     ; 769   uint32_t startaddress = 0;
 336                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 337                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
 338                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
 339  00f3 7b0b          	ld	a,(OFST+5,sp)
 340  00f5 a1fd          	cp	a,#253
 341  00f7 2605          	jrne	L73
 342                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
 343                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
 344  00f9 ae8000        	ldw	x,#32768
 346  00fc 2003          	jra	L14
 347  00fe               L73:
 348                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
 349                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
 350  00fe ae1000        	ldw	x,#4096
 351  0101               L14:
 352  0101 1f03          	ldw	(OFST-3,sp),x
 353  0103 5f            	clrw	x
 354  0104 1f01          	ldw	(OFST-5,sp),x
 355                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
 356  0106 a640          	ld	a,#64
 357  0108 1e07          	ldw	x,(OFST+1,sp)
 358  010a cd0000        	call	c_cmulx
 360  010d 96            	ldw	x,sp
 361  010e 5c            	incw	x
 362  010f cd0000        	call	c_lgadd
 364                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
 365  0112 7b0c          	ld	a,(OFST+6,sp)
 366  0114 2606          	jrne	L34
 367                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
 368  0116 72105051      	bset	20561,#0
 370  011a 2004          	jra	L54
 371  011c               L34:
 372                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
 373  011c 72185051      	bset	20561,#4
 374  0120               L54:
 375                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 376  0120 5f            	clrw	x
 377  0121 1f05          	ldw	(OFST-1,sp),x
 378  0123               L74:
 379                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
 380  0123 1e0d          	ldw	x,(OFST+7,sp)
 381  0125 72fb05        	addw	x,(OFST-1,sp)
 382  0128 f6            	ld	a,(x)
 383  0129 1e03          	ldw	x,(OFST-3,sp)
 384  012b 72fb05        	addw	x,(OFST-1,sp)
 385  012e f7            	ld	(x),a
 386                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 387  012f 1e05          	ldw	x,(OFST-1,sp)
 388  0131 5c            	incw	x
 389  0132 1f05          	ldw	(OFST-1,sp),x
 391  0134 a30040        	cpw	x,#64
 392  0137 25ea          	jrult	L74
 393                     ; 805 }
 394  0139 5b08          	addw	sp,#8
 395  013b 81            	ret	
 397                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
 397                     ; 818 {
 398  013c               _FLASH_EraseBlock:
 399  013c 89            	pushw	x
 400  013d 5206          	subw	sp,#6
 401       00000006      OFST:	set	6
 403                     ; 819   uint32_t startaddress = 0;
 404                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 405                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
 406  013f 7b0b          	ld	a,(OFST+5,sp)
 407  0141 a1fd          	cp	a,#253
 408  0143 2605          	jrne	L55
 409                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
 410                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
 411  0145 ae8000        	ldw	x,#32768
 413  0148 2003          	jra	L75
 414  014a               L55:
 415                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
 416                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
 417  014a ae1000        	ldw	x,#4096
 418  014d               L75:
 419  014d 1f05          	ldw	(OFST-1,sp),x
 420  014f 5f            	clrw	x
 421  0150 1f03          	ldw	(OFST-3,sp),x
 422                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
 423  0152 a640          	ld	a,#64
 424  0154 1e07          	ldw	x,(OFST+1,sp)
 425  0156 cd0000        	call	c_cmulx
 427  0159 96            	ldw	x,sp
 428  015a 1c0003        	addw	x,#OFST-3
 429  015d cd0000        	call	c_ladd
 431  0160 be02          	ldw	x,c_lreg+2
 432  0162 1f01          	ldw	(OFST-5,sp),x
 433                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
 434  0164 721a5051      	bset	20561,#5
 435                     ; 855     *pwFlash = (uint32_t)0;  
 436  0168 4f            	clr	a
 437  0169 e703          	ld	(3,x),a
 438  016b e702          	ld	(2,x),a
 439  016d e701          	ld	(1,x),a
 440  016f f7            	ld	(x),a
 441                     ; 863 }
 442  0170 5b08          	addw	sp,#8
 443  0172 81            	ret	
 445                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
 445                     ; 876 {
 446  0173               _FLASH_WaitForLastOperation:
 447  0173 5203          	subw	sp,#3
 448       00000003      OFST:	set	3
 450                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
 451  0175 aeffff        	ldw	x,#65535
 452  0178 1f01          	ldw	(OFST-2,sp),x
 453                     ; 878   uint8_t flagstatus = 0x00;
 454  017a 0f03          	clr	(OFST+0,sp)
 455                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
 456  017c a1fd          	cp	a,#253
 457  017e 2620          	jrne	L77
 459  0180 200a          	jra	L56
 460  0182               L36:
 461                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
 461                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
 462  0182 c65054        	ld	a,20564
 463  0185 a405          	and	a,#5
 464  0187 6b03          	ld	(OFST+0,sp),a
 465                     ; 887       timeout--;
 466  0189 5a            	decw	x
 467  018a 1f01          	ldw	(OFST-2,sp),x
 468  018c               L56:
 469                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
 470  018c 7b03          	ld	a,(OFST+0,sp)
 471  018e 2618          	jrne	L37
 473  0190 1e01          	ldw	x,(OFST-2,sp)
 474  0192 26ee          	jrne	L36
 475  0194 2012          	jra	L37
 476  0196               L57:
 477                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
 477                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
 478  0196 c65054        	ld	a,20564
 479  0199 a441          	and	a,#65
 480  019b 6b03          	ld	(OFST+0,sp),a
 481                     ; 896       timeout--;
 482  019d 5a            	decw	x
 483  019e 1f01          	ldw	(OFST-2,sp),x
 484  01a0               L77:
 485                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
 486  01a0 7b03          	ld	a,(OFST+0,sp)
 487  01a2 2604          	jrne	L37
 489  01a4 1e01          	ldw	x,(OFST-2,sp)
 490  01a6 26ee          	jrne	L57
 491  01a8               L37:
 492                     ; 900   if(timeout == 0x00)
 493  01a8 1e01          	ldw	x,(OFST-2,sp)
 494  01aa 2602          	jrne	L501
 495                     ; 902     flagstatus = FLASH_Status_TimeOut;
 496  01ac a602          	ld	a,#2
 497  01ae               L501:
 498                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
 500  01ae 5b03          	addw	sp,#3
 501  01b0 81            	ret	
 503                     	xdef	_FLASH_WaitForLastOperation
 504                     	xdef	_FLASH_EraseBlock
 505                     	xdef	_FLASH_ProgramBlock
 506                     	xdef	_FLASH_GetPowerStatus
 507                     	xdef	_FLASH_PowerRunModeConfig
 508                     	xdef	_FLASH_GetFlagStatus
 509                     	xdef	_FLASH_ITConfig
 510                     	xdef	_FLASH_EraseOptionByte
 511                     	xdef	_FLASH_ProgramOptionByte
 512                     	xdef	_FLASH_GetReadOutProtectionStatus
 513                     	xdef	_FLASH_GetCodeSize
 514                     	xdef	_FLASH_GetBootSize
 515                     	xdef	_FLASH_ReadByte
 516                     	xdef	_FLASH_ProgramWord
 517                     	xdef	_FLASH_EraseByte
 518                     	xdef	_FLASH_ProgramByte
 519                     	xdef	_FLASH_Lock
 520                     	xdef	_FLASH_Unlock
 521                     	xdef	_FLASH_DeInit
 522                     	xdef	_FLASH_PowerWaitModeConfig
 523                     	xdef	_FLASH_SetProgrammingTime
 524                     	xdef	_FLASH_GetProgrammingTime
 525                     	xref.b	c_lreg
 526                     	xref	c_ladd
 527                     	xref	c_lgadd
 528                     	xref	c_cmulx
 529                     	end
