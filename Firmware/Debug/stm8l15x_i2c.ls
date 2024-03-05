   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
  18                     ; 142 {
  19                     	scross	off
  20  0000               _I2C_DeInit:
  22                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
  23  0000 7f            	clr	(x)
  24                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
  25  0001 6f01          	clr	(1,x)
  26                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
  27  0003 6f02          	clr	(2,x)
  28                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
  29  0005 6f03          	clr	(3,x)
  30                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
  31  0007 6f04          	clr	(4,x)
  32                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
  33  0009 6f05          	clr	(5,x)
  34                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
  35  000b 6f0a          	clr	(10,x)
  36                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
  37  000d 6f0b          	clr	(11,x)
  38                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
  39  000f 6f0c          	clr	(12,x)
  40                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
  41  0011 a602          	ld	a,#2
  42  0013 e70d          	ld	(13,x),a
  43                     ; 153 }
  44  0015 81            	ret	
  46                     .const:	section	.text
  47  0000               L01:
  48  0000 000f4240      	dc.l	1000000
  49  0004               L21:
  50  0004 000186a1      	dc.l	100001
  51  0008               L41:
  52  0008 00000004      	dc.l	4
  53                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
  53                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
  53                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
  53                     ; 187 {
  54                     	switch	.text
  55  0016               _I2C_Init:
  56  0016 89            	pushw	x
  57  0017 520c          	subw	sp,#12
  58       0000000c      OFST:	set	12
  60                     ; 188   uint32_t result = 0x0004;
  61                     ; 189   uint16_t tmpval = 0;
  62                     ; 190   uint8_t tmpccrh = 0;
  63  0019 0f07          	clr	(OFST-5,sp)
  64                     ; 191   uint8_t input_clock = 0;
  65                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
  66                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
  67                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
  68                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
  69                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
  70                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
  71                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
  72  001b cd0000        	call	_CLK_GetClockFreq
  74  001e ae0000        	ldw	x,#L01
  75  0021 cd0000        	call	c_ludv
  77  0024 b603          	ld	a,c_lreg+3
  78  0026 6b08          	ld	(OFST-4,sp),a
  79                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
  80  0028 1e0d          	ldw	x,(OFST+1,sp)
  81  002a e602          	ld	a,(2,x)
  82  002c a4c0          	and	a,#192
  83  002e e702          	ld	(2,x),a
  84                     ; 209   I2Cx->FREQR |= input_clock;
  85  0030 e602          	ld	a,(2,x)
  86  0032 1a08          	or	a,(OFST-4,sp)
  87  0034 e702          	ld	(2,x),a
  88                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
  89  0036 f6            	ld	a,(x)
  90  0037 a4fe          	and	a,#254
  91  0039 f7            	ld	(x),a
  92                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
  93  003a e60c          	ld	a,(12,x)
  94  003c a430          	and	a,#48
  95  003e e70c          	ld	(12,x),a
  96                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
  97  0040 6f0b          	clr	(11,x)
  98                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
  99  0042 96            	ldw	x,sp
 100  0043 1c0011        	addw	x,#OFST+5
 101  0046 cd0000        	call	c_ltor
 103  0049 ae0004        	ldw	x,#L21
 104  004c cd0000        	call	c_lcmp
 106  004f 2576          	jrult	L3
 107                     ; 223     tmpccrh = I2C_CCRH_FS;
 108  0051 a680          	ld	a,#128
 109  0053 6b07          	ld	(OFST-5,sp),a
 110                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 111  0055 96            	ldw	x,sp
 112  0056 0d18          	tnz	(OFST+12,sp)
 113  0058 2623          	jrne	L5
 114                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 115  005a 1c0011        	addw	x,#OFST+5
 116  005d cd0000        	call	c_ltor
 118  0060 a603          	ld	a,#3
 119  0062 cd0000        	call	c_smul
 121  0065 96            	ldw	x,sp
 122  0066 5c            	incw	x
 123  0067 cd0000        	call	c_rtol
 125  006a 7b08          	ld	a,(OFST-4,sp)
 126  006c cd0141        	call	LC001
 128  006f 96            	ldw	x,sp
 129  0070 5c            	incw	x
 130  0071 cd0000        	call	c_ludv
 132  0074 96            	ldw	x,sp
 133  0075 1c0009        	addw	x,#OFST-3
 134  0078 cd0000        	call	c_rtol
 137  007b 2027          	jra	L7
 138  007d               L5:
 139                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 140  007d 1c0011        	addw	x,#OFST+5
 141  0080 cd0000        	call	c_ltor
 143  0083 a619          	ld	a,#25
 144  0085 cd0000        	call	c_smul
 146  0088 96            	ldw	x,sp
 147  0089 5c            	incw	x
 148  008a cd0000        	call	c_rtol
 150  008d 7b08          	ld	a,(OFST-4,sp)
 151  008f cd0141        	call	LC001
 153  0092 96            	ldw	x,sp
 154  0093 5c            	incw	x
 155  0094 cd0000        	call	c_ludv
 157  0097 96            	ldw	x,sp
 158  0098 1c0009        	addw	x,#OFST-3
 159  009b cd0000        	call	c_rtol
 161                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 162  009e 7b07          	ld	a,(OFST-5,sp)
 163  00a0 aa40          	or	a,#64
 164  00a2 6b07          	ld	(OFST-5,sp),a
 165  00a4               L7:
 166                     ; 239     if (result < (uint16_t)0x01)
 167  00a4 96            	ldw	x,sp
 168  00a5 1c0009        	addw	x,#OFST-3
 169  00a8 cd0000        	call	c_lzmp
 171  00ab 2608          	jrne	L11
 172                     ; 242       result = (uint16_t)0x0001;
 173  00ad ae0001        	ldw	x,#1
 174  00b0 1f0b          	ldw	(OFST-1,sp),x
 175  00b2 5f            	clrw	x
 176  00b3 1f09          	ldw	(OFST-3,sp),x
 177  00b5               L11:
 178                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 179  00b5 7b08          	ld	a,(OFST-4,sp)
 180  00b7 97            	ld	xl,a
 181  00b8 a603          	ld	a,#3
 182  00ba 42            	mul	x,a
 183  00bb a60a          	ld	a,#10
 184  00bd cd0000        	call	c_sdivx
 186  00c0 5c            	incw	x
 187  00c1 1f05          	ldw	(OFST-7,sp),x
 188                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 189  00c3 7b06          	ld	a,(OFST-6,sp)
 191  00c5 2046          	jra	L31
 192  00c7               L3:
 193                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 194  00c7 96            	ldw	x,sp
 195  00c8 1c0011        	addw	x,#OFST+5
 196  00cb cd0000        	call	c_ltor
 198  00ce 3803          	sll	c_lreg+3
 199  00d0 3902          	rlc	c_lreg+2
 200  00d2 3901          	rlc	c_lreg+1
 201  00d4 96            	ldw	x,sp
 202  00d5 3900          	rlc	c_lreg
 203  00d7 5c            	incw	x
 204  00d8 cd0000        	call	c_rtol
 206  00db 7b08          	ld	a,(OFST-4,sp)
 207  00dd ad62          	call	LC001
 209  00df 96            	ldw	x,sp
 210  00e0 5c            	incw	x
 211  00e1 cd0000        	call	c_ludv
 213  00e4 b602          	ld	a,c_lreg+2
 214  00e6 97            	ld	xl,a
 215  00e7 b603          	ld	a,c_lreg+3
 216  00e9 cd0000        	call	c_uitol
 218  00ec 96            	ldw	x,sp
 219  00ed 1c0009        	addw	x,#OFST-3
 220  00f0 cd0000        	call	c_rtol
 222                     ; 259     if (result < (uint16_t)0x0004)
 223  00f3 96            	ldw	x,sp
 224  00f4 1c0009        	addw	x,#OFST-3
 225  00f7 cd0000        	call	c_ltor
 227  00fa ae0008        	ldw	x,#L41
 228  00fd cd0000        	call	c_lcmp
 230  0100 2408          	jruge	L51
 231                     ; 262       result = (uint16_t)0x0004;
 232  0102 ae0004        	ldw	x,#4
 233  0105 1f0b          	ldw	(OFST-1,sp),x
 234  0107 5f            	clrw	x
 235  0108 1f09          	ldw	(OFST-3,sp),x
 236  010a               L51:
 237                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 238  010a 7b08          	ld	a,(OFST-4,sp)
 239  010c 4c            	inc	a
 240  010d               L31:
 241  010d 1e0d          	ldw	x,(OFST+1,sp)
 242  010f e70d          	ld	(13,x),a
 243                     ; 273   I2Cx->CCRL = (uint8_t)result;
 244  0111 7b0c          	ld	a,(OFST+0,sp)
 245  0113 e70b          	ld	(11,x),a
 246                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 247  0115 7b07          	ld	a,(OFST-5,sp)
 248  0117 e70c          	ld	(12,x),a
 249                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 250  0119 7b17          	ld	a,(OFST+11,sp)
 251  011b aa01          	or	a,#1
 252  011d fa            	or	a,(x)
 253  011e f7            	ld	(x),a
 254                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 255  011f e601          	ld	a,(1,x)
 256  0121 1a19          	or	a,(OFST+13,sp)
 257  0123 e701          	ld	(1,x),a
 258                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 259  0125 7b16          	ld	a,(OFST+10,sp)
 260  0127 e703          	ld	(3,x),a
 261                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 261                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 262  0129 1e15          	ldw	x,(OFST+9,sp)
 263  012b 4f            	clr	a
 264  012c 01            	rrwa	x,a
 265  012d 48            	sll	a
 266  012e 01            	rrwa	x,a
 267  012f 49            	rlc	a
 268  0130 a406          	and	a,#6
 269  0132 6b04          	ld	(OFST-8,sp),a
 270  0134 7b1a          	ld	a,(OFST+14,sp)
 271  0136 aa40          	or	a,#64
 272  0138 1a04          	or	a,(OFST-8,sp)
 273  013a 1e0d          	ldw	x,(OFST+1,sp)
 274  013c e704          	ld	(4,x),a
 275                     ; 286 }
 276  013e 5b0e          	addw	sp,#14
 277  0140 81            	ret	
 278  0141               LC001:
 279  0141 b703          	ld	c_lreg+3,a
 280  0143 3f02          	clr	c_lreg+2
 281  0145 3f01          	clr	c_lreg+1
 282  0147 3f00          	clr	c_lreg
 283  0149 ae0000        	ldw	x,#L01
 284  014c cc0000        	jp	c_lmul
 286                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 286                     ; 296 {
 287  014f               _I2C_Cmd:
 288       fffffffe      OFST: set -2
 290                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 291                     ; 301   if (NewState != DISABLE)
 292  014f 7b03          	ld	a,(OFST+5,sp)
 293  0151 2705          	jreq	L71
 294                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 295  0153 f6            	ld	a,(x)
 296  0154 aa01          	or	a,#1
 298  0156 2003          	jra	L12
 299  0158               L71:
 300                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 301  0158 f6            	ld	a,(x)
 302  0159 a4fe          	and	a,#254
 303  015b               L12:
 304  015b f7            	ld	(x),a
 305                     ; 311 }
 306  015c 81            	ret	
 308                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 308                     ; 321 {
 309  015d               _I2C_GeneralCallCmd:
 310       fffffffe      OFST: set -2
 312                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 313                     ; 326   if (NewState != DISABLE)
 314  015d 7b03          	ld	a,(OFST+5,sp)
 315  015f 2705          	jreq	L32
 316                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 317  0161 f6            	ld	a,(x)
 318  0162 aa40          	or	a,#64
 320  0164 2003          	jra	L52
 321  0166               L32:
 322                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 323  0166 f6            	ld	a,(x)
 324  0167 a4bf          	and	a,#191
 325  0169               L52:
 326  0169 f7            	ld	(x),a
 327                     ; 336 }
 328  016a 81            	ret	
 330                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 330                     ; 348 {
 331  016b               _I2C_GenerateSTART:
 332       fffffffe      OFST: set -2
 334                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 335                     ; 353   if (NewState != DISABLE)
 336  016b 7b03          	ld	a,(OFST+5,sp)
 337  016d 2706          	jreq	L72
 338                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 339  016f e601          	ld	a,(1,x)
 340  0171 aa01          	or	a,#1
 342  0173 2004          	jra	L13
 343  0175               L72:
 344                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 345  0175 e601          	ld	a,(1,x)
 346  0177 a4fe          	and	a,#254
 347  0179               L13:
 348  0179 e701          	ld	(1,x),a
 349                     ; 363 }
 350  017b 81            	ret	
 352                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
 352                     ; 373 {
 353  017c               _I2C_GenerateSTOP:
 354       fffffffe      OFST: set -2
 356                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
 357                     ; 378   if (NewState != DISABLE)
 358  017c 7b03          	ld	a,(OFST+5,sp)
 359  017e 2706          	jreq	L33
 360                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
 361  0180 e601          	ld	a,(1,x)
 362  0182 aa02          	or	a,#2
 364  0184 2004          	jra	L53
 365  0186               L33:
 366                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 367  0186 e601          	ld	a,(1,x)
 368  0188 a4fd          	and	a,#253
 369  018a               L53:
 370  018a e701          	ld	(1,x),a
 371                     ; 388 }
 372  018c 81            	ret	
 374                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 374                     ; 398 {
 375  018d               _I2C_SoftwareResetCmd:
 376       fffffffe      OFST: set -2
 378                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
 379                     ; 402   if (NewState != DISABLE)
 380  018d 7b03          	ld	a,(OFST+5,sp)
 381  018f 2706          	jreq	L73
 382                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
 383  0191 e601          	ld	a,(1,x)
 384  0193 aa80          	or	a,#128
 386  0195 2004          	jra	L14
 387  0197               L73:
 388                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 389  0197 e601          	ld	a,(1,x)
 390  0199 a47f          	and	a,#127
 391  019b               L14:
 392  019b e701          	ld	(1,x),a
 393                     ; 412 }
 394  019d 81            	ret	
 396                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 396                     ; 422 {
 397  019e               _I2C_StretchClockCmd:
 398       fffffffe      OFST: set -2
 400                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
 401                     ; 426   if (NewState != DISABLE)
 402  019e 7b03          	ld	a,(OFST+5,sp)
 403  01a0 2705          	jreq	L34
 404                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 405  01a2 f6            	ld	a,(x)
 406  01a3 a47f          	and	a,#127
 408  01a5 2003          	jra	L54
 409  01a7               L34:
 410                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
 411  01a7 f6            	ld	a,(x)
 412  01a8 aa80          	or	a,#128
 413  01aa               L54:
 414  01aa f7            	ld	(x),a
 415                     ; 437 }
 416  01ab 81            	ret	
 418                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 418                     ; 447 {
 419  01ac               _I2C_ARPCmd:
 420       fffffffe      OFST: set -2
 422                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
 423                     ; 451   if (NewState != DISABLE)
 424  01ac 7b03          	ld	a,(OFST+5,sp)
 425  01ae 2705          	jreq	L74
 426                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
 427  01b0 f6            	ld	a,(x)
 428  01b1 aa10          	or	a,#16
 430  01b3 2003          	jra	L15
 431  01b5               L74:
 432                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
 433  01b5 f6            	ld	a,(x)
 434  01b6 a4ef          	and	a,#239
 435  01b8               L15:
 436  01b8 f7            	ld	(x),a
 437                     ; 462 }
 438  01b9 81            	ret	
 440                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
 440                     ; 472 {
 441  01ba               _I2C_AcknowledgeConfig:
 442       fffffffe      OFST: set -2
 444                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
 445                     ; 476   if (NewState != DISABLE)
 446  01ba 7b03          	ld	a,(OFST+5,sp)
 447  01bc 2706          	jreq	L35
 448                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
 449  01be e601          	ld	a,(1,x)
 450  01c0 aa04          	or	a,#4
 452  01c2 2004          	jra	L55
 453  01c4               L35:
 454                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 455  01c4 e601          	ld	a,(1,x)
 456  01c6 a4fb          	and	a,#251
 457  01c8               L55:
 458  01c8 e701          	ld	(1,x),a
 459                     ; 486 }
 460  01ca 81            	ret	
 462                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
 462                     ; 495 {
 463  01cb               _I2C_OwnAddress2Config:
 464  01cb 89            	pushw	x
 465  01cc 88            	push	a
 466       00000001      OFST:	set	1
 468                     ; 496   uint8_t tmpreg = 0;
 469                     ; 499   tmpreg = I2Cx->OAR2;
 470  01cd e605          	ld	a,(5,x)
 471                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
 472  01cf a401          	and	a,#1
 473  01d1 6b01          	ld	(OFST+0,sp),a
 474                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
 475  01d3 7b06          	ld	a,(OFST+5,sp)
 476  01d5 a4fe          	and	a,#254
 477  01d7 1a01          	or	a,(OFST+0,sp)
 478  01d9 6b01          	ld	(OFST+0,sp),a
 479                     ; 508   I2Cx->OAR2 = tmpreg;
 480  01db 1e02          	ldw	x,(OFST+1,sp)
 481  01dd e705          	ld	(5,x),a
 482                     ; 509 }
 483  01df 5b03          	addw	sp,#3
 484  01e1 81            	ret	
 486                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 486                     ; 519 {
 487  01e2               _I2C_DualAddressCmd:
 488       fffffffe      OFST: set -2
 490                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
 491                     ; 523   if (NewState != DISABLE)
 492  01e2 7b03          	ld	a,(OFST+5,sp)
 493  01e4 2706          	jreq	L75
 494                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
 495  01e6 e605          	ld	a,(5,x)
 496  01e8 aa01          	or	a,#1
 498  01ea 2004          	jra	L16
 499  01ec               L75:
 500                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
 501  01ec e605          	ld	a,(5,x)
 502  01ee a4fe          	and	a,#254
 503  01f0               L16:
 504  01f0 e705          	ld	(5,x),a
 505                     ; 533 }
 506  01f2 81            	ret	
 508                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
 508                     ; 546 {
 509  01f3               _I2C_AckPositionConfig:
 510       fffffffe      OFST: set -2
 512                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
 513                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
 514  01f3 e601          	ld	a,(1,x)
 515  01f5 a4f7          	and	a,#247
 516  01f7 e701          	ld	(1,x),a
 517                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
 518  01f9 e601          	ld	a,(1,x)
 519  01fb 1a03          	or	a,(OFST+5,sp)
 520  01fd e701          	ld	(1,x),a
 521                     ; 554 }
 522  01ff 81            	ret	
 524                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
 524                     ; 566 {
 525  0200               _I2C_SMBusAlertConfig:
 526       fffffffe      OFST: set -2
 528                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
 529                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
 530  0200 7b03          	ld	a,(OFST+5,sp)
 531  0202 2706          	jreq	L36
 532                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
 533  0204 e601          	ld	a,(1,x)
 534  0206 aa20          	or	a,#32
 536  0208 2004          	jra	L56
 537  020a               L36:
 538                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
 539  020a e601          	ld	a,(1,x)
 540  020c a4df          	and	a,#223
 541  020e               L56:
 542  020e e701          	ld	(1,x),a
 543                     ; 581 }
 544  0210 81            	ret	
 546                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
 546                     ; 593 {
 547  0211               _I2C_FastModeDutyCycleConfig:
 548       fffffffe      OFST: set -2
 550                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 551                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
 552  0211 7b03          	ld	a,(OFST+5,sp)
 553  0213 a140          	cp	a,#64
 554  0215 2606          	jrne	L76
 555                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
 556  0217 e60c          	ld	a,(12,x)
 557  0219 aa40          	or	a,#64
 559  021b 2004          	jra	L17
 560  021d               L76:
 561                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
 562  021d e60c          	ld	a,(12,x)
 563  021f a4bf          	and	a,#191
 564  0221               L17:
 565  0221 e70c          	ld	(12,x),a
 566                     ; 608 }
 567  0223 81            	ret	
 569                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
 569                     ; 622 {
 570  0224               _I2C_Send7bitAddress:
 571  0224 89            	pushw	x
 572       00000000      OFST:	set	0
 574                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
 575                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
 576                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
 577  0225 7b06          	ld	a,(OFST+6,sp)
 578  0227 2706          	jreq	L37
 579                     ; 631     Address |= OAR1_ADD0_Set;
 580  0229 7b05          	ld	a,(OFST+5,sp)
 581  022b aa01          	or	a,#1
 583  022d 2004          	jra	L57
 584  022f               L37:
 585                     ; 636     Address &= OAR1_ADD0_Reset;
 586  022f 7b05          	ld	a,(OFST+5,sp)
 587  0231 a4fe          	and	a,#254
 588  0233               L57:
 589  0233 6b05          	ld	(OFST+5,sp),a
 590                     ; 639   I2Cx->DR = Address;
 591  0235 1e01          	ldw	x,(OFST+1,sp)
 592  0237 e706          	ld	(6,x),a
 593                     ; 640 }
 594  0239 85            	popw	x
 595  023a 81            	ret	
 597                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
 597                     ; 665 {
 598  023b               _I2C_SendData:
 599       fffffffe      OFST: set -2
 601                     ; 667   I2Cx->DR = Data;
 602  023b 7b03          	ld	a,(OFST+5,sp)
 603  023d e706          	ld	(6,x),a
 604                     ; 668 }
 605  023f 81            	ret	
 607                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
 607                     ; 677 {
 608  0240               _I2C_ReceiveData:
 610                     ; 679   return ((uint8_t)I2Cx->DR);
 611  0240 e606          	ld	a,(6,x)
 613  0242 81            	ret	
 615                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
 615                     ; 706 {
 616  0243               _I2C_TransmitPEC:
 617       fffffffe      OFST: set -2
 619                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
 620                     ; 710   if (NewState != DISABLE)
 621  0243 7b03          	ld	a,(OFST+5,sp)
 622  0245 2706          	jreq	L77
 623                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
 624  0247 e601          	ld	a,(1,x)
 625  0249 aa10          	or	a,#16
 627  024b 2004          	jra	L101
 628  024d               L77:
 629                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
 630  024d e601          	ld	a,(1,x)
 631  024f a4ef          	and	a,#239
 632  0251               L101:
 633  0251 e701          	ld	(1,x),a
 634                     ; 720 }
 635  0253 81            	ret	
 637                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
 637                     ; 730 {
 638  0254               _I2C_CalculatePEC:
 639       fffffffe      OFST: set -2
 641                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
 642                     ; 734   if (NewState != DISABLE)
 643  0254 7b03          	ld	a,(OFST+5,sp)
 644  0256 2705          	jreq	L301
 645                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
 646  0258 f6            	ld	a,(x)
 647  0259 aa20          	or	a,#32
 649  025b 2003          	jra	L501
 650  025d               L301:
 651                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
 652  025d f6            	ld	a,(x)
 653  025e a4df          	and	a,#223
 654  0260               L501:
 655  0260 f7            	ld	(x),a
 656                     ; 744 }
 657  0261 81            	ret	
 659                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
 659                     ; 756 {
 660  0262               _I2C_PECPositionConfig:
 661       fffffffe      OFST: set -2
 663                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
 664                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
 665  0262 e601          	ld	a,(1,x)
 666  0264 a4f7          	and	a,#247
 667  0266 e701          	ld	(1,x),a
 668                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
 669  0268 e601          	ld	a,(1,x)
 670  026a 1a03          	or	a,(OFST+5,sp)
 671  026c e701          	ld	(1,x),a
 672                     ; 764 }
 673  026e 81            	ret	
 675                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
 675                     ; 773 {
 676  026f               _I2C_GetPEC:
 678                     ; 775   return (I2Cx->PECR);
 679  026f e60e          	ld	a,(14,x)
 681  0271 81            	ret	
 683                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 683                     ; 804 {
 684  0272               _I2C_DMACmd:
 685       fffffffe      OFST: set -2
 687                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
 688                     ; 808   if (NewState != DISABLE)
 689  0272 7b03          	ld	a,(OFST+5,sp)
 690  0274 2706          	jreq	L701
 691                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
 692  0276 e60a          	ld	a,(10,x)
 693  0278 aa08          	or	a,#8
 695  027a 2004          	jra	L111
 696  027c               L701:
 697                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
 698  027c e60a          	ld	a,(10,x)
 699  027e a4f7          	and	a,#247
 700  0280               L111:
 701  0280 e70a          	ld	(10,x),a
 702                     ; 818 }
 703  0282 81            	ret	
 705                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 705                     ; 828 {
 706  0283               _I2C_DMALastTransferCmd:
 707       fffffffe      OFST: set -2
 709                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
 710                     ; 832   if (NewState != DISABLE)
 711  0283 7b03          	ld	a,(OFST+5,sp)
 712  0285 2706          	jreq	L311
 713                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
 714  0287 e60a          	ld	a,(10,x)
 715  0289 aa10          	or	a,#16
 717  028b 2004          	jra	L511
 718  028d               L311:
 719                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
 720  028d e60a          	ld	a,(10,x)
 721  028f a4ef          	and	a,#239
 722  0291               L511:
 723  0291 e70a          	ld	(10,x),a
 724                     ; 842 }
 725  0293 81            	ret	
 727                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
 727                     ; 955 {
 728  0294               _I2C_ITConfig:
 729       fffffffe      OFST: set -2
 731                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
 732                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
 733                     ; 960   if (NewState != DISABLE)
 734  0294 7b05          	ld	a,(OFST+7,sp)
 735  0296 2706          	jreq	L711
 736                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
 737  0298 e60a          	ld	a,(10,x)
 738  029a 1a04          	or	a,(OFST+6,sp)
 740  029c 2005          	jra	L121
 741  029e               L711:
 742                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
 743  029e 7b04          	ld	a,(OFST+6,sp)
 744  02a0 43            	cpl	a
 745  02a1 e40a          	and	a,(10,x)
 746  02a3               L121:
 747  02a3 e70a          	ld	(10,x),a
 748                     ; 970 }
 749  02a5 81            	ret	
 751                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
 751                     ; 995 {
 752  02a6               _I2C_ReadRegister:
 753  02a6 89            	pushw	x
 754  02a7 5204          	subw	sp,#4
 755       00000004      OFST:	set	4
 757                     ; 996   __IO uint16_t tmp = 0;
 758  02a9 5f            	clrw	x
 759  02aa 1f03          	ldw	(OFST-1,sp),x
 760                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
 761                     ; 1000   tmp = (uint16_t) I2Cx;
 762  02ac 1e05          	ldw	x,(OFST+1,sp)
 763  02ae 1f03          	ldw	(OFST-1,sp),x
 764                     ; 1001   tmp += I2C_Register;
 765  02b0 7b09          	ld	a,(OFST+5,sp)
 766  02b2 5f            	clrw	x
 767  02b3 97            	ld	xl,a
 768  02b4 1f01          	ldw	(OFST-3,sp),x
 769  02b6 72fb03        	addw	x,(OFST-1,sp)
 770  02b9 1f03          	ldw	(OFST-1,sp),x
 771                     ; 1004   return (*(__IO uint8_t *) tmp);
 772  02bb 1e03          	ldw	x,(OFST-1,sp)
 773  02bd f6            	ld	a,(x)
 775  02be 5b06          	addw	sp,#6
 776  02c0 81            	ret	
 778                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
 778                     ; 1045 {
 779  02c1               _I2C_CheckEvent:
 780  02c1 89            	pushw	x
 781  02c2 5206          	subw	sp,#6
 782       00000006      OFST:	set	6
 784                     ; 1046   __IO uint16_t lastevent = 0x00;
 785  02c4 5f            	clrw	x
 786  02c5 1f04          	ldw	(OFST-2,sp),x
 787                     ; 1047   uint8_t flag1 = 0x00 ;
 788                     ; 1048   uint8_t flag2 = 0x00;
 789                     ; 1049   ErrorStatus status = ERROR;
 790                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
 791                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
 792  02c7 1e0b          	ldw	x,(OFST+5,sp)
 793  02c9 a30004        	cpw	x,#4
 794  02cc 260a          	jrne	L321
 795                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
 796  02ce 1e07          	ldw	x,(OFST+1,sp)
 797  02d0 e608          	ld	a,(8,x)
 798  02d2 a404          	and	a,#4
 799  02d4 5f            	clrw	x
 800  02d5 97            	ld	xl,a
 802  02d6 201a          	jra	L521
 803  02d8               L321:
 804                     ; 1060     flag1 = I2Cx->SR1;
 805  02d8 1e07          	ldw	x,(OFST+1,sp)
 806  02da e607          	ld	a,(7,x)
 807  02dc 6b03          	ld	(OFST-3,sp),a
 808                     ; 1061     flag2 = I2Cx->SR3;
 809  02de e609          	ld	a,(9,x)
 810  02e0 6b06          	ld	(OFST+0,sp),a
 811                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
 812  02e2 5f            	clrw	x
 813  02e3 7b03          	ld	a,(OFST-3,sp)
 814  02e5 97            	ld	xl,a
 815  02e6 1f01          	ldw	(OFST-5,sp),x
 816  02e8 5f            	clrw	x
 817  02e9 7b06          	ld	a,(OFST+0,sp)
 818  02eb 97            	ld	xl,a
 819  02ec 7b02          	ld	a,(OFST-4,sp)
 820  02ee 01            	rrwa	x,a
 821  02ef 1a01          	or	a,(OFST-5,sp)
 822  02f1 01            	rrwa	x,a
 823  02f2               L521:
 824  02f2 1f04          	ldw	(OFST-2,sp),x
 825                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
 826  02f4 1e04          	ldw	x,(OFST-2,sp)
 827  02f6 01            	rrwa	x,a
 828  02f7 140c          	and	a,(OFST+6,sp)
 829  02f9 01            	rrwa	x,a
 830  02fa 140b          	and	a,(OFST+5,sp)
 831  02fc 01            	rrwa	x,a
 832  02fd 130b          	cpw	x,(OFST+5,sp)
 833  02ff 2604          	jrne	L721
 834                     ; 1068     status = SUCCESS;
 835  0301 a601          	ld	a,#1
 837  0303 2001          	jra	L131
 838  0305               L721:
 839                     ; 1073     status = ERROR;
 840  0305 4f            	clr	a
 841  0306               L131:
 842                     ; 1077   return status;
 844  0306 5b08          	addw	sp,#8
 845  0308 81            	ret	
 847                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
 847                     ; 1096 {
 848  0309               _I2C_GetLastEvent:
 849  0309 89            	pushw	x
 850  030a 5206          	subw	sp,#6
 851       00000006      OFST:	set	6
 853                     ; 1097   __IO uint16_t lastevent = 0;
 854  030c 5f            	clrw	x
 855  030d 1f05          	ldw	(OFST-1,sp),x
 856                     ; 1098   uint16_t flag1 = 0;
 857                     ; 1099   uint16_t flag2 = 0;
 858                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
 859  030f 1e07          	ldw	x,(OFST+1,sp)
 860  0311 e608          	ld	a,(8,x)
 861  0313 a504          	bcp	a,#4
 862  0315 2705          	jreq	L331
 863                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
 864  0317 ae0004        	ldw	x,#4
 866  031a 2014          	jra	L531
 867  031c               L331:
 868                     ; 1108     flag1 = I2Cx->SR1;
 869  031c e607          	ld	a,(7,x)
 870  031e 5f            	clrw	x
 871  031f 97            	ld	xl,a
 872  0320 1f01          	ldw	(OFST-5,sp),x
 873                     ; 1109     flag2 = I2Cx->SR3;
 874  0322 1e07          	ldw	x,(OFST+1,sp)
 875  0324 e609          	ld	a,(9,x)
 876  0326 5f            	clrw	x
 877  0327 97            	ld	xl,a
 878  0328 1f03          	ldw	(OFST-3,sp),x
 879                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
 880  032a 7b02          	ld	a,(OFST-4,sp)
 881  032c 01            	rrwa	x,a
 882  032d 1a01          	or	a,(OFST-5,sp)
 883  032f 01            	rrwa	x,a
 884  0330               L531:
 885  0330 1f05          	ldw	(OFST-1,sp),x
 886                     ; 1115   return (I2C_Event_TypeDef)lastevent;
 887  0332 1e05          	ldw	x,(OFST-1,sp)
 889  0334 5b08          	addw	sp,#8
 890  0336 81            	ret	
 892                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
 892                     ; 1153 {
 893  0337               _I2C_GetFlagStatus:
 894  0337 89            	pushw	x
 895  0338 89            	pushw	x
 896       00000002      OFST:	set	2
 898                     ; 1154   uint8_t tempreg = 0;
 899  0339 0f02          	clr	(OFST+0,sp)
 900                     ; 1155   uint8_t regindex = 0;
 901                     ; 1156   FlagStatus bitstatus = RESET;
 902                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
 903                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
 904  033b 7b07          	ld	a,(OFST+5,sp)
 905  033d 6b01          	ld	(OFST-1,sp),a
 906                     ; 1164   switch (regindex)
 908                     ; 1181     default:
 908                     ; 1182       break;
 909  033f 4a            	dec	a
 910  0340 2708          	jreq	L731
 911  0342 4a            	dec	a
 912  0343 270b          	jreq	L141
 913  0345 4a            	dec	a
 914  0346 270e          	jreq	L341
 915  0348 2012          	jra	L151
 916  034a               L731:
 917                     ; 1167     case 0x01:
 917                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
 918  034a 1e03          	ldw	x,(OFST+1,sp)
 919  034c e607          	ld	a,(7,x)
 920                     ; 1169       break;
 921  034e 200a          	jp	LC002
 922  0350               L141:
 923                     ; 1172     case 0x02:
 923                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
 924  0350 1e03          	ldw	x,(OFST+1,sp)
 925  0352 e608          	ld	a,(8,x)
 926                     ; 1174       break;
 927  0354 2004          	jp	LC002
 928  0356               L341:
 929                     ; 1177     case 0x03:
 929                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
 930  0356 1e03          	ldw	x,(OFST+1,sp)
 931  0358 e609          	ld	a,(9,x)
 932  035a               LC002:
 933  035a 6b02          	ld	(OFST+0,sp),a
 934                     ; 1179       break;
 935                     ; 1181     default:
 935                     ; 1182       break;
 936  035c               L151:
 937                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
 938  035c 7b08          	ld	a,(OFST+6,sp)
 939  035e 1502          	bcp	a,(OFST+0,sp)
 940  0360 2704          	jreq	L351
 941                     ; 1189     bitstatus = SET;
 942  0362 a601          	ld	a,#1
 944  0364 2001          	jra	L551
 945  0366               L351:
 946                     ; 1194     bitstatus = RESET;
 947  0366 4f            	clr	a
 948  0367               L551:
 949                     ; 1197   return bitstatus;
 951  0367 5b04          	addw	sp,#4
 952  0369 81            	ret	
 954                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
 954                     ; 1230 {
 955  036a               _I2C_ClearFlag:
 956  036a 89            	pushw	x
 957  036b 89            	pushw	x
 958       00000002      OFST:	set	2
 960                     ; 1231   uint16_t flagpos = 0;
 961                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
 962                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
 963  036c 7b08          	ld	a,(OFST+6,sp)
 964  036e 5f            	clrw	x
 965  036f 02            	rlwa	x,a
 966  0370 1f01          	ldw	(OFST-1,sp),x
 967                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
 968  0372 7b02          	ld	a,(OFST+0,sp)
 969  0374 43            	cpl	a
 970  0375 1e03          	ldw	x,(OFST+1,sp)
 971  0377 e708          	ld	(8,x),a
 972                     ; 1239 }
 973  0379 5b04          	addw	sp,#4
 974  037b 81            	ret	
 976                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
 976                     ; 1265 {
 977  037c               _I2C_GetITStatus:
 978  037c 89            	pushw	x
 979  037d 5204          	subw	sp,#4
 980       00000004      OFST:	set	4
 982                     ; 1266   ITStatus bitstatus = RESET;
 983                     ; 1267   __IO uint8_t enablestatus = 0;
 984  037f 0f03          	clr	(OFST-1,sp)
 985                     ; 1268   uint16_t tempregister = 0;
 986                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
 987                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
 988  0381 7b09          	ld	a,(OFST+5,sp)
 989  0383 a407          	and	a,#7
 990  0385 5f            	clrw	x
 991  0386 97            	ld	xl,a
 992  0387 1f01          	ldw	(OFST-3,sp),x
 993                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
 994  0389 1e05          	ldw	x,(OFST+1,sp)
 995  038b e60a          	ld	a,(10,x)
 996  038d 1402          	and	a,(OFST-2,sp)
 997  038f 6b03          	ld	(OFST-1,sp),a
 998                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
 999  0391 7b09          	ld	a,(OFST+5,sp)
1000  0393 a430          	and	a,#48
1001  0395 97            	ld	xl,a
1002  0396 4f            	clr	a
1003  0397 02            	rlwa	x,a
1004  0398 a30100        	cpw	x,#256
1005  039b 260e          	jrne	L751
1006                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
1007  039d 1e05          	ldw	x,(OFST+1,sp)
1008  039f e607          	ld	a,(7,x)
1009  03a1 150a          	bcp	a,(OFST+6,sp)
1010  03a3 2716          	jreq	L761
1012  03a5 0d03          	tnz	(OFST-1,sp)
1013  03a7 2712          	jreq	L761
1014                     ; 1284       bitstatus = SET;
1016  03a9 200c          	jp	LC004
1017                     ; 1289       bitstatus = RESET;
1018  03ab               L751:
1019                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
1020  03ab 1e05          	ldw	x,(OFST+1,sp)
1021  03ad e608          	ld	a,(8,x)
1022  03af 150a          	bcp	a,(OFST+6,sp)
1023  03b1 2708          	jreq	L761
1025  03b3 0d03          	tnz	(OFST-1,sp)
1026  03b5 2704          	jreq	L761
1027                     ; 1298       bitstatus = SET;
1028  03b7               LC004:
1029  03b7 a601          	ld	a,#1
1031  03b9 2001          	jra	L561
1032  03bb               L761:
1033                     ; 1303       bitstatus = RESET;
1034  03bb 4f            	clr	a
1035  03bc               L561:
1036                     ; 1307   return  bitstatus;
1038  03bc 5b06          	addw	sp,#6
1039  03be 81            	ret	
1041                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
1041                     ; 1341 {
1042  03bf               _I2C_ClearITPendingBit:
1043  03bf 89            	pushw	x
1044  03c0 89            	pushw	x
1045       00000002      OFST:	set	2
1047                     ; 1342   uint16_t flagpos = 0;
1048                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
1049                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
1050  03c1 7b08          	ld	a,(OFST+6,sp)
1051  03c3 5f            	clrw	x
1052  03c4 02            	rlwa	x,a
1053  03c5 1f01          	ldw	(OFST-1,sp),x
1054                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
1055  03c7 7b02          	ld	a,(OFST+0,sp)
1056  03c9 43            	cpl	a
1057  03ca 1e03          	ldw	x,(OFST+1,sp)
1058  03cc e708          	ld	(8,x),a
1059                     ; 1352 }
1060  03ce 5b04          	addw	sp,#4
1061  03d0 81            	ret	
1063                     	xdef	_I2C_ClearITPendingBit
1064                     	xdef	_I2C_GetITStatus
1065                     	xdef	_I2C_ClearFlag
1066                     	xdef	_I2C_GetFlagStatus
1067                     	xdef	_I2C_GetLastEvent
1068                     	xdef	_I2C_CheckEvent
1069                     	xdef	_I2C_ReadRegister
1070                     	xdef	_I2C_ITConfig
1071                     	xdef	_I2C_DMALastTransferCmd
1072                     	xdef	_I2C_DMACmd
1073                     	xdef	_I2C_CalculatePEC
1074                     	xdef	_I2C_TransmitPEC
1075                     	xdef	_I2C_GetPEC
1076                     	xdef	_I2C_PECPositionConfig
1077                     	xdef	_I2C_ReceiveData
1078                     	xdef	_I2C_SendData
1079                     	xdef	_I2C_Send7bitAddress
1080                     	xdef	_I2C_SMBusAlertConfig
1081                     	xdef	_I2C_FastModeDutyCycleConfig
1082                     	xdef	_I2C_AckPositionConfig
1083                     	xdef	_I2C_DualAddressCmd
1084                     	xdef	_I2C_OwnAddress2Config
1085                     	xdef	_I2C_AcknowledgeConfig
1086                     	xdef	_I2C_GenerateSTOP
1087                     	xdef	_I2C_GenerateSTART
1088                     	xdef	_I2C_ARPCmd
1089                     	xdef	_I2C_StretchClockCmd
1090                     	xdef	_I2C_SoftwareResetCmd
1091                     	xdef	_I2C_GeneralCallCmd
1092                     	xdef	_I2C_Cmd
1093                     	xdef	_I2C_Init
1094                     	xdef	_I2C_DeInit
1095                     	xref	_CLK_GetClockFreq
1096                     	xref.b	c_lreg
1097                     	xref.b	c_x
1098                     	xref	c_uitol
1099                     	xref	c_sdivx
1100                     	xref	c_lzmp
1101                     	xref	c_rtol
1102                     	xref	c_smul
1103                     	xref	c_lmul
1104                     	xref	c_lcmp
1105                     	xref	c_ltor
1106                     	xref	c_ludv
1107                     	end
