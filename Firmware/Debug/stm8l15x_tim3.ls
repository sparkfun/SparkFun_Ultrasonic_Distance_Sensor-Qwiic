   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 168 void TIM3_DeInit(void)
  18                     ; 169 {
  19                     	scross	off
  20  0000               _TIM3_DeInit:
  22                     ; 170   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  23  0000 725f5280      	clr	21120
  24                     ; 171   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  25  0004 725f5281      	clr	21121
  26                     ; 172   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  27  0008 725f5282      	clr	21122
  28                     ; 173   TIM3->ETR = TIM_ETR_RESET_VALUE;
  29  000c 725f5283      	clr	21123
  30                     ; 174   TIM3->IER = TIM_IER_RESET_VALUE;
  31  0010 725f5285      	clr	21125
  32                     ; 175   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  33  0014 725f5287      	clr	21127
  34                     ; 178   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  35  0018 725f528b      	clr	21131
  36                     ; 180   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  37  001c 35015289      	mov	21129,#1
  38                     ; 181   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  39  0020 3501528a      	mov	21130,#1
  40                     ; 184   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  41  0024 725f528b      	clr	21131
  42                     ; 185   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  43  0028 725f5289      	clr	21129
  44                     ; 186   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  45  002c 725f528a      	clr	21130
  46                     ; 188   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  47  0030 725f528c      	clr	21132
  48                     ; 189   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  49  0034 725f528d      	clr	21133
  50                     ; 191   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  51  0038 725f528e      	clr	21134
  52                     ; 193   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  53  003c 35ff528f      	mov	21135,#255
  54                     ; 194   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
  55  0040 35ff5290      	mov	21136,#255
  56                     ; 196   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
  57  0044 725f5291      	clr	21137
  58                     ; 197   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
  59  0048 725f5292      	clr	21138
  60                     ; 198   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
  61  004c 725f5293      	clr	21139
  62                     ; 199   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
  63  0050 725f5294      	clr	21140
  64                     ; 202   TIM3->OISR = TIM_OISR_RESET_VALUE;
  65  0054 725f5296      	clr	21142
  66                     ; 203   TIM3->EGR = 0x01;/* TIM_EGR_UG */
  67  0058 35015288      	mov	21128,#1
  68                     ; 204   TIM3->BKR = TIM_BKR_RESET_VALUE;
  69  005c 725f5295      	clr	21141
  70                     ; 205   TIM3->SR1 = TIM_SR1_RESET_VALUE;
  71  0060 725f5286      	clr	21126
  72                     ; 206 }
  73  0064 81            	ret	
  75                     ; 231 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
  75                     ; 232                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
  75                     ; 233                        uint16_t TIM3_Period)
  75                     ; 234 {
  76  0065               _TIM3_TimeBaseInit:
  77       fffffffe      OFST: set -2
  79                     ; 236   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
  80                     ; 237   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
  81                     ; 242   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
  82  0065 7b03          	ld	a,(OFST+5,sp)
  83  0067 c7528f        	ld	21135,a
  84                     ; 243   TIM3->ARRL = (uint8_t)(TIM3_Period);
  85  006a 7b04          	ld	a,(OFST+6,sp)
  86  006c c75290        	ld	21136,a
  87                     ; 246   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
  88  006f 9e            	ld	a,xh
  89  0070 c7528e        	ld	21134,a
  90                     ; 249   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
  91  0073 c65280        	ld	a,21120
  92  0076 a48f          	and	a,#143
  93  0078 c75280        	ld	21120,a
  94                     ; 250   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
  95  007b 9f            	ld	a,xl
  96  007c ca5280        	or	a,21120
  97  007f c75280        	ld	21120,a
  98                     ; 253   TIM3->EGR = TIM3_EventSource_Update;
  99  0082 35015288      	mov	21128,#1
 100                     ; 254 }
 101  0086 81            	ret	
 103                     ; 274 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 103                     ; 275                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 103                     ; 276 {
 104  0087               _TIM3_PrescalerConfig:
 106                     ; 278   assert_param(IS_TIM3_PRESCALER(Prescaler));
 107                     ; 279   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
 108                     ; 282   TIM3->PSCR = (uint8_t)(Prescaler);
 109  0087 9e            	ld	a,xh
 110  0088 c7528e        	ld	21134,a
 111                     ; 285   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
 112  008b 9f            	ld	a,xl
 113  008c 4a            	dec	a
 114  008d 2605          	jrne	L7
 115                     ; 287     TIM3->EGR |= TIM_EGR_UG ;
 116  008f 72105288      	bset	21128,#0
 118  0093 81            	ret	
 119  0094               L7:
 120                     ; 291     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 121  0094 72115288      	bres	21128,#0
 122                     ; 293 }
 123  0098 81            	ret	
 125                     ; 306 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
 125                     ; 307 {
 126  0099               _TIM3_CounterModeConfig:
 127  0099 88            	push	a
 128  009a 88            	push	a
 129       00000001      OFST:	set	1
 131                     ; 308   uint8_t tmpcr1 = 0;
 132                     ; 311   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 133                     ; 313   tmpcr1 = TIM3->CR1;
 134  009b c65280        	ld	a,21120
 135                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 136  009e a48f          	and	a,#143
 137                     ; 319   tmpcr1 |= (uint8_t)TIM3_CounterMode;
 138  00a0 1a02          	or	a,(OFST+1,sp)
 139                     ; 321   TIM3->CR1 = tmpcr1;
 140  00a2 c75280        	ld	21120,a
 141                     ; 322 }
 142  00a5 85            	popw	x
 143  00a6 81            	ret	
 145                     ; 330 void TIM3_SetCounter(uint16_t Counter)
 145                     ; 331 {
 146  00a7               _TIM3_SetCounter:
 148                     ; 334   TIM3->CNTRH = (uint8_t)(Counter >> 8);
 149  00a7 9e            	ld	a,xh
 150  00a8 c7528c        	ld	21132,a
 151                     ; 335   TIM3->CNTRL = (uint8_t)(Counter);
 152  00ab 9f            	ld	a,xl
 153  00ac c7528d        	ld	21133,a
 154                     ; 336 }
 155  00af 81            	ret	
 157                     ; 344 void TIM3_SetAutoreload(uint16_t Autoreload)
 157                     ; 345 {
 158  00b0               _TIM3_SetAutoreload:
 160                     ; 347   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
 161  00b0 9e            	ld	a,xh
 162  00b1 c7528f        	ld	21135,a
 163                     ; 348   TIM3->ARRL = (uint8_t)(Autoreload);
 164  00b4 9f            	ld	a,xl
 165  00b5 c75290        	ld	21136,a
 166                     ; 349 }
 167  00b8 81            	ret	
 169                     ; 356 uint16_t TIM3_GetCounter(void)
 169                     ; 357 {
 170  00b9               _TIM3_GetCounter:
 171  00b9 5204          	subw	sp,#4
 172       00000004      OFST:	set	4
 174                     ; 358   uint16_t tmpcnt = 0;
 175                     ; 361   tmpcntrh = TIM3->CNTRH;
 176  00bb c6528c        	ld	a,21132
 177  00be 6b02          	ld	(OFST-2,sp),a
 178                     ; 362   tmpcntrl = TIM3->CNTRL;
 179  00c0 c6528d        	ld	a,21133
 180  00c3 6b01          	ld	(OFST-3,sp),a
 181                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 182  00c5 5f            	clrw	x
 183  00c6 97            	ld	xl,a
 184  00c7 1f03          	ldw	(OFST-1,sp),x
 185                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 186  00c9 5f            	clrw	x
 187  00ca 7b02          	ld	a,(OFST-2,sp)
 188  00cc 97            	ld	xl,a
 189  00cd 7b04          	ld	a,(OFST+0,sp)
 190  00cf 01            	rrwa	x,a
 191  00d0 1a03          	or	a,(OFST-1,sp)
 192  00d2 01            	rrwa	x,a
 193                     ; 367   return ((uint16_t)tmpcnt);
 195  00d3 5b04          	addw	sp,#4
 196  00d5 81            	ret	
 198                     ; 383 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
 198                     ; 384 {
 199  00d6               _TIM3_GetPrescaler:
 201                     ; 386   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
 202  00d6 c6528e        	ld	a,21134
 204  00d9 81            	ret	
 206                     ; 396 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 206                     ; 397 {
 207  00da               _TIM3_UpdateDisableConfig:
 209                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 210                     ; 402   if (NewState != DISABLE)
 211  00da 4d            	tnz	a
 212  00db 2705          	jreq	L31
 213                     ; 404     TIM3->CR1 |= TIM_CR1_UDIS;
 214  00dd 72125280      	bset	21120,#1
 216  00e1 81            	ret	
 217  00e2               L31:
 218                     ; 408     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 219  00e2 72135280      	bres	21120,#1
 220                     ; 410 }
 221  00e6 81            	ret	
 223                     ; 420 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 223                     ; 421 {
 224  00e7               _TIM3_UpdateRequestConfig:
 226                     ; 423   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
 227                     ; 426   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
 228  00e7 4a            	dec	a
 229  00e8 2605          	jrne	L71
 230                     ; 428     TIM3->CR1 |= TIM_CR1_URS ;
 231  00ea 72145280      	bset	21120,#2
 233  00ee 81            	ret	
 234  00ef               L71:
 235                     ; 432     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
 236  00ef 72155280      	bres	21120,#2
 237                     ; 434 }
 238  00f3 81            	ret	
 240                     ; 442 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 240                     ; 443 {
 241  00f4               _TIM3_ARRPreloadConfig:
 243                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 244                     ; 448   if (NewState != DISABLE)
 245  00f4 4d            	tnz	a
 246  00f5 2705          	jreq	L32
 247                     ; 450     TIM3->CR1 |= TIM_CR1_ARPE;
 248  00f7 721e5280      	bset	21120,#7
 250  00fb 81            	ret	
 251  00fc               L32:
 252                     ; 454     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 253  00fc 721f5280      	bres	21120,#7
 254                     ; 456 }
 255  0100 81            	ret	
 257                     ; 466 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
 257                     ; 467 {
 258  0101               _TIM3_SelectOnePulseMode:
 260                     ; 469   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
 261                     ; 472   if (TIM3_OPMode == TIM3_OPMode_Single)
 262  0101 4a            	dec	a
 263  0102 2605          	jrne	L72
 264                     ; 474     TIM3->CR1 |= TIM_CR1_OPM ;
 265  0104 72165280      	bset	21120,#3
 267  0108 81            	ret	
 268  0109               L72:
 269                     ; 478     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
 270  0109 72175280      	bres	21120,#3
 271                     ; 480 }
 272  010d 81            	ret	
 274                     ; 488 void TIM3_Cmd(FunctionalState NewState)
 274                     ; 489 {
 275  010e               _TIM3_Cmd:
 277                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
 278                     ; 494   if (NewState != DISABLE)
 279  010e 4d            	tnz	a
 280  010f 2705          	jreq	L33
 281                     ; 496     TIM3->CR1 |= TIM_CR1_CEN;
 282  0111 72105280      	bset	21120,#0
 284  0115 81            	ret	
 285  0116               L33:
 286                     ; 500     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
 287  0116 72115280      	bres	21120,#0
 288                     ; 502 }
 289  011a 81            	ret	
 291                     ; 578 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 291                     ; 579                   TIM3_OutputState_TypeDef TIM3_OutputState,
 291                     ; 580                   uint16_t TIM3_Pulse,
 291                     ; 581                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 291                     ; 582                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 291                     ; 583 {
 292  011b               _TIM3_OC1Init:
 293  011b 89            	pushw	x
 294  011c 88            	push	a
 295       00000001      OFST:	set	1
 297                     ; 584   uint8_t tmpccmr1 = 0;
 298                     ; 587   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 299                     ; 588   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 300                     ; 589   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 301                     ; 590   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 302                     ; 592   tmpccmr1 = TIM3->CCMR1;
 303  011d c65289        	ld	a,21129
 304  0120 6b01          	ld	(OFST+0,sp),a
 305                     ; 595   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 306  0122 7211528b      	bres	21131,#0
 307                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 308  0126 a48f          	and	a,#143
 309  0128 6b01          	ld	(OFST+0,sp),a
 310                     ; 600   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 311  012a 9e            	ld	a,xh
 312  012b 1a01          	or	a,(OFST+0,sp)
 313  012d 6b01          	ld	(OFST+0,sp),a
 314                     ; 602   TIM3->CCMR1 = tmpccmr1;
 315  012f c75289        	ld	21129,a
 316                     ; 605   if (TIM3_OutputState == TIM3_OutputState_Enable)
 317  0132 9f            	ld	a,xl
 318  0133 4a            	dec	a
 319  0134 2606          	jrne	L73
 320                     ; 607     TIM3->CCER1 |= TIM_CCER1_CC1E;
 321  0136 7210528b      	bset	21131,#0
 323  013a 2004          	jra	L14
 324  013c               L73:
 325                     ; 611     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 326  013c 7211528b      	bres	21131,#0
 327  0140               L14:
 328                     ; 615   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 329  0140 7b08          	ld	a,(OFST+7,sp)
 330  0142 4a            	dec	a
 331  0143 2606          	jrne	L34
 332                     ; 617     TIM3->CCER1 |= TIM_CCER1_CC1P;
 333  0145 7212528b      	bset	21131,#1
 335  0149 2004          	jra	L54
 336  014b               L34:
 337                     ; 621     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 338  014b 7213528b      	bres	21131,#1
 339  014f               L54:
 340                     ; 625   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 341  014f 7b09          	ld	a,(OFST+8,sp)
 342  0151 4a            	dec	a
 343  0152 2606          	jrne	L74
 344                     ; 627     TIM3->OISR |= TIM_OISR_OIS1;
 345  0154 72105296      	bset	21142,#0
 347  0158 2004          	jra	L15
 348  015a               L74:
 349                     ; 631     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 350  015a 72115296      	bres	21142,#0
 351  015e               L15:
 352                     ; 635   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 353  015e 7b06          	ld	a,(OFST+5,sp)
 354  0160 c75291        	ld	21137,a
 355                     ; 636   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 356  0163 7b07          	ld	a,(OFST+6,sp)
 357  0165 c75292        	ld	21138,a
 358                     ; 637 }
 359  0168 5b03          	addw	sp,#3
 360  016a 81            	ret	
 362                     ; 664 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 362                     ; 665                   TIM3_OutputState_TypeDef TIM3_OutputState,
 362                     ; 666                   uint16_t TIM3_Pulse,
 362                     ; 667                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 362                     ; 668                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 362                     ; 669 {
 363  016b               _TIM3_OC2Init:
 364  016b 89            	pushw	x
 365  016c 88            	push	a
 366       00000001      OFST:	set	1
 368                     ; 670   uint8_t tmpccmr2 = 0;
 369                     ; 673   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 370                     ; 674   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 371                     ; 675   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 372                     ; 676   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 373                     ; 678   tmpccmr2 = TIM3->CCMR2;
 374  016d c6528a        	ld	a,21130
 375  0170 6b01          	ld	(OFST+0,sp),a
 376                     ; 681   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 377  0172 7219528b      	bres	21131,#4
 378                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 379  0176 a48f          	and	a,#143
 380  0178 6b01          	ld	(OFST+0,sp),a
 381                     ; 687   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 382  017a 9e            	ld	a,xh
 383  017b 1a01          	or	a,(OFST+0,sp)
 384  017d 6b01          	ld	(OFST+0,sp),a
 385                     ; 689   TIM3->CCMR2 = tmpccmr2;
 386  017f c7528a        	ld	21130,a
 387                     ; 692   if (TIM3_OutputState == TIM3_OutputState_Enable)
 388  0182 9f            	ld	a,xl
 389  0183 4a            	dec	a
 390  0184 2606          	jrne	L35
 391                     ; 694     TIM3->CCER1 |= TIM_CCER1_CC2E;
 392  0186 7218528b      	bset	21131,#4
 394  018a 2004          	jra	L55
 395  018c               L35:
 396                     ; 698     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 397  018c 7219528b      	bres	21131,#4
 398  0190               L55:
 399                     ; 702   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 400  0190 7b08          	ld	a,(OFST+7,sp)
 401  0192 4a            	dec	a
 402  0193 2606          	jrne	L75
 403                     ; 704     TIM3->CCER1 |= TIM_CCER1_CC2P;
 404  0195 721a528b      	bset	21131,#5
 406  0199 2004          	jra	L16
 407  019b               L75:
 408                     ; 708     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 409  019b 721b528b      	bres	21131,#5
 410  019f               L16:
 411                     ; 713   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 412  019f 7b09          	ld	a,(OFST+8,sp)
 413  01a1 4a            	dec	a
 414  01a2 2606          	jrne	L36
 415                     ; 715     TIM3->OISR |= TIM_OISR_OIS2;
 416  01a4 72145296      	bset	21142,#2
 418  01a8 2004          	jra	L56
 419  01aa               L36:
 420                     ; 719     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 421  01aa 72155296      	bres	21142,#2
 422  01ae               L56:
 423                     ; 723   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 424  01ae 7b06          	ld	a,(OFST+5,sp)
 425  01b0 c75293        	ld	21139,a
 426                     ; 724   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 427  01b3 7b07          	ld	a,(OFST+6,sp)
 428  01b5 c75294        	ld	21140,a
 429                     ; 725 }
 430  01b8 5b03          	addw	sp,#3
 431  01ba 81            	ret	
 433                     ; 754 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
 433                     ; 755                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
 433                     ; 756                     TIM3_BreakState_TypeDef TIM3_BreakState,
 433                     ; 757                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
 433                     ; 758                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
 433                     ; 759 
 433                     ; 760 {
 434  01bb               _TIM3_BKRConfig:
 435  01bb 89            	pushw	x
 436  01bc 88            	push	a
 437       00000001      OFST:	set	1
 439                     ; 762   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
 440                     ; 763   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
 441                     ; 764   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
 442                     ; 765   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
 443                     ; 766   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
 444                     ; 772   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
 444                     ; 773                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
 444                     ; 774                                   TIM3_AutomaticOutput));
 445  01bd 7b06          	ld	a,(OFST+5,sp)
 446  01bf 1a07          	or	a,(OFST+6,sp)
 447  01c1 6b01          	ld	(OFST+0,sp),a
 448  01c3 9f            	ld	a,xl
 449  01c4 1a02          	or	a,(OFST+1,sp)
 450  01c6 1a01          	or	a,(OFST+0,sp)
 451  01c8 1a08          	or	a,(OFST+7,sp)
 452  01ca c75295        	ld	21141,a
 453                     ; 775 }
 454  01cd 5b03          	addw	sp,#3
 455  01cf 81            	ret	
 457                     ; 783 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
 457                     ; 784 {
 458  01d0               _TIM3_CtrlPWMOutputs:
 460                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
 461                     ; 790   if (NewState != DISABLE)
 462  01d0 4d            	tnz	a
 463  01d1 2705          	jreq	L76
 464                     ; 792     TIM3->BKR |= TIM_BKR_MOE ;
 465  01d3 721e5295      	bset	21141,#7
 467  01d7 81            	ret	
 468  01d8               L76:
 469                     ; 796     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
 470  01d8 721f5295      	bres	21141,#7
 471                     ; 798 }
 472  01dc 81            	ret	
 474                     ; 818 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
 474                     ; 819                      TIM3_OCMode_TypeDef TIM3_OCMode)
 474                     ; 820 {
 475  01dd               _TIM3_SelectOCxM:
 476  01dd 89            	pushw	x
 477       00000000      OFST:	set	0
 479                     ; 822   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
 480                     ; 823   assert_param(IS_TIM3_OCM(TIM3_OCMode));
 481                     ; 825   if (TIM3_Channel == TIM3_Channel_1)
 482  01de 9e            	ld	a,xh
 483  01df 4d            	tnz	a
 484  01e0 2615          	jrne	L37
 485                     ; 828     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 486  01e2 7211528b      	bres	21131,#0
 487                     ; 831     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
 488  01e6 c65289        	ld	a,21129
 489  01e9 a48f          	and	a,#143
 490  01eb c75289        	ld	21129,a
 491                     ; 834     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
 492  01ee 9f            	ld	a,xl
 493  01ef ca5289        	or	a,21129
 494  01f2 c75289        	ld	21129,a
 496  01f5 2014          	jra	L57
 497  01f7               L37:
 498                     ; 839     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 499  01f7 7219528b      	bres	21131,#4
 500                     ; 842     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
 501  01fb c6528a        	ld	a,21130
 502  01fe a48f          	and	a,#143
 503  0200 c7528a        	ld	21130,a
 504                     ; 845     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
 505  0203 c6528a        	ld	a,21130
 506  0206 1a02          	or	a,(OFST+2,sp)
 507  0208 c7528a        	ld	21130,a
 508  020b               L57:
 509                     ; 847 }
 510  020b 85            	popw	x
 511  020c 81            	ret	
 513                     ; 855 void TIM3_SetCompare1(uint16_t Compare)
 513                     ; 856 {
 514  020d               _TIM3_SetCompare1:
 516                     ; 858   TIM3->CCR1H = (uint8_t)(Compare >> 8);
 517  020d 9e            	ld	a,xh
 518  020e c75291        	ld	21137,a
 519                     ; 859   TIM3->CCR1L = (uint8_t)(Compare);
 520  0211 9f            	ld	a,xl
 521  0212 c75292        	ld	21138,a
 522                     ; 860 }
 523  0215 81            	ret	
 525                     ; 868 void TIM3_SetCompare2(uint16_t Compare)
 525                     ; 869 {
 526  0216               _TIM3_SetCompare2:
 528                     ; 871   TIM3->CCR2H = (uint8_t)(Compare >> 8);
 529  0216 9e            	ld	a,xh
 530  0217 c75293        	ld	21139,a
 531                     ; 872   TIM3->CCR2L = (uint8_t)(Compare);
 532  021a 9f            	ld	a,xl
 533  021b c75294        	ld	21140,a
 534                     ; 873 }
 535  021e 81            	ret	
 537                     ; 883 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
 537                     ; 884 {
 538  021f               _TIM3_ForcedOC1Config:
 539  021f 88            	push	a
 540  0220 88            	push	a
 541       00000001      OFST:	set	1
 543                     ; 885   uint8_t tmpccmr1 = 0;
 544                     ; 888   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
 545                     ; 890   tmpccmr1 = TIM3->CCMR1;
 546  0221 c65289        	ld	a,21129
 547                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 548  0224 a48f          	and	a,#143
 549                     ; 896   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
 550  0226 1a02          	or	a,(OFST+1,sp)
 551                     ; 898   TIM3->CCMR1 = tmpccmr1;
 552  0228 c75289        	ld	21129,a
 553                     ; 899 }
 554  022b 85            	popw	x
 555  022c 81            	ret	
 557                     ; 909 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
 557                     ; 910 {
 558  022d               _TIM3_ForcedOC2Config:
 559  022d 88            	push	a
 560  022e 88            	push	a
 561       00000001      OFST:	set	1
 563                     ; 911   uint8_t tmpccmr2 = 0;
 564                     ; 914   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
 565                     ; 916   tmpccmr2 = TIM3->CCMR2;
 566  022f c6528a        	ld	a,21130
 567                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 568  0232 a48f          	and	a,#143
 569                     ; 922   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
 570  0234 1a02          	or	a,(OFST+1,sp)
 571                     ; 924   TIM3->CCMR2 = tmpccmr2;
 572  0236 c7528a        	ld	21130,a
 573                     ; 925 }
 574  0239 85            	popw	x
 575  023a 81            	ret	
 577                     ; 933 void TIM3_OC1PreloadConfig(FunctionalState NewState)
 577                     ; 934 {
 578  023b               _TIM3_OC1PreloadConfig:
 580                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
 581                     ; 939   if (NewState != DISABLE)
 582  023b 4d            	tnz	a
 583  023c 2705          	jreq	L77
 584                     ; 941     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
 585  023e 72165289      	bset	21129,#3
 587  0242 81            	ret	
 588  0243               L77:
 589                     ; 945     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
 590  0243 72175289      	bres	21129,#3
 591                     ; 947 }
 592  0247 81            	ret	
 594                     ; 955 void TIM3_OC2PreloadConfig(FunctionalState NewState)
 594                     ; 956 {
 595  0248               _TIM3_OC2PreloadConfig:
 597                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
 598                     ; 961   if (NewState != DISABLE)
 599  0248 4d            	tnz	a
 600  0249 2705          	jreq	L301
 601                     ; 963     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
 602  024b 7216528a      	bset	21130,#3
 604  024f 81            	ret	
 605  0250               L301:
 606                     ; 967     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
 607  0250 7217528a      	bres	21130,#3
 608                     ; 969 }
 609  0254 81            	ret	
 611                     ; 977 void TIM3_OC1FastConfig(FunctionalState NewState)
 611                     ; 978 {
 612  0255               _TIM3_OC1FastConfig:
 614                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
 615                     ; 983   if (NewState != DISABLE)
 616  0255 4d            	tnz	a
 617  0256 2705          	jreq	L701
 618                     ; 985     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
 619  0258 72145289      	bset	21129,#2
 621  025c 81            	ret	
 622  025d               L701:
 623                     ; 989     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
 624  025d 72155289      	bres	21129,#2
 625                     ; 991 }
 626  0261 81            	ret	
 628                     ; 1000 void TIM3_OC2FastConfig(FunctionalState NewState)
 628                     ; 1001 {
 629  0262               _TIM3_OC2FastConfig:
 631                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
 632                     ; 1006   if (NewState != DISABLE)
 633  0262 4d            	tnz	a
 634  0263 2705          	jreq	L311
 635                     ; 1008     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
 636  0265 7214528a      	bset	21130,#2
 638  0269 81            	ret	
 639  026a               L311:
 640                     ; 1012     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
 641  026a 7215528a      	bres	21130,#2
 642                     ; 1014 }
 643  026e 81            	ret	
 645                     ; 1024 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 645                     ; 1025 {
 646  026f               _TIM3_OC1PolarityConfig:
 648                     ; 1027   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 649                     ; 1030   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 650  026f 4a            	dec	a
 651  0270 2605          	jrne	L711
 652                     ; 1032     TIM3->CCER1 |= TIM_CCER1_CC1P ;
 653  0272 7212528b      	bset	21131,#1
 655  0276 81            	ret	
 656  0277               L711:
 657                     ; 1036     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
 658  0277 7213528b      	bres	21131,#1
 659                     ; 1038 }
 660  027b 81            	ret	
 662                     ; 1048 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 662                     ; 1049 {
 663  027c               _TIM3_OC2PolarityConfig:
 665                     ; 1051   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 666                     ; 1054   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 667  027c 4a            	dec	a
 668  027d 2605          	jrne	L321
 669                     ; 1056     TIM3->CCER1 |= TIM_CCER1_CC2P ;
 670  027f 721a528b      	bset	21131,#5
 672  0283 81            	ret	
 673  0284               L321:
 674                     ; 1060     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
 675  0284 721b528b      	bres	21131,#5
 676                     ; 1062 }
 677  0288 81            	ret	
 679                     ; 1074 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
 679                     ; 1075                  FunctionalState NewState)
 679                     ; 1076 {
 680  0289               _TIM3_CCxCmd:
 681  0289 89            	pushw	x
 682       00000000      OFST:	set	0
 684                     ; 1078   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
 685                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
 686                     ; 1081   if (TIM3_Channel == TIM3_Channel_1)
 687  028a 9e            	ld	a,xh
 688  028b 4d            	tnz	a
 689  028c 2610          	jrne	L721
 690                     ; 1084     if (NewState != DISABLE)
 691  028e 9f            	ld	a,xl
 692  028f 4d            	tnz	a
 693  0290 2706          	jreq	L131
 694                     ; 1086       TIM3->CCER1 |= TIM_CCER1_CC1E ;
 695  0292 7210528b      	bset	21131,#0
 697  0296 2014          	jra	L531
 698  0298               L131:
 699                     ; 1090       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
 700  0298 7211528b      	bres	21131,#0
 701  029c 200e          	jra	L531
 702  029e               L721:
 703                     ; 1097     if (NewState != DISABLE)
 704  029e 7b02          	ld	a,(OFST+2,sp)
 705  02a0 2706          	jreq	L731
 706                     ; 1099       TIM3->CCER1 |= TIM_CCER1_CC2E;
 707  02a2 7218528b      	bset	21131,#4
 709  02a6 2004          	jra	L531
 710  02a8               L731:
 711                     ; 1103       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
 712  02a8 7219528b      	bres	21131,#4
 713  02ac               L531:
 714                     ; 1106 }
 715  02ac 85            	popw	x
 716  02ad 81            	ret	
 718                     ; 1184 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 718                     ; 1185                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 718                     ; 1186                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 718                     ; 1187                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 718                     ; 1188                  uint8_t TIM3_ICFilter)
 718                     ; 1189 {
 719  02ae               _TIM3_ICInit:
 720  02ae 89            	pushw	x
 721       00000000      OFST:	set	0
 723                     ; 1191   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
 724                     ; 1193   if (TIM3_Channel == TIM3_Channel_1)
 725  02af 9e            	ld	a,xh
 726  02b0 4d            	tnz	a
 727  02b1 2614          	jrne	L341
 728                     ; 1196     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
 729  02b3 7b07          	ld	a,(OFST+7,sp)
 730  02b5 88            	push	a
 731  02b6 7b06          	ld	a,(OFST+6,sp)
 732  02b8 97            	ld	xl,a
 733  02b9 7b03          	ld	a,(OFST+3,sp)
 734  02bb 95            	ld	xh,a
 735  02bc cd054a        	call	L3_TI1_Config
 737  02bf 84            	pop	a
 738                     ; 1199     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 739  02c0 7b06          	ld	a,(OFST+6,sp)
 740  02c2 cd037c        	call	_TIM3_SetIC1Prescaler
 743  02c5 2012          	jra	L541
 744  02c7               L341:
 745                     ; 1204     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
 746  02c7 7b07          	ld	a,(OFST+7,sp)
 747  02c9 88            	push	a
 748  02ca 7b06          	ld	a,(OFST+6,sp)
 749  02cc 97            	ld	xl,a
 750  02cd 7b03          	ld	a,(OFST+3,sp)
 751  02cf 95            	ld	xh,a
 752  02d0 cd0582        	call	L5_TI2_Config
 754  02d3 84            	pop	a
 755                     ; 1207     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 756  02d4 7b06          	ld	a,(OFST+6,sp)
 757  02d6 cd038a        	call	_TIM3_SetIC2Prescaler
 759  02d9               L541:
 760                     ; 1209 }
 761  02d9 85            	popw	x
 762  02da 81            	ret	
 764                     ; 1235 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 764                     ; 1236                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 764                     ; 1237                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 764                     ; 1238                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 764                     ; 1239                      uint8_t TIM3_ICFilter)
 764                     ; 1240 {
 765  02db               _TIM3_PWMIConfig:
 766  02db 89            	pushw	x
 767  02dc 89            	pushw	x
 768       00000002      OFST:	set	2
 770                     ; 1241   uint8_t icpolarity = TIM3_ICPolarity_Rising;
 771                     ; 1242   uint8_t icselection = TIM3_ICSelection_DirectTI;
 772                     ; 1245   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
 773                     ; 1248   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
 774  02dd 9f            	ld	a,xl
 775  02de 4d            	tnz	a
 776  02df 2605          	jrne	L741
 777                     ; 1250     icpolarity = TIM3_ICPolarity_Falling;
 778  02e1 4c            	inc	a
 779  02e2 6b01          	ld	(OFST-1,sp),a
 781  02e4 2002          	jra	L151
 782  02e6               L741:
 783                     ; 1254     icpolarity = TIM3_ICPolarity_Rising;
 784  02e6 0f01          	clr	(OFST-1,sp)
 785  02e8               L151:
 786                     ; 1258   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
 787  02e8 7b07          	ld	a,(OFST+5,sp)
 788  02ea 4a            	dec	a
 789  02eb 2604          	jrne	L351
 790                     ; 1260     icselection = TIM3_ICSelection_IndirectTI;
 791  02ed a602          	ld	a,#2
 793  02ef 2002          	jra	L551
 794  02f1               L351:
 795                     ; 1264     icselection = TIM3_ICSelection_DirectTI;
 796  02f1 a601          	ld	a,#1
 797  02f3               L551:
 798  02f3 6b02          	ld	(OFST+0,sp),a
 799                     ; 1267   if (TIM3_Channel == TIM3_Channel_1)
 800  02f5 7b03          	ld	a,(OFST+1,sp)
 801  02f7 2624          	jrne	L751
 802                     ; 1270     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
 802                     ; 1271                TIM3_ICFilter);
 803  02f9 7b09          	ld	a,(OFST+7,sp)
 804  02fb 88            	push	a
 805  02fc 7b08          	ld	a,(OFST+6,sp)
 806  02fe 97            	ld	xl,a
 807  02ff 7b05          	ld	a,(OFST+3,sp)
 808  0301 95            	ld	xh,a
 809  0302 cd054a        	call	L3_TI1_Config
 811  0305 84            	pop	a
 812                     ; 1274     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 813  0306 7b08          	ld	a,(OFST+6,sp)
 814  0308 ad72          	call	_TIM3_SetIC1Prescaler
 816                     ; 1277     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
 817  030a 7b09          	ld	a,(OFST+7,sp)
 818  030c 88            	push	a
 819  030d 7b03          	ld	a,(OFST+1,sp)
 820  030f 97            	ld	xl,a
 821  0310 7b02          	ld	a,(OFST+0,sp)
 822  0312 95            	ld	xh,a
 823  0313 cd0582        	call	L5_TI2_Config
 825  0316 84            	pop	a
 826                     ; 1280     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 827  0317 7b08          	ld	a,(OFST+6,sp)
 828  0319 ad6f          	call	_TIM3_SetIC2Prescaler
 831  031b 2022          	jra	L161
 832  031d               L751:
 833                     ; 1285     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
 833                     ; 1286                TIM3_ICFilter);
 834  031d 7b09          	ld	a,(OFST+7,sp)
 835  031f 88            	push	a
 836  0320 7b08          	ld	a,(OFST+6,sp)
 837  0322 97            	ld	xl,a
 838  0323 7b05          	ld	a,(OFST+3,sp)
 839  0325 95            	ld	xh,a
 840  0326 cd0582        	call	L5_TI2_Config
 842  0329 84            	pop	a
 843                     ; 1289     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 844  032a 7b08          	ld	a,(OFST+6,sp)
 845  032c ad5c          	call	_TIM3_SetIC2Prescaler
 847                     ; 1292     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
 848  032e 7b09          	ld	a,(OFST+7,sp)
 849  0330 88            	push	a
 850  0331 7b03          	ld	a,(OFST+1,sp)
 851  0333 97            	ld	xl,a
 852  0334 7b02          	ld	a,(OFST+0,sp)
 853  0336 95            	ld	xh,a
 854  0337 cd054a        	call	L3_TI1_Config
 856  033a 84            	pop	a
 857                     ; 1295     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 858  033b 7b08          	ld	a,(OFST+6,sp)
 859  033d ad3d          	call	_TIM3_SetIC1Prescaler
 861  033f               L161:
 862                     ; 1297 }
 863  033f 5b04          	addw	sp,#4
 864  0341 81            	ret	
 866                     ; 1304 uint16_t TIM3_GetCapture1(void)
 866                     ; 1305 {
 867  0342               _TIM3_GetCapture1:
 868  0342 5204          	subw	sp,#4
 869       00000004      OFST:	set	4
 871                     ; 1306   uint16_t tmpccr1 = 0;
 872                     ; 1309   tmpccr1h = TIM3->CCR1H;
 873  0344 c65291        	ld	a,21137
 874  0347 6b02          	ld	(OFST-2,sp),a
 875                     ; 1310   tmpccr1l = TIM3->CCR1L;
 876  0349 c65292        	ld	a,21138
 877  034c 6b01          	ld	(OFST-3,sp),a
 878                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
 879  034e 5f            	clrw	x
 880  034f 97            	ld	xl,a
 881  0350 1f03          	ldw	(OFST-1,sp),x
 882                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
 883  0352 5f            	clrw	x
 884  0353 7b02          	ld	a,(OFST-2,sp)
 885  0355 97            	ld	xl,a
 886  0356 7b04          	ld	a,(OFST+0,sp)
 887  0358 01            	rrwa	x,a
 888  0359 1a03          	or	a,(OFST-1,sp)
 889  035b 01            	rrwa	x,a
 890                     ; 1315   return ((uint16_t)tmpccr1);
 892  035c 5b04          	addw	sp,#4
 893  035e 81            	ret	
 895                     ; 1323 uint16_t TIM3_GetCapture2(void)
 895                     ; 1324 {
 896  035f               _TIM3_GetCapture2:
 897  035f 5204          	subw	sp,#4
 898       00000004      OFST:	set	4
 900                     ; 1325   uint16_t tmpccr2 = 0;
 901                     ; 1328   tmpccr2h = TIM3->CCR2H;
 902  0361 c65293        	ld	a,21139
 903  0364 6b02          	ld	(OFST-2,sp),a
 904                     ; 1329   tmpccr2l = TIM3->CCR2L;
 905  0366 c65294        	ld	a,21140
 906  0369 6b01          	ld	(OFST-3,sp),a
 907                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
 908  036b 5f            	clrw	x
 909  036c 97            	ld	xl,a
 910  036d 1f03          	ldw	(OFST-1,sp),x
 911                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
 912  036f 5f            	clrw	x
 913  0370 7b02          	ld	a,(OFST-2,sp)
 914  0372 97            	ld	xl,a
 915  0373 7b04          	ld	a,(OFST+0,sp)
 916  0375 01            	rrwa	x,a
 917  0376 1a03          	or	a,(OFST-1,sp)
 918  0378 01            	rrwa	x,a
 919                     ; 1334   return ((uint16_t)tmpccr2);
 921  0379 5b04          	addw	sp,#4
 922  037b 81            	ret	
 924                     ; 1347 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
 924                     ; 1348 {
 925  037c               _TIM3_SetIC1Prescaler:
 926  037c 88            	push	a
 927  037d 88            	push	a
 928       00000001      OFST:	set	1
 930                     ; 1349   uint8_t tmpccmr1 = 0;
 931                     ; 1352   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
 932                     ; 1354   tmpccmr1 = TIM3->CCMR1;
 933  037e c65289        	ld	a,21129
 934                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
 935  0381 a4f3          	and	a,#243
 936                     ; 1360   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
 937  0383 1a02          	or	a,(OFST+1,sp)
 938                     ; 1362   TIM3->CCMR1 = tmpccmr1;
 939  0385 c75289        	ld	21129,a
 940                     ; 1363 }
 941  0388 85            	popw	x
 942  0389 81            	ret	
 944                     ; 1375 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
 944                     ; 1376 {
 945  038a               _TIM3_SetIC2Prescaler:
 946  038a 88            	push	a
 947  038b 88            	push	a
 948       00000001      OFST:	set	1
 950                     ; 1377   uint8_t tmpccmr2 = 0;
 951                     ; 1380   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
 952                     ; 1382   tmpccmr2 = TIM3->CCMR2;
 953  038c c6528a        	ld	a,21130
 954                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
 955  038f a4f3          	and	a,#243
 956                     ; 1388   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
 957  0391 1a02          	or	a,(OFST+1,sp)
 958                     ; 1390   TIM3->CCMR2 = tmpccmr2;
 959  0393 c7528a        	ld	21130,a
 960                     ; 1391 }
 961  0396 85            	popw	x
 962  0397 81            	ret	
 964                     ; 1422 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
 964                     ; 1423 {
 965  0398               _TIM3_ITConfig:
 966  0398 89            	pushw	x
 967       00000000      OFST:	set	0
 969                     ; 1425   assert_param(IS_TIM3_IT(TIM3_IT));
 970                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
 971                     ; 1428   if (NewState != DISABLE)
 972  0399 9f            	ld	a,xl
 973  039a 4d            	tnz	a
 974  039b 2706          	jreq	L361
 975                     ; 1431     TIM3->IER |= (uint8_t)TIM3_IT;
 976  039d 9e            	ld	a,xh
 977  039e ca5285        	or	a,21125
 979  03a1 2006          	jra	L561
 980  03a3               L361:
 981                     ; 1436     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
 982  03a3 7b01          	ld	a,(OFST+1,sp)
 983  03a5 43            	cpl	a
 984  03a6 c45285        	and	a,21125
 985  03a9               L561:
 986  03a9 c75285        	ld	21125,a
 987                     ; 1438 }
 988  03ac 85            	popw	x
 989  03ad 81            	ret	
 991                     ; 1451 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
 991                     ; 1452 {
 992  03ae               _TIM3_GenerateEvent:
 994                     ; 1454   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
 995                     ; 1457   TIM3->EGR |= (uint8_t)TIM3_EventSource;
 996  03ae ca5288        	or	a,21128
 997  03b1 c75288        	ld	21128,a
 998                     ; 1458 }
 999  03b4 81            	ret	
1001                     ; 1473 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
1001                     ; 1474 {
1002  03b5               _TIM3_GetFlagStatus:
1003  03b5 89            	pushw	x
1004  03b6 89            	pushw	x
1005       00000002      OFST:	set	2
1007                     ; 1475   FlagStatus bitstatus = RESET;
1008                     ; 1476   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
1010                     ; 1479   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
1011                     ; 1481   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
1012  03b7 9f            	ld	a,xl
1013  03b8 c45286        	and	a,21126
1014  03bb 6b01          	ld	(OFST-1,sp),a
1015                     ; 1482   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
1016  03bd c65287        	ld	a,21127
1017  03c0 1403          	and	a,(OFST+1,sp)
1018  03c2 6b02          	ld	(OFST+0,sp),a
1019                     ; 1484   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
1020  03c4 1a01          	or	a,(OFST-1,sp)
1021  03c6 2702          	jreq	L761
1022                     ; 1486     bitstatus = SET;
1023  03c8 a601          	ld	a,#1
1025  03ca               L761:
1026                     ; 1490     bitstatus = RESET;
1027                     ; 1492   return ((FlagStatus)bitstatus);
1029  03ca 5b04          	addw	sp,#4
1030  03cc 81            	ret	
1032                     ; 1506 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
1032                     ; 1507 {
1033  03cd               _TIM3_ClearFlag:
1034  03cd 89            	pushw	x
1035       00000000      OFST:	set	0
1037                     ; 1509   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
1038                     ; 1511   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
1039  03ce 9f            	ld	a,xl
1040  03cf 43            	cpl	a
1041  03d0 c75286        	ld	21126,a
1042                     ; 1512   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
1043  03d3 7b01          	ld	a,(OFST+1,sp)
1044  03d5 43            	cpl	a
1045  03d6 c75287        	ld	21127,a
1046                     ; 1513 }
1047  03d9 85            	popw	x
1048  03da 81            	ret	
1050                     ; 1526 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
1050                     ; 1527 {
1051  03db               _TIM3_GetITStatus:
1052  03db 88            	push	a
1053  03dc 89            	pushw	x
1054       00000002      OFST:	set	2
1056                     ; 1528   ITStatus bitstatus = RESET;
1057                     ; 1530   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
1059                     ; 1533   assert_param(IS_TIM3_GET_IT(TIM3_IT));
1060                     ; 1535   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
1061  03dd c45286        	and	a,21126
1062  03e0 6b01          	ld	(OFST-1,sp),a
1063                     ; 1537   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
1064  03e2 c65285        	ld	a,21125
1065  03e5 1403          	and	a,(OFST+1,sp)
1066  03e7 6b02          	ld	(OFST+0,sp),a
1067                     ; 1539   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET))
1068  03e9 7b01          	ld	a,(OFST-1,sp)
1069  03eb 2708          	jreq	L371
1071  03ed 7b02          	ld	a,(OFST+0,sp)
1072  03ef 2704          	jreq	L371
1073                     ; 1541     bitstatus = (ITStatus)SET;
1074  03f1 a601          	ld	a,#1
1076  03f3 2001          	jra	L571
1077  03f5               L371:
1078                     ; 1545     bitstatus = (ITStatus)RESET;
1079  03f5 4f            	clr	a
1080  03f6               L571:
1081                     ; 1547   return ((ITStatus)bitstatus);
1083  03f6 5b03          	addw	sp,#3
1084  03f8 81            	ret	
1086                     ; 1561 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
1086                     ; 1562 {
1087  03f9               _TIM3_ClearITPendingBit:
1089                     ; 1564   assert_param(IS_TIM3_IT(TIM3_IT));
1090                     ; 1567   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
1091  03f9 43            	cpl	a
1092  03fa c75286        	ld	21126,a
1093                     ; 1568 }
1094  03fd 81            	ret	
1096                     ; 1581 void TIM3_DMACmd( TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
1096                     ; 1582 {
1097  03fe               _TIM3_DMACmd:
1098  03fe 89            	pushw	x
1099       00000000      OFST:	set	0
1101                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1102                     ; 1585   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
1103                     ; 1587   if (NewState != DISABLE)
1104  03ff 9f            	ld	a,xl
1105  0400 4d            	tnz	a
1106  0401 2706          	jreq	L771
1107                     ; 1590     TIM3->DER |= TIM3_DMASource;
1108  0403 9e            	ld	a,xh
1109  0404 ca5284        	or	a,21124
1111  0407 2006          	jra	L102
1112  0409               L771:
1113                     ; 1595     TIM3->DER &= (uint8_t)(~TIM3_DMASource);
1114  0409 7b01          	ld	a,(OFST+1,sp)
1115  040b 43            	cpl	a
1116  040c c45284        	and	a,21124
1117  040f               L102:
1118  040f c75284        	ld	21124,a
1119                     ; 1597 }
1120  0412 85            	popw	x
1121  0413 81            	ret	
1123                     ; 1605 void TIM3_SelectCCDMA(FunctionalState NewState)
1123                     ; 1606 {
1124  0414               _TIM3_SelectCCDMA:
1126                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
1127                     ; 1610   if (NewState != DISABLE)
1128  0414 4d            	tnz	a
1129  0415 2705          	jreq	L302
1130                     ; 1613     TIM3->CR2 |= TIM_CR2_CCDS;
1131  0417 72165281      	bset	21121,#3
1133  041b 81            	ret	
1134  041c               L302:
1135                     ; 1618     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
1136  041c 72175281      	bres	21121,#3
1137                     ; 1620 }
1138  0420 81            	ret	
1140                     ; 1644 void TIM3_InternalClockConfig(void)
1140                     ; 1645 {
1141  0421               _TIM3_InternalClockConfig:
1143                     ; 1647   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1144  0421 c65282        	ld	a,21122
1145  0424 a4f8          	and	a,#248
1146  0426 c75282        	ld	21122,a
1147                     ; 1648 }
1148  0429 81            	ret	
1150                     ; 1665 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
1150                     ; 1666                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1150                     ; 1667                                  uint8_t ICFilter)
1150                     ; 1668 {
1151  042a               _TIM3_TIxExternalClockConfig:
1152  042a 89            	pushw	x
1153       00000000      OFST:	set	0
1155                     ; 1670   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
1156                     ; 1671   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
1157                     ; 1672   assert_param(IS_TIM3_IC_FILTER(ICFilter));
1158                     ; 1675   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
1159  042b 9e            	ld	a,xh
1160  042c a160          	cp	a,#96
1161  042e 260d          	jrne	L702
1162                     ; 1677     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
1163  0430 7b05          	ld	a,(OFST+5,sp)
1164  0432 88            	push	a
1165  0433 9f            	ld	a,xl
1166  0434 ae0001        	ldw	x,#1
1167  0437 95            	ld	xh,a
1168  0438 cd0582        	call	L5_TI2_Config
1171  043b 200c          	jra	L112
1172  043d               L702:
1173                     ; 1681     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
1174  043d 7b05          	ld	a,(OFST+5,sp)
1175  043f 88            	push	a
1176  0440 7b03          	ld	a,(OFST+3,sp)
1177  0442 ae0001        	ldw	x,#1
1178  0445 95            	ld	xh,a
1179  0446 cd054a        	call	L3_TI1_Config
1181  0449               L112:
1182  0449 84            	pop	a
1183                     ; 1685   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
1184  044a 7b01          	ld	a,(OFST+1,sp)
1185  044c ad46          	call	_TIM3_SelectInputTrigger
1187                     ; 1688   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1188  044e c65282        	ld	a,21122
1189  0451 aa07          	or	a,#7
1190  0453 c75282        	ld	21122,a
1191                     ; 1689 }
1192  0456 85            	popw	x
1193  0457 81            	ret	
1195                     ; 1707 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1195                     ; 1708                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1195                     ; 1709                               uint8_t ExtTRGFilter)
1195                     ; 1710 {
1196  0458               _TIM3_ETRClockMode1Config:
1197  0458 89            	pushw	x
1198       00000000      OFST:	set	0
1200                     ; 1712   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
1201  0459 7b05          	ld	a,(OFST+5,sp)
1202  045b 88            	push	a
1203  045c 7b02          	ld	a,(OFST+2,sp)
1204  045e 95            	ld	xh,a
1205  045f ad6a          	call	_TIM3_ETRConfig
1207  0461 84            	pop	a
1208                     ; 1715   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1209  0462 c65282        	ld	a,21122
1210  0465 a4f8          	and	a,#248
1211  0467 c75282        	ld	21122,a
1212                     ; 1716   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1213  046a c65282        	ld	a,21122
1214  046d aa07          	or	a,#7
1215  046f c75282        	ld	21122,a
1216                     ; 1719   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1217  0472 c65282        	ld	a,21122
1218  0475 a48f          	and	a,#143
1219  0477 c75282        	ld	21122,a
1220                     ; 1720   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1221  047a c65282        	ld	a,21122
1222  047d aa70          	or	a,#112
1223  047f c75282        	ld	21122,a
1224                     ; 1721 }
1225  0482 85            	popw	x
1226  0483 81            	ret	
1228                     ; 1739 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1228                     ; 1740                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1228                     ; 1741                               uint8_t ExtTRGFilter)
1228                     ; 1742 {
1229  0484               _TIM3_ETRClockMode2Config:
1230  0484 89            	pushw	x
1231       00000000      OFST:	set	0
1233                     ; 1744   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
1234  0485 7b05          	ld	a,(OFST+5,sp)
1235  0487 88            	push	a
1236  0488 7b02          	ld	a,(OFST+2,sp)
1237  048a 95            	ld	xh,a
1238  048b ad3e          	call	_TIM3_ETRConfig
1240  048d 721c5283      	bset	21123,#6
1241                     ; 1747   TIM3->ETR |= TIM_ETR_ECE ;
1242                     ; 1748 }
1243  0491 5b03          	addw	sp,#3
1244  0493 81            	ret	
1246                     ; 1799 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
1246                     ; 1800 {
1247  0494               _TIM3_SelectInputTrigger:
1248  0494 88            	push	a
1249  0495 88            	push	a
1250       00000001      OFST:	set	1
1252                     ; 1801   uint8_t tmpsmcr = 0;
1253                     ; 1804   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
1254                     ; 1806   tmpsmcr = TIM3->SMCR;
1255  0496 c65282        	ld	a,21122
1256                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
1257  0499 a48f          	and	a,#143
1258                     ; 1810   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
1259  049b 1a02          	or	a,(OFST+1,sp)
1260                     ; 1812   TIM3->SMCR = (uint8_t)tmpsmcr;
1261  049d c75282        	ld	21122,a
1262                     ; 1813 }
1263  04a0 85            	popw	x
1264  04a1 81            	ret	
1266                     ; 1827 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
1266                     ; 1828 {
1267  04a2               _TIM3_SelectOutputTrigger:
1268  04a2 88            	push	a
1269  04a3 88            	push	a
1270       00000001      OFST:	set	1
1272                     ; 1829   uint8_t tmpcr2 = 0;
1273                     ; 1832   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
1274                     ; 1834   tmpcr2 = TIM3->CR2;
1275  04a4 c65281        	ld	a,21121
1276                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
1277  04a7 a48f          	and	a,#143
1278                     ; 1840   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
1279  04a9 1a02          	or	a,(OFST+1,sp)
1280                     ; 1842   TIM3->CR2 = tmpcr2;
1281  04ab c75281        	ld	21121,a
1282                     ; 1843 }
1283  04ae 85            	popw	x
1284  04af 81            	ret	
1286                     ; 1855 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
1286                     ; 1856 {
1287  04b0               _TIM3_SelectSlaveMode:
1288  04b0 88            	push	a
1289  04b1 88            	push	a
1290       00000001      OFST:	set	1
1292                     ; 1857   uint8_t tmpsmcr = 0;
1293                     ; 1860   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
1294                     ; 1862   tmpsmcr = TIM3->SMCR;
1295  04b2 c65282        	ld	a,21122
1296                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
1297  04b5 a4f8          	and	a,#248
1298                     ; 1868   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
1299  04b7 1a02          	or	a,(OFST+1,sp)
1300                     ; 1870   TIM3->SMCR = tmpsmcr;
1301  04b9 c75282        	ld	21122,a
1302                     ; 1871 }
1303  04bc 85            	popw	x
1304  04bd 81            	ret	
1306                     ; 1879 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
1306                     ; 1880 {
1307  04be               _TIM3_SelectMasterSlaveMode:
1309                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
1310                     ; 1885   if (NewState != DISABLE)
1311  04be 4d            	tnz	a
1312  04bf 2705          	jreq	L312
1313                     ; 1887     TIM3->SMCR |= TIM_SMCR_MSM;
1314  04c1 721e5282      	bset	21122,#7
1316  04c5 81            	ret	
1317  04c6               L312:
1318                     ; 1891     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
1319  04c6 721f5282      	bres	21122,#7
1320                     ; 1893 }
1321  04ca 81            	ret	
1323                     ; 1911 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1323                     ; 1912                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1323                     ; 1913                     uint8_t ExtTRGFilter)
1323                     ; 1914 {
1324  04cb               _TIM3_ETRConfig:
1325  04cb 89            	pushw	x
1326       00000000      OFST:	set	0
1328                     ; 1916   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
1329                     ; 1917   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
1330                     ; 1918   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
1331                     ; 1921   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
1331                     ; 1922                          | (uint8_t)ExtTRGFilter);
1332  04cc 9f            	ld	a,xl
1333  04cd 1a01          	or	a,(OFST+1,sp)
1334  04cf 1a05          	or	a,(OFST+5,sp)
1335  04d1 ca5283        	or	a,21123
1336  04d4 c75283        	ld	21123,a
1337                     ; 1923 }
1338  04d7 85            	popw	x
1339  04d8 81            	ret	
1341                     ; 1958 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
1341                     ; 1959                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
1341                     ; 1960                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
1341                     ; 1961 {
1342  04d9               _TIM3_EncoderInterfaceConfig:
1343  04d9 89            	pushw	x
1344  04da 5203          	subw	sp,#3
1345       00000003      OFST:	set	3
1347                     ; 1962   uint8_t tmpsmcr = 0;
1348                     ; 1963   uint8_t tmpccmr1 = 0;
1349                     ; 1964   uint8_t tmpccmr2 = 0;
1350                     ; 1967   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
1351                     ; 1968   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
1352                     ; 1969   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
1353                     ; 1971   tmpsmcr = TIM3->SMCR;
1354  04dc c65282        	ld	a,21122
1355  04df 6b01          	ld	(OFST-2,sp),a
1356                     ; 1972   tmpccmr1 = TIM3->CCMR1;
1357  04e1 c65289        	ld	a,21129
1358  04e4 6b02          	ld	(OFST-1,sp),a
1359                     ; 1973   tmpccmr2 = TIM3->CCMR2;
1360  04e6 c6528a        	ld	a,21130
1361  04e9 6b03          	ld	(OFST+0,sp),a
1362                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
1363  04eb 7b01          	ld	a,(OFST-2,sp)
1364  04ed a4f0          	and	a,#240
1365  04ef 6b01          	ld	(OFST-2,sp),a
1366                     ; 1977   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
1367  04f1 9e            	ld	a,xh
1368  04f2 1a01          	or	a,(OFST-2,sp)
1369  04f4 6b01          	ld	(OFST-2,sp),a
1370                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
1371  04f6 7b02          	ld	a,(OFST-1,sp)
1372  04f8 a4fc          	and	a,#252
1373  04fa 6b02          	ld	(OFST-1,sp),a
1374                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
1375  04fc 7b03          	ld	a,(OFST+0,sp)
1376  04fe a4fc          	and	a,#252
1377  0500 6b03          	ld	(OFST+0,sp),a
1378                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
1379  0502 7b02          	ld	a,(OFST-1,sp)
1380  0504 aa01          	or	a,#1
1381  0506 6b02          	ld	(OFST-1,sp),a
1382                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
1383  0508 7b03          	ld	a,(OFST+0,sp)
1384  050a aa01          	or	a,#1
1385  050c 6b03          	ld	(OFST+0,sp),a
1386                     ; 1986   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
1387  050e 9f            	ld	a,xl
1388  050f 4a            	dec	a
1389  0510 2606          	jrne	L712
1390                     ; 1988     TIM3->CCER1 |= TIM_CCER1_CC1P ;
1391  0512 7212528b      	bset	21131,#1
1393  0516 2004          	jra	L122
1394  0518               L712:
1395                     ; 1992     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
1396  0518 7213528b      	bres	21131,#1
1397  051c               L122:
1398                     ; 1995   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
1399  051c 7b08          	ld	a,(OFST+5,sp)
1400  051e 4a            	dec	a
1401  051f 2606          	jrne	L322
1402                     ; 1997     TIM3->CCER1 |= TIM_CCER1_CC2P ;
1403  0521 721a528b      	bset	21131,#5
1405  0525 2004          	jra	L522
1406  0527               L322:
1407                     ; 2001     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
1408  0527 721b528b      	bres	21131,#5
1409  052b               L522:
1410                     ; 2004   TIM3->SMCR = tmpsmcr;
1411  052b 7b01          	ld	a,(OFST-2,sp)
1412  052d c75282        	ld	21122,a
1413                     ; 2005   TIM3->CCMR1 = tmpccmr1;
1414  0530 7b02          	ld	a,(OFST-1,sp)
1415  0532 c75289        	ld	21129,a
1416                     ; 2006   TIM3->CCMR2 = tmpccmr2;
1417  0535 7b03          	ld	a,(OFST+0,sp)
1418  0537 c7528a        	ld	21130,a
1419                     ; 2007 }
1420  053a 5b05          	addw	sp,#5
1421  053c 81            	ret	
1423                     ; 2015 void TIM3_SelectHallSensor(FunctionalState NewState)
1423                     ; 2016 {
1424  053d               _TIM3_SelectHallSensor:
1426                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
1427                     ; 2021   if (NewState != DISABLE)
1428  053d 4d            	tnz	a
1429  053e 2705          	jreq	L722
1430                     ; 2023     TIM3->CR2 |= TIM_CR2_TI1S;
1431  0540 721e5281      	bset	21121,#7
1433  0544 81            	ret	
1434  0545               L722:
1435                     ; 2027     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
1436  0545 721f5281      	bres	21121,#7
1437                     ; 2029 }
1438  0549 81            	ret	
1440                     ; 2050 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity, \
1440                     ; 2051                        TIM3_ICSelection_TypeDef TIM3_ICSelection, \
1440                     ; 2052                        uint8_t TIM3_ICFilter)
1440                     ; 2053 {
1441  054a               L3_TI1_Config:
1442  054a 89            	pushw	x
1443  054b 89            	pushw	x
1444       00000002      OFST:	set	2
1446                     ; 2054   uint8_t tmpccmr1 = 0;
1447                     ; 2055   uint8_t tmpicpolarity = TIM3_ICPolarity;
1448  054c 9e            	ld	a,xh
1449  054d 6b01          	ld	(OFST-1,sp),a
1450                     ; 2056   tmpccmr1 = TIM3->CCMR1;
1451  054f c65289        	ld	a,21129
1452  0552 6b02          	ld	(OFST+0,sp),a
1453                     ; 2059   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
1454                     ; 2060   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
1455                     ; 2061   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
1456                     ; 2064   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
1457  0554 7211528b      	bres	21131,#0
1458                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
1459  0558 a40c          	and	a,#12
1460  055a 6b02          	ld	(OFST+0,sp),a
1461                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
1462  055c 7b07          	ld	a,(OFST+5,sp)
1463  055e 97            	ld	xl,a
1464  055f a610          	ld	a,#16
1465  0561 42            	mul	x,a
1466  0562 9f            	ld	a,xl
1467  0563 1a04          	or	a,(OFST+2,sp)
1468  0565 1a02          	or	a,(OFST+0,sp)
1469  0567 6b02          	ld	(OFST+0,sp),a
1470                     ; 2070   TIM3->CCMR1 = tmpccmr1;
1471  0569 c75289        	ld	21129,a
1472                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
1473  056c 7b01          	ld	a,(OFST-1,sp)
1474  056e 4a            	dec	a
1475  056f 2606          	jrne	L332
1476                     ; 2075     TIM3->CCER1 |= TIM_CCER1_CC1P;
1477  0571 7212528b      	bset	21131,#1
1479  0575 2004          	jra	L532
1480  0577               L332:
1481                     ; 2079     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1482  0577 7213528b      	bres	21131,#1
1483  057b               L532:
1484                     ; 2083   TIM3->CCER1 |=  TIM_CCER1_CC1E;
1485  057b 7210528b      	bset	21131,#0
1486                     ; 2084 }
1487  057f 5b04          	addw	sp,#4
1488  0581 81            	ret	
1490                     ; 2101 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1490                     ; 2102                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
1490                     ; 2103                        uint8_t TIM3_ICFilter)
1490                     ; 2104 {
1491  0582               L5_TI2_Config:
1492  0582 89            	pushw	x
1493  0583 89            	pushw	x
1494       00000002      OFST:	set	2
1496                     ; 2105   uint8_t tmpccmr2 = 0;
1497                     ; 2106   uint8_t tmpicpolarity = TIM3_ICPolarity;
1498  0584 9e            	ld	a,xh
1499  0585 6b01          	ld	(OFST-1,sp),a
1500                     ; 2109   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
1501                     ; 2110   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
1502                     ; 2111   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
1503                     ; 2113   tmpccmr2 = TIM3->CCMR2;
1504  0587 c6528a        	ld	a,21130
1505  058a 6b02          	ld	(OFST+0,sp),a
1506                     ; 2116   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
1507  058c 7219528b      	bres	21131,#4
1508                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
1509  0590 a40c          	and	a,#12
1510  0592 6b02          	ld	(OFST+0,sp),a
1511                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
1512  0594 7b07          	ld	a,(OFST+5,sp)
1513  0596 97            	ld	xl,a
1514  0597 a610          	ld	a,#16
1515  0599 42            	mul	x,a
1516  059a 9f            	ld	a,xl
1517  059b 1a04          	or	a,(OFST+2,sp)
1518  059d 1a02          	or	a,(OFST+0,sp)
1519  059f 6b02          	ld	(OFST+0,sp),a
1520                     ; 2122   TIM3->CCMR2 = tmpccmr2;
1521  05a1 c7528a        	ld	21130,a
1522                     ; 2125   if (tmpicpolarity == TIM3_ICPolarity_Falling)
1523  05a4 7b01          	ld	a,(OFST-1,sp)
1524  05a6 4a            	dec	a
1525  05a7 2606          	jrne	L732
1526                     ; 2127     TIM3->CCER1 |= TIM_CCER1_CC2P ;
1527  05a9 721a528b      	bset	21131,#5
1529  05ad 2004          	jra	L142
1530  05af               L732:
1531                     ; 2131     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
1532  05af 721b528b      	bres	21131,#5
1533  05b3               L142:
1534                     ; 2135   TIM3->CCER1 |=  TIM_CCER1_CC2E;
1535  05b3 7218528b      	bset	21131,#4
1536                     ; 2136 }
1537  05b7 5b04          	addw	sp,#4
1538  05b9 81            	ret	
1540                     	xdef	_TIM3_SelectHallSensor
1541                     	xdef	_TIM3_EncoderInterfaceConfig
1542                     	xdef	_TIM3_ETRConfig
1543                     	xdef	_TIM3_SelectMasterSlaveMode
1544                     	xdef	_TIM3_SelectSlaveMode
1545                     	xdef	_TIM3_SelectOutputTrigger
1546                     	xdef	_TIM3_SelectInputTrigger
1547                     	xdef	_TIM3_ETRClockMode2Config
1548                     	xdef	_TIM3_ETRClockMode1Config
1549                     	xdef	_TIM3_TIxExternalClockConfig
1550                     	xdef	_TIM3_InternalClockConfig
1551                     	xdef	_TIM3_SelectCCDMA
1552                     	xdef	_TIM3_DMACmd
1553                     	xdef	_TIM3_ClearITPendingBit
1554                     	xdef	_TIM3_GetITStatus
1555                     	xdef	_TIM3_ClearFlag
1556                     	xdef	_TIM3_GetFlagStatus
1557                     	xdef	_TIM3_GenerateEvent
1558                     	xdef	_TIM3_ITConfig
1559                     	xdef	_TIM3_SetIC2Prescaler
1560                     	xdef	_TIM3_SetIC1Prescaler
1561                     	xdef	_TIM3_GetCapture2
1562                     	xdef	_TIM3_GetCapture1
1563                     	xdef	_TIM3_PWMIConfig
1564                     	xdef	_TIM3_ICInit
1565                     	xdef	_TIM3_CCxCmd
1566                     	xdef	_TIM3_OC2PolarityConfig
1567                     	xdef	_TIM3_OC1PolarityConfig
1568                     	xdef	_TIM3_OC2FastConfig
1569                     	xdef	_TIM3_OC1FastConfig
1570                     	xdef	_TIM3_OC2PreloadConfig
1571                     	xdef	_TIM3_OC1PreloadConfig
1572                     	xdef	_TIM3_ForcedOC2Config
1573                     	xdef	_TIM3_ForcedOC1Config
1574                     	xdef	_TIM3_SetCompare2
1575                     	xdef	_TIM3_SetCompare1
1576                     	xdef	_TIM3_SelectOCxM
1577                     	xdef	_TIM3_CtrlPWMOutputs
1578                     	xdef	_TIM3_BKRConfig
1579                     	xdef	_TIM3_OC2Init
1580                     	xdef	_TIM3_OC1Init
1581                     	xdef	_TIM3_Cmd
1582                     	xdef	_TIM3_SelectOnePulseMode
1583                     	xdef	_TIM3_ARRPreloadConfig
1584                     	xdef	_TIM3_UpdateRequestConfig
1585                     	xdef	_TIM3_UpdateDisableConfig
1586                     	xdef	_TIM3_GetPrescaler
1587                     	xdef	_TIM3_GetCounter
1588                     	xdef	_TIM3_SetAutoreload
1589                     	xdef	_TIM3_SetCounter
1590                     	xdef	_TIM3_CounterModeConfig
1591                     	xdef	_TIM3_PrescalerConfig
1592                     	xdef	_TIM3_TimeBaseInit
1593                     	xdef	_TIM3_DeInit
1594                     	end
