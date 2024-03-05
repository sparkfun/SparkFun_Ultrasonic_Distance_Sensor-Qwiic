   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 140 void DMA_GlobalDeInit(void)
  18                     ; 141 {
  19                     	scross	off
  20  0000               _DMA_GlobalDeInit:
  22                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  23  0000 72115070      	bres	20592,#0
  24                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  25  0004 35fc5070      	mov	20592,#252
  26                     ; 147 }
  27  0008 81            	ret	
  29                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
  29                     ; 156 {
  30  0009               _DMA_DeInit:
  31  0009 89            	pushw	x
  32       00000000      OFST:	set	0
  34                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
  35                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
  36  000a f6            	ld	a,(x)
  37  000b a4fe          	and	a,#254
  38  000d f7            	ld	(x),a
  39                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
  40  000e 7f            	clr	(x)
  41                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
  42  000f 6f02          	clr	(2,x)
  43                     ; 170   if (DMA_Channelx == DMA1_Channel3)
  44  0011 a35093        	cpw	x,#20627
  45  0014 2608          	jrne	L3
  46                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
  47  0016 a640          	ld	a,#64
  48  0018 e703          	ld	(3,x),a
  49                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
  50  001a 6f05          	clr	(5,x)
  52  001c 2004          	jra	L5
  53  001e               L3:
  54                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
  55  001e a652          	ld	a,#82
  56  0020 e703          	ld	(3,x),a
  57  0022               L5:
  58                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
  59  0022 1e01          	ldw	x,(OFST+1,sp)
  60  0024 6f04          	clr	(4,x)
  61                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
  62  0026 6f06          	clr	(6,x)
  63                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
  64  0028 6f07          	clr	(7,x)
  65                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
  66  002a 6f01          	clr	(1,x)
  67                     ; 187 }
  68  002c 85            	popw	x
  69  002d 81            	ret	
  71                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
  71                     ; 225               uint32_t DMA_Memory0BaseAddr,
  71                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
  71                     ; 227               uint8_t DMA_BufferSize,
  71                     ; 228               DMA_DIR_TypeDef DMA_DIR,
  71                     ; 229               DMA_Mode_TypeDef DMA_Mode,
  71                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
  71                     ; 231               DMA_Priority_TypeDef DMA_Priority,
  71                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
  71                     ; 233 {
  72  002e               _DMA_Init:
  73       fffffffe      OFST: set -2
  75                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
  76                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
  77                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
  78                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
  79                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
  80                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
  81                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
  82  002e f6            	ld	a,(x)
  83  002f a4fe          	and	a,#254
  84  0031 f7            	ld	(x),a
  85                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
  86  0032 7f            	clr	(x)
  87                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
  87                     ; 251                                            (uint8_t)DMA_Mode) | \
  87                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
  88  0033 7b0a          	ld	a,(OFST+12,sp)
  89  0035 1a0b          	or	a,(OFST+13,sp)
  90  0037 1a0c          	or	a,(OFST+14,sp)
  91  0039 fa            	or	a,(x)
  92  003a f7            	ld	(x),a
  93                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
  94  003b e601          	ld	a,(1,x)
  95  003d a4c7          	and	a,#199
  96  003f e701          	ld	(1,x),a
  97                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
  97                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
  98  0041 7b0d          	ld	a,(OFST+15,sp)
  99  0043 1a0e          	or	a,(OFST+16,sp)
 100  0045 ea01          	or	a,(1,x)
 101  0047 e701          	ld	(1,x),a
 102                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 103  0049 7b09          	ld	a,(OFST+11,sp)
 104  004b e702          	ld	(2,x),a
 105                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 106  004d 7b07          	ld	a,(OFST+9,sp)
 107  004f e703          	ld	(3,x),a
 108                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 109  0051 7b08          	ld	a,(OFST+10,sp)
 110  0053 e704          	ld	(4,x),a
 111                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 112  0055 a35093        	cpw	x,#20627
 113  0058 2604          	jrne	L7
 114                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 115  005a 7b04          	ld	a,(OFST+6,sp)
 116  005c e705          	ld	(5,x),a
 117  005e               L7:
 118                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 119  005e 7b05          	ld	a,(OFST+7,sp)
 120  0060 e706          	ld	(6,x),a
 121                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 122  0062 7b06          	ld	a,(OFST+8,sp)
 123  0064 e707          	ld	(7,x),a
 124                     ; 280 }
 125  0066 81            	ret	
 127                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 127                     ; 289 {
 128  0067               _DMA_GlobalCmd:
 130                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 131                     ; 293   if (NewState != DISABLE)
 132  0067 4d            	tnz	a
 133  0068 2705          	jreq	L11
 134                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 135  006a 72105070      	bset	20592,#0
 137  006e 81            	ret	
 138  006f               L11:
 139                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 140  006f 72115070      	bres	20592,#0
 141                     ; 303 }
 142  0073 81            	ret	
 144                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 144                     ; 315 {
 145  0074               _DMA_Cmd:
 146       fffffffe      OFST: set -2
 148                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 149                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 150                     ; 320   if (NewState != DISABLE)
 151  0074 7b03          	ld	a,(OFST+5,sp)
 152  0076 2705          	jreq	L51
 153                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 154  0078 f6            	ld	a,(x)
 155  0079 aa01          	or	a,#1
 157  007b 2003          	jra	L71
 158  007d               L51:
 159                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 160  007d f6            	ld	a,(x)
 161  007e a4fe          	and	a,#254
 162  0080               L71:
 163  0080 f7            	ld	(x),a
 164                     ; 330 }
 165  0081 81            	ret	
 167                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 167                     ; 343 {
 168  0082               _DMA_SetTimeOut:
 170                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 171                     ; 348   DMA1->GCSR = 0;
 172  0082 725f5070      	clr	20592
 173                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 174  0086 48            	sll	a
 175  0087 48            	sll	a
 176  0088 c75070        	ld	20592,a
 177                     ; 351 }
 178  008b 81            	ret	
 180                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 180                     ; 402 {
 181  008c               _DMA_SetCurrDataCounter:
 182       fffffffe      OFST: set -2
 184                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 185                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 186  008c 7b03          	ld	a,(OFST+5,sp)
 187  008e e702          	ld	(2,x),a
 188                     ; 408 }
 189  0090 81            	ret	
 191                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 191                     ; 416 {
 192  0091               _DMA_GetCurrDataCounter:
 194                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 195                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 196  0091 e602          	ld	a,(2,x)
 198  0093 81            	ret	
 200                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 200                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 200                     ; 484                   FunctionalState NewState)
 200                     ; 485 {
 201  0094               _DMA_ITConfig:
 202       fffffffe      OFST: set -2
 204                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 205                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 206                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 207                     ; 491   if (NewState != DISABLE)
 208  0094 7b04          	ld	a,(OFST+6,sp)
 209  0096 2705          	jreq	L12
 210                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 211  0098 f6            	ld	a,(x)
 212  0099 1a03          	or	a,(OFST+5,sp)
 214  009b 2004          	jra	L32
 215  009d               L12:
 216                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 217  009d 7b03          	ld	a,(OFST+5,sp)
 218  009f 43            	cpl	a
 219  00a0 f4            	and	a,(x)
 220  00a1               L32:
 221  00a1 f7            	ld	(x),a
 222                     ; 501 }
 223  00a2 81            	ret	
 225                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
 225                     ; 531 {
 226  00a3               _DMA_GetFlagStatus:
 227  00a3 89            	pushw	x
 228  00a4 5204          	subw	sp,#4
 229       00000004      OFST:	set	4
 231                     ; 532   FlagStatus flagstatus = RESET;
 232                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 233                     ; 534   uint8_t tmpgir1 = 0;
 234                     ; 535   uint8_t tmpgcsr = 0;
 235                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
 236                     ; 541   tmpgcsr = DMA1->GCSR;
 237  00a6 c65070        	ld	a,20592
 238  00a9 6b04          	ld	(OFST+0,sp),a
 239                     ; 542   tmpgir1 = DMA1->GIR1;
 240  00ab c65071        	ld	a,20593
 241  00ae 6b01          	ld	(OFST-3,sp),a
 242                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
 243  00b0 01            	rrwa	x,a
 244  00b1 9f            	ld	a,xl
 245  00b2 a40f          	and	a,#15
 246  00b4 97            	ld	xl,a
 247  00b5 4f            	clr	a
 248  00b6 02            	rlwa	x,a
 249  00b7 5d            	tnzw	x
 250  00b8 2728          	jreq	L52
 251                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
 252  00ba 7b05          	ld	a,(OFST+1,sp)
 253  00bc a501          	bcp	a,#1
 254  00be 2705          	jreq	L72
 255                     ; 549       DMA_Channelx = DMA1_Channel0;
 256  00c0 ae5075        	ldw	x,#20597
 258  00c3 2015          	jra	L13
 259  00c5               L72:
 260                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
 261  00c5 a502          	bcp	a,#2
 262  00c7 2705          	jreq	L33
 263                     ; 553       DMA_Channelx = DMA1_Channel1;
 264  00c9 ae507f        	ldw	x,#20607
 266  00cc 200c          	jra	L13
 267  00ce               L33:
 268                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
 269  00ce a504          	bcp	a,#4
 270  00d0 2705          	jreq	L73
 271                     ; 557       DMA_Channelx = DMA1_Channel2;
 272  00d2 ae5089        	ldw	x,#20617
 274  00d5 2003          	jra	L13
 275  00d7               L73:
 276                     ; 561       DMA_Channelx = DMA1_Channel3;
 277  00d7 ae5093        	ldw	x,#20627
 278  00da               L13:
 279  00da 1f02          	ldw	(OFST-2,sp),x
 280                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
 281  00dc e601          	ld	a,(1,x)
 282  00de 1406          	and	a,(OFST+2,sp)
 284  00e0 2010          	jra	L34
 285  00e2               L52:
 286                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
 287  00e2 7b05          	ld	a,(OFST+1,sp)
 288  00e4 a510          	bcp	a,#16
 289  00e6 2706          	jreq	L54
 290                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
 291  00e8 7b06          	ld	a,(OFST+2,sp)
 292  00ea 1401          	and	a,(OFST-3,sp)
 294  00ec 2004          	jra	L34
 295  00ee               L54:
 296                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
 297  00ee 7b04          	ld	a,(OFST+0,sp)
 298  00f0 a402          	and	a,#2
 299  00f2               L34:
 300                     ; 579   return (flagstatus);
 302  00f2 5b06          	addw	sp,#6
 303  00f4 81            	ret	
 305                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
 305                     ; 598 {
 306  00f5               _DMA_ClearFlag:
 307  00f5 89            	pushw	x
 308  00f6 89            	pushw	x
 309       00000002      OFST:	set	2
 311                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 312                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
 313                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
 314  00f7 01            	rrwa	x,a
 315  00f8 9f            	ld	a,xl
 316  00f9 a401          	and	a,#1
 317  00fb 97            	ld	xl,a
 318  00fc 4f            	clr	a
 319  00fd 02            	rlwa	x,a
 320  00fe 5d            	tnzw	x
 321  00ff 2705          	jreq	L15
 322                     ; 607     DMA_Channelx = DMA1_Channel0;
 323  0101 ae5075        	ldw	x,#20597
 325  0104 2017          	jra	L35
 326  0106               L15:
 327                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
 328  0106 7b03          	ld	a,(OFST+1,sp)
 329  0108 a502          	bcp	a,#2
 330  010a 2705          	jreq	L55
 331                     ; 613       DMA_Channelx = DMA1_Channel1;
 332  010c ae507f        	ldw	x,#20607
 334  010f 200c          	jra	L35
 335  0111               L55:
 336                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
 337  0111 a504          	bcp	a,#4
 338  0113 2705          	jreq	L16
 339                     ; 619         DMA_Channelx = DMA1_Channel2;
 340  0115 ae5089        	ldw	x,#20617
 342  0118 2003          	jra	L35
 343  011a               L16:
 344                     ; 623         DMA_Channelx = DMA1_Channel3;
 345  011a ae5093        	ldw	x,#20627
 346  011d               L35:
 347  011d 1f01          	ldw	(OFST-1,sp),x
 348                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
 349  011f 7b04          	ld	a,(OFST+2,sp)
 350  0121 a406          	and	a,#6
 351  0123 43            	cpl	a
 352  0124 e401          	and	a,(1,x)
 353  0126 e701          	ld	(1,x),a
 354                     ; 630 }
 355  0128 5b04          	addw	sp,#4
 356  012a 81            	ret	
 358                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
 358                     ; 647 {
 359  012b               _DMA_GetITStatus:
 360  012b 88            	push	a
 361  012c 5204          	subw	sp,#4
 362       00000004      OFST:	set	4
 364                     ; 648   ITStatus itstatus = RESET;
 365                     ; 649   uint8_t tmpreg = 0;
 366                     ; 650   uint8_t tmp2 = 0;
 367                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 368                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
 369                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
 370  012e a510          	bcp	a,#16
 371  0130 2705          	jreq	L56
 372                     ; 659     DMA_Channelx = DMA1_Channel0;
 373  0132 ae5075        	ldw	x,#20597
 375  0135 2015          	jra	L76
 376  0137               L56:
 377                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
 378  0137 a520          	bcp	a,#32
 379  0139 2705          	jreq	L17
 380                     ; 665       DMA_Channelx = DMA1_Channel1;
 381  013b ae507f        	ldw	x,#20607
 383  013e 200c          	jra	L76
 384  0140               L17:
 385                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
 386  0140 a540          	bcp	a,#64
 387  0142 2705          	jreq	L57
 388                     ; 671         DMA_Channelx = DMA1_Channel2;
 389  0144 ae5089        	ldw	x,#20617
 391  0147 2003          	jra	L76
 392  0149               L57:
 393                     ; 675         DMA_Channelx = DMA1_Channel3;
 394  0149 ae5093        	ldw	x,#20627
 395  014c               L76:
 396  014c 1f03          	ldw	(OFST-1,sp),x
 397                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
 398  014e e601          	ld	a,(1,x)
 399                     ; 681   tmpreg &= DMA_Channelx->CCR ;
 400  0150 f4            	and	a,(x)
 401  0151 6b01          	ld	(OFST-3,sp),a
 402                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
 403  0153 7b05          	ld	a,(OFST+1,sp)
 404  0155 a406          	and	a,#6
 405                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
 406  0157 1401          	and	a,(OFST-3,sp)
 407                     ; 686   return (itstatus);
 409  0159 5b05          	addw	sp,#5
 410  015b 81            	ret	
 412                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
 412                     ; 705 {
 413  015c               _DMA_ClearITPendingBit:
 414  015c 88            	push	a
 415  015d 89            	pushw	x
 416       00000002      OFST:	set	2
 418                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
 419                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
 420                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
 421  015e a510          	bcp	a,#16
 422  0160 2705          	jreq	L101
 423                     ; 713     DMA_Channelx = DMA1_Channel0;
 424  0162 ae5075        	ldw	x,#20597
 426  0165 2015          	jra	L301
 427  0167               L101:
 428                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
 429  0167 a520          	bcp	a,#32
 430  0169 2705          	jreq	L501
 431                     ; 719       DMA_Channelx = DMA1_Channel1;
 432  016b ae507f        	ldw	x,#20607
 434  016e 200c          	jra	L301
 435  0170               L501:
 436                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
 437  0170 a540          	bcp	a,#64
 438  0172 2705          	jreq	L111
 439                     ; 725         DMA_Channelx = DMA1_Channel2;
 440  0174 ae5089        	ldw	x,#20617
 442  0177 2003          	jra	L301
 443  0179               L111:
 444                     ; 729         DMA_Channelx = DMA1_Channel3;
 445  0179 ae5093        	ldw	x,#20627
 446  017c               L301:
 447  017c 1f01          	ldw	(OFST-1,sp),x
 448                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
 449  017e 7b03          	ld	a,(OFST+1,sp)
 450  0180 a406          	and	a,#6
 451  0182 43            	cpl	a
 452  0183 e401          	and	a,(1,x)
 453  0185 e701          	ld	(1,x),a
 454                     ; 735 }
 455  0187 5b03          	addw	sp,#3
 456  0189 81            	ret	
 458                     	xdef	_DMA_ClearITPendingBit
 459                     	xdef	_DMA_GetITStatus
 460                     	xdef	_DMA_ClearFlag
 461                     	xdef	_DMA_GetFlagStatus
 462                     	xdef	_DMA_ITConfig
 463                     	xdef	_DMA_GetCurrDataCounter
 464                     	xdef	_DMA_SetCurrDataCounter
 465                     	xdef	_DMA_SetTimeOut
 466                     	xdef	_DMA_Cmd
 467                     	xdef	_DMA_GlobalCmd
 468                     	xdef	_DMA_Init
 469                     	xdef	_DMA_DeInit
 470                     	xdef	_DMA_GlobalDeInit
 471                     	end
