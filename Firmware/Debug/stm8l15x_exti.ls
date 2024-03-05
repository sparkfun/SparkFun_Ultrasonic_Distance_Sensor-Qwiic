   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 123 void EXTI_DeInit(void)
  18                     ; 124 {
  19                     	scross	off
  20  0000               _EXTI_DeInit:
  22                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  23  0000 725f50a0      	clr	20640
  24                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  25  0004 725f50a1      	clr	20641
  26                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  27  0008 725f50a2      	clr	20642
  28                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  29  000c 725f50aa      	clr	20650
  30                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  31  0010 35ff50a3      	mov	20643,#255
  32                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  33  0014 35ff50a4      	mov	20644,#255
  34                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  35  0018 725f50a5      	clr	20645
  36                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  37  001c 725f50ab      	clr	20651
  38                     ; 133 }
  39  0020 81            	ret	
  41                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
  41                     ; 161 {
  42  0021               _EXTI_SetPinSensitivity:
  43  0021 89            	pushw	x
  44       00000000      OFST:	set	0
  46                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
  47                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
  48                     ; 168   switch (EXTI_Pin)
  49  0022 9e            	ld	a,xh
  51                     ; 202     default:
  51                     ; 203       break;
  52  0023 4d            	tnz	a
  53  0024 2728          	jreq	L3
  54  0026 a002          	sub	a,#2
  55  0028 273b          	jreq	L5
  56  002a a002          	sub	a,#2
  57  002c 274e          	jreq	L7
  58  002e a002          	sub	a,#2
  59  0030 2761          	jreq	L11
  60  0032 a00a          	sub	a,#10
  61  0034 277a          	jreq	L31
  62  0036 a002          	sub	a,#2
  63  0038 2603cc00c7    	jreq	L51
  64  003d a002          	sub	a,#2
  65  003f 2603cc00de    	jreq	L71
  66  0044 a002          	sub	a,#2
  67  0046 2603cc00f5    	jreq	L12
  68  004b cc0110        	jra	L72
  69  004e               L3:
  70                     ; 170     case EXTI_Pin_0:
  70                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
  71  004e c650a0        	ld	a,20640
  72  0051 a4fc          	and	a,#252
  73  0053 c750a0        	ld	20640,a
  74                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
  75  0056 7b01          	ld	a,(OFST+1,sp)
  76  0058 5f            	clrw	x
  77  0059 97            	ld	xl,a
  78  005a 7b02          	ld	a,(OFST+2,sp)
  79  005c 5d            	tnzw	x
  80  005d 2749          	jreq	L22
  81  005f               L01:
  82  005f 48            	sll	a
  83  0060 5a            	decw	x
  84  0061 26fc          	jrne	L01
  85                     ; 173       break;
  86  0063 2043          	jp	L22
  87  0065               L5:
  88                     ; 174     case EXTI_Pin_1:
  88                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
  89  0065 c650a0        	ld	a,20640
  90  0068 a4f3          	and	a,#243
  91  006a c750a0        	ld	20640,a
  92                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
  93  006d 7b01          	ld	a,(OFST+1,sp)
  94  006f 5f            	clrw	x
  95  0070 97            	ld	xl,a
  96  0071 7b02          	ld	a,(OFST+2,sp)
  97  0073 5d            	tnzw	x
  98  0074 2732          	jreq	L22
  99  0076               L41:
 100  0076 48            	sll	a
 101  0077 5a            	decw	x
 102  0078 26fc          	jrne	L41
 103                     ; 177       break;
 104  007a 202c          	jp	L22
 105  007c               L7:
 106                     ; 178     case EXTI_Pin_2:
 106                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 107  007c c650a0        	ld	a,20640
 108  007f a4cf          	and	a,#207
 109  0081 c750a0        	ld	20640,a
 110                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 111  0084 7b01          	ld	a,(OFST+1,sp)
 112  0086 5f            	clrw	x
 113  0087 97            	ld	xl,a
 114  0088 7b02          	ld	a,(OFST+2,sp)
 115  008a 5d            	tnzw	x
 116  008b 271b          	jreq	L22
 117  008d               L02:
 118  008d 48            	sll	a
 119  008e 5a            	decw	x
 120  008f 26fc          	jrne	L02
 121                     ; 181       break;
 122  0091 2015          	jp	L22
 123  0093               L11:
 124                     ; 182     case EXTI_Pin_3:
 124                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 125  0093 c650a0        	ld	a,20640
 126  0096 a43f          	and	a,#63
 127  0098 c750a0        	ld	20640,a
 128                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 129  009b 7b01          	ld	a,(OFST+1,sp)
 130  009d 5f            	clrw	x
 131  009e 97            	ld	xl,a
 132  009f 7b02          	ld	a,(OFST+2,sp)
 133  00a1 5d            	tnzw	x
 134  00a2 2704          	jreq	L22
 135  00a4               L42:
 136  00a4 48            	sll	a
 137  00a5 5a            	decw	x
 138  00a6 26fc          	jrne	L42
 139  00a8               L22:
 140  00a8 ca50a0        	or	a,20640
 141  00ab c750a0        	ld	20640,a
 142                     ; 185       break;
 143  00ae 2060          	jra	L72
 144  00b0               L31:
 145                     ; 186     case EXTI_Pin_4:
 145                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 146  00b0 c650a1        	ld	a,20641
 147  00b3 a4fc          	and	a,#252
 148  00b5 c750a1        	ld	20641,a
 149                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 150  00b8 7b01          	ld	a,(OFST+1,sp)
 151  00ba ad56          	call	LC003
 152  00bc 7b02          	ld	a,(OFST+2,sp)
 153  00be 5d            	tnzw	x
 154  00bf 2749          	jreq	L24
 155  00c1               L03:
 156  00c1 48            	sll	a
 157  00c2 5a            	decw	x
 158  00c3 26fc          	jrne	L03
 159                     ; 189       break;
 160  00c5 2043          	jp	L24
 161  00c7               L51:
 162                     ; 190     case EXTI_Pin_5:
 162                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 163  00c7 c650a1        	ld	a,20641
 164  00ca a4f3          	and	a,#243
 165  00cc c750a1        	ld	20641,a
 166                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 167  00cf 7b01          	ld	a,(OFST+1,sp)
 168  00d1 ad3f          	call	LC003
 169  00d3 7b02          	ld	a,(OFST+2,sp)
 170  00d5 5d            	tnzw	x
 171  00d6 2732          	jreq	L24
 172  00d8               L43:
 173  00d8 48            	sll	a
 174  00d9 5a            	decw	x
 175  00da 26fc          	jrne	L43
 176                     ; 193       break;
 177  00dc 202c          	jp	L24
 178  00de               L71:
 179                     ; 194     case EXTI_Pin_6:
 179                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 180  00de c650a1        	ld	a,20641
 181  00e1 a4cf          	and	a,#207
 182  00e3 c750a1        	ld	20641,a
 183                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 184  00e6 7b01          	ld	a,(OFST+1,sp)
 185  00e8 ad28          	call	LC003
 186  00ea 7b02          	ld	a,(OFST+2,sp)
 187  00ec 5d            	tnzw	x
 188  00ed 271b          	jreq	L24
 189  00ef               L04:
 190  00ef 48            	sll	a
 191  00f0 5a            	decw	x
 192  00f1 26fc          	jrne	L04
 193                     ; 197       break;
 194  00f3 2015          	jp	L24
 195  00f5               L12:
 196                     ; 198     case EXTI_Pin_7:
 196                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 197  00f5 c650a1        	ld	a,20641
 198  00f8 a43f          	and	a,#63
 199  00fa c750a1        	ld	20641,a
 200                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 201  00fd 7b01          	ld	a,(OFST+1,sp)
 202  00ff ad11          	call	LC003
 203  0101 7b02          	ld	a,(OFST+2,sp)
 204  0103 5d            	tnzw	x
 205  0104 2704          	jreq	L24
 206  0106               L44:
 207  0106 48            	sll	a
 208  0107 5a            	decw	x
 209  0108 26fc          	jrne	L44
 210  010a               L24:
 211  010a ca50a1        	or	a,20641
 212  010d c750a1        	ld	20641,a
 213                     ; 201       break;
 214                     ; 202     default:
 214                     ; 203       break;
 215  0110               L72:
 216                     ; 205 }
 217  0110 85            	popw	x
 218  0111 81            	ret	
 219  0112               LC003:
 220  0112 a4ef          	and	a,#239
 221  0114 5f            	clrw	x
 222  0115 97            	ld	xl,a
 223  0116 81            	ret	
 225                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 225                     ; 220 {
 226  0117               _EXTI_SelectPort:
 227       00000000      OFST:	set	0
 229                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 230                     ; 224   if (EXTI_Port == EXTI_Port_B)
 231  0117 4d            	tnz	a
 232  0118 2605          	jrne	L13
 233                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 234  011a 721b50ab      	bres	20651,#5
 236  011e 81            	ret	
 237  011f               L13:
 238                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 239  011f a102          	cp	a,#2
 240  0121 2605          	jrne	L53
 241                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 242  0123 721d50ab      	bres	20651,#6
 244  0127 81            	ret	
 245  0128               L53:
 246                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 247  0128 a104          	cp	a,#4
 248  012a 2605          	jrne	L14
 249                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 250  012c 721f50a5      	bres	20645,#7
 252  0130 81            	ret	
 253  0131               L14:
 254                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 255  0131 a106          	cp	a,#6
 256  0133 2605          	jrne	L54
 257                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 258  0135 721e50a5      	bset	20645,#7
 260  0139 81            	ret	
 261  013a               L54:
 262                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 263  013a a110          	cp	a,#16
 264  013c 2605          	jrne	L15
 265                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 266  013e 721a50ab      	bset	20651,#5
 268  0142 81            	ret	
 269  0143               L15:
 270                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 271  0143 721c50ab      	bset	20651,#6
 272                     ; 254 }
 273  0147 81            	ret	
 275                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 275                     ; 281                                FunctionalState NewState)
 275                     ; 282 {
 276  0148               _EXTI_SetHalfPortSelection:
 277  0148 89            	pushw	x
 278       00000000      OFST:	set	0
 280                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 281                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 282                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 283  0149 9e            	ld	a,xh
 284  014a a580          	bcp	a,#128
 285  014c 2616          	jrne	L55
 286                     ; 289     if (NewState != DISABLE)
 287  014e 7b02          	ld	a,(OFST+2,sp)
 288  0150 2707          	jreq	L75
 289                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 290  0152 c650a5        	ld	a,20645
 291  0155 1a01          	or	a,(OFST+1,sp)
 293  0157 2006          	jp	LC005
 294  0159               L75:
 295                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 296  0159 7b01          	ld	a,(OFST+1,sp)
 297  015b 43            	cpl	a
 298  015c c450a5        	and	a,20645
 299  015f               LC005:
 300  015f c750a5        	ld	20645,a
 301  0162 2018          	jra	L36
 302  0164               L55:
 303                     ; 302     if (NewState != DISABLE)
 304  0164 7b02          	ld	a,(OFST+2,sp)
 305  0166 2709          	jreq	L56
 306                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 307  0168 7b01          	ld	a,(OFST+1,sp)
 308  016a a47f          	and	a,#127
 309  016c ca50ab        	or	a,20651
 311  016f 2008          	jp	LC004
 312  0171               L56:
 313                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 314  0171 7b01          	ld	a,(OFST+1,sp)
 315  0173 a47f          	and	a,#127
 316  0175 43            	cpl	a
 317  0176 c450ab        	and	a,20651
 318  0179               LC004:
 319  0179 c750ab        	ld	20651,a
 320  017c               L36:
 321                     ; 313 }
 322  017c 85            	popw	x
 323  017d 81            	ret	
 325                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 325                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 325                     ; 340 {
 326  017e               _EXTI_SetPortSensitivity:
 327  017e 89            	pushw	x
 328       00000000      OFST:	set	0
 330                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 331                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 332                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 333  017f 9e            	ld	a,xh
 334  0180 a5f0          	bcp	a,#240
 335  0182 2629          	jrne	L17
 336                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 337  0184 7b01          	ld	a,(OFST+1,sp)
 338  0186 5f            	clrw	x
 339  0187 97            	ld	xl,a
 340  0188 a603          	ld	a,#3
 341  018a 5d            	tnzw	x
 342  018b 2704          	jreq	L45
 343  018d               L65:
 344  018d 48            	sll	a
 345  018e 5a            	decw	x
 346  018f 26fc          	jrne	L65
 347  0191               L45:
 348  0191 43            	cpl	a
 349  0192 c450a2        	and	a,20642
 350  0195 c750a2        	ld	20642,a
 351                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 352  0198 7b01          	ld	a,(OFST+1,sp)
 353  019a 5f            	clrw	x
 354  019b 97            	ld	xl,a
 355  019c 7b02          	ld	a,(OFST+2,sp)
 356  019e 5d            	tnzw	x
 357  019f 2704          	jreq	L06
 358  01a1               L26:
 359  01a1 48            	sll	a
 360  01a2 5a            	decw	x
 361  01a3 26fc          	jrne	L26
 362  01a5               L06:
 363  01a5 ca50a2        	or	a,20642
 364  01a8 c750a2        	ld	20642,a
 366  01ab 202b          	jra	L37
 367  01ad               L17:
 368                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 369  01ad 7b01          	ld	a,(OFST+1,sp)
 370  01af a40f          	and	a,#15
 371  01b1 5f            	clrw	x
 372  01b2 97            	ld	xl,a
 373  01b3 a603          	ld	a,#3
 374  01b5 5d            	tnzw	x
 375  01b6 2704          	jreq	L46
 376  01b8               L66:
 377  01b8 48            	sll	a
 378  01b9 5a            	decw	x
 379  01ba 26fc          	jrne	L66
 380  01bc               L46:
 381  01bc 43            	cpl	a
 382  01bd c450aa        	and	a,20650
 383  01c0 c750aa        	ld	20650,a
 384                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 385  01c3 7b01          	ld	a,(OFST+1,sp)
 386  01c5 a40f          	and	a,#15
 387  01c7 5f            	clrw	x
 388  01c8 97            	ld	xl,a
 389  01c9 7b02          	ld	a,(OFST+2,sp)
 390  01cb 5d            	tnzw	x
 391  01cc 2704          	jreq	L07
 392  01ce               L27:
 393  01ce 48            	sll	a
 394  01cf 5a            	decw	x
 395  01d0 26fc          	jrne	L27
 396  01d2               L07:
 397  01d2 ca50aa        	or	a,20650
 398  01d5 c750aa        	ld	20650,a
 399  01d8               L37:
 400                     ; 360 }
 401  01d8 85            	popw	x
 402  01d9 81            	ret	
 404                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
 404                     ; 377 {
 405  01da               _EXTI_GetPinSensitivity:
 406  01da 88            	push	a
 407       00000001      OFST:	set	1
 409                     ; 378   uint8_t value = 0;
 410  01db 0f01          	clr	(OFST+0,sp)
 411                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 412                     ; 383   switch (EXTI_Pin)
 414                     ; 409     default:
 414                     ; 410       break;
 415  01dd 4d            	tnz	a
 416  01de 2720          	jreq	L57
 417  01e0 a002          	sub	a,#2
 418  01e2 2721          	jreq	L77
 419  01e4 a002          	sub	a,#2
 420  01e6 2722          	jreq	L101
 421  01e8 a002          	sub	a,#2
 422  01ea 2724          	jreq	L301
 423  01ec a00a          	sub	a,#10
 424  01ee 2725          	jreq	L501
 425  01f0 a002          	sub	a,#2
 426  01f2 2726          	jreq	L701
 427  01f4 a002          	sub	a,#2
 428  01f6 272b          	jreq	L111
 429  01f8 a002          	sub	a,#2
 430  01fa 272d          	jreq	L311
 431  01fc 7b01          	ld	a,(OFST+0,sp)
 432  01fe 2033          	jra	LC006
 433  0200               L57:
 434                     ; 385     case EXTI_Pin_0:
 434                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 435  0200 c650a0        	ld	a,20640
 436                     ; 387       break;
 437  0203 202c          	jp	LC007
 438  0205               L77:
 439                     ; 388     case EXTI_Pin_1:
 439                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
 440  0205 c650a0        	ld	a,20640
 441                     ; 390       break;
 442  0208 2013          	jp	LC009
 443  020a               L101:
 444                     ; 391     case EXTI_Pin_2:
 444                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
 445  020a c650a0        	ld	a,20640
 446  020d 4e            	swap	a
 447                     ; 393       break;
 448  020e 2021          	jp	LC007
 449  0210               L301:
 450                     ; 394     case EXTI_Pin_3:
 450                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
 451  0210 c650a0        	ld	a,20640
 452                     ; 396       break;
 453  0213 2017          	jp	LC008
 454  0215               L501:
 455                     ; 397     case EXTI_Pin_4:
 455                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 456  0215 c650a1        	ld	a,20641
 457                     ; 399       break;
 458  0218 2017          	jp	LC007
 459  021a               L701:
 460                     ; 400     case EXTI_Pin_5:
 460                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 461  021a c650a1        	ld	a,20641
 462  021d               LC009:
 463  021d a40c          	and	a,#12
 464  021f 44            	srl	a
 465  0220 44            	srl	a
 466                     ; 402       break;
 467  0221 2010          	jp	LC006
 468  0223               L111:
 469                     ; 403     case EXTI_Pin_6:
 469                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 470  0223 c650a1        	ld	a,20641
 471  0226 4e            	swap	a
 472                     ; 405       break;
 473  0227 2008          	jp	LC007
 474  0229               L311:
 475                     ; 406     case EXTI_Pin_7:
 475                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 476  0229 c650a1        	ld	a,20641
 477  022c               LC008:
 478  022c 4e            	swap	a
 479  022d a40c          	and	a,#12
 480  022f 44            	srl	a
 481  0230 44            	srl	a
 482  0231               LC007:
 483  0231 a403          	and	a,#3
 484  0233               LC006:
 485                     ; 408       break;
 486                     ; 409     default:
 486                     ; 410       break;
 487                     ; 412   return((EXTI_Trigger_TypeDef)value);
 489  0233 5b01          	addw	sp,#1
 490  0235 81            	ret	
 492                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 492                     ; 428 {
 493  0236               _EXTI_GetPortSensitivity:
 494       00000001      OFST:	set	1
 496                     ; 429   uint8_t portsensitivity = 0;
 497                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
 498                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
 499  0236 a5f0          	bcp	a,#240
 500  0238 260e          	jrne	L321
 501                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
 502  023a 5f            	clrw	x
 503  023b 97            	ld	xl,a
 504  023c c650a2        	ld	a,20642
 505  023f 5d            	tnzw	x
 506  0240 2714          	jreq	L401
 507  0242               L201:
 508  0242 44            	srl	a
 509  0243 5a            	decw	x
 510  0244 26fc          	jrne	L201
 512  0246 200e          	jra	L401
 513  0248               L321:
 514                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
 515  0248 a40f          	and	a,#15
 516  024a 5f            	clrw	x
 517  024b 97            	ld	xl,a
 518  024c c650aa        	ld	a,20650
 519  024f 5d            	tnzw	x
 520  0250 2704          	jreq	L401
 521  0252               L601:
 522  0252 44            	srl	a
 523  0253 5a            	decw	x
 524  0254 26fc          	jrne	L601
 525  0256               L401:
 526  0256 a403          	and	a,#3
 527                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
 529  0258 81            	ret	
 531                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
 531                     ; 488 {
 532  0259               _EXTI_GetITStatus:
 533  0259 89            	pushw	x
 534  025a 88            	push	a
 535       00000001      OFST:	set	1
 537                     ; 489   ITStatus status = RESET;
 538                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
 539                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
 540  025b 01            	rrwa	x,a
 541  025c 4f            	clr	a
 542  025d 02            	rlwa	x,a
 543  025e a30100        	cpw	x,#256
 544  0261 2607          	jrne	L721
 545                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
 546  0263 7b03          	ld	a,(OFST+2,sp)
 547  0265 c450a4        	and	a,20644
 549  0268 2005          	jra	L131
 550  026a               L721:
 551                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
 552  026a 7b03          	ld	a,(OFST+2,sp)
 553  026c c450a3        	and	a,20643
 554  026f               L131:
 555                     ; 501   return((ITStatus)status);
 557  026f 5b03          	addw	sp,#3
 558  0271 81            	ret	
 560                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
 560                     ; 525 {
 561  0272               _EXTI_ClearITPendingBit:
 562  0272 89            	pushw	x
 563  0273 89            	pushw	x
 564       00000002      OFST:	set	2
 566                     ; 526   uint16_t tempvalue = 0;
 567                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
 568                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
 569  0274 01            	rrwa	x,a
 570  0275 4f            	clr	a
 571  0276 02            	rlwa	x,a
 572  0277 1f01          	ldw	(OFST-1,sp),x
 573                     ; 533   if ( tempvalue == 0x0100)
 574  0279 a30100        	cpw	x,#256
 575  027c 2607          	jrne	L331
 576                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
 577  027e 7b04          	ld	a,(OFST+2,sp)
 578  0280 c750a4        	ld	20644,a
 580  0283 2005          	jra	L531
 581  0285               L331:
 582                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
 583  0285 7b04          	ld	a,(OFST+2,sp)
 584  0287 c750a3        	ld	20643,a
 585  028a               L531:
 586                     ; 541 }
 587  028a 5b04          	addw	sp,#4
 588  028c 81            	ret	
 590                     	xdef	_EXTI_ClearITPendingBit
 591                     	xdef	_EXTI_GetITStatus
 592                     	xdef	_EXTI_GetPortSensitivity
 593                     	xdef	_EXTI_GetPinSensitivity
 594                     	xdef	_EXTI_SetPortSensitivity
 595                     	xdef	_EXTI_SetHalfPortSelection
 596                     	xdef	_EXTI_SelectPort
 597                     	xdef	_EXTI_SetPinSensitivity
 598                     	xdef	_EXTI_DeInit
 599                     	end
