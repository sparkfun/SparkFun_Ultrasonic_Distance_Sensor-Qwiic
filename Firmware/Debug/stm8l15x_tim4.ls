   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 130 void TIM4_DeInit(void)
  18                     ; 131 {
  19                     	scross	off
  20  0000               _TIM4_DeInit:
  22                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  23  0000 725f52e0      	clr	21216
  24                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  25  0004 725f52e1      	clr	21217
  26                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  27  0008 725f52e2      	clr	21218
  28                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  29  000c 725f52e4      	clr	21220
  30                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  31  0010 725f52e7      	clr	21223
  32                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  33  0014 725f52e8      	clr	21224
  34                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  35  0018 35ff52e9      	mov	21225,#255
  36                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  37  001c 725f52e5      	clr	21221
  38                     ; 140 }
  39  0020 81            	ret	
  41                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
  41                     ; 166                        uint8_t TIM4_Period)
  41                     ; 167 {
  42  0021               _TIM4_TimeBaseInit:
  44                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
  45                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
  46  0021 9f            	ld	a,xl
  47  0022 c752e9        	ld	21225,a
  48                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
  49  0025 9e            	ld	a,xh
  50  0026 c752e8        	ld	21224,a
  51                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
  52  0029 350152e6      	mov	21222,#1
  53                     ; 177 }
  54  002d 81            	ret	
  56                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
  56                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
  56                     ; 207 {
  57  002e               _TIM4_PrescalerConfig:
  59                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
  60                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
  61                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
  62  002e 9e            	ld	a,xh
  63  002f c752e8        	ld	21224,a
  64                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
  65  0032 9f            	ld	a,xl
  66  0033 4a            	dec	a
  67  0034 2605          	jrne	L3
  68                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
  69  0036 721052e6      	bset	21222,#0
  71  003a 81            	ret	
  72  003b               L3:
  73                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
  74  003b 721152e6      	bres	21222,#0
  75                     ; 224 }
  76  003f 81            	ret	
  78                     ; 232 void TIM4_SetCounter(uint8_t Counter)
  78                     ; 233 {
  79  0040               _TIM4_SetCounter:
  81                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
  82  0040 c752e7        	ld	21223,a
  83                     ; 236 }
  84  0043 81            	ret	
  86                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
  86                     ; 245 {
  87  0044               _TIM4_SetAutoreload:
  89                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
  90  0044 c752e9        	ld	21225,a
  91                     ; 248 }
  92  0047 81            	ret	
  94                     ; 255 uint8_t TIM4_GetCounter(void)
  94                     ; 256 {
  95  0048               _TIM4_GetCounter:
  96       00000001      OFST:	set	1
  98                     ; 257   uint8_t tmpcntr = 0;
  99                     ; 258   tmpcntr = TIM4->CNTR;
 100  0048 c652e7        	ld	a,21223
 101                     ; 260   return ((uint8_t)tmpcntr);
 103  004b 81            	ret	
 105                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 105                     ; 285 {
 106  004c               _TIM4_GetPrescaler:
 108                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 109  004c c652e8        	ld	a,21224
 111  004f 81            	ret	
 113                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 113                     ; 297 {
 114  0050               _TIM4_UpdateDisableConfig:
 116                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 117                     ; 302   if (NewState != DISABLE)
 118  0050 4d            	tnz	a
 119  0051 2705          	jreq	L7
 120                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 121  0053 721252e0      	bset	21216,#1
 123  0057 81            	ret	
 124  0058               L7:
 125                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 126  0058 721352e0      	bres	21216,#1
 127                     ; 310 }
 128  005c 81            	ret	
 130                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 130                     ; 321 {
 131  005d               _TIM4_UpdateRequestConfig:
 133                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 134                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 135  005d 4a            	dec	a
 136  005e 2605          	jrne	L31
 137                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 138  0060 721452e0      	bset	21216,#2
 140  0064 81            	ret	
 141  0065               L31:
 142                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 143  0065 721552e0      	bres	21216,#2
 144                     ; 334 }
 145  0069 81            	ret	
 147                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 147                     ; 343 {
 148  006a               _TIM4_ARRPreloadConfig:
 150                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 151                     ; 348   if (NewState != DISABLE)
 152  006a 4d            	tnz	a
 153  006b 2705          	jreq	L71
 154                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 155  006d 721e52e0      	bset	21216,#7
 157  0071 81            	ret	
 158  0072               L71:
 159                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 160  0072 721f52e0      	bres	21216,#7
 161                     ; 356 }
 162  0076 81            	ret	
 164                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 164                     ; 367 {
 165  0077               _TIM4_SelectOnePulseMode:
 167                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 168                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 169  0077 4a            	dec	a
 170  0078 2605          	jrne	L32
 171                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 172  007a 721652e0      	bset	21216,#3
 174  007e 81            	ret	
 175  007f               L32:
 176                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 177  007f 721752e0      	bres	21216,#3
 178                     ; 380 }
 179  0083 81            	ret	
 181                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 181                     ; 389 {
 182  0084               _TIM4_Cmd:
 184                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 185                     ; 394   if (NewState != DISABLE)
 186  0084 4d            	tnz	a
 187  0085 2705          	jreq	L72
 188                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 189  0087 721052e0      	bset	21216,#0
 191  008b 81            	ret	
 192  008c               L72:
 193                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 194  008c 721152e0      	bres	21216,#0
 195                     ; 402 }
 196  0090 81            	ret	
 198                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 198                     ; 431 {
 199  0091               _TIM4_ITConfig:
 200  0091 89            	pushw	x
 201       00000000      OFST:	set	0
 203                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 204                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 205                     ; 436   if (NewState != DISABLE)
 206  0092 9f            	ld	a,xl
 207  0093 4d            	tnz	a
 208  0094 2706          	jreq	L33
 209                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 210  0096 9e            	ld	a,xh
 211  0097 ca52e4        	or	a,21220
 213  009a 2006          	jra	L53
 214  009c               L33:
 215                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 216  009c 7b01          	ld	a,(OFST+1,sp)
 217  009e 43            	cpl	a
 218  009f c452e4        	and	a,21220
 219  00a2               L53:
 220  00a2 c752e4        	ld	21220,a
 221                     ; 446 }
 222  00a5 85            	popw	x
 223  00a6 81            	ret	
 225                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 225                     ; 457 {
 226  00a7               _TIM4_GenerateEvent:
 228                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
 229                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
 230  00a7 ca52e6        	or	a,21222
 231  00aa c752e6        	ld	21222,a
 232                     ; 463 }
 233  00ad 81            	ret	
 235                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
 235                     ; 475 {
 236  00ae               _TIM4_GetFlagStatus:
 237       00000001      OFST:	set	1
 239                     ; 476   FlagStatus bitstatus = RESET;
 240                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
 241                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
 242  00ae c452e5        	and	a,21221
 243  00b1 2702          	jreq	L73
 244                     ; 483     bitstatus = SET;
 245  00b3 a601          	ld	a,#1
 247  00b5               L73:
 248                     ; 487     bitstatus = RESET;
 249                     ; 489   return ((FlagStatus)bitstatus);
 251  00b5 81            	ret	
 253                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
 253                     ; 501 {
 254  00b6               _TIM4_ClearFlag:
 256                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
 257                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
 258  00b6 43            	cpl	a
 259  00b7 c752e5        	ld	21221,a
 260                     ; 506 }
 261  00ba 81            	ret	
 263                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
 263                     ; 519 {
 264  00bb               _TIM4_GetITStatus:
 265  00bb 88            	push	a
 266  00bc 89            	pushw	x
 267       00000002      OFST:	set	2
 269                     ; 520   ITStatus bitstatus = RESET;
 270                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
 272                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
 273                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
 274  00bd c452e5        	and	a,21221
 275  00c0 6b01          	ld	(OFST-1,sp),a
 276                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
 277  00c2 c652e4        	ld	a,21220
 278  00c5 1403          	and	a,(OFST+1,sp)
 279  00c7 6b02          	ld	(OFST+0,sp),a
 280                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
 281  00c9 7b01          	ld	a,(OFST-1,sp)
 282  00cb 2708          	jreq	L34
 284  00cd 7b02          	ld	a,(OFST+0,sp)
 285  00cf 2704          	jreq	L34
 286                     ; 533     bitstatus = (ITStatus)SET;
 287  00d1 a601          	ld	a,#1
 289  00d3 2001          	jra	L54
 290  00d5               L34:
 291                     ; 537     bitstatus = (ITStatus)RESET;
 292  00d5 4f            	clr	a
 293  00d6               L54:
 294                     ; 539   return ((ITStatus)bitstatus);
 296  00d6 5b03          	addw	sp,#3
 297  00d8 81            	ret	
 299                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
 299                     ; 551 {
 300  00d9               _TIM4_ClearITPendingBit:
 302                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
 303                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
 304  00d9 43            	cpl	a
 305  00da c752e5        	ld	21221,a
 306                     ; 557 }
 307  00dd 81            	ret	
 309                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
 309                     ; 569 {
 310  00de               _TIM4_DMACmd:
 311  00de 89            	pushw	x
 312       00000000      OFST:	set	0
 314                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 315                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
 316                     ; 574   if (NewState != DISABLE)
 317  00df 9f            	ld	a,xl
 318  00e0 4d            	tnz	a
 319  00e1 2706          	jreq	L74
 320                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
 321  00e3 9e            	ld	a,xh
 322  00e4 ca52e3        	or	a,21219
 324  00e7 2006          	jra	L15
 325  00e9               L74:
 326                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
 327  00e9 7b01          	ld	a,(OFST+1,sp)
 328  00eb 43            	cpl	a
 329  00ec c452e3        	and	a,21219
 330  00ef               L15:
 331  00ef c752e3        	ld	21219,a
 332                     ; 584 }
 333  00f2 85            	popw	x
 334  00f3 81            	ret	
 336                     ; 607 void TIM4_InternalClockConfig(void)
 336                     ; 608 {
 337  00f4               _TIM4_InternalClockConfig:
 339                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
 340  00f4 c652e2        	ld	a,21218
 341  00f7 a4f8          	and	a,#248
 342  00f9 c752e2        	ld	21218,a
 343                     ; 611 }
 344  00fc 81            	ret	
 346                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 346                     ; 652 {
 347  00fd               _TIM4_SelectInputTrigger:
 348  00fd 88            	push	a
 349  00fe 88            	push	a
 350       00000001      OFST:	set	1
 352                     ; 653   uint8_t tmpsmcr = 0;
 353                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 354                     ; 658   tmpsmcr = TIM4->SMCR;
 355  00ff c652e2        	ld	a,21218
 356                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 357  0102 a48f          	and	a,#143
 358                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 359  0104 1a02          	or	a,(OFST+1,sp)
 360                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
 361  0106 c752e2        	ld	21218,a
 362                     ; 665 }
 363  0109 85            	popw	x
 364  010a 81            	ret	
 366                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 366                     ; 677 {
 367  010b               _TIM4_SelectOutputTrigger:
 368  010b 88            	push	a
 369  010c 88            	push	a
 370       00000001      OFST:	set	1
 372                     ; 678   uint8_t tmpcr2 = 0;
 373                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 374                     ; 683   tmpcr2 = TIM4->CR2;
 375  010d c652e1        	ld	a,21217
 376                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 377  0110 a48f          	and	a,#143
 378                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
 379  0112 1a02          	or	a,(OFST+1,sp)
 380                     ; 691   TIM4->CR2 = tmpcr2;
 381  0114 c752e1        	ld	21217,a
 382                     ; 692 }
 383  0117 85            	popw	x
 384  0118 81            	ret	
 386                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
 386                     ; 707 {
 387  0119               _TIM4_SelectSlaveMode:
 388  0119 88            	push	a
 389  011a 88            	push	a
 390       00000001      OFST:	set	1
 392                     ; 708   uint8_t tmpsmcr = 0;
 393                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
 394                     ; 713   tmpsmcr = TIM4->SMCR;
 395  011b c652e2        	ld	a,21218
 396                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
 397  011e a4f8          	and	a,#248
 398                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
 399  0120 1a02          	or	a,(OFST+1,sp)
 400                     ; 721   TIM4->SMCR = tmpsmcr;
 401  0122 c752e2        	ld	21218,a
 402                     ; 722 }
 403  0125 85            	popw	x
 404  0126 81            	ret	
 406                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
 406                     ; 731 {
 407  0127               _TIM4_SelectMasterSlaveMode:
 409                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
 410                     ; 736   if (NewState != DISABLE)
 411  0127 4d            	tnz	a
 412  0128 2705          	jreq	L35
 413                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
 414  012a 721e52e2      	bset	21218,#7
 416  012e 81            	ret	
 417  012f               L35:
 418                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
 419  012f 721f52e2      	bres	21218,#7
 420                     ; 744 }
 421  0133 81            	ret	
 423                     	xdef	_TIM4_SelectMasterSlaveMode
 424                     	xdef	_TIM4_SelectSlaveMode
 425                     	xdef	_TIM4_SelectOutputTrigger
 426                     	xdef	_TIM4_SelectInputTrigger
 427                     	xdef	_TIM4_InternalClockConfig
 428                     	xdef	_TIM4_DMACmd
 429                     	xdef	_TIM4_ClearITPendingBit
 430                     	xdef	_TIM4_GetITStatus
 431                     	xdef	_TIM4_ClearFlag
 432                     	xdef	_TIM4_GetFlagStatus
 433                     	xdef	_TIM4_GenerateEvent
 434                     	xdef	_TIM4_ITConfig
 435                     	xdef	_TIM4_Cmd
 436                     	xdef	_TIM4_SelectOnePulseMode
 437                     	xdef	_TIM4_ARRPreloadConfig
 438                     	xdef	_TIM4_UpdateRequestConfig
 439                     	xdef	_TIM4_UpdateDisableConfig
 440                     	xdef	_TIM4_GetPrescaler
 441                     	xdef	_TIM4_GetCounter
 442                     	xdef	_TIM4_SetAutoreload
 443                     	xdef	_TIM4_SetCounter
 444                     	xdef	_TIM4_PrescalerConfig
 445                     	xdef	_TIM4_TimeBaseInit
 446                     	xdef	_TIM4_DeInit
 447                     	end
