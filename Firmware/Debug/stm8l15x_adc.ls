   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
  18                     ; 136 {
  19                     	scross	off
  20  0000               _ADC_DeInit:
  22                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
  23  0000 7f            	clr	(x)
  24                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
  25  0001 6f01          	clr	(1,x)
  26                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
  27  0003 a61f          	ld	a,#31
  28  0005 e702          	ld	(2,x),a
  29                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
  30  0007 a6ff          	ld	a,#255
  31  0009 e703          	ld	(3,x),a
  32                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
  33  000b a60f          	ld	a,#15
  34  000d e706          	ld	(6,x),a
  35                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
  36  000f a6ff          	ld	a,#255
  37  0011 e707          	ld	(7,x),a
  38                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
  39  0013 6f08          	clr	(8,x)
  40                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
  41  0015 6f09          	clr	(9,x)
  42                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
  43  0017 6f0a          	clr	(10,x)
  44                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
  45  0019 6f0b          	clr	(11,x)
  46                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
  47  001b 6f0c          	clr	(12,x)
  48                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
  49  001d 6f0d          	clr	(13,x)
  50                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
  51  001f 6f0e          	clr	(14,x)
  52                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
  53  0021 6f0f          	clr	(15,x)
  54                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
  55  0023 6f10          	clr	(16,x)
  56                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
  57  0025 6f11          	clr	(17,x)
  58                     ; 164 }
  59  0027 81            	ret	
  61                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
  61                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
  61                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
  61                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
  61                     ; 190 {
  62  0028               _ADC_Init:
  63       fffffffe      OFST: set -2
  65                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
  66                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
  67                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
  68                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
  69  0028 f6            	ld	a,(x)
  70  0029 a49b          	and	a,#155
  71  002b f7            	ld	(x),a
  72                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
  73  002c 7b03          	ld	a,(OFST+5,sp)
  74  002e 1a04          	or	a,(OFST+6,sp)
  75  0030 fa            	or	a,(x)
  76  0031 f7            	ld	(x),a
  77                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
  78  0032 e601          	ld	a,(1,x)
  79  0034 a47f          	and	a,#127
  80  0036 e701          	ld	(1,x),a
  81                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
  82  0038 e601          	ld	a,(1,x)
  83  003a 1a05          	or	a,(OFST+7,sp)
  84  003c e701          	ld	(1,x),a
  85                     ; 207 }
  86  003e 81            	ret	
  88                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
  88                     ; 217              FunctionalState NewState)
  88                     ; 218 {
  89  003f               _ADC_Cmd:
  90       fffffffe      OFST: set -2
  92                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
  93                     ; 222   if (NewState != DISABLE)
  94  003f 7b03          	ld	a,(OFST+5,sp)
  95  0041 2705          	jreq	L3
  96                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
  97  0043 f6            	ld	a,(x)
  98  0044 aa01          	or	a,#1
 100  0046 2003          	jra	L5
 101  0048               L3:
 102                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 103  0048 f6            	ld	a,(x)
 104  0049 a4fe          	and	a,#254
 105  004b               L5:
 106  004b f7            	ld	(x),a
 107                     ; 232 }
 108  004c 81            	ret	
 110                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 110                     ; 240 {
 111  004d               _ADC_SoftwareStartConv:
 113                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 114  004d f6            	ld	a,(x)
 115  004e aa02          	or	a,#2
 116  0050 f7            	ld	(x),a
 117                     ; 243 }
 118  0051 81            	ret	
 120                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 120                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 120                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 120                     ; 264 {
 121  0052               _ADC_ExternalTrigConfig:
 122       fffffffe      OFST: set -2
 124                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 125                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 126                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 127  0052 e601          	ld	a,(1,x)
 128  0054 a487          	and	a,#135
 129  0056 e701          	ld	(1,x),a
 130                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 130                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 131  0058 7b04          	ld	a,(OFST+6,sp)
 132  005a 1a03          	or	a,(OFST+5,sp)
 133  005c ea01          	or	a,(1,x)
 134  005e e701          	ld	(1,x),a
 135                     ; 276 }
 136  0060 81            	ret	
 138                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
 138                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
 138                     ; 341 {
 139  0061               _ADC_AnalogWatchdogChannelSelect:
 140       fffffffe      OFST: set -2
 142                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
 143                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
 144  0061 e602          	ld	a,(2,x)
 145  0063 a4e0          	and	a,#224
 146  0065 e702          	ld	(2,x),a
 147                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
 148  0067 e602          	ld	a,(2,x)
 149  0069 1a03          	or	a,(OFST+5,sp)
 150  006b e702          	ld	(2,x),a
 151                     ; 350 }
 152  006d 81            	ret	
 154                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
 154                     ; 362 {
 155  006e               _ADC_AnalogWatchdogThresholdsConfig:
 156       fffffffe      OFST: set -2
 158                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
 159                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
 160                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
 161  006e 7b03          	ld	a,(OFST+5,sp)
 162  0070 e706          	ld	(6,x),a
 163                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
 164  0072 7b04          	ld	a,(OFST+6,sp)
 165  0074 e707          	ld	(7,x),a
 166                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
 167  0076 7b05          	ld	a,(OFST+7,sp)
 168  0078 e708          	ld	(8,x),a
 169                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
 170  007a 7b06          	ld	a,(OFST+8,sp)
 171  007c e709          	ld	(9,x),a
 172                     ; 374 }
 173  007e 81            	ret	
 175                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
 175                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
 175                     ; 414                               uint16_t HighThreshold,
 175                     ; 415                               uint16_t LowThreshold)
 175                     ; 416 {
 176  007f               _ADC_AnalogWatchdogConfig:
 177       fffffffe      OFST: set -2
 179                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
 180                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
 181                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
 182                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
 183  007f e602          	ld	a,(2,x)
 184  0081 a4e0          	and	a,#224
 185  0083 e702          	ld	(2,x),a
 186                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
 187  0085 e602          	ld	a,(2,x)
 188  0087 1a03          	or	a,(OFST+5,sp)
 189  0089 e702          	ld	(2,x),a
 190                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
 191  008b 7b04          	ld	a,(OFST+6,sp)
 192  008d e706          	ld	(6,x),a
 193                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
 194  008f 7b05          	ld	a,(OFST+7,sp)
 195  0091 e707          	ld	(7,x),a
 196                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
 197  0093 7b06          	ld	a,(OFST+8,sp)
 198  0095 e708          	ld	(8,x),a
 199                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
 200  0097 7b07          	ld	a,(OFST+9,sp)
 201  0099 e709          	ld	(9,x),a
 202                     ; 435 }
 203  009b 81            	ret	
 205                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
 205                     ; 475 {
 206  009c               _ADC_TempSensorCmd:
 208                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
 209                     ; 479   if (NewState != DISABLE)
 210  009c 4d            	tnz	a
 211  009d 2705          	jreq	L7
 212                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
 213  009f 721a534e      	bset	21326,#5
 215  00a3 81            	ret	
 216  00a4               L7:
 217                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
 218  00a4 721b534e      	bres	21326,#5
 219                     ; 489 }
 220  00a8 81            	ret	
 222                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
 222                     ; 498 {
 223  00a9               _ADC_VrefintCmd:
 225                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
 226                     ; 502   if (NewState != DISABLE)
 227  00a9 4d            	tnz	a
 228  00aa 2705          	jreq	L31
 229                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
 230  00ac 7218534e      	bset	21326,#4
 232  00b0 81            	ret	
 233  00b1               L31:
 234                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
 235  00b1 7219534e      	bres	21326,#4
 236                     ; 512 }
 237  00b5 81            	ret	
 239                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
 239                     ; 584 {
 240  00b6               _ADC_ChannelCmd:
 241  00b6 89            	pushw	x
 242  00b7 88            	push	a
 243       00000001      OFST:	set	1
 245                     ; 585   uint8_t regindex = 0;
 246                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
 247                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 248  00b8 7b06          	ld	a,(OFST+5,sp)
 249  00ba 6b01          	ld	(OFST+0,sp),a
 250                     ; 591   if (NewState != DISABLE)
 251  00bc 0d08          	tnz	(OFST+7,sp)
 252  00be 270d          	jreq	L71
 253                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
 254  00c0 01            	rrwa	x,a
 255  00c1 1b01          	add	a,(OFST+0,sp)
 256  00c3 2401          	jrnc	L03
 257  00c5 5c            	incw	x
 258  00c6               L03:
 259  00c6 02            	rlwa	x,a
 260  00c7 e60a          	ld	a,(10,x)
 261  00c9 1a07          	or	a,(OFST+6,sp)
 263  00cb 200a          	jra	L12
 264  00cd               L71:
 265                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
 266  00cd 5f            	clrw	x
 267  00ce 97            	ld	xl,a
 268  00cf 72fb02        	addw	x,(OFST+1,sp)
 269  00d2 7b07          	ld	a,(OFST+6,sp)
 270  00d4 43            	cpl	a
 271  00d5 e40a          	and	a,(10,x)
 272  00d7               L12:
 273  00d7 e70a          	ld	(10,x),a
 274                     ; 601 }
 275  00d9 5b03          	addw	sp,#3
 276  00db 81            	ret	
 278                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
 278                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
 278                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
 278                     ; 628 {
 279  00dc               _ADC_SamplingTimeConfig:
 280       fffffffe      OFST: set -2
 282                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
 283                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
 284                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
 285  00dc 7b03          	ld	a,(OFST+5,sp)
 286  00de 2711          	jreq	L32
 287                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
 288  00e0 e602          	ld	a,(2,x)
 289  00e2 a41f          	and	a,#31
 290  00e4 e702          	ld	(2,x),a
 291                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
 292  00e6 7b04          	ld	a,(OFST+6,sp)
 293  00e8 4e            	swap	a
 294  00e9 48            	sll	a
 295  00ea a4e0          	and	a,#224
 296  00ec ea02          	or	a,(2,x)
 297  00ee e702          	ld	(2,x),a
 299  00f0 81            	ret	
 300  00f1               L32:
 301                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
 302  00f1 e601          	ld	a,(1,x)
 303  00f3 a4f8          	and	a,#248
 304  00f5 e701          	ld	(1,x),a
 305                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
 306  00f7 e601          	ld	a,(1,x)
 307  00f9 1a04          	or	a,(OFST+6,sp)
 308  00fb e701          	ld	(1,x),a
 309                     ; 645 }
 310  00fd 81            	ret	
 312                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
 312                     ; 692                               FunctionalState NewState)
 312                     ; 693 {
 313  00fe               _ADC_SchmittTriggerConfig:
 314  00fe 89            	pushw	x
 315  00ff 88            	push	a
 316       00000001      OFST:	set	1
 318                     ; 694   uint8_t regindex = 0;
 319                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
 320                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 321  0100 7b06          	ld	a,(OFST+5,sp)
 322  0102 6b01          	ld	(OFST+0,sp),a
 323                     ; 700   if (NewState != DISABLE)
 324  0104 0d08          	tnz	(OFST+7,sp)
 325  0106 270e          	jreq	L72
 326                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
 327  0108 01            	rrwa	x,a
 328  0109 1b01          	add	a,(OFST+0,sp)
 329  010b 2401          	jrnc	L63
 330  010d 5c            	incw	x
 331  010e               L63:
 332  010e 02            	rlwa	x,a
 333  010f 7b07          	ld	a,(OFST+6,sp)
 334  0111 43            	cpl	a
 335  0112 e40e          	and	a,(14,x)
 337  0114 2009          	jra	L13
 338  0116               L72:
 339                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
 340  0116 5f            	clrw	x
 341  0117 97            	ld	xl,a
 342  0118 72fb02        	addw	x,(OFST+1,sp)
 343  011b e60e          	ld	a,(14,x)
 344  011d 1a07          	or	a,(OFST+6,sp)
 345  011f               L13:
 346  011f e70e          	ld	(14,x),a
 347                     ; 710 }
 348  0121 5b03          	addw	sp,#3
 349  0123 81            	ret	
 351                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
 351                     ; 718 {
 352  0124               _ADC_GetConversionValue:
 353  0124 89            	pushw	x
 354  0125 89            	pushw	x
 355       00000002      OFST:	set	2
 357                     ; 719   uint16_t tmpreg = 0;
 358                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
 359  0126 e604          	ld	a,(4,x)
 360  0128 97            	ld	xl,a
 361                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
 362  0129 1603          	ldw	y,(OFST+1,sp)
 363  012b 90e605        	ld	a,(5,y)
 364  012e 02            	rlwa	x,a
 365                     ; 726   return (uint16_t)(tmpreg) ;
 367  012f 5b04          	addw	sp,#4
 368  0131 81            	ret	
 370                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
 370                     ; 761 {
 371  0132               _ADC_DMACmd:
 372       fffffffe      OFST: set -2
 374                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
 375                     ; 765   if (NewState != DISABLE)
 376  0132 7b03          	ld	a,(OFST+5,sp)
 377  0134 2706          	jreq	L33
 378                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
 379  0136 e60a          	ld	a,(10,x)
 380  0138 a47f          	and	a,#127
 382  013a 2004          	jra	L53
 383  013c               L33:
 384                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
 385  013c e60a          	ld	a,(10,x)
 386  013e aa80          	or	a,#128
 387  0140               L53:
 388  0140 e70a          	ld	(10,x),a
 389                     ; 775 }
 390  0142 81            	ret	
 392                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
 392                     ; 832 {
 393  0143               _ADC_ITConfig:
 394       fffffffe      OFST: set -2
 396                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
 397                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
 398                     ; 837   if (NewState != DISABLE)
 399  0143 7b04          	ld	a,(OFST+6,sp)
 400  0145 2705          	jreq	L73
 401                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
 402  0147 f6            	ld	a,(x)
 403  0148 1a03          	or	a,(OFST+5,sp)
 405  014a 2004          	jra	L14
 406  014c               L73:
 407                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
 408  014c 7b03          	ld	a,(OFST+5,sp)
 409  014e 43            	cpl	a
 410  014f f4            	and	a,(x)
 411  0150               L14:
 412  0150 f7            	ld	(x),a
 413                     ; 847 }
 414  0151 81            	ret	
 416                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
 416                     ; 860 {
 417  0152               _ADC_GetFlagStatus:
 418       fffffffe      OFST: set -2
 420                     ; 861   FlagStatus flagstatus = RESET;
 421                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
 422                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
 423  0152 e603          	ld	a,(3,x)
 424  0154 1503          	bcp	a,(OFST+5,sp)
 425  0156 2703          	jreq	L34
 426                     ; 870     flagstatus = SET;
 427  0158 a601          	ld	a,#1
 429  015a 81            	ret	
 430  015b               L34:
 431                     ; 875     flagstatus = RESET;
 432  015b 4f            	clr	a
 433                     ; 879   return  flagstatus;
 435  015c 81            	ret	
 437                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
 437                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
 437                     ; 894 {
 438  015d               _ADC_ClearFlag:
 439       fffffffe      OFST: set -2
 441                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
 442                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
 443  015d 7b03          	ld	a,(OFST+5,sp)
 444  015f 43            	cpl	a
 445  0160 e703          	ld	(3,x),a
 446                     ; 900 }
 447  0162 81            	ret	
 449                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
 449                     ; 913                          ADC_IT_TypeDef ADC_IT)
 449                     ; 914 {
 450  0163               _ADC_GetITStatus:
 451  0163 89            	pushw	x
 452  0164 5203          	subw	sp,#3
 453       00000003      OFST:	set	3
 455                     ; 915   ITStatus itstatus = RESET;
 456                     ; 916   uint8_t itmask = 0, enablestatus = 0;
 458                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
 459                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
 460  0166 7b08          	ld	a,(OFST+5,sp)
 461  0168 44            	srl	a
 462  0169 44            	srl	a
 463  016a 44            	srl	a
 464  016b 6b03          	ld	(OFST+0,sp),a
 465                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
 465                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
 466  016d a403          	and	a,#3
 467  016f 6b01          	ld	(OFST-2,sp),a
 468  0171 7b03          	ld	a,(OFST+0,sp)
 469  0173 a410          	and	a,#16
 470  0175 44            	srl	a
 471  0176 44            	srl	a
 472  0177 1a01          	or	a,(OFST-2,sp)
 473  0179 6b03          	ld	(OFST+0,sp),a
 474                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
 475  017b f6            	ld	a,(x)
 476  017c 1408          	and	a,(OFST+5,sp)
 477  017e 6b02          	ld	(OFST-1,sp),a
 478                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
 479  0180 e603          	ld	a,(3,x)
 480  0182 1503          	bcp	a,(OFST+0,sp)
 481  0184 2708          	jreq	L74
 483  0186 7b02          	ld	a,(OFST-1,sp)
 484  0188 2704          	jreq	L74
 485                     ; 933     itstatus = SET;
 486  018a a601          	ld	a,#1
 488  018c 2001          	jra	L15
 489  018e               L74:
 490                     ; 938     itstatus = RESET;
 491  018e 4f            	clr	a
 492  018f               L15:
 493                     ; 942   return  itstatus;
 495  018f 5b05          	addw	sp,#5
 496  0191 81            	ret	
 498                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
 498                     ; 956                            ADC_IT_TypeDef ADC_IT)
 498                     ; 957 {
 499  0192               _ADC_ClearITPendingBit:
 500  0192 89            	pushw	x
 501  0193 89            	pushw	x
 502       00000002      OFST:	set	2
 504                     ; 958   uint8_t itmask = 0;
 505                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
 506                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
 507  0194 7b07          	ld	a,(OFST+5,sp)
 508  0196 44            	srl	a
 509  0197 44            	srl	a
 510  0198 44            	srl	a
 511  0199 6b02          	ld	(OFST+0,sp),a
 512                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
 512                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
 513  019b a403          	and	a,#3
 514  019d 6b01          	ld	(OFST-1,sp),a
 515  019f 7b02          	ld	a,(OFST+0,sp)
 516  01a1 a410          	and	a,#16
 517  01a3 44            	srl	a
 518  01a4 44            	srl	a
 519  01a5 1a01          	or	a,(OFST-1,sp)
 520  01a7 6b02          	ld	(OFST+0,sp),a
 521                     ; 969   ADCx->SR = (uint8_t)~itmask;
 522  01a9 43            	cpl	a
 523  01aa 1e03          	ldw	x,(OFST+1,sp)
 524  01ac e703          	ld	(3,x),a
 525                     ; 970 }
 526  01ae 5b04          	addw	sp,#4
 527  01b0 81            	ret	
 529                     	xdef	_ADC_ClearITPendingBit
 530                     	xdef	_ADC_GetITStatus
 531                     	xdef	_ADC_ClearFlag
 532                     	xdef	_ADC_GetFlagStatus
 533                     	xdef	_ADC_ITConfig
 534                     	xdef	_ADC_DMACmd
 535                     	xdef	_ADC_GetConversionValue
 536                     	xdef	_ADC_SchmittTriggerConfig
 537                     	xdef	_ADC_SamplingTimeConfig
 538                     	xdef	_ADC_ChannelCmd
 539                     	xdef	_ADC_VrefintCmd
 540                     	xdef	_ADC_TempSensorCmd
 541                     	xdef	_ADC_AnalogWatchdogConfig
 542                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
 543                     	xdef	_ADC_AnalogWatchdogChannelSelect
 544                     	xdef	_ADC_ExternalTrigConfig
 545                     	xdef	_ADC_SoftwareStartConv
 546                     	xdef	_ADC_Cmd
 547                     	xdef	_ADC_Init
 548                     	xdef	_ADC_DeInit
 549                     	end
