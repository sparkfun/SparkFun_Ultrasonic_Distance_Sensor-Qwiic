   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 142 void DAC_DeInit(void)
  18                     ; 143 {
  19                     	scross	off
  20  0000               _DAC_DeInit:
  22                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  23  0000 725f5380      	clr	21376
  24                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  25  0004 725f5381      	clr	21377
  26                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  27  0008 725f5382      	clr	21378
  28                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  29  000c 725f5383      	clr	21379
  30                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  31  0010 725f5384      	clr	21380
  32                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  33  0014 35ff5385      	mov	21381,#255
  34                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  35  0018 725f5388      	clr	21384
  36                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  37  001c 725f5389      	clr	21385
  38                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  39  0020 725f538c      	clr	21388
  40                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  41  0024 725f538d      	clr	21389
  42                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  43  0028 725f5390      	clr	21392
  44                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  45  002c 725f5394      	clr	21396
  46                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  47  0030 725f5395      	clr	21397
  48                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  49  0034 725f5398      	clr	21400
  50                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  51  0038 725f5399      	clr	21401
  52                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  53  003c 725f539c      	clr	21404
  54                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  55  0040 725f53a0      	clr	21408
  56                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
  57  0044 725f53a1      	clr	21409
  58                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
  59  0048 725f53a2      	clr	21410
  60                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
  61  004c 725f53a3      	clr	21411
  62                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
  63  0050 725f53a4      	clr	21412
  64                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
  65  0054 725f53a5      	clr	21413
  66                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
  67  0058 725f53a6      	clr	21414
  68                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
  69  005c 725f53a7      	clr	21415
  70                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
  71  0060 725f53a8      	clr	21416
  72                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
  73  0064 725f53a9      	clr	21417
  74                     ; 187 }
  75  0068 81            	ret	
  77                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
  77                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
  77                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
  77                     ; 211 {
  78  0069               _DAC_Init:
  79  0069 89            	pushw	x
  80  006a 5203          	subw	sp,#3
  81       00000003      OFST:	set	3
  83                     ; 212   uint8_t tmpreg = 0;
  84                     ; 213   uint16_t tmpreg2 = 0;
  85                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
  86                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
  87                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
  88                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
  89  006c 9e            	ld	a,xh
  90  006d 48            	sll	a
  91  006e 5f            	clrw	x
  92  006f 97            	ld	xl,a
  93  0070 1f01          	ldw	(OFST-2,sp),x
  94                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
  95  0072 d65380        	ld	a,(21376,x)
  96                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
  97  0075 a4c1          	and	a,#193
  98                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
  99  0077 1a08          	or	a,(OFST+5,sp)
 100  0079 6b03          	ld	(OFST+0,sp),a
 101                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 102  007b 7b05          	ld	a,(OFST+2,sp)
 103  007d a130          	cp	a,#48
 104  007f 2706          	jreq	L3
 105                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 106  0081 aa04          	or	a,#4
 107  0083 1a03          	or	a,(OFST+0,sp)
 108  0085 6b03          	ld	(OFST+0,sp),a
 109  0087               L3:
 110                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 111  0087 7b03          	ld	a,(OFST+0,sp)
 112  0089 d75380        	ld	(21376,x),a
 113                     ; 240 }
 114  008c 5b05          	addw	sp,#5
 115  008e 81            	ret	
 117                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 117                     ; 255 {
 118  008f               _DAC_Cmd:
 119  008f 89            	pushw	x
 120  0090 89            	pushw	x
 121       00000002      OFST:	set	2
 123                     ; 256   uint16_t cr1addr = 0;
 124                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 125                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 126                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 127  0091 9e            	ld	a,xh
 128  0092 48            	sll	a
 129  0093 5f            	clrw	x
 130  0094 97            	ld	xl,a
 131  0095 1c5380        	addw	x,#21376
 132  0098 1f01          	ldw	(OFST-1,sp),x
 133                     ; 264   if (NewState != DISABLE)
 134  009a 7b04          	ld	a,(OFST+2,sp)
 135  009c 2705          	jreq	L5
 136                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 137  009e f6            	ld	a,(x)
 138  009f aa01          	or	a,#1
 140  00a1 2003          	jra	L7
 141  00a3               L5:
 142                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 143  00a3 f6            	ld	a,(x)
 144  00a4 a4fe          	and	a,#254
 145  00a6               L7:
 146  00a6 f7            	ld	(x),a
 147                     ; 274 }
 148  00a7 5b04          	addw	sp,#4
 149  00a9 81            	ret	
 151                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 151                     ; 287 {
 152  00aa               _DAC_SoftwareTriggerCmd:
 153  00aa 89            	pushw	x
 154       00000000      OFST:	set	0
 156                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 157                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 158                     ; 292   if (NewState != DISABLE)
 159  00ab 9f            	ld	a,xl
 160  00ac 4d            	tnz	a
 161  00ad 2711          	jreq	L11
 162                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 163  00af 9e            	ld	a,xh
 164  00b0 5f            	clrw	x
 165  00b1 97            	ld	xl,a
 166  00b2 a601          	ld	a,#1
 167  00b4 5d            	tnzw	x
 168  00b5 2704          	jreq	L21
 169  00b7               L41:
 170  00b7 48            	sll	a
 171  00b8 5a            	decw	x
 172  00b9 26fc          	jrne	L41
 173  00bb               L21:
 174  00bb ca5384        	or	a,21380
 176  00be 2011          	jra	L31
 177  00c0               L11:
 178                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 179  00c0 7b01          	ld	a,(OFST+1,sp)
 180  00c2 5f            	clrw	x
 181  00c3 97            	ld	xl,a
 182  00c4 a601          	ld	a,#1
 183  00c6 5d            	tnzw	x
 184  00c7 2704          	jreq	L61
 185  00c9               L02:
 186  00c9 48            	sll	a
 187  00ca 5a            	decw	x
 188  00cb 26fc          	jrne	L02
 189  00cd               L61:
 190  00cd 43            	cpl	a
 191  00ce c45384        	and	a,21380
 192  00d1               L31:
 193  00d1 c75384        	ld	21380,a
 194                     ; 302 }
 195  00d4 85            	popw	x
 196  00d5 81            	ret	
 198                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 198                     ; 312 {
 199  00d6               _DAC_DualSoftwareTriggerCmd:
 201                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 202                     ; 316   if (NewState != DISABLE)
 203  00d6 4d            	tnz	a
 204  00d7 2707          	jreq	L51
 205                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 206  00d9 c65384        	ld	a,21380
 207  00dc aa03          	or	a,#3
 209  00de 2005          	jra	L71
 210  00e0               L51:
 211                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 212  00e0 c65384        	ld	a,21380
 213  00e3 a4fc          	and	a,#252
 214  00e5               L71:
 215  00e5 c75384        	ld	21380,a
 216                     ; 326 }
 217  00e8 81            	ret	
 219                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 219                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 219                     ; 344                            FunctionalState NewState)
 219                     ; 345 {
 220  00e9               _DAC_WaveGenerationCmd:
 221  00e9 89            	pushw	x
 222  00ea 88            	push	a
 223       00000001      OFST:	set	1
 225                     ; 346   uint8_t tmpreg = 0;
 226                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 227                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 228                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 229                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 230  00eb 9e            	ld	a,xh
 231  00ec 48            	sll	a
 232  00ed 5f            	clrw	x
 233  00ee 97            	ld	xl,a
 234  00ef d65380        	ld	a,(21376,x)
 235  00f2 a43f          	and	a,#63
 236                     ; 356   if (NewState != DISABLE)
 237  00f4 0d06          	tnz	(OFST+5,sp)
 238  00f6 2702          	jreq	L12
 239                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 240  00f8 1a03          	or	a,(OFST+2,sp)
 241  00fa               L12:
 242  00fa 6b01          	ld	(OFST+0,sp),a
 243                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 244  00fc 7b02          	ld	a,(OFST+1,sp)
 245  00fe 48            	sll	a
 246  00ff 5f            	clrw	x
 247  0100 97            	ld	xl,a
 248  0101 7b01          	ld	a,(OFST+0,sp)
 249  0103 d75380        	ld	(21376,x),a
 250                     ; 364 }
 251  0106 5b03          	addw	sp,#3
 252  0108 81            	ret	
 254                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 254                     ; 389 {
 255  0109               _DAC_SetNoiseWaveLFSR:
 256  0109 89            	pushw	x
 257  010a 5203          	subw	sp,#3
 258       00000003      OFST:	set	3
 260                     ; 390   uint8_t tmpreg = 0;
 261                     ; 391   uint16_t cr2addr = 0;
 262                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 263                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 264                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 265  010c 9e            	ld	a,xh
 266  010d 48            	sll	a
 267  010e 5f            	clrw	x
 268  010f 97            	ld	xl,a
 269  0110 1c5381        	addw	x,#21377
 270  0113 1f02          	ldw	(OFST-1,sp),x
 271                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 272  0115 f6            	ld	a,(x)
 273  0116 a4f0          	and	a,#240
 274  0118 6b01          	ld	(OFST-2,sp),a
 275                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 276  011a 1a05          	or	a,(OFST+2,sp)
 277  011c f7            	ld	(x),a
 278                     ; 403 }
 279  011d 5b05          	addw	sp,#5
 280  011f 81            	ret	
 282                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
 282                     ; 428 {
 283  0120               _DAC_SetTriangleWaveAmplitude:
 284  0120 89            	pushw	x
 285  0121 5203          	subw	sp,#3
 286       00000003      OFST:	set	3
 288                     ; 429   uint8_t tmpreg = 0;
 289                     ; 430   uint16_t cr2addr = 0;
 290                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 291                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
 292                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 293  0123 9e            	ld	a,xh
 294  0124 48            	sll	a
 295  0125 5f            	clrw	x
 296  0126 97            	ld	xl,a
 297  0127 1c5381        	addw	x,#21377
 298  012a 1f02          	ldw	(OFST-1,sp),x
 299                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 300  012c f6            	ld	a,(x)
 301  012d a4f0          	and	a,#240
 302  012f 6b01          	ld	(OFST-2,sp),a
 303                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
 304  0131 1a05          	or	a,(OFST+2,sp)
 305  0133 f7            	ld	(x),a
 306                     ; 443 }
 307  0134 5b05          	addw	sp,#5
 308  0136 81            	ret	
 310                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
 310                     ; 456 {
 311  0137               _DAC_SetChannel1Data:
 312  0137 88            	push	a
 313       00000000      OFST:	set	0
 315                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
 316                     ; 460   if (DAC_Align != DAC_Align_8b_R)
 317  0138 a108          	cp	a,#8
 318  013a 2712          	jreq	L32
 319                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
 320  013c 5f            	clrw	x
 321  013d 97            	ld	xl,a
 322  013e 7b04          	ld	a,(OFST+4,sp)
 323  0140 d75388        	ld	(21384,x),a
 324                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
 325  0143 5f            	clrw	x
 326  0144 7b01          	ld	a,(OFST+1,sp)
 327  0146 97            	ld	xl,a
 328  0147 7b05          	ld	a,(OFST+5,sp)
 329  0149 d75389        	ld	(21385,x),a
 331  014c 2005          	jra	L52
 332  014e               L32:
 333                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
 334                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
 335  014e 7b05          	ld	a,(OFST+5,sp)
 336  0150 c75390        	ld	21392,a
 337  0153               L52:
 338                     ; 474 }
 339  0153 84            	pop	a
 340  0154 81            	ret	
 342                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
 342                     ; 487 {
 343  0155               _DAC_SetChannel2Data:
 344  0155 88            	push	a
 345       00000000      OFST:	set	0
 347                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
 348                     ; 491   if (DAC_Align != DAC_Align_8b_R)
 349  0156 a108          	cp	a,#8
 350  0158 2712          	jreq	L72
 351                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
 352  015a 5f            	clrw	x
 353  015b 97            	ld	xl,a
 354  015c 7b04          	ld	a,(OFST+4,sp)
 355  015e d75394        	ld	(21396,x),a
 356                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
 357  0161 5f            	clrw	x
 358  0162 7b01          	ld	a,(OFST+1,sp)
 359  0164 97            	ld	xl,a
 360  0165 7b05          	ld	a,(OFST+5,sp)
 361  0167 d75395        	ld	(21397,x),a
 363  016a 2005          	jra	L13
 364  016c               L72:
 365                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
 366                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
 367  016c 7b05          	ld	a,(OFST+5,sp)
 368  016e c7539c        	ld	21404,a
 369  0171               L13:
 370                     ; 505 }
 371  0171 84            	pop	a
 372  0172 81            	ret	
 374                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
 374                     ; 523 {
 375  0173               _DAC_SetDualChannelData:
 376       ffffffff      OFST: set -1
 378                     ; 524   uint16_t dchxrdhrhaddr = 0;
 379                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
 380                     ; 529   if (DAC_Align != DAC_Align_8b_R)
 381  0173 a108          	cp	a,#8
 382  0175 2715          	jreq	L33
 383                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
 384  0177 5f            	clrw	x
 385  0178 97            	ld	xl,a
 386  0179 1c53a0        	addw	x,#21408
 387                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
 388  017c 7b05          	ld	a,(OFST+6,sp)
 389  017e f7            	ld	(x),a
 390                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
 391  017f 7b06          	ld	a,(OFST+7,sp)
 392  0181 e701          	ld	(1,x),a
 393                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
 394  0183 7b03          	ld	a,(OFST+4,sp)
 395  0185 e702          	ld	(2,x),a
 396                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
 397  0187 7b04          	ld	a,(OFST+5,sp)
 398  0189 e703          	ld	(3,x),a
 400  018b 81            	ret	
 401  018c               L33:
 402                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
 403                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
 404  018c 7b06          	ld	a,(OFST+7,sp)
 405  018e c753a8        	ld	21416,a
 406                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
 407  0191 7b04          	ld	a,(OFST+5,sp)
 408  0193 c753a9        	ld	21417,a
 409                     ; 549 }
 410  0196 81            	ret	
 412                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
 412                     ; 560 {
 413  0197               _DAC_GetDataOutputValue:
 414  0197 89            	pushw	x
 415       00000002      OFST:	set	2
 417                     ; 561   uint16_t outputdata = 0;
 418                     ; 562   uint16_t tmp = 0;
 419                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 420                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
 421  0198 4d            	tnz	a
 422  0199 260d          	jrne	L73
 423                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
 424  019b c653ac        	ld	a,21420
 425  019e 97            	ld	xl,a
 426  019f 4f            	clr	a
 427  01a0 02            	rlwa	x,a
 428  01a1 1f01          	ldw	(OFST-1,sp),x
 429                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
 430  01a3 c653ad        	ld	a,21421
 432  01a6 200b          	jra	L14
 433  01a8               L73:
 434                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
 435  01a8 c653b0        	ld	a,21424
 436  01ab 97            	ld	xl,a
 437  01ac 4f            	clr	a
 438  01ad 02            	rlwa	x,a
 439  01ae 1f01          	ldw	(OFST-1,sp),x
 440                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
 441  01b0 c653b1        	ld	a,21425
 442  01b3               L14:
 443  01b3 5f            	clrw	x
 444  01b4 97            	ld	xl,a
 445  01b5 01            	rrwa	x,a
 446  01b6 1a02          	or	a,(OFST+0,sp)
 447  01b8 01            	rrwa	x,a
 448  01b9 1a01          	or	a,(OFST-1,sp)
 449  01bb 01            	rrwa	x,a
 450                     ; 581   return (uint16_t)outputdata;
 452  01bc 5b02          	addw	sp,#2
 453  01be 81            	ret	
 455                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 455                     ; 614 {
 456  01bf               _DAC_DMACmd:
 457  01bf 89            	pushw	x
 458  01c0 89            	pushw	x
 459       00000002      OFST:	set	2
 461                     ; 615   uint16_t cr2addr = 0;
 462                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 463                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
 464                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 465  01c1 9e            	ld	a,xh
 466  01c2 48            	sll	a
 467  01c3 5f            	clrw	x
 468  01c4 97            	ld	xl,a
 469  01c5 1c5381        	addw	x,#21377
 470  01c8 1f01          	ldw	(OFST-1,sp),x
 471                     ; 624   if (NewState != DISABLE)
 472  01ca 7b04          	ld	a,(OFST+2,sp)
 473  01cc 2705          	jreq	L34
 474                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
 475  01ce f6            	ld	a,(x)
 476  01cf aa10          	or	a,#16
 478  01d1 2003          	jra	L54
 479  01d3               L34:
 480                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
 481  01d3 f6            	ld	a,(x)
 482  01d4 a4ef          	and	a,#239
 483  01d6               L54:
 484  01d6 f7            	ld	(x),a
 485                     ; 634 }
 486  01d7 5b04          	addw	sp,#4
 487  01d9 81            	ret	
 489                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
 489                     ; 668 {
 490  01da               _DAC_ITConfig:
 491  01da 89            	pushw	x
 492  01db 89            	pushw	x
 493       00000002      OFST:	set	2
 495                     ; 669   uint16_t cr2addr = 0;
 496                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 497                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
 498                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
 499                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 500  01dc 9e            	ld	a,xh
 501  01dd 48            	sll	a
 502  01de 5f            	clrw	x
 503  01df 97            	ld	xl,a
 504  01e0 1c5381        	addw	x,#21377
 505  01e3 1f01          	ldw	(OFST-1,sp),x
 506                     ; 679   if (NewState != DISABLE)
 507  01e5 7b07          	ld	a,(OFST+5,sp)
 508  01e7 2705          	jreq	L74
 509                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
 510  01e9 f6            	ld	a,(x)
 511  01ea 1a04          	or	a,(OFST+2,sp)
 513  01ec 2004          	jra	L15
 514  01ee               L74:
 515                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
 516  01ee 7b04          	ld	a,(OFST+2,sp)
 517  01f0 43            	cpl	a
 518  01f1 f4            	and	a,(x)
 519  01f2               L15:
 520  01f2 f7            	ld	(x),a
 521                     ; 689 }
 522  01f3 5b04          	addw	sp,#4
 523  01f5 81            	ret	
 525                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
 525                     ; 705 {
 526  01f6               _DAC_GetFlagStatus:
 527  01f6 89            	pushw	x
 528  01f7 88            	push	a
 529       00000001      OFST:	set	1
 531                     ; 706   FlagStatus flagstatus = RESET;
 532                     ; 707   uint8_t flag = 0;
 533                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 534                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
 535                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
 536  01f8 9e            	ld	a,xh
 537  01f9 5f            	clrw	x
 538  01fa 97            	ld	xl,a
 539  01fb 7b03          	ld	a,(OFST+2,sp)
 540  01fd 5d            	tnzw	x
 541  01fe 2704          	jreq	L05
 542  0200               L25:
 543  0200 48            	sll	a
 544  0201 5a            	decw	x
 545  0202 26fc          	jrne	L25
 546  0204               L05:
 547  0204 6b01          	ld	(OFST+0,sp),a
 548                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
 549  0206 c65385        	ld	a,21381
 550  0209 1501          	bcp	a,(OFST+0,sp)
 551  020b 2704          	jreq	L35
 552                     ; 719     flagstatus = SET;
 553  020d a601          	ld	a,#1
 555  020f 2001          	jra	L55
 556  0211               L35:
 557                     ; 724     flagstatus = RESET;
 558  0211 4f            	clr	a
 559  0212               L55:
 560                     ; 728   return  flagstatus;
 562  0212 5b03          	addw	sp,#3
 563  0214 81            	ret	
 565                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
 565                     ; 743 {
 566  0215               _DAC_ClearFlag:
 567  0215 89            	pushw	x
 568  0216 88            	push	a
 569       00000001      OFST:	set	1
 571                     ; 744   uint8_t flag = 0;
 572                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 573                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
 574                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
 575  0217 9e            	ld	a,xh
 576  0218 5f            	clrw	x
 577  0219 97            	ld	xl,a
 578  021a 7b03          	ld	a,(OFST+2,sp)
 579  021c 5d            	tnzw	x
 580  021d 2704          	jreq	L65
 581  021f               L06:
 582  021f 48            	sll	a
 583  0220 5a            	decw	x
 584  0221 26fc          	jrne	L06
 585  0223               L65:
 586                     ; 754   DAC->SR = (uint8_t)(~flag);
 587  0223 43            	cpl	a
 588  0224 c75385        	ld	21381,a
 589                     ; 755 }
 590  0227 5b03          	addw	sp,#3
 591  0229 81            	ret	
 593                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
 593                     ; 771 {
 594  022a               _DAC_GetITStatus:
 595  022a 89            	pushw	x
 596  022b 89            	pushw	x
 597       00000002      OFST:	set	2
 599                     ; 772   ITStatus itstatus = RESET;
 600                     ; 773   uint8_t enablestatus = 0;
 601                     ; 774   uint8_t flagstatus = 0;
 602                     ; 775   uint8_t tempreg = 0;
 603                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 604                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
 605                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
 606  022c 9e            	ld	a,xh
 607  022d 48            	sll	a
 608  022e 48            	sll	a
 609  022f 5f            	clrw	x
 610  0230 97            	ld	xl,a
 611  0231 d65381        	ld	a,(21377,x)
 612  0234 6b02          	ld	(OFST+0,sp),a
 613                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
 614  0236 5f            	clrw	x
 615  0237 7b03          	ld	a,(OFST+1,sp)
 616  0239 97            	ld	xl,a
 617  023a 7b04          	ld	a,(OFST+2,sp)
 618  023c 5d            	tnzw	x
 619  023d 2704          	jreq	L46
 620  023f               L66:
 621  023f 48            	sll	a
 622  0240 5a            	decw	x
 623  0241 26fc          	jrne	L66
 624  0243               L46:
 625  0243 1402          	and	a,(OFST+0,sp)
 626  0245 6b01          	ld	(OFST-1,sp),a
 627                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
 628  0247 a605          	ld	a,#5
 629  0249 1003          	sub	a,(OFST+1,sp)
 630  024b 5f            	clrw	x
 631  024c 97            	ld	xl,a
 632  024d 7b04          	ld	a,(OFST+2,sp)
 633  024f 5d            	tnzw	x
 634  0250 2704          	jreq	L07
 635  0252               L27:
 636  0252 44            	srl	a
 637  0253 5a            	decw	x
 638  0254 26fc          	jrne	L27
 639  0256               L07:
 640  0256 c45385        	and	a,21381
 641  0259 6b02          	ld	(OFST+0,sp),a
 642                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
 643  025b 2708          	jreq	L75
 645  025d 7b01          	ld	a,(OFST-1,sp)
 646  025f 2704          	jreq	L75
 647                     ; 790     itstatus = SET;
 648  0261 a601          	ld	a,#1
 650  0263 2001          	jra	L16
 651  0265               L75:
 652                     ; 795     itstatus = RESET;
 653  0265 4f            	clr	a
 654  0266               L16:
 655                     ; 799   return  itstatus;
 657  0266 5b04          	addw	sp,#4
 658  0268 81            	ret	
 660                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
 660                     ; 814 {
 661  0269               _DAC_ClearITPendingBit:
 662  0269 89            	pushw	x
 663       00000000      OFST:	set	0
 665                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 666                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
 667                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
 668  026a 9e            	ld	a,xh
 669  026b a005          	sub	a,#5
 670  026d 40            	neg	a
 671  026e 5f            	clrw	x
 672  026f 97            	ld	xl,a
 673  0270 7b02          	ld	a,(OFST+2,sp)
 674  0272 5d            	tnzw	x
 675  0273 2704          	jreq	L67
 676  0275               L001:
 677  0275 44            	srl	a
 678  0276 5a            	decw	x
 679  0277 26fc          	jrne	L001
 680  0279               L67:
 681  0279 43            	cpl	a
 682  027a c75385        	ld	21381,a
 683                     ; 821 }
 684  027d 85            	popw	x
 685  027e 81            	ret	
 687                     	xdef	_DAC_ClearITPendingBit
 688                     	xdef	_DAC_GetITStatus
 689                     	xdef	_DAC_ClearFlag
 690                     	xdef	_DAC_GetFlagStatus
 691                     	xdef	_DAC_ITConfig
 692                     	xdef	_DAC_DMACmd
 693                     	xdef	_DAC_GetDataOutputValue
 694                     	xdef	_DAC_SetDualChannelData
 695                     	xdef	_DAC_SetChannel2Data
 696                     	xdef	_DAC_SetChannel1Data
 697                     	xdef	_DAC_SetTriangleWaveAmplitude
 698                     	xdef	_DAC_SetNoiseWaveLFSR
 699                     	xdef	_DAC_WaveGenerationCmd
 700                     	xdef	_DAC_DualSoftwareTriggerCmd
 701                     	xdef	_DAC_SoftwareTriggerCmd
 702                     	xdef	_DAC_Cmd
 703                     	xdef	_DAC_Init
 704                     	xdef	_DAC_DeInit
 705                     	end
