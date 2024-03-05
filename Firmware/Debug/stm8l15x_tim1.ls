   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 181 void TIM1_DeInit(void)
  18                     ; 182 {
  19                     	scross	off
  20  0000               _TIM1_DeInit:
  22                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  23  0000 725f52b0      	clr	21168
  24                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  25  0004 725f52b1      	clr	21169
  26                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  27  0008 725f52b2      	clr	21170
  28                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  29  000c 725f52b3      	clr	21171
  30                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  31  0010 725f52b5      	clr	21173
  32                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  33  0014 725f52bd      	clr	21181
  34                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  35  0018 725f52be      	clr	21182
  36                     ; 193   TIM1->CCMR1 = 0x01;
  37  001c 350152b9      	mov	21177,#1
  38                     ; 194   TIM1->CCMR2 = 0x01;
  39  0020 350152ba      	mov	21178,#1
  40                     ; 195   TIM1->CCMR3 = 0x01;
  41  0024 350152bb      	mov	21179,#1
  42                     ; 196   TIM1->CCMR4 = 0x01;
  43  0028 350152bc      	mov	21180,#1
  44                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  45  002c 725f52bd      	clr	21181
  46                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  47  0030 725f52be      	clr	21182
  48                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  49  0034 725f52b9      	clr	21177
  50                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  51  0038 725f52ba      	clr	21178
  52                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  53  003c 725f52bb      	clr	21179
  54                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  55  0040 725f52bc      	clr	21180
  56                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  57  0044 725f52bf      	clr	21183
  58                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  59  0048 725f52c0      	clr	21184
  60                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  61  004c 725f52c1      	clr	21185
  62                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
  63  0050 725f52c2      	clr	21186
  64                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
  65  0054 35ff52c3      	mov	21187,#255
  66                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
  67  0058 35ff52c4      	mov	21188,#255
  68                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
  69  005c 725f52c6      	clr	21190
  70                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
  71  0060 725f52c7      	clr	21191
  72                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
  73  0064 725f52c8      	clr	21192
  74                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
  75  0068 725f52c9      	clr	21193
  76                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
  77  006c 725f52ca      	clr	21194
  78                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
  79  0070 725f52cb      	clr	21195
  80                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
  81  0074 725f52cc      	clr	21196
  82                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
  83  0078 725f52cd      	clr	21197
  84                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
  85  007c 725f52d0      	clr	21200
  86                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
  87  0080 350152b8      	mov	21176,#1
  88                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
  89  0084 725f52cf      	clr	21199
  90                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
  91  0088 725f52ce      	clr	21198
  92                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
  93  008c 725f52c5      	clr	21189
  94                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
  95  0090 725f52b6      	clr	21174
  96                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
  97  0094 725f52b7      	clr	21175
  98                     ; 225 }
  99  0098 81            	ret	
 101                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 101                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 101                     ; 243                        uint16_t TIM1_Period,
 101                     ; 244                        uint8_t TIM1_RepetitionCounter)
 101                     ; 245 {
 102  0099               _TIM1_TimeBaseInit:
 103       fffffffe      OFST: set -2
 105                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 106                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 107  0099 7b04          	ld	a,(OFST+6,sp)
 108  009b c752c3        	ld	21187,a
 109                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 110  009e 7b05          	ld	a,(OFST+7,sp)
 111  00a0 c752c4        	ld	21188,a
 112                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 113  00a3 9e            	ld	a,xh
 114  00a4 c752c1        	ld	21185,a
 115                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 116  00a7 9f            	ld	a,xl
 117  00a8 c752c2        	ld	21186,a
 118                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 118                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 119  00ab c652b0        	ld	a,21168
 120  00ae a48f          	and	a,#143
 121  00b0 1a03          	or	a,(OFST+5,sp)
 122  00b2 c752b0        	ld	21168,a
 123                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 124  00b5 7b06          	ld	a,(OFST+8,sp)
 125  00b7 c752c5        	ld	21189,a
 126                     ; 265 }
 127  00ba 81            	ret	
 129                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 129                     ; 280 {
 130  00bb               _TIM1_PrescalerConfig:
 131       fffffffe      OFST: set -2
 133                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 134                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 135  00bb 9e            	ld	a,xh
 136  00bc c752c1        	ld	21185,a
 137                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 138  00bf 9f            	ld	a,xl
 139  00c0 c752c2        	ld	21186,a
 140                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 141  00c3 7b03          	ld	a,(OFST+5,sp)
 142  00c5 c752b8        	ld	21176,a
 143                     ; 290 }
 144  00c8 81            	ret	
 146                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 146                     ; 304 {
 147  00c9               _TIM1_CounterModeConfig:
 148  00c9 88            	push	a
 149       00000000      OFST:	set	0
 151                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 152                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 152                     ; 311                         | (uint8_t)TIM1_CounterMode);
 153  00ca c652b0        	ld	a,21168
 154  00cd a48f          	and	a,#143
 155  00cf 1a01          	or	a,(OFST+1,sp)
 156  00d1 c752b0        	ld	21168,a
 157                     ; 312 }
 158  00d4 84            	pop	a
 159  00d5 81            	ret	
 161                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 161                     ; 321 {
 162  00d6               _TIM1_SetCounter:
 164                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 165  00d6 9e            	ld	a,xh
 166  00d7 c752bf        	ld	21183,a
 167                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 168  00da 9f            	ld	a,xl
 169  00db c752c0        	ld	21184,a
 170                     ; 325 }
 171  00de 81            	ret	
 173                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 173                     ; 334 {
 174  00df               _TIM1_SetAutoreload:
 176                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 177  00df 9e            	ld	a,xh
 178  00e0 c752c3        	ld	21187,a
 179                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 180  00e3 9f            	ld	a,xl
 181  00e4 c752c4        	ld	21188,a
 182                     ; 338 }
 183  00e7 81            	ret	
 185                     ; 345 uint16_t TIM1_GetCounter(void)
 185                     ; 346 {
 186  00e8               _TIM1_GetCounter:
 187  00e8 5204          	subw	sp,#4
 188       00000004      OFST:	set	4
 190                     ; 348   uint16_t tmpcntr = 0;
 191                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 193                     ; 351   tmpcntrh = TIM1->CNTRH;
 194  00ea c652bf        	ld	a,21183
 195  00ed 6b02          	ld	(OFST-2,sp),a
 196                     ; 352   tmpcntrl = TIM1->CNTRL;
 197  00ef c652c0        	ld	a,21184
 198  00f2 6b01          	ld	(OFST-3,sp),a
 199                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 200  00f4 5f            	clrw	x
 201  00f5 97            	ld	xl,a
 202  00f6 1f03          	ldw	(OFST-1,sp),x
 203                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 204  00f8 5f            	clrw	x
 205  00f9 7b02          	ld	a,(OFST-2,sp)
 206  00fb 97            	ld	xl,a
 207  00fc 7b04          	ld	a,(OFST+0,sp)
 208  00fe 01            	rrwa	x,a
 209  00ff 1a03          	or	a,(OFST-1,sp)
 210  0101 01            	rrwa	x,a
 211                     ; 358   return (uint16_t)tmpcntr;
 213  0102 5b04          	addw	sp,#4
 214  0104 81            	ret	
 216                     ; 366 uint16_t TIM1_GetPrescaler(void)
 216                     ; 367 {
 217  0105               _TIM1_GetPrescaler:
 218  0105 89            	pushw	x
 219       00000002      OFST:	set	2
 221                     ; 368   uint16_t tmpreg = 0;
 222                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 223  0106 c652c1        	ld	a,21185
 224  0109 97            	ld	xl,a
 225  010a 4f            	clr	a
 226  010b 02            	rlwa	x,a
 227  010c 1f01          	ldw	(OFST-1,sp),x
 228                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 229  010e c652c2        	ld	a,21186
 230  0111 5f            	clrw	x
 231  0112 97            	ld	xl,a
 232  0113 01            	rrwa	x,a
 233  0114 1a02          	or	a,(OFST+0,sp)
 234  0116 01            	rrwa	x,a
 235  0117 1a01          	or	a,(OFST-1,sp)
 236  0119 01            	rrwa	x,a
 238  011a 5b02          	addw	sp,#2
 239  011c 81            	ret	
 241                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 241                     ; 381 {
 242  011d               _TIM1_UpdateDisableConfig:
 244                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 245                     ; 386   if (NewState != DISABLE)
 246  011d 4d            	tnz	a
 247  011e 2705          	jreq	L31
 248                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 249  0120 721252b0      	bset	21168,#1
 251  0124 81            	ret	
 252  0125               L31:
 253                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 254  0125 721352b0      	bres	21168,#1
 255                     ; 394 }
 256  0129 81            	ret	
 258                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 258                     ; 405 {
 259  012a               _TIM1_UpdateRequestConfig:
 261                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 262                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 263  012a 4d            	tnz	a
 264  012b 2705          	jreq	L71
 265                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 266  012d 721452b0      	bset	21168,#2
 268  0131 81            	ret	
 269  0132               L71:
 270                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 271  0132 721552b0      	bres	21168,#2
 272                     ; 418 }
 273  0136 81            	ret	
 275                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 275                     ; 427 {
 276  0137               _TIM1_ARRPreloadConfig:
 278                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 279                     ; 432   if (NewState != DISABLE)
 280  0137 4d            	tnz	a
 281  0138 2705          	jreq	L32
 282                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 283  013a 721e52b0      	bset	21168,#7
 285  013e 81            	ret	
 286  013f               L32:
 287                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 288  013f 721f52b0      	bres	21168,#7
 289                     ; 440 }
 290  0143 81            	ret	
 292                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 292                     ; 451 {
 293  0144               _TIM1_SelectOnePulseMode:
 295                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 296                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 297  0144 4d            	tnz	a
 298  0145 2705          	jreq	L72
 299                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
 300  0147 721652b0      	bset	21168,#3
 302  014b 81            	ret	
 303  014c               L72:
 304                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
 305  014c 721752b0      	bres	21168,#3
 306                     ; 464 }
 307  0150 81            	ret	
 309                     ; 472 void TIM1_Cmd(FunctionalState NewState)
 309                     ; 473 {
 310  0151               _TIM1_Cmd:
 312                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
 313                     ; 478   if (NewState != DISABLE)
 314  0151 4d            	tnz	a
 315  0152 2705          	jreq	L33
 316                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
 317  0154 721052b0      	bset	21168,#0
 319  0158 81            	ret	
 320  0159               L33:
 321                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
 322  0159 721152b0      	bres	21168,#0
 323                     ; 486 }
 324  015d 81            	ret	
 326                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 326                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
 326                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 326                     ; 580                   uint16_t TIM1_Pulse,
 326                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 326                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 326                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 326                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 326                     ; 585 {
 327  015e               _TIM1_OC1Init:
 328  015e 89            	pushw	x
 329  015f 5203          	subw	sp,#3
 330       00000003      OFST:	set	3
 332                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 333                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 334                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 335                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 336                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 337                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 338                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 339                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
 339                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 340  0161 c652bd        	ld	a,21181
 341  0164 a4f0          	and	a,#240
 342  0166 c752bd        	ld	21181,a
 343                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 343                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 343                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 343                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 344  0169 7b0c          	ld	a,(OFST+9,sp)
 345  016b a408          	and	a,#8
 346  016d 6b03          	ld	(OFST+0,sp),a
 347  016f 7b0b          	ld	a,(OFST+8,sp)
 348  0171 a402          	and	a,#2
 349  0173 1a03          	or	a,(OFST+0,sp)
 350  0175 6b02          	ld	(OFST-1,sp),a
 351  0177 7b08          	ld	a,(OFST+5,sp)
 352  0179 a404          	and	a,#4
 353  017b 6b01          	ld	(OFST-2,sp),a
 354  017d 9f            	ld	a,xl
 355  017e a401          	and	a,#1
 356  0180 1a01          	or	a,(OFST-2,sp)
 357  0182 1a02          	or	a,(OFST-1,sp)
 358  0184 ca52bd        	or	a,21181
 359  0187 c752bd        	ld	21181,a
 360                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
 360                     ; 608                           | (uint8_t)TIM1_OCMode);
 361  018a c652b9        	ld	a,21177
 362  018d a48f          	and	a,#143
 363  018f 1a04          	or	a,(OFST+1,sp)
 364  0191 c752b9        	ld	21177,a
 365                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 366  0194 c652d0        	ld	a,21200
 367  0197 a4fc          	and	a,#252
 368  0199 c752d0        	ld	21200,a
 369                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
 369                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
 370  019c 7b0e          	ld	a,(OFST+11,sp)
 371  019e a402          	and	a,#2
 372  01a0 6b03          	ld	(OFST+0,sp),a
 373  01a2 7b0d          	ld	a,(OFST+10,sp)
 374  01a4 a401          	and	a,#1
 375  01a6 1a03          	or	a,(OFST+0,sp)
 376  01a8 ca52d0        	or	a,21200
 377  01ab c752d0        	ld	21200,a
 378                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 379  01ae 7b09          	ld	a,(OFST+6,sp)
 380  01b0 c752c6        	ld	21190,a
 381                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 382  01b3 7b0a          	ld	a,(OFST+7,sp)
 383  01b5 c752c7        	ld	21191,a
 384                     ; 619 }
 385  01b8 5b05          	addw	sp,#5
 386  01ba 81            	ret	
 388                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 388                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
 388                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 388                     ; 661                   uint16_t TIM1_Pulse,
 388                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 388                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 388                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 388                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 388                     ; 666 {
 389  01bb               _TIM1_OC2Init:
 390  01bb 89            	pushw	x
 391  01bc 5203          	subw	sp,#3
 392       00000003      OFST:	set	3
 394                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 395                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 396                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 397                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 398                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 399                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 400                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 401                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 402  01be c652bd        	ld	a,21181
 403  01c1 a40f          	and	a,#15
 404  01c3 c752bd        	ld	21181,a
 405                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
 405                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
 406  01c6 7b0c          	ld	a,(OFST+9,sp)
 407  01c8 a480          	and	a,#128
 408  01ca 6b03          	ld	(OFST+0,sp),a
 409  01cc 7b0b          	ld	a,(OFST+8,sp)
 410  01ce a420          	and	a,#32
 411  01d0 1a03          	or	a,(OFST+0,sp)
 412  01d2 6b02          	ld	(OFST-1,sp),a
 413  01d4 7b08          	ld	a,(OFST+5,sp)
 414  01d6 a440          	and	a,#64
 415  01d8 6b01          	ld	(OFST-2,sp),a
 416  01da 9f            	ld	a,xl
 417  01db a410          	and	a,#16
 418  01dd 1a01          	or	a,(OFST-2,sp)
 419  01df 1a02          	or	a,(OFST-1,sp)
 420  01e1 ca52bd        	or	a,21181
 421  01e4 c752bd        	ld	21181,a
 422                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 423  01e7 c652ba        	ld	a,21178
 424  01ea a48f          	and	a,#143
 425  01ec 1a04          	or	a,(OFST+1,sp)
 426  01ee c752ba        	ld	21178,a
 427                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 428  01f1 c652d0        	ld	a,21200
 429  01f4 a4f3          	and	a,#243
 430  01f6 c752d0        	ld	21200,a
 431                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 432  01f9 7b0e          	ld	a,(OFST+11,sp)
 433  01fb a408          	and	a,#8
 434  01fd 6b03          	ld	(OFST+0,sp),a
 435  01ff 7b0d          	ld	a,(OFST+10,sp)
 436  0201 a404          	and	a,#4
 437  0203 1a03          	or	a,(OFST+0,sp)
 438  0205 ca52d0        	or	a,21200
 439  0208 c752d0        	ld	21200,a
 440                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 441  020b 7b09          	ld	a,(OFST+6,sp)
 442  020d c752c8        	ld	21192,a
 443                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 444  0210 7b0a          	ld	a,(OFST+7,sp)
 445  0212 c752c9        	ld	21193,a
 446                     ; 696 }
 447  0215 5b05          	addw	sp,#5
 448  0217 81            	ret	
 450                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 450                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
 450                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 450                     ; 738                   uint16_t TIM1_Pulse,
 450                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 450                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 450                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 450                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 450                     ; 743 {
 451  0218               _TIM1_OC3Init:
 452  0218 89            	pushw	x
 453  0219 5203          	subw	sp,#3
 454       00000003      OFST:	set	3
 456                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 457                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 458                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 459                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 460                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 461                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 462                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 463                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 464  021b c652be        	ld	a,21182
 465  021e a4f0          	and	a,#240
 466  0220 c752be        	ld	21182,a
 467                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
 467                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
 468  0223 7b0c          	ld	a,(OFST+9,sp)
 469  0225 a408          	and	a,#8
 470  0227 6b03          	ld	(OFST+0,sp),a
 471  0229 7b0b          	ld	a,(OFST+8,sp)
 472  022b a402          	and	a,#2
 473  022d 1a03          	or	a,(OFST+0,sp)
 474  022f 6b02          	ld	(OFST-1,sp),a
 475  0231 7b08          	ld	a,(OFST+5,sp)
 476  0233 a404          	and	a,#4
 477  0235 6b01          	ld	(OFST-2,sp),a
 478  0237 9f            	ld	a,xl
 479  0238 a401          	and	a,#1
 480  023a 1a01          	or	a,(OFST-2,sp)
 481  023c 1a02          	or	a,(OFST-1,sp)
 482  023e ca52be        	or	a,21182
 483  0241 c752be        	ld	21182,a
 484                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 485  0244 c652bb        	ld	a,21179
 486  0247 a48f          	and	a,#143
 487  0249 1a04          	or	a,(OFST+1,sp)
 488  024b c752bb        	ld	21179,a
 489                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
 490  024e c652d0        	ld	a,21200
 491  0251 a4cf          	and	a,#207
 492  0253 c752d0        	ld	21200,a
 493                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
 494  0256 7b0e          	ld	a,(OFST+11,sp)
 495  0258 a420          	and	a,#32
 496  025a 6b03          	ld	(OFST+0,sp),a
 497  025c 7b0d          	ld	a,(OFST+10,sp)
 498  025e a410          	and	a,#16
 499  0260 1a03          	or	a,(OFST+0,sp)
 500  0262 ca52d0        	or	a,21200
 501  0265 c752d0        	ld	21200,a
 502                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
 503  0268 7b09          	ld	a,(OFST+6,sp)
 504  026a c752ca        	ld	21194,a
 505                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
 506  026d 7b0a          	ld	a,(OFST+7,sp)
 507  026f c752cb        	ld	21195,a
 508                     ; 773 }
 509  0272 5b05          	addw	sp,#5
 510  0274 81            	ret	
 512                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
 512                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
 512                     ; 805                      uint8_t TIM1_DeadTime,
 512                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
 512                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
 512                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
 512                     ; 809 {
 513  0275               _TIM1_BDTRConfig:
 514  0275 89            	pushw	x
 515  0276 88            	push	a
 516       00000001      OFST:	set	1
 518                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
 519                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
 520                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
 521                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
 522                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
 523                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
 524  0277 7b06          	ld	a,(OFST+5,sp)
 525  0279 c752cf        	ld	21199,a
 526                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
 526                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
 526                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
 527  027c 7b07          	ld	a,(OFST+6,sp)
 528  027e 1a08          	or	a,(OFST+7,sp)
 529  0280 1a09          	or	a,(OFST+8,sp)
 530  0282 6b01          	ld	(OFST+0,sp),a
 531  0284 9f            	ld	a,xl
 532  0285 1a02          	or	a,(OFST+1,sp)
 533  0287 1a01          	or	a,(OFST+0,sp)
 534  0289 c752ce        	ld	21198,a
 535                     ; 826 }
 536  028c 5b03          	addw	sp,#3
 537  028e 81            	ret	
 539                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
 539                     ; 835 {
 540  028f               _TIM1_CtrlPWMOutputs:
 542                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
 543                     ; 841   if (NewState != DISABLE)
 544  028f 4d            	tnz	a
 545  0290 2705          	jreq	L73
 546                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
 547  0292 721e52ce      	bset	21198,#7
 549  0296 81            	ret	
 550  0297               L73:
 551                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
 552  0297 721f52ce      	bres	21198,#7
 553                     ; 849 }
 554  029b 81            	ret	
 556                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
 556                     ; 872 {
 557  029c               _TIM1_SelectOCxM:
 558  029c 89            	pushw	x
 559       00000000      OFST:	set	0
 561                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
 562                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
 563                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
 564  029d 9e            	ld	a,xh
 565  029e 4d            	tnz	a
 566  029f 2610          	jrne	L34
 567                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
 568  02a1 721152bd      	bres	21181,#0
 569                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 570  02a5 c652b9        	ld	a,21177
 571  02a8 a48f          	and	a,#143
 572  02aa 1a02          	or	a,(OFST+2,sp)
 573  02ac c752b9        	ld	21177,a
 575  02af 2023          	jra	L54
 576  02b1               L34:
 577                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
 578  02b1 7b01          	ld	a,(OFST+1,sp)
 579  02b3 4a            	dec	a
 580  02b4 2610          	jrne	L74
 581                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
 582  02b6 721952bd      	bres	21181,#4
 583                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 584  02ba c652ba        	ld	a,21178
 585  02bd a48f          	and	a,#143
 586  02bf 1a02          	or	a,(OFST+2,sp)
 587  02c1 c752ba        	ld	21178,a
 589  02c4 200e          	jra	L54
 590  02c6               L74:
 591                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
 592  02c6 721152be      	bres	21182,#0
 593                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 594  02ca c652bb        	ld	a,21179
 595  02cd a48f          	and	a,#143
 596  02cf 1a02          	or	a,(OFST+2,sp)
 597  02d1 c752bb        	ld	21179,a
 598  02d4               L54:
 599                     ; 902 }
 600  02d4 85            	popw	x
 601  02d5 81            	ret	
 603                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
 603                     ; 911 {
 604  02d6               _TIM1_SetCompare1:
 606                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
 607  02d6 9e            	ld	a,xh
 608  02d7 c752c6        	ld	21190,a
 609                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
 610  02da 9f            	ld	a,xl
 611  02db c752c7        	ld	21191,a
 612                     ; 916 }
 613  02de 81            	ret	
 615                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
 615                     ; 925 {
 616  02df               _TIM1_SetCompare2:
 618                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
 619  02df 9e            	ld	a,xh
 620  02e0 c752c8        	ld	21192,a
 621                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
 622  02e3 9f            	ld	a,xl
 623  02e4 c752c9        	ld	21193,a
 624                     ; 929 }
 625  02e7 81            	ret	
 627                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
 627                     ; 938 {
 628  02e8               _TIM1_SetCompare3:
 630                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
 631  02e8 9e            	ld	a,xh
 632  02e9 c752ca        	ld	21194,a
 633                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
 634  02ec 9f            	ld	a,xl
 635  02ed c752cb        	ld	21195,a
 636                     ; 942 }
 637  02f0 81            	ret	
 639                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
 639                     ; 951 {
 640  02f1               _TIM1_SetCompare4:
 642                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
 643  02f1 9e            	ld	a,xh
 644  02f2 c752cc        	ld	21196,a
 645                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
 646  02f5 9f            	ld	a,xl
 647  02f6 c752cd        	ld	21197,a
 648                     ; 955 }
 649  02f9 81            	ret	
 651                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
 651                     ; 964 {
 652  02fa               _TIM1_CCPreloadControl:
 654                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
 655                     ; 969   if (NewState != DISABLE)
 656  02fa 4d            	tnz	a
 657  02fb 2705          	jreq	L35
 658                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
 659  02fd 721052b1      	bset	21169,#0
 661  0301 81            	ret	
 662  0302               L35:
 663                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
 664  0302 721152b1      	bres	21169,#0
 665                     ; 977 }
 666  0306 81            	ret	
 668                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 668                     ; 988 {
 669  0307               _TIM1_ForcedOC1Config:
 670  0307 88            	push	a
 671       00000000      OFST:	set	0
 673                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
 674                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
 675  0308 c652b9        	ld	a,21177
 676  030b a48f          	and	a,#143
 677  030d 1a01          	or	a,(OFST+1,sp)
 678  030f c752b9        	ld	21177,a
 679                     ; 994 }
 680  0312 84            	pop	a
 681  0313 81            	ret	
 683                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 683                     ; 1005 {
 684  0314               _TIM1_ForcedOC2Config:
 685  0314 88            	push	a
 686       00000000      OFST:	set	0
 688                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
 689                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
 690  0315 c652ba        	ld	a,21178
 691  0318 a48f          	and	a,#143
 692  031a 1a01          	or	a,(OFST+1,sp)
 693  031c c752ba        	ld	21178,a
 694                     ; 1011 }
 695  031f 84            	pop	a
 696  0320 81            	ret	
 698                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 698                     ; 1022 {
 699  0321               _TIM1_ForcedOC3Config:
 700  0321 88            	push	a
 701       00000000      OFST:	set	0
 703                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
 704                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
 705  0322 c652bb        	ld	a,21179
 706  0325 a48f          	and	a,#143
 707  0327 1a01          	or	a,(OFST+1,sp)
 708  0329 c752bb        	ld	21179,a
 709                     ; 1028 }
 710  032c 84            	pop	a
 711  032d 81            	ret	
 713                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
 713                     ; 1037 {
 714  032e               _TIM1_OC1PreloadConfig:
 716                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
 717                     ; 1042   if (NewState != DISABLE)
 718  032e 4d            	tnz	a
 719  032f 2705          	jreq	L75
 720                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
 721  0331 721652b9      	bset	21177,#3
 723  0335 81            	ret	
 724  0336               L75:
 725                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 726  0336 721752b9      	bres	21177,#3
 727                     ; 1050 }
 728  033a 81            	ret	
 730                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
 730                     ; 1059 {
 731  033b               _TIM1_OC2PreloadConfig:
 733                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
 734                     ; 1064   if (NewState != DISABLE)
 735  033b 4d            	tnz	a
 736  033c 2705          	jreq	L36
 737                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
 738  033e 721652ba      	bset	21178,#3
 740  0342 81            	ret	
 741  0343               L36:
 742                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 743  0343 721752ba      	bres	21178,#3
 744                     ; 1072 }
 745  0347 81            	ret	
 747                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
 747                     ; 1081 {
 748  0348               _TIM1_OC3PreloadConfig:
 750                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
 751                     ; 1086   if (NewState != DISABLE)
 752  0348 4d            	tnz	a
 753  0349 2705          	jreq	L76
 754                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
 755  034b 721652bb      	bset	21179,#3
 757  034f 81            	ret	
 758  0350               L76:
 759                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 760  0350 721752bb      	bres	21179,#3
 761                     ; 1094 }
 762  0354 81            	ret	
 764                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
 764                     ; 1103 {
 765  0355               _TIM1_OC4PreloadConfig:
 767                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
 768                     ; 1108   if (NewState != DISABLE)
 769  0355 4d            	tnz	a
 770  0356 2705          	jreq	L37
 771                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
 772  0358 721652bc      	bset	21180,#3
 774  035c 81            	ret	
 775  035d               L37:
 776                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
 777  035d 721752bc      	bres	21180,#3
 778                     ; 1116 }
 779  0361 81            	ret	
 781                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
 781                     ; 1125 {
 782  0362               _TIM1_OC1FastConfig:
 784                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 785                     ; 1130   if (NewState != DISABLE)
 786  0362 4d            	tnz	a
 787  0363 2705          	jreq	L77
 788                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
 789  0365 721452b9      	bset	21177,#2
 791  0369 81            	ret	
 792  036a               L77:
 793                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
 794  036a 721552b9      	bres	21177,#2
 795                     ; 1138 }
 796  036e 81            	ret	
 798                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
 798                     ; 1147 {
 799  036f               _TIM1_OC2FastConfig:
 801                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
 802                     ; 1152   if (NewState != DISABLE)
 803  036f 4d            	tnz	a
 804  0370 2705          	jreq	L301
 805                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
 806  0372 721452ba      	bset	21178,#2
 808  0376 81            	ret	
 809  0377               L301:
 810                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
 811  0377 721552ba      	bres	21178,#2
 812                     ; 1160 }
 813  037b 81            	ret	
 815                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
 815                     ; 1169 {
 816  037c               _TIM1_OC3FastConfig:
 818                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
 819                     ; 1174   if (NewState != DISABLE)
 820  037c 4d            	tnz	a
 821  037d 2705          	jreq	L701
 822                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
 823  037f 721452bb      	bset	21179,#2
 825  0383 81            	ret	
 826  0384               L701:
 827                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
 828  0384 721552bb      	bres	21179,#2
 829                     ; 1182 }
 830  0388 81            	ret	
 832                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
 832                     ; 1191 {
 833  0389               _TIM1_ClearOC1Ref:
 835                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
 836                     ; 1196   if (NewState != DISABLE)
 837  0389 4d            	tnz	a
 838  038a 2705          	jreq	L311
 839                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
 840  038c 721e52b9      	bset	21177,#7
 842  0390 81            	ret	
 843  0391               L311:
 844                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 845  0391 721f52b9      	bres	21177,#7
 846                     ; 1204 }
 847  0395 81            	ret	
 849                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
 849                     ; 1213 {
 850  0396               _TIM1_ClearOC2Ref:
 852                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
 853                     ; 1218   if (NewState != DISABLE)
 854  0396 4d            	tnz	a
 855  0397 2705          	jreq	L711
 856                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
 857  0399 721e52ba      	bset	21178,#7
 859  039d 81            	ret	
 860  039e               L711:
 861                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 862  039e 721f52ba      	bres	21178,#7
 863                     ; 1226 }
 864  03a2 81            	ret	
 866                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
 866                     ; 1235 {
 867  03a3               _TIM1_ClearOC3Ref:
 869                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
 870                     ; 1240   if (NewState != DISABLE)
 871  03a3 4d            	tnz	a
 872  03a4 2705          	jreq	L321
 873                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
 874  03a6 721e52bb      	bset	21179,#7
 876  03aa 81            	ret	
 877  03ab               L321:
 878                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 879  03ab 721f52bb      	bres	21179,#7
 880                     ; 1248 }
 881  03af 81            	ret	
 883                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
 883                     ; 1257 {
 884  03b0               _TIM1_ClearOC4Ref:
 886                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 887                     ; 1262   if (NewState != DISABLE)
 888  03b0 4d            	tnz	a
 889  03b1 2705          	jreq	L721
 890                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
 891  03b3 721e52bc      	bset	21180,#7
 893  03b7 81            	ret	
 894  03b8               L721:
 895                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
 896  03b8 721f52bc      	bres	21180,#7
 897                     ; 1270 }
 898  03bc 81            	ret	
 900                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
 900                     ; 1281 {
 901  03bd               _TIM1_OC1PolarityConfig:
 903                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 904                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
 905  03bd 4d            	tnz	a
 906  03be 2705          	jreq	L331
 907                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
 908  03c0 721252bd      	bset	21181,#1
 910  03c4 81            	ret	
 911  03c5               L331:
 912                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
 913  03c5 721352bd      	bres	21181,#1
 914                     ; 1294 }
 915  03c9 81            	ret	
 917                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
 917                     ; 1305 {
 918  03ca               _TIM1_OC1NPolarityConfig:
 920                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 921                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
 922  03ca 4d            	tnz	a
 923  03cb 2705          	jreq	L731
 924                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
 925  03cd 721652bd      	bset	21181,#3
 927  03d1 81            	ret	
 928  03d2               L731:
 929                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
 930  03d2 721752bd      	bres	21181,#3
 931                     ; 1318 }
 932  03d6 81            	ret	
 934                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
 934                     ; 1329 {
 935  03d7               _TIM1_OC2PolarityConfig:
 937                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 938                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
 939  03d7 4d            	tnz	a
 940  03d8 2705          	jreq	L341
 941                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
 942  03da 721a52bd      	bset	21181,#5
 944  03de 81            	ret	
 945  03df               L341:
 946                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
 947  03df 721b52bd      	bres	21181,#5
 948                     ; 1342 }
 949  03e3 81            	ret	
 951                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
 951                     ; 1353 {
 952  03e4               _TIM1_OC2NPolarityConfig:
 954                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 955                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
 956  03e4 4d            	tnz	a
 957  03e5 2705          	jreq	L741
 958                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
 959  03e7 721e52bd      	bset	21181,#7
 961  03eb 81            	ret	
 962  03ec               L741:
 963                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
 964  03ec 721f52bd      	bres	21181,#7
 965                     ; 1366 }
 966  03f0 81            	ret	
 968                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
 968                     ; 1377 {
 969  03f1               _TIM1_OC3PolarityConfig:
 971                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 972                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
 973  03f1 4d            	tnz	a
 974  03f2 2705          	jreq	L351
 975                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
 976  03f4 721252be      	bset	21182,#1
 978  03f8 81            	ret	
 979  03f9               L351:
 980                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
 981  03f9 721352be      	bres	21182,#1
 982                     ; 1390 }
 983  03fd 81            	ret	
 985                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
 985                     ; 1401 {
 986  03fe               _TIM1_OC3NPolarityConfig:
 988                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 989                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
 990  03fe 4d            	tnz	a
 991  03ff 2705          	jreq	L751
 992                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
 993  0401 721652be      	bset	21182,#3
 995  0405 81            	ret	
 996  0406               L751:
 997                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
 998  0406 721752be      	bres	21182,#3
 999                     ; 1414 }
1000  040a 81            	ret	
1002                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
1002                     ; 1425 {
1003  040b               _TIM1_SelectOCREFClear:
1005                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
1006                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
1007  040b 721752b2      	bres	21170,#3
1008                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
1009  040f ca52b2        	or	a,21170
1010  0412 c752b2        	ld	21170,a
1011                     ; 1432 }
1012  0415 81            	ret	
1014                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
1014                     ; 1441 {
1015  0416               _TIM1_SelectCOM:
1017                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
1018                     ; 1446   if (NewState != DISABLE)
1019  0416 4d            	tnz	a
1020  0417 2705          	jreq	L361
1021                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
1022  0419 721452b1      	bset	21169,#2
1024  041d 81            	ret	
1025  041e               L361:
1026                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
1027  041e 721552b1      	bres	21169,#2
1028                     ; 1454 }
1029  0422 81            	ret	
1031                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
1031                     ; 1469 {
1032  0423               _TIM1_CCxCmd:
1033  0423 89            	pushw	x
1034       00000000      OFST:	set	0
1036                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
1037                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1038                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
1039  0424 9e            	ld	a,xh
1040  0425 4d            	tnz	a
1041  0426 2610          	jrne	L761
1042                     ; 1477     if (NewState != DISABLE)
1043  0428 9f            	ld	a,xl
1044  0429 4d            	tnz	a
1045  042a 2706          	jreq	L171
1046                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
1047  042c 721052bd      	bset	21181,#0
1049  0430 203e          	jra	L571
1050  0432               L171:
1051                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1052  0432 721152bd      	bres	21181,#0
1053  0436 2038          	jra	L571
1054  0438               L761:
1055                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
1056  0438 7b01          	ld	a,(OFST+1,sp)
1057  043a a101          	cp	a,#1
1058  043c 2610          	jrne	L771
1059                     ; 1489     if (NewState != DISABLE)
1060  043e 7b02          	ld	a,(OFST+2,sp)
1061  0440 2706          	jreq	L102
1062                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
1063  0442 721852bd      	bset	21181,#4
1065  0446 2028          	jra	L571
1066  0448               L102:
1067                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
1068  0448 721952bd      	bres	21181,#4
1069  044c 2022          	jra	L571
1070  044e               L771:
1071                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
1072  044e a102          	cp	a,#2
1073  0450 2610          	jrne	L702
1074                     ; 1501     if (NewState != DISABLE)
1075  0452 7b02          	ld	a,(OFST+2,sp)
1076  0454 2706          	jreq	L112
1077                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
1078  0456 721052be      	bset	21182,#0
1080  045a 2014          	jra	L571
1081  045c               L112:
1082                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
1083  045c 721152be      	bres	21182,#0
1084  0460 200e          	jra	L571
1085  0462               L702:
1086                     ; 1513     if (NewState != DISABLE)
1087  0462 7b02          	ld	a,(OFST+2,sp)
1088  0464 2706          	jreq	L712
1089                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
1090  0466 721852be      	bset	21182,#4
1092  046a 2004          	jra	L571
1093  046c               L712:
1094                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
1095  046c 721952be      	bres	21182,#4
1096  0470               L571:
1097                     ; 1522 }
1098  0470 85            	popw	x
1099  0471 81            	ret	
1101                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
1101                     ; 1536 {
1102  0472               _TIM1_CCxNCmd:
1103  0472 89            	pushw	x
1104       00000000      OFST:	set	0
1106                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
1107                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1108                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
1109  0473 9e            	ld	a,xh
1110  0474 4d            	tnz	a
1111  0475 2610          	jrne	L322
1112                     ; 1544     if (NewState != DISABLE)
1113  0477 9f            	ld	a,xl
1114  0478 4d            	tnz	a
1115  0479 2706          	jreq	L522
1116                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
1117  047b 721452bd      	bset	21181,#2
1119  047f 2029          	jra	L132
1120  0481               L522:
1121                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
1122  0481 721552bd      	bres	21181,#2
1123  0485 2023          	jra	L132
1124  0487               L322:
1125                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
1126  0487 7b01          	ld	a,(OFST+1,sp)
1127  0489 4a            	dec	a
1128  048a 2610          	jrne	L332
1129                     ; 1556     if (NewState != DISABLE)
1130  048c 7b02          	ld	a,(OFST+2,sp)
1131  048e 2706          	jreq	L532
1132                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
1133  0490 721c52bd      	bset	21181,#6
1135  0494 2014          	jra	L132
1136  0496               L532:
1137                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
1138  0496 721d52bd      	bres	21181,#6
1139  049a 200e          	jra	L132
1140  049c               L332:
1141                     ; 1568     if (NewState != DISABLE)
1142  049c 7b02          	ld	a,(OFST+2,sp)
1143  049e 2706          	jreq	L342
1144                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
1145  04a0 721452be      	bset	21182,#2
1147  04a4 2004          	jra	L132
1148  04a6               L342:
1149                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
1150  04a6 721552be      	bres	21182,#2
1151  04aa               L132:
1152                     ; 1577 }
1153  04aa 85            	popw	x
1154  04ab 81            	ret	
1156                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1156                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1156                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1156                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1156                     ; 1668                  uint8_t TIM1_ICFilter)
1156                     ; 1669 {
1157  04ac               _TIM1_ICInit:
1158  04ac 89            	pushw	x
1159       00000000      OFST:	set	0
1161                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
1162                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1163                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
1164                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
1165                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
1166                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
1167  04ad 9e            	ld	a,xh
1168  04ae 4d            	tnz	a
1169  04af 2614          	jrne	L742
1170                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1171  04b1 7b07          	ld	a,(OFST+7,sp)
1172  04b3 88            	push	a
1173  04b4 7b06          	ld	a,(OFST+6,sp)
1174  04b6 97            	ld	xl,a
1175  04b7 7b03          	ld	a,(OFST+3,sp)
1176  04b9 95            	ld	xh,a
1177  04ba cd0792        	call	L3_TI1_Config
1179  04bd 84            	pop	a
1180                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1181  04be 7b06          	ld	a,(OFST+6,sp)
1182  04c0 cd05e6        	call	_TIM1_SetIC1Prescaler
1185  04c3 2044          	jra	L152
1186  04c5               L742:
1187                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
1188  04c5 7b01          	ld	a,(OFST+1,sp)
1189  04c7 a101          	cp	a,#1
1190  04c9 2614          	jrne	L352
1191                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1192  04cb 7b07          	ld	a,(OFST+7,sp)
1193  04cd 88            	push	a
1194  04ce 7b06          	ld	a,(OFST+6,sp)
1195  04d0 97            	ld	xl,a
1196  04d1 7b03          	ld	a,(OFST+3,sp)
1197  04d3 95            	ld	xh,a
1198  04d4 cd07c2        	call	L5_TI2_Config
1200  04d7 84            	pop	a
1201                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1202  04d8 7b06          	ld	a,(OFST+6,sp)
1203  04da cd05f3        	call	_TIM1_SetIC2Prescaler
1206  04dd 202a          	jra	L152
1207  04df               L352:
1208                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
1209  04df a102          	cp	a,#2
1210  04e1 2614          	jrne	L752
1211                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1212  04e3 7b07          	ld	a,(OFST+7,sp)
1213  04e5 88            	push	a
1214  04e6 7b06          	ld	a,(OFST+6,sp)
1215  04e8 97            	ld	xl,a
1216  04e9 7b03          	ld	a,(OFST+3,sp)
1217  04eb 95            	ld	xh,a
1218  04ec cd07f2        	call	L7_TI3_Config
1220  04ef 84            	pop	a
1221                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1222  04f0 7b06          	ld	a,(OFST+6,sp)
1223  04f2 cd0600        	call	_TIM1_SetIC3Prescaler
1226  04f5 2012          	jra	L152
1227  04f7               L752:
1228                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1229  04f7 7b07          	ld	a,(OFST+7,sp)
1230  04f9 88            	push	a
1231  04fa 7b06          	ld	a,(OFST+6,sp)
1232  04fc 97            	ld	xl,a
1233  04fd 7b03          	ld	a,(OFST+3,sp)
1234  04ff 95            	ld	xh,a
1235  0500 cd0822        	call	L11_TI4_Config
1237  0503 84            	pop	a
1238                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1239  0504 7b06          	ld	a,(OFST+6,sp)
1240  0506 cd060d        	call	_TIM1_SetIC4Prescaler
1242  0509               L152:
1243                     ; 1706 }
1244  0509 85            	popw	x
1245  050a 81            	ret	
1247                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1247                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1247                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1247                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1247                     ; 1737                      uint8_t TIM1_ICFilter)
1247                     ; 1738 {
1248  050b               _TIM1_PWMIConfig:
1249  050b 89            	pushw	x
1250  050c 89            	pushw	x
1251       00000002      OFST:	set	2
1253                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
1254                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
1255                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
1256                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1257                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
1258                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
1259                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
1260  050d 9f            	ld	a,xl
1261  050e 4a            	dec	a
1262  050f 2702          	jreq	L362
1263                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
1264  0511 a601          	ld	a,#1
1266  0513               L362:
1267                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
1268  0513 6b01          	ld	(OFST-1,sp),a
1269                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
1270  0515 7b07          	ld	a,(OFST+5,sp)
1271  0517 4a            	dec	a
1272  0518 2604          	jrne	L762
1273                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
1274  051a a602          	ld	a,#2
1276  051c 2002          	jra	L172
1277  051e               L762:
1278                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
1279  051e a601          	ld	a,#1
1280  0520               L172:
1281  0520 6b02          	ld	(OFST+0,sp),a
1282                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
1283  0522 7b03          	ld	a,(OFST+1,sp)
1284  0524 2626          	jrne	L372
1285                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1286  0526 7b09          	ld	a,(OFST+7,sp)
1287  0528 88            	push	a
1288  0529 7b08          	ld	a,(OFST+6,sp)
1289  052b 97            	ld	xl,a
1290  052c 7b05          	ld	a,(OFST+3,sp)
1291  052e 95            	ld	xh,a
1292  052f cd0792        	call	L3_TI1_Config
1294  0532 84            	pop	a
1295                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1296  0533 7b08          	ld	a,(OFST+6,sp)
1297  0535 cd05e6        	call	_TIM1_SetIC1Prescaler
1299                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1300  0538 7b09          	ld	a,(OFST+7,sp)
1301  053a 88            	push	a
1302  053b 7b03          	ld	a,(OFST+1,sp)
1303  053d 97            	ld	xl,a
1304  053e 7b02          	ld	a,(OFST+0,sp)
1305  0540 95            	ld	xh,a
1306  0541 cd07c2        	call	L5_TI2_Config
1308  0544 84            	pop	a
1309                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1310  0545 7b08          	ld	a,(OFST+6,sp)
1311  0547 cd05f3        	call	_TIM1_SetIC2Prescaler
1314  054a 2023          	jra	L572
1315  054c               L372:
1316                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1317  054c 7b09          	ld	a,(OFST+7,sp)
1318  054e 88            	push	a
1319  054f 7b08          	ld	a,(OFST+6,sp)
1320  0551 97            	ld	xl,a
1321  0552 7b05          	ld	a,(OFST+3,sp)
1322  0554 95            	ld	xh,a
1323  0555 cd07c2        	call	L5_TI2_Config
1325  0558 84            	pop	a
1326                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1327  0559 7b08          	ld	a,(OFST+6,sp)
1328  055b cd05f3        	call	_TIM1_SetIC2Prescaler
1330                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1331  055e 7b09          	ld	a,(OFST+7,sp)
1332  0560 88            	push	a
1333  0561 7b03          	ld	a,(OFST+1,sp)
1334  0563 97            	ld	xl,a
1335  0564 7b02          	ld	a,(OFST+0,sp)
1336  0566 95            	ld	xh,a
1337  0567 cd0792        	call	L3_TI1_Config
1339  056a 84            	pop	a
1340                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1341  056b 7b08          	ld	a,(OFST+6,sp)
1342  056d ad77          	call	_TIM1_SetIC1Prescaler
1344  056f               L572:
1345                     ; 1796 }
1346  056f 5b04          	addw	sp,#4
1347  0571 81            	ret	
1349                     ; 1803 uint16_t TIM1_GetCapture1(void)
1349                     ; 1804 {
1350  0572               _TIM1_GetCapture1:
1351  0572 5204          	subw	sp,#4
1352       00000004      OFST:	set	4
1354                     ; 1807   uint16_t tmpccr1 = 0;
1355                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
1357                     ; 1810   tmpccr1h = TIM1->CCR1H;
1358  0574 c652c6        	ld	a,21190
1359  0577 6b02          	ld	(OFST-2,sp),a
1360                     ; 1811   tmpccr1l = TIM1->CCR1L;
1361  0579 c652c7        	ld	a,21191
1362  057c 6b01          	ld	(OFST-3,sp),a
1363                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
1364  057e 5f            	clrw	x
1365  057f 97            	ld	xl,a
1366  0580 1f03          	ldw	(OFST-1,sp),x
1367                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
1368  0582 5f            	clrw	x
1369  0583 7b02          	ld	a,(OFST-2,sp)
1370  0585 97            	ld	xl,a
1371  0586 7b04          	ld	a,(OFST+0,sp)
1372  0588 01            	rrwa	x,a
1373  0589 1a03          	or	a,(OFST-1,sp)
1374  058b 01            	rrwa	x,a
1375                     ; 1816   return (uint16_t)tmpccr1;
1377  058c 5b04          	addw	sp,#4
1378  058e 81            	ret	
1380                     ; 1824 uint16_t TIM1_GetCapture2(void)
1380                     ; 1825 {
1381  058f               _TIM1_GetCapture2:
1382  058f 5204          	subw	sp,#4
1383       00000004      OFST:	set	4
1385                     ; 1828   uint16_t tmpccr2 = 0;
1386                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
1388                     ; 1831   tmpccr2h = TIM1->CCR2H;
1389  0591 c652c8        	ld	a,21192
1390  0594 6b02          	ld	(OFST-2,sp),a
1391                     ; 1832   tmpccr2l = TIM1->CCR2L;
1392  0596 c652c9        	ld	a,21193
1393  0599 6b01          	ld	(OFST-3,sp),a
1394                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
1395  059b 5f            	clrw	x
1396  059c 97            	ld	xl,a
1397  059d 1f03          	ldw	(OFST-1,sp),x
1398                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
1399  059f 5f            	clrw	x
1400  05a0 7b02          	ld	a,(OFST-2,sp)
1401  05a2 97            	ld	xl,a
1402  05a3 7b04          	ld	a,(OFST+0,sp)
1403  05a5 01            	rrwa	x,a
1404  05a6 1a03          	or	a,(OFST-1,sp)
1405  05a8 01            	rrwa	x,a
1406                     ; 1837   return (uint16_t)tmpccr2;
1408  05a9 5b04          	addw	sp,#4
1409  05ab 81            	ret	
1411                     ; 1845 uint16_t TIM1_GetCapture3(void)
1411                     ; 1846 {
1412  05ac               _TIM1_GetCapture3:
1413  05ac 5204          	subw	sp,#4
1414       00000004      OFST:	set	4
1416                     ; 1848   uint16_t tmpccr3 = 0;
1417                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
1419                     ; 1851   tmpccr3h = TIM1->CCR3H;
1420  05ae c652ca        	ld	a,21194
1421  05b1 6b02          	ld	(OFST-2,sp),a
1422                     ; 1852   tmpccr3l = TIM1->CCR3L;
1423  05b3 c652cb        	ld	a,21195
1424  05b6 6b01          	ld	(OFST-3,sp),a
1425                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
1426  05b8 5f            	clrw	x
1427  05b9 97            	ld	xl,a
1428  05ba 1f03          	ldw	(OFST-1,sp),x
1429                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
1430  05bc 5f            	clrw	x
1431  05bd 7b02          	ld	a,(OFST-2,sp)
1432  05bf 97            	ld	xl,a
1433  05c0 7b04          	ld	a,(OFST+0,sp)
1434  05c2 01            	rrwa	x,a
1435  05c3 1a03          	or	a,(OFST-1,sp)
1436  05c5 01            	rrwa	x,a
1437                     ; 1857   return (uint16_t)tmpccr3;
1439  05c6 5b04          	addw	sp,#4
1440  05c8 81            	ret	
1442                     ; 1865 uint16_t TIM1_GetCapture4(void)
1442                     ; 1866 {
1443  05c9               _TIM1_GetCapture4:
1444  05c9 5204          	subw	sp,#4
1445       00000004      OFST:	set	4
1447                     ; 1868   uint16_t tmpccr4 = 0;
1448                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
1450                     ; 1871   tmpccr4h = TIM1->CCR4H;
1451  05cb c652cc        	ld	a,21196
1452  05ce 6b02          	ld	(OFST-2,sp),a
1453                     ; 1872   tmpccr4l = TIM1->CCR4L;
1454  05d0 c652cd        	ld	a,21197
1455  05d3 6b01          	ld	(OFST-3,sp),a
1456                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
1457  05d5 5f            	clrw	x
1458  05d6 97            	ld	xl,a
1459  05d7 1f03          	ldw	(OFST-1,sp),x
1460                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
1461  05d9 5f            	clrw	x
1462  05da 7b02          	ld	a,(OFST-2,sp)
1463  05dc 97            	ld	xl,a
1464  05dd 7b04          	ld	a,(OFST+0,sp)
1465  05df 01            	rrwa	x,a
1466  05e0 1a03          	or	a,(OFST-1,sp)
1467  05e2 01            	rrwa	x,a
1468                     ; 1877   return (uint16_t)tmpccr4;
1470  05e3 5b04          	addw	sp,#4
1471  05e5 81            	ret	
1473                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
1473                     ; 1891 {
1474  05e6               _TIM1_SetIC1Prescaler:
1475  05e6 88            	push	a
1476       00000000      OFST:	set	0
1478                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
1479                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
1480  05e7 c652b9        	ld	a,21177
1481  05ea a4f3          	and	a,#243
1482  05ec 1a01          	or	a,(OFST+1,sp)
1483  05ee c752b9        	ld	21177,a
1484                     ; 1897 }
1485  05f1 84            	pop	a
1486  05f2 81            	ret	
1488                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
1488                     ; 1910 {
1489  05f3               _TIM1_SetIC2Prescaler:
1490  05f3 88            	push	a
1491       00000000      OFST:	set	0
1493                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
1494                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
1495  05f4 c652ba        	ld	a,21178
1496  05f7 a4f3          	and	a,#243
1497  05f9 1a01          	or	a,(OFST+1,sp)
1498  05fb c752ba        	ld	21178,a
1499                     ; 1916 }
1500  05fe 84            	pop	a
1501  05ff 81            	ret	
1503                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
1503                     ; 1929 {
1504  0600               _TIM1_SetIC3Prescaler:
1505  0600 88            	push	a
1506       00000000      OFST:	set	0
1508                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
1509                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
1510  0601 c652bb        	ld	a,21179
1511  0604 a4f3          	and	a,#243
1512  0606 1a01          	or	a,(OFST+1,sp)
1513  0608 c752bb        	ld	21179,a
1514                     ; 1936 }
1515  060b 84            	pop	a
1516  060c 81            	ret	
1518                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
1518                     ; 1949 {
1519  060d               _TIM1_SetIC4Prescaler:
1520  060d 88            	push	a
1521       00000000      OFST:	set	0
1523                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
1524                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
1525  060e c652bc        	ld	a,21180
1526  0611 a4f3          	and	a,#243
1527  0613 1a01          	or	a,(OFST+1,sp)
1528  0615 c752bc        	ld	21180,a
1529                     ; 1956 }
1530  0618 84            	pop	a
1531  0619 81            	ret	
1533                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
1533                     ; 1992 {
1534  061a               _TIM1_ITConfig:
1535  061a 89            	pushw	x
1536       00000000      OFST:	set	0
1538                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
1539                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
1540                     ; 1997   if (NewState != DISABLE)
1541  061b 9f            	ld	a,xl
1542  061c 4d            	tnz	a
1543  061d 2706          	jreq	L772
1544                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
1545  061f 9e            	ld	a,xh
1546  0620 ca52b5        	or	a,21173
1548  0623 2006          	jra	L103
1549  0625               L772:
1550                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
1551  0625 7b01          	ld	a,(OFST+1,sp)
1552  0627 43            	cpl	a
1553  0628 c452b5        	and	a,21173
1554  062b               L103:
1555  062b c752b5        	ld	21173,a
1556                     ; 2007 }
1557  062e 85            	popw	x
1558  062f 81            	ret	
1560                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
1560                     ; 2024 {
1561  0630               _TIM1_GenerateEvent:
1563                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
1564                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
1565  0630 c752b8        	ld	21176,a
1566                     ; 2030 }
1567  0633 81            	ret	
1569                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
1569                     ; 2050 {
1570  0634               _TIM1_GetFlagStatus:
1571  0634 89            	pushw	x
1572  0635 89            	pushw	x
1573       00000002      OFST:	set	2
1575                     ; 2051   FlagStatus bitstatus = RESET;
1576                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
1578                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
1579                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
1580  0636 9f            	ld	a,xl
1581  0637 c452b6        	and	a,21174
1582  063a 6b01          	ld	(OFST-1,sp),a
1583                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
1584  063c c652b7        	ld	a,21175
1585  063f 1403          	and	a,(OFST+1,sp)
1586  0641 6b02          	ld	(OFST+0,sp),a
1587                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
1588  0643 1a01          	or	a,(OFST-1,sp)
1589  0645 2702          	jreq	L303
1590                     ; 2062     bitstatus = SET;
1591  0647 a601          	ld	a,#1
1593  0649               L303:
1594                     ; 2066     bitstatus = RESET;
1595                     ; 2068   return (FlagStatus)(bitstatus);
1597  0649 5b04          	addw	sp,#4
1598  064b 81            	ret	
1600                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
1600                     ; 2090 {
1601  064c               _TIM1_ClearFlag:
1602  064c 89            	pushw	x
1603       00000000      OFST:	set	0
1605                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
1606                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
1607  064d 9f            	ld	a,xl
1608  064e 43            	cpl	a
1609  064f c752b6        	ld	21174,a
1610                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
1611  0652 7b01          	ld	a,(OFST+1,sp)
1612  0654 43            	cpl	a
1613  0655 a41e          	and	a,#30
1614  0657 c752b7        	ld	21175,a
1615                     ; 2097 }
1616  065a 85            	popw	x
1617  065b 81            	ret	
1619                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
1619                     ; 2115 {
1620  065c               _TIM1_GetITStatus:
1621  065c 88            	push	a
1622  065d 89            	pushw	x
1623       00000002      OFST:	set	2
1625                     ; 2116   ITStatus bitstatus = RESET;
1626                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
1628                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
1629                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
1630  065e c452b6        	and	a,21174
1631  0661 6b01          	ld	(OFST-1,sp),a
1632                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
1633  0663 c652b5        	ld	a,21173
1634  0666 1403          	and	a,(OFST+1,sp)
1635  0668 6b02          	ld	(OFST+0,sp),a
1636                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
1637  066a 7b01          	ld	a,(OFST-1,sp)
1638  066c 2708          	jreq	L703
1640  066e 7b02          	ld	a,(OFST+0,sp)
1641  0670 2704          	jreq	L703
1642                     ; 2129     bitstatus = SET;
1643  0672 a601          	ld	a,#1
1645  0674 2001          	jra	L113
1646  0676               L703:
1647                     ; 2133     bitstatus = RESET;
1648  0676 4f            	clr	a
1649  0677               L113:
1650                     ; 2135   return (ITStatus)(bitstatus);
1652  0677 5b03          	addw	sp,#3
1653  0679 81            	ret	
1655                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
1655                     ; 2153 {
1656  067a               _TIM1_ClearITPendingBit:
1658                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
1659                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
1660  067a 43            	cpl	a
1661  067b c752b6        	ld	21174,a
1662                     ; 2159 }
1663  067e 81            	ret	
1665                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
1665                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
1665                     ; 2169 {
1666  067f               _TIM1_DMAConfig:
1668                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
1669                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
1670                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
1671  067f 9e            	ld	a,xh
1672  0680 c752d1        	ld	21201,a
1673                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
1674  0683 9f            	ld	a,xl
1675  0684 c752d2        	ld	21202,a
1676                     ; 2177 }
1677  0687 81            	ret	
1679                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
1679                     ; 2190 {
1680  0688               _TIM1_DMACmd:
1681  0688 89            	pushw	x
1682       00000000      OFST:	set	0
1684                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
1685                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
1686                     ; 2195   if (NewState != DISABLE)
1687  0689 9f            	ld	a,xl
1688  068a 4d            	tnz	a
1689  068b 2706          	jreq	L313
1690                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
1691  068d 9e            	ld	a,xh
1692  068e ca52b4        	or	a,21172
1694  0691 2006          	jra	L513
1695  0693               L313:
1696                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
1697  0693 7b01          	ld	a,(OFST+1,sp)
1698  0695 43            	cpl	a
1699  0696 c452b4        	and	a,21172
1700  0699               L513:
1701  0699 c752b4        	ld	21172,a
1702                     ; 2205 }
1703  069c 85            	popw	x
1704  069d 81            	ret	
1706                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
1706                     ; 2214 {
1707  069e               _TIM1_SelectCCDMA:
1709                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
1710                     ; 2218   if (NewState != DISABLE)
1711  069e 4d            	tnz	a
1712  069f 2705          	jreq	L713
1713                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
1714  06a1 721652b1      	bset	21169,#3
1716  06a5 81            	ret	
1717  06a6               L713:
1718                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
1719  06a6 721752b1      	bres	21169,#3
1720                     ; 2228 }
1721  06aa 81            	ret	
1723                     ; 2251 void TIM1_InternalClockConfig(void)
1723                     ; 2252 {
1724  06ab               _TIM1_InternalClockConfig:
1726                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
1727  06ab c652b2        	ld	a,21170
1728  06ae a4f8          	and	a,#248
1729  06b0 c752b2        	ld	21170,a
1730                     ; 2255 }
1731  06b3 81            	ret	
1733                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
1733                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1733                     ; 2274                                  uint8_t ICFilter)
1733                     ; 2275 {
1734  06b4               _TIM1_TIxExternalClockConfig:
1735  06b4 89            	pushw	x
1736       00000000      OFST:	set	0
1738                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
1739                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1740                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
1741                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
1742  06b5 9e            	ld	a,xh
1743  06b6 a160          	cp	a,#96
1744  06b8 260d          	jrne	L323
1745                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
1746  06ba 7b05          	ld	a,(OFST+5,sp)
1747  06bc 88            	push	a
1748  06bd 9f            	ld	a,xl
1749  06be ae0001        	ldw	x,#1
1750  06c1 95            	ld	xh,a
1751  06c2 cd07c2        	call	L5_TI2_Config
1754  06c5 200c          	jra	L523
1755  06c7               L323:
1756                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
1757  06c7 7b05          	ld	a,(OFST+5,sp)
1758  06c9 88            	push	a
1759  06ca 7b03          	ld	a,(OFST+3,sp)
1760  06cc ae0001        	ldw	x,#1
1761  06cf 95            	ld	xh,a
1762  06d0 cd0792        	call	L3_TI1_Config
1764  06d3               L523:
1765  06d3 84            	pop	a
1766                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
1767  06d4 7b01          	ld	a,(OFST+1,sp)
1768  06d6 ad2e          	call	_TIM1_SelectInputTrigger
1770                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
1771  06d8 c652b2        	ld	a,21170
1772  06db aa07          	or	a,#7
1773  06dd c752b2        	ld	21170,a
1774                     ; 2296 }
1775  06e0 85            	popw	x
1776  06e1 81            	ret	
1778                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1778                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1778                     ; 2316                               uint8_t ExtTRGFilter)
1778                     ; 2317 {
1779  06e2               _TIM1_ETRClockMode1Config:
1780  06e2 89            	pushw	x
1781       00000000      OFST:	set	0
1783                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
1784                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
1785                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
1786                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
1787  06e3 7b05          	ld	a,(OFST+5,sp)
1788  06e5 88            	push	a
1789  06e6 7b02          	ld	a,(OFST+2,sp)
1790  06e8 95            	ld	xh,a
1791  06e9 ad4f          	call	_TIM1_ETRConfig
1793  06eb 84            	pop	a
1794                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
1794                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
1795  06ec c652b2        	ld	a,21170
1796  06ef aa77          	or	a,#119
1797  06f1 c752b2        	ld	21170,a
1798                     ; 2329 }
1799  06f4 85            	popw	x
1800  06f5 81            	ret	
1802                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1802                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1802                     ; 2349                               uint8_t ExtTRGFilter)
1802                     ; 2350 {
1803  06f6               _TIM1_ETRClockMode2Config:
1804  06f6 89            	pushw	x
1805       00000000      OFST:	set	0
1807                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
1808                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
1809                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
1810  06f7 7b05          	ld	a,(OFST+5,sp)
1811  06f9 88            	push	a
1812  06fa 7b02          	ld	a,(OFST+2,sp)
1813  06fc 95            	ld	xh,a
1814  06fd ad3b          	call	_TIM1_ETRConfig
1816  06ff 721c52b3      	bset	21171,#6
1817                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
1818                     ; 2360 }
1819  0703 5b03          	addw	sp,#3
1820  0705 81            	ret	
1822                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
1822                     ; 2411 {
1823  0706               _TIM1_SelectInputTrigger:
1824  0706 88            	push	a
1825       00000000      OFST:	set	0
1827                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
1828                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
1829  0707 c652b2        	ld	a,21170
1830  070a a48f          	and	a,#143
1831  070c 1a01          	or	a,(OFST+1,sp)
1832  070e c752b2        	ld	21170,a
1833                     ; 2417 }
1834  0711 84            	pop	a
1835  0712 81            	ret	
1837                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
1837                     ; 2434 {
1838  0713               _TIM1_SelectOutputTrigger:
1839  0713 88            	push	a
1840       00000000      OFST:	set	0
1842                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
1843                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
1844  0714 c652b1        	ld	a,21169
1845  0717 a48f          	and	a,#143
1846  0719 1a01          	or	a,(OFST+1,sp)
1847  071b c752b1        	ld	21169,a
1848                     ; 2439 }
1849  071e 84            	pop	a
1850  071f 81            	ret	
1852                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
1852                     ; 2452 {
1853  0720               _TIM1_SelectSlaveMode:
1854  0720 88            	push	a
1855       00000000      OFST:	set	0
1857                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
1858                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
1859  0721 c652b2        	ld	a,21170
1860  0724 a4f8          	and	a,#248
1861  0726 1a01          	or	a,(OFST+1,sp)
1862  0728 c752b2        	ld	21170,a
1863                     ; 2459 }
1864  072b 84            	pop	a
1865  072c 81            	ret	
1867                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
1867                     ; 2468 {
1868  072d               _TIM1_SelectMasterSlaveMode:
1870                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
1871                     ; 2473   if (NewState != DISABLE)
1872  072d 4d            	tnz	a
1873  072e 2705          	jreq	L723
1874                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
1875  0730 721e52b2      	bset	21170,#7
1877  0734 81            	ret	
1878  0735               L723:
1879                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
1880  0735 721f52b2      	bres	21170,#7
1881                     ; 2481 }
1882  0739 81            	ret	
1884                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1884                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1884                     ; 2501                     uint8_t ExtTRGFilter)
1884                     ; 2502 {
1885  073a               _TIM1_ETRConfig:
1886  073a 89            	pushw	x
1887       00000000      OFST:	set	0
1889                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
1890                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
1890                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
1890                     ; 2508                          | (uint8_t) ExtTRGFilter);
1891  073b 9f            	ld	a,xl
1892  073c 1a01          	or	a,(OFST+1,sp)
1893  073e 1a05          	or	a,(OFST+5,sp)
1894  0740 ca52b3        	or	a,21171
1895  0743 c752b3        	ld	21171,a
1896                     ; 2509 }
1897  0746 85            	popw	x
1898  0747 81            	ret	
1900                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
1900                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
1900                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
1900                     ; 2550 {
1901  0748               _TIM1_EncoderInterfaceConfig:
1902  0748 89            	pushw	x
1903       00000000      OFST:	set	0
1905                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
1906                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
1907                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
1908                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
1909  0749 9f            	ld	a,xl
1910  074a 4d            	tnz	a
1911  074b 2706          	jreq	L333
1912                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1913  074d 721252bd      	bset	21181,#1
1915  0751 2004          	jra	L533
1916  0753               L333:
1917                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1918  0753 721352bd      	bres	21181,#1
1919  0757               L533:
1920                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
1921  0757 7b05          	ld	a,(OFST+5,sp)
1922  0759 2706          	jreq	L733
1923                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
1924  075b 721a52bd      	bset	21181,#5
1926  075f 2004          	jra	L143
1927  0761               L733:
1928                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
1929  0761 721b52bd      	bres	21181,#5
1930  0765               L143:
1931                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
1932  0765 c652b2        	ld	a,21170
1933  0768 a4f0          	and	a,#240
1934  076a 1a01          	or	a,(OFST+1,sp)
1935  076c c752b2        	ld	21170,a
1936                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
1937  076f c652b9        	ld	a,21177
1938  0772 a4fc          	and	a,#252
1939  0774 aa01          	or	a,#1
1940  0776 c752b9        	ld	21177,a
1941                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
1942  0779 c652ba        	ld	a,21178
1943  077c a4fc          	and	a,#252
1944  077e aa01          	or	a,#1
1945  0780 c752ba        	ld	21178,a
1946                     ; 2581 }
1947  0783 85            	popw	x
1948  0784 81            	ret	
1950                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
1950                     ; 2590 {
1951  0785               _TIM1_SelectHallSensor:
1953                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
1954                     ; 2595   if (NewState != DISABLE)
1955  0785 4d            	tnz	a
1956  0786 2705          	jreq	L343
1957                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
1958  0788 721e52b1      	bset	21169,#7
1960  078c 81            	ret	
1961  078d               L343:
1962                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
1963  078d 721f52b1      	bres	21169,#7
1964                     ; 2603 }
1965  0791 81            	ret	
1967                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
1967                     ; 2624 {
1968  0792               L3_TI1_Config:
1969  0792 89            	pushw	x
1970  0793 88            	push	a
1971       00000001      OFST:	set	1
1973                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1974  0794 721152bd      	bres	21181,#0
1975                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
1975                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
1976  0798 7b06          	ld	a,(OFST+5,sp)
1977  079a 97            	ld	xl,a
1978  079b a610          	ld	a,#16
1979  079d 42            	mul	x,a
1980  079e 9f            	ld	a,xl
1981  079f 1a03          	or	a,(OFST+2,sp)
1982  07a1 6b01          	ld	(OFST+0,sp),a
1983  07a3 c652b9        	ld	a,21177
1984  07a6 a40c          	and	a,#12
1985  07a8 1a01          	or	a,(OFST+0,sp)
1986  07aa c752b9        	ld	21177,a
1987                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
1988  07ad 7b02          	ld	a,(OFST+1,sp)
1989  07af 2706          	jreq	L743
1990                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1991  07b1 721252bd      	bset	21181,#1
1993  07b5 2004          	jra	L153
1994  07b7               L743:
1995                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1996  07b7 721352bd      	bres	21181,#1
1997  07bb               L153:
1998                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
1999  07bb 721052bd      	bset	21181,#0
2000                     ; 2647 }
2001  07bf 5b03          	addw	sp,#3
2002  07c1 81            	ret	
2004                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
2004                     ; 2664 {
2005  07c2               L5_TI2_Config:
2006  07c2 89            	pushw	x
2007  07c3 88            	push	a
2008       00000001      OFST:	set	1
2010                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
2011  07c4 721952bd      	bres	21181,#4
2012                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
2012                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2013  07c8 7b06          	ld	a,(OFST+5,sp)
2014  07ca 97            	ld	xl,a
2015  07cb a610          	ld	a,#16
2016  07cd 42            	mul	x,a
2017  07ce 9f            	ld	a,xl
2018  07cf 1a03          	or	a,(OFST+2,sp)
2019  07d1 6b01          	ld	(OFST+0,sp),a
2020  07d3 c652ba        	ld	a,21178
2021  07d6 a40c          	and	a,#12
2022  07d8 1a01          	or	a,(OFST+0,sp)
2023  07da c752ba        	ld	21178,a
2024                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
2025  07dd 7b02          	ld	a,(OFST+1,sp)
2026  07df 2706          	jreq	L353
2027                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
2028  07e1 721a52bd      	bset	21181,#5
2030  07e5 2004          	jra	L553
2031  07e7               L353:
2032                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
2033  07e7 721b52bd      	bres	21181,#5
2034  07eb               L553:
2035                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
2036  07eb 721852bd      	bset	21181,#4
2037                     ; 2682 }
2038  07ef 5b03          	addw	sp,#3
2039  07f1 81            	ret	
2041                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
2041                     ; 2699 {
2042  07f2               L7_TI3_Config:
2043  07f2 89            	pushw	x
2044  07f3 88            	push	a
2045       00000001      OFST:	set	1
2047                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
2048  07f4 721152be      	bres	21182,#0
2049                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
2049                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2050  07f8 7b06          	ld	a,(OFST+5,sp)
2051  07fa 97            	ld	xl,a
2052  07fb a610          	ld	a,#16
2053  07fd 42            	mul	x,a
2054  07fe 9f            	ld	a,xl
2055  07ff 1a03          	or	a,(OFST+2,sp)
2056  0801 6b01          	ld	(OFST+0,sp),a
2057  0803 c652bb        	ld	a,21179
2058  0806 a40c          	and	a,#12
2059  0808 1a01          	or	a,(OFST+0,sp)
2060  080a c752bb        	ld	21179,a
2061                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
2062  080d 7b02          	ld	a,(OFST+1,sp)
2063  080f 2706          	jreq	L753
2064                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
2065  0811 721252be      	bset	21182,#1
2067  0815 2004          	jra	L163
2068  0817               L753:
2069                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
2070  0817 721352be      	bres	21182,#1
2071  081b               L163:
2072                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
2073  081b 721052be      	bset	21182,#0
2074                     ; 2718 }
2075  081f 5b03          	addw	sp,#3
2076  0821 81            	ret	
2078                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
2078                     ; 2734 {
2079  0822               L11_TI4_Config:
2080  0822 89            	pushw	x
2081  0823 88            	push	a
2082       00000001      OFST:	set	1
2084                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
2085  0824 721952be      	bres	21182,#4
2086                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
2086                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2087  0828 7b06          	ld	a,(OFST+5,sp)
2088  082a 97            	ld	xl,a
2089  082b a610          	ld	a,#16
2090  082d 42            	mul	x,a
2091  082e 9f            	ld	a,xl
2092  082f 1a03          	or	a,(OFST+2,sp)
2093  0831 6b01          	ld	(OFST+0,sp),a
2094  0833 c652bc        	ld	a,21180
2095  0836 a40c          	and	a,#12
2096  0838 1a01          	or	a,(OFST+0,sp)
2097  083a c752bc        	ld	21180,a
2098                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
2099  083d 7b02          	ld	a,(OFST+1,sp)
2100  083f 2706          	jreq	L363
2101                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
2102  0841 721a52be      	bset	21182,#5
2104  0845 2004          	jra	L563
2105  0847               L363:
2106                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
2107  0847 721b52be      	bres	21182,#5
2108  084b               L563:
2109                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
2110  084b 721852be      	bset	21182,#4
2111                     ; 2755 }
2112  084f 5b03          	addw	sp,#3
2113  0851 81            	ret	
2115                     	xdef	_TIM1_SelectHallSensor
2116                     	xdef	_TIM1_EncoderInterfaceConfig
2117                     	xdef	_TIM1_ETRConfig
2118                     	xdef	_TIM1_SelectMasterSlaveMode
2119                     	xdef	_TIM1_SelectSlaveMode
2120                     	xdef	_TIM1_SelectOutputTrigger
2121                     	xdef	_TIM1_SelectInputTrigger
2122                     	xdef	_TIM1_ETRClockMode2Config
2123                     	xdef	_TIM1_ETRClockMode1Config
2124                     	xdef	_TIM1_TIxExternalClockConfig
2125                     	xdef	_TIM1_InternalClockConfig
2126                     	xdef	_TIM1_SelectCCDMA
2127                     	xdef	_TIM1_DMACmd
2128                     	xdef	_TIM1_DMAConfig
2129                     	xdef	_TIM1_ClearITPendingBit
2130                     	xdef	_TIM1_GetITStatus
2131                     	xdef	_TIM1_ClearFlag
2132                     	xdef	_TIM1_GetFlagStatus
2133                     	xdef	_TIM1_GenerateEvent
2134                     	xdef	_TIM1_ITConfig
2135                     	xdef	_TIM1_SetIC4Prescaler
2136                     	xdef	_TIM1_SetIC3Prescaler
2137                     	xdef	_TIM1_SetIC2Prescaler
2138                     	xdef	_TIM1_SetIC1Prescaler
2139                     	xdef	_TIM1_GetCapture4
2140                     	xdef	_TIM1_GetCapture3
2141                     	xdef	_TIM1_GetCapture2
2142                     	xdef	_TIM1_GetCapture1
2143                     	xdef	_TIM1_PWMIConfig
2144                     	xdef	_TIM1_ICInit
2145                     	xdef	_TIM1_CCxNCmd
2146                     	xdef	_TIM1_CCxCmd
2147                     	xdef	_TIM1_SelectCOM
2148                     	xdef	_TIM1_SelectOCREFClear
2149                     	xdef	_TIM1_OC3NPolarityConfig
2150                     	xdef	_TIM1_OC3PolarityConfig
2151                     	xdef	_TIM1_OC2NPolarityConfig
2152                     	xdef	_TIM1_OC2PolarityConfig
2153                     	xdef	_TIM1_OC1NPolarityConfig
2154                     	xdef	_TIM1_OC1PolarityConfig
2155                     	xdef	_TIM1_ClearOC4Ref
2156                     	xdef	_TIM1_ClearOC3Ref
2157                     	xdef	_TIM1_ClearOC2Ref
2158                     	xdef	_TIM1_ClearOC1Ref
2159                     	xdef	_TIM1_OC3FastConfig
2160                     	xdef	_TIM1_OC2FastConfig
2161                     	xdef	_TIM1_OC1FastConfig
2162                     	xdef	_TIM1_OC4PreloadConfig
2163                     	xdef	_TIM1_OC3PreloadConfig
2164                     	xdef	_TIM1_OC2PreloadConfig
2165                     	xdef	_TIM1_OC1PreloadConfig
2166                     	xdef	_TIM1_ForcedOC3Config
2167                     	xdef	_TIM1_ForcedOC2Config
2168                     	xdef	_TIM1_ForcedOC1Config
2169                     	xdef	_TIM1_CCPreloadControl
2170                     	xdef	_TIM1_SetCompare4
2171                     	xdef	_TIM1_SetCompare3
2172                     	xdef	_TIM1_SetCompare2
2173                     	xdef	_TIM1_SetCompare1
2174                     	xdef	_TIM1_SelectOCxM
2175                     	xdef	_TIM1_CtrlPWMOutputs
2176                     	xdef	_TIM1_BDTRConfig
2177                     	xdef	_TIM1_OC3Init
2178                     	xdef	_TIM1_OC2Init
2179                     	xdef	_TIM1_OC1Init
2180                     	xdef	_TIM1_Cmd
2181                     	xdef	_TIM1_SelectOnePulseMode
2182                     	xdef	_TIM1_ARRPreloadConfig
2183                     	xdef	_TIM1_UpdateRequestConfig
2184                     	xdef	_TIM1_UpdateDisableConfig
2185                     	xdef	_TIM1_GetPrescaler
2186                     	xdef	_TIM1_GetCounter
2187                     	xdef	_TIM1_SetAutoreload
2188                     	xdef	_TIM1_SetCounter
2189                     	xdef	_TIM1_CounterModeConfig
2190                     	xdef	_TIM1_PrescalerConfig
2191                     	xdef	_TIM1_TimeBaseInit
2192                     	xdef	_TIM1_DeInit
2193                     	end
