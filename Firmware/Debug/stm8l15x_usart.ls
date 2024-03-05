   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
  18                     ; 149 {
  19                     	scross	off
  20  0000               _USART_DeInit:
  22                     ; 153   (void) USARTx->SR;
  23  0000 f6            	ld	a,(x)
  24                     ; 154   (void) USARTx->DR;
  25  0001 e601          	ld	a,(1,x)
  26                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  27  0003 6f03          	clr	(3,x)
  28                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  29  0005 6f02          	clr	(2,x)
  30                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  31  0007 6f04          	clr	(4,x)
  32                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  33  0009 6f05          	clr	(5,x)
  34                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  35  000b 6f06          	clr	(6,x)
  36                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  37  000d 6f07          	clr	(7,x)
  38                     ; 163 }
  39  000f 81            	ret	
  41                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
  41                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
  41                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
  41                     ; 195 {
  42  0010               _USART_Init:
  43  0010 89            	pushw	x
  44  0011 5204          	subw	sp,#4
  45       00000004      OFST:	set	4
  47                     ; 196   uint32_t BaudRate_Mantissa = 0;
  48                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
  49                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
  50                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
  51                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
  52                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
  53                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
  54  0013 e604          	ld	a,(4,x)
  55  0015 a4e9          	and	a,#233
  56  0017 e704          	ld	(4,x),a
  57                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
  58  0019 7b0d          	ld	a,(OFST+9,sp)
  59  001b 1a0f          	or	a,(OFST+11,sp)
  60  001d ea04          	or	a,(4,x)
  61  001f e704          	ld	(4,x),a
  62                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
  63  0021 e606          	ld	a,(6,x)
  64  0023 a4cf          	and	a,#207
  65  0025 e706          	ld	(6,x),a
  66                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
  67  0027 e606          	ld	a,(6,x)
  68  0029 1a0e          	or	a,(OFST+10,sp)
  69  002b e706          	ld	(6,x),a
  70                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
  71  002d 6f02          	clr	(2,x)
  72                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
  73  002f e603          	ld	a,(3,x)
  74  0031 a40f          	and	a,#15
  75  0033 e703          	ld	(3,x),a
  76                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
  77  0035 e603          	ld	a,(3,x)
  78  0037 a4f0          	and	a,#240
  79  0039 e703          	ld	(3,x),a
  80                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
  81  003b cd0000        	call	_CLK_GetClockFreq
  83  003e 96            	ldw	x,sp
  84  003f 1c0009        	addw	x,#OFST+5
  85  0042 cd0000        	call	c_ludv
  87  0045 96            	ldw	x,sp
  88  0046 5c            	incw	x
  89  0047 cd0000        	call	c_rtol
  91                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
  92  004a 7b03          	ld	a,(OFST-1,sp)
  93  004c a4f0          	and	a,#240
  94  004e 1e05          	ldw	x,(OFST+1,sp)
  95  0050 e703          	ld	(3,x),a
  96                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
  97  0052 7b04          	ld	a,(OFST+0,sp)
  98  0054 a40f          	and	a,#15
  99  0056 ea03          	or	a,(3,x)
 100  0058 e703          	ld	(3,x),a
 101                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 102  005a 96            	ldw	x,sp
 103  005b 5c            	incw	x
 104  005c cd0000        	call	c_ltor
 106  005f a604          	ld	a,#4
 107  0061 cd0000        	call	c_lursh
 109  0064 b603          	ld	a,c_lreg+3
 110  0066 1e05          	ldw	x,(OFST+1,sp)
 111  0068 e702          	ld	(2,x),a
 112                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 113  006a e605          	ld	a,(5,x)
 114  006c a4f3          	and	a,#243
 115  006e e705          	ld	(5,x),a
 116                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 117  0070 e605          	ld	a,(5,x)
 118  0072 1a10          	or	a,(OFST+12,sp)
 119  0074 e705          	ld	(5,x),a
 120                     ; 239 }
 121  0076 5b06          	addw	sp,#6
 122  0078 81            	ret	
 124                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 124                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 124                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 124                     ; 267 {
 125  0079               _USART_ClockInit:
 126       fffffffe      OFST: set -2
 128                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 129                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 130                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 131                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 132                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 133  0079 e606          	ld	a,(6,x)
 134  007b a4f8          	and	a,#248
 135  007d e706          	ld	(6,x),a
 136                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 137  007f 7b04          	ld	a,(OFST+6,sp)
 138  0081 1a05          	or	a,(OFST+7,sp)
 139  0083 1a06          	or	a,(OFST+8,sp)
 140  0085 ea06          	or	a,(6,x)
 141  0087 e706          	ld	(6,x),a
 142                     ; 279   if (USART_Clock != USART_Clock_Disable)
 143  0089 7b03          	ld	a,(OFST+5,sp)
 144  008b 2706          	jreq	L3
 145                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 146  008d e606          	ld	a,(6,x)
 147  008f aa08          	or	a,#8
 149  0091 2004          	jra	L5
 150  0093               L3:
 151                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 152  0093 e606          	ld	a,(6,x)
 153  0095 a4f7          	and	a,#247
 154  0097               L5:
 155  0097 e706          	ld	(6,x),a
 156                     ; 287 }
 157  0099 81            	ret	
 159                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 159                     ; 297 {
 160  009a               _USART_Cmd:
 161       fffffffe      OFST: set -2
 163                     ; 298   if (NewState != DISABLE)
 164  009a 7b03          	ld	a,(OFST+5,sp)
 165  009c 2706          	jreq	L7
 166                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 167  009e e604          	ld	a,(4,x)
 168  00a0 a4df          	and	a,#223
 170  00a2 2004          	jra	L11
 171  00a4               L7:
 172                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 173  00a4 e604          	ld	a,(4,x)
 174  00a6 aa20          	or	a,#32
 175  00a8               L11:
 176  00a8 e704          	ld	(4,x),a
 177                     ; 306 }
 178  00aa 81            	ret	
 180                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 180                     ; 330 {
 181  00ab               _USART_SetPrescaler:
 182       fffffffe      OFST: set -2
 184                     ; 332   USARTx->PSCR = USART_Prescaler;
 185  00ab 7b03          	ld	a,(OFST+5,sp)
 186  00ad e70a          	ld	(10,x),a
 187                     ; 333 }
 188  00af 81            	ret	
 190                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 190                     ; 341 {
 191  00b0               _USART_SendBreak:
 193                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 194  00b0 e605          	ld	a,(5,x)
 195  00b2 aa01          	or	a,#1
 196  00b4 e705          	ld	(5,x),a
 197                     ; 343 }
 198  00b6 81            	ret	
 200                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 200                     ; 383 {
 201  00b7               _USART_ReceiveData8:
 203                     ; 384   return USARTx->DR;
 204  00b7 e601          	ld	a,(1,x)
 206  00b9 81            	ret	
 208                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
 208                     ; 393 {
 209  00ba               _USART_ReceiveData9:
 210  00ba 89            	pushw	x
 211  00bb 89            	pushw	x
 212       00000002      OFST:	set	2
 214                     ; 394   uint16_t temp = 0;
 215                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 216  00bc e604          	ld	a,(4,x)
 217  00be a480          	and	a,#128
 218  00c0 5f            	clrw	x
 219  00c1 02            	rlwa	x,a
 220  00c2 58            	sllw	x
 221  00c3 1f01          	ldw	(OFST-1,sp),x
 222                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
 223  00c5 1e03          	ldw	x,(OFST+1,sp)
 224  00c7 e601          	ld	a,(1,x)
 225  00c9 5f            	clrw	x
 226  00ca 97            	ld	xl,a
 227  00cb 01            	rrwa	x,a
 228  00cc 1a02          	or	a,(OFST+0,sp)
 229  00ce 01            	rrwa	x,a
 230  00cf 1a01          	or	a,(OFST-1,sp)
 231  00d1 a401          	and	a,#1
 232  00d3 01            	rrwa	x,a
 234  00d4 5b04          	addw	sp,#4
 235  00d6 81            	ret	
 237                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
 237                     ; 406 {
 238  00d7               _USART_SendData8:
 239       fffffffe      OFST: set -2
 241                     ; 408   USARTx->DR = Data;
 242  00d7 7b03          	ld	a,(OFST+5,sp)
 243  00d9 e701          	ld	(1,x),a
 244                     ; 409 }
 245  00db 81            	ret	
 247                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
 247                     ; 419 {
 248  00dc               _USART_SendData9:
 249       fffffffe      OFST: set -2
 251                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
 252                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
 253  00dc e604          	ld	a,(4,x)
 254  00de a4bf          	and	a,#191
 255  00e0 e704          	ld	(4,x),a
 256                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
 257  00e2 1603          	ldw	y,(OFST+5,sp)
 258  00e4 9054          	srlw	y
 259  00e6 9054          	srlw	y
 260  00e8 909f          	ld	a,yl
 261  00ea a440          	and	a,#64
 262  00ec ea04          	or	a,(4,x)
 263  00ee e704          	ld	(4,x),a
 264                     ; 429   USARTx->DR   = (uint8_t)(Data);
 265  00f0 7b04          	ld	a,(OFST+6,sp)
 266  00f2 e701          	ld	(1,x),a
 267                     ; 430 }
 268  00f4 81            	ret	
 270                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 270                     ; 474 {
 271  00f5               _USART_ReceiverWakeUpCmd:
 272       fffffffe      OFST: set -2
 274                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
 275                     ; 477   if (NewState != DISABLE)
 276  00f5 7b03          	ld	a,(OFST+5,sp)
 277  00f7 2706          	jreq	L31
 278                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
 279  00f9 e605          	ld	a,(5,x)
 280  00fb aa02          	or	a,#2
 282  00fd 2004          	jra	L51
 283  00ff               L31:
 284                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
 285  00ff e605          	ld	a,(5,x)
 286  0101 a4fd          	and	a,#253
 287  0103               L51:
 288  0103 e705          	ld	(5,x),a
 289                     ; 487 }
 290  0105 81            	ret	
 292                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
 292                     ; 497 {
 293  0106               _USART_SetAddress:
 294       fffffffe      OFST: set -2
 296                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
 297                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
 298  0106 e607          	ld	a,(7,x)
 299  0108 a4f0          	and	a,#240
 300  010a e707          	ld	(7,x),a
 301                     ; 504   USARTx->CR4 |= USART_Address;
 302  010c e607          	ld	a,(7,x)
 303  010e 1a03          	or	a,(OFST+5,sp)
 304  0110 e707          	ld	(7,x),a
 305                     ; 505 }
 306  0112 81            	ret	
 308                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
 308                     ; 516 {
 309  0113               _USART_WakeUpConfig:
 310       fffffffe      OFST: set -2
 312                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
 313                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
 314  0113 e604          	ld	a,(4,x)
 315  0115 a4f7          	and	a,#247
 316  0117 e704          	ld	(4,x),a
 317                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
 318  0119 e604          	ld	a,(4,x)
 319  011b 1a03          	or	a,(OFST+5,sp)
 320  011d e704          	ld	(4,x),a
 321                     ; 521 }
 322  011f 81            	ret	
 324                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 324                     ; 567 {
 325  0120               _USART_HalfDuplexCmd:
 326       fffffffe      OFST: set -2
 328                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
 329                     ; 570   if (NewState != DISABLE)
 330  0120 7b03          	ld	a,(OFST+5,sp)
 331  0122 2706          	jreq	L71
 332                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
 333  0124 e608          	ld	a,(8,x)
 334  0126 aa08          	or	a,#8
 336  0128 2004          	jra	L12
 337  012a               L71:
 338                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
 339  012a e608          	ld	a,(8,x)
 340  012c a4f7          	and	a,#247
 341  012e               L12:
 342  012e e708          	ld	(8,x),a
 343                     ; 578 }
 344  0130 81            	ret	
 346                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 346                     ; 645 {
 347  0131               _USART_SmartCardCmd:
 348       fffffffe      OFST: set -2
 350                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
 351                     ; 648   if (NewState != DISABLE)
 352  0131 7b03          	ld	a,(OFST+5,sp)
 353  0133 2706          	jreq	L32
 354                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
 355  0135 e608          	ld	a,(8,x)
 356  0137 aa20          	or	a,#32
 358  0139 2004          	jra	L52
 359  013b               L32:
 360                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
 361  013b e608          	ld	a,(8,x)
 362  013d a4df          	and	a,#223
 363  013f               L52:
 364  013f e708          	ld	(8,x),a
 365                     ; 658 }
 366  0141 81            	ret	
 368                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 368                     ; 668 {
 369  0142               _USART_SmartCardNACKCmd:
 370       fffffffe      OFST: set -2
 372                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
 373                     ; 671   if (NewState != DISABLE)
 374  0142 7b03          	ld	a,(OFST+5,sp)
 375  0144 2706          	jreq	L72
 376                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
 377  0146 e608          	ld	a,(8,x)
 378  0148 aa10          	or	a,#16
 380  014a 2004          	jra	L13
 381  014c               L72:
 382                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
 383  014c e608          	ld	a,(8,x)
 384  014e a4ef          	and	a,#239
 385  0150               L13:
 386  0150 e708          	ld	(8,x),a
 387                     ; 681 }
 388  0152 81            	ret	
 390                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
 390                     ; 691 {
 391  0153               _USART_SetGuardTime:
 392       fffffffe      OFST: set -2
 394                     ; 693   USARTx->GTR = USART_GuardTime;
 395  0153 7b03          	ld	a,(OFST+5,sp)
 396  0155 e709          	ld	(9,x),a
 397                     ; 694 }
 398  0157 81            	ret	
 400                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
 400                     ; 752 {
 401  0158               _USART_IrDAConfig:
 402       fffffffe      OFST: set -2
 404                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
 405                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
 406  0158 7b03          	ld	a,(OFST+5,sp)
 407  015a 2706          	jreq	L33
 408                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
 409  015c e608          	ld	a,(8,x)
 410  015e aa04          	or	a,#4
 412  0160 2004          	jra	L53
 413  0162               L33:
 414                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
 415  0162 e608          	ld	a,(8,x)
 416  0164 a4fb          	and	a,#251
 417  0166               L53:
 418  0166 e708          	ld	(8,x),a
 419                     ; 763 }
 420  0168 81            	ret	
 422                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
 422                     ; 773 {
 423  0169               _USART_IrDACmd:
 424       fffffffe      OFST: set -2
 426                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
 427                     ; 778   if (NewState != DISABLE)
 428  0169 7b03          	ld	a,(OFST+5,sp)
 429  016b 2706          	jreq	L73
 430                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
 431  016d e608          	ld	a,(8,x)
 432  016f aa02          	or	a,#2
 434  0171 2004          	jra	L14
 435  0173               L73:
 436                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
 437  0173 e608          	ld	a,(8,x)
 438  0175 a4fd          	and	a,#253
 439  0177               L14:
 440  0177 e708          	ld	(8,x),a
 441                     ; 788 }
 442  0179 81            	ret	
 444                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
 444                     ; 819                   FunctionalState NewState)
 444                     ; 820 {
 445  017a               _USART_DMACmd:
 446       fffffffe      OFST: set -2
 448                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
 449                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
 450                     ; 825   if (NewState != DISABLE)
 451  017a 7b04          	ld	a,(OFST+6,sp)
 452  017c 2706          	jreq	L34
 453                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
 454  017e e608          	ld	a,(8,x)
 455  0180 1a03          	or	a,(OFST+5,sp)
 457  0182 2005          	jra	L54
 458  0184               L34:
 459                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
 460  0184 7b03          	ld	a,(OFST+5,sp)
 461  0186 43            	cpl	a
 462  0187 e408          	and	a,(8,x)
 463  0189               L54:
 464  0189 e708          	ld	(8,x),a
 465                     ; 837 }
 466  018b 81            	ret	
 468                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
 468                     ; 940 {
 469  018c               _USART_ITConfig:
 470  018c 89            	pushw	x
 471  018d 89            	pushw	x
 472       00000002      OFST:	set	2
 474                     ; 941   uint8_t usartreg, itpos = 0x00;
 475                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
 476                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
 477                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
 478  018e 7b07          	ld	a,(OFST+5,sp)
 479  0190 6b01          	ld	(OFST-1,sp),a
 480                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 481  0192 7b08          	ld	a,(OFST+6,sp)
 482  0194 a40f          	and	a,#15
 483  0196 5f            	clrw	x
 484  0197 97            	ld	xl,a
 485  0198 a601          	ld	a,#1
 486  019a 5d            	tnzw	x
 487  019b 2704          	jreq	L65
 488  019d               L06:
 489  019d 48            	sll	a
 490  019e 5a            	decw	x
 491  019f 26fc          	jrne	L06
 492  01a1               L65:
 493  01a1 6b02          	ld	(OFST+0,sp),a
 494                     ; 950   if (NewState != DISABLE)
 495  01a3 7b09          	ld	a,(OFST+7,sp)
 496  01a5 2722          	jreq	L74
 497                     ; 953     if (usartreg == 0x01)
 498  01a7 7b01          	ld	a,(OFST-1,sp)
 499  01a9 a101          	cp	a,#1
 500  01ab 2608          	jrne	L15
 501                     ; 955       USARTx->CR1 |= itpos;
 502  01ad 1e03          	ldw	x,(OFST+1,sp)
 503  01af e604          	ld	a,(4,x)
 504  01b1 1a02          	or	a,(OFST+0,sp)
 506  01b3 2021          	jp	LC002
 507  01b5               L15:
 508                     ; 957     else if (usartreg == 0x05)
 509  01b5 a105          	cp	a,#5
 510  01b7 2608          	jrne	L55
 511                     ; 959       USARTx->CR5 |= itpos;
 512  01b9 1e03          	ldw	x,(OFST+1,sp)
 513  01bb e608          	ld	a,(8,x)
 514  01bd 1a02          	or	a,(OFST+0,sp)
 516  01bf 2024          	jp	LC003
 517  01c1               L55:
 518                     ; 964       USARTx->CR2 |= itpos;
 519  01c1 1e03          	ldw	x,(OFST+1,sp)
 520  01c3 e605          	ld	a,(5,x)
 521  01c5 1a02          	or	a,(OFST+0,sp)
 522  01c7 2027          	jp	LC001
 523  01c9               L74:
 524                     ; 970     if (usartreg == 0x01)
 525  01c9 7b01          	ld	a,(OFST-1,sp)
 526  01cb a101          	cp	a,#1
 527  01cd 260b          	jrne	L36
 528                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
 529  01cf 1e03          	ldw	x,(OFST+1,sp)
 530  01d1 7b02          	ld	a,(OFST+0,sp)
 531  01d3 43            	cpl	a
 532  01d4 e404          	and	a,(4,x)
 533  01d6               LC002:
 534  01d6 e704          	ld	(4,x),a
 536  01d8 2018          	jra	L16
 537  01da               L36:
 538                     ; 974     else if (usartreg == 0x05)
 539  01da a105          	cp	a,#5
 540  01dc 260b          	jrne	L76
 541                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
 542  01de 1e03          	ldw	x,(OFST+1,sp)
 543  01e0 7b02          	ld	a,(OFST+0,sp)
 544  01e2 43            	cpl	a
 545  01e3 e408          	and	a,(8,x)
 546  01e5               LC003:
 547  01e5 e708          	ld	(8,x),a
 549  01e7 2009          	jra	L16
 550  01e9               L76:
 551                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
 552  01e9 1e03          	ldw	x,(OFST+1,sp)
 553  01eb 7b02          	ld	a,(OFST+0,sp)
 554  01ed 43            	cpl	a
 555  01ee e405          	and	a,(5,x)
 556  01f0               LC001:
 557  01f0 e705          	ld	(5,x),a
 558  01f2               L16:
 559                     ; 984 }
 560  01f2 5b04          	addw	sp,#4
 561  01f4 81            	ret	
 563                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
 563                     ; 1003 {
 564  01f5               _USART_GetFlagStatus:
 565  01f5 89            	pushw	x
 566  01f6 88            	push	a
 567       00000001      OFST:	set	1
 569                     ; 1004   FlagStatus status = RESET;
 570                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
 571                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
 572  01f7 1e06          	ldw	x,(OFST+5,sp)
 573  01f9 a30101        	cpw	x,#257
 574  01fc 260a          	jrne	L37
 575                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
 576  01fe 1e02          	ldw	x,(OFST+1,sp)
 577  0200 e605          	ld	a,(5,x)
 578  0202 1507          	bcp	a,(OFST+6,sp)
 579  0204 270d          	jreq	L301
 580                     ; 1014       status = SET;
 582  0206 2007          	jp	LC005
 583                     ; 1019       status = RESET;
 584  0208               L37:
 585                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
 586  0208 1e02          	ldw	x,(OFST+1,sp)
 587  020a f6            	ld	a,(x)
 588  020b 1507          	bcp	a,(OFST+6,sp)
 589  020d 2704          	jreq	L301
 590                     ; 1027       status = SET;
 591  020f               LC005:
 592  020f a601          	ld	a,#1
 594  0211 2001          	jra	L101
 595  0213               L301:
 596                     ; 1032       status = RESET;
 597  0213 4f            	clr	a
 598  0214               L101:
 599                     ; 1036   return status;
 601  0214 5b03          	addw	sp,#3
 602  0216 81            	ret	
 604                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
 604                     ; 1061 {
 605  0217               _USART_ClearFlag:
 606       fffffffe      OFST: set -2
 608                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
 609                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
 610  0217 7b04          	ld	a,(OFST+6,sp)
 611  0219 43            	cpl	a
 612  021a f7            	ld	(x),a
 613                     ; 1066 }
 614  021b 81            	ret	
 616                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
 616                     ; 1084 {
 617  021c               _USART_GetITStatus:
 618  021c 89            	pushw	x
 619  021d 5203          	subw	sp,#3
 620       00000003      OFST:	set	3
 622                     ; 1085   ITStatus pendingbitstatus = RESET;
 623                     ; 1086   uint8_t temp = 0;
 624                     ; 1087   uint8_t itpos = 0;
 625                     ; 1088   uint8_t itmask1 = 0;
 626                     ; 1089   uint8_t itmask2 = 0;
 627                     ; 1090   uint8_t enablestatus = 0;
 628                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
 629                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 630  021f 7b09          	ld	a,(OFST+6,sp)
 631  0221 a40f          	and	a,#15
 632  0223 5f            	clrw	x
 633  0224 97            	ld	xl,a
 634  0225 a601          	ld	a,#1
 635  0227 5d            	tnzw	x
 636  0228 2704          	jreq	L07
 637  022a               L27:
 638  022a 48            	sll	a
 639  022b 5a            	decw	x
 640  022c 26fc          	jrne	L27
 641  022e               L07:
 642  022e 6b02          	ld	(OFST-1,sp),a
 643                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
 644  0230 7b09          	ld	a,(OFST+6,sp)
 645  0232 4e            	swap	a
 646  0233 a40f          	and	a,#15
 647  0235 6b03          	ld	(OFST+0,sp),a
 648                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
 649  0237 5f            	clrw	x
 650  0238 97            	ld	xl,a
 651  0239 a601          	ld	a,#1
 652  023b 5d            	tnzw	x
 653  023c 2704          	jreq	L47
 654  023e               L67:
 655  023e 48            	sll	a
 656  023f 5a            	decw	x
 657  0240 26fc          	jrne	L67
 658  0242               L47:
 659  0242 6b03          	ld	(OFST+0,sp),a
 660                     ; 1103   if (USART_IT == USART_IT_PE)
 661  0244 1e08          	ldw	x,(OFST+5,sp)
 662  0246 a30100        	cpw	x,#256
 663  0249 2611          	jrne	L701
 664                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
 665  024b 1e04          	ldw	x,(OFST+1,sp)
 666  024d e604          	ld	a,(4,x)
 667  024f 1403          	and	a,(OFST+0,sp)
 668  0251 6b03          	ld	(OFST+0,sp),a
 669                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
 670  0253 f6            	ld	a,(x)
 671  0254 1502          	bcp	a,(OFST-1,sp)
 672  0256 2739          	jreq	L131
 674  0258 7b03          	ld	a,(OFST+0,sp)
 675                     ; 1112       pendingbitstatus = SET;
 677  025a 201e          	jp	LC008
 678                     ; 1117       pendingbitstatus = RESET;
 679  025c               L701:
 680                     ; 1121   else if (USART_IT == USART_IT_OR)
 681  025c a30235        	cpw	x,#565
 682  025f 261f          	jrne	L711
 683                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
 684  0261 1e04          	ldw	x,(OFST+1,sp)
 685  0263 e605          	ld	a,(5,x)
 686  0265 1403          	and	a,(OFST+0,sp)
 687  0267 6b03          	ld	(OFST+0,sp),a
 688                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
 689  0269 e608          	ld	a,(8,x)
 690  026b a401          	and	a,#1
 691  026d 6b01          	ld	(OFST-2,sp),a
 692                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
 693  026f f6            	ld	a,(x)
 694  0270 1502          	bcp	a,(OFST-1,sp)
 695  0272 271d          	jreq	L131
 697  0274 7b03          	ld	a,(OFST+0,sp)
 698  0276 2604          	jrne	L321
 700  0278 7b01          	ld	a,(OFST-2,sp)
 701  027a               LC008:
 702  027a 2715          	jreq	L131
 703  027c               L321:
 704                     ; 1132       pendingbitstatus = SET;
 705  027c a601          	ld	a,#1
 707  027e 2012          	jra	L511
 708                     ; 1137       pendingbitstatus = RESET;
 709  0280               L711:
 710                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
 711  0280 1e04          	ldw	x,(OFST+1,sp)
 712  0282 e605          	ld	a,(5,x)
 713  0284 1403          	and	a,(OFST+0,sp)
 714  0286 6b03          	ld	(OFST+0,sp),a
 715                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
 716  0288 f6            	ld	a,(x)
 717  0289 1502          	bcp	a,(OFST-1,sp)
 718  028b 2704          	jreq	L131
 720  028d 7b03          	ld	a,(OFST+0,sp)
 721                     ; 1149       pendingbitstatus = SET;
 723  028f 26eb          	jrne	L321
 724  0291               L131:
 725                     ; 1154       pendingbitstatus = RESET;
 726  0291 4f            	clr	a
 727  0292               L511:
 728                     ; 1159   return  pendingbitstatus;
 730  0292 5b05          	addw	sp,#5
 731  0294 81            	ret	
 733                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
 733                     ; 1184 {
 734  0295               _USART_ClearITPendingBit:
 736                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
 737                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
 738  0295 f6            	ld	a,(x)
 739  0296 a4bf          	and	a,#191
 740  0298 f7            	ld	(x),a
 741                     ; 1189 }
 742  0299 81            	ret	
 744                     	xdef	_USART_ClearITPendingBit
 745                     	xdef	_USART_GetITStatus
 746                     	xdef	_USART_ClearFlag
 747                     	xdef	_USART_GetFlagStatus
 748                     	xdef	_USART_ITConfig
 749                     	xdef	_USART_DMACmd
 750                     	xdef	_USART_IrDACmd
 751                     	xdef	_USART_IrDAConfig
 752                     	xdef	_USART_SetGuardTime
 753                     	xdef	_USART_SmartCardNACKCmd
 754                     	xdef	_USART_SmartCardCmd
 755                     	xdef	_USART_HalfDuplexCmd
 756                     	xdef	_USART_SetAddress
 757                     	xdef	_USART_ReceiverWakeUpCmd
 758                     	xdef	_USART_WakeUpConfig
 759                     	xdef	_USART_ReceiveData9
 760                     	xdef	_USART_ReceiveData8
 761                     	xdef	_USART_SendData9
 762                     	xdef	_USART_SendData8
 763                     	xdef	_USART_SendBreak
 764                     	xdef	_USART_SetPrescaler
 765                     	xdef	_USART_Cmd
 766                     	xdef	_USART_ClockInit
 767                     	xdef	_USART_Init
 768                     	xdef	_USART_DeInit
 769                     	xref	_CLK_GetClockFreq
 770                     	xref.b	c_lreg
 771                     	xref.b	c_x
 772                     	xref	c_lursh
 773                     	xref	c_ltor
 774                     	xref	c_rtol
 775                     	xref	c_ludv
 776                     	end
