   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     .const:	section	.text
  19  0000               _SYSDivFactor:
  20  0000 01            	dc.b	1
  21  0001 02            	dc.b	2
  22  0002 04            	dc.b	4
  23  0003 08            	dc.b	8
  24  0004 10            	dc.b	16
  25                     ; 120 void CLK_DeInit(void)
  25                     ; 121 {
  26                     	scross	off
  27                     	switch	.text
  28  0000               _CLK_DeInit:
  30                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  31  0000 351150c2      	mov	20674,#17
  32                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  33  0004 725f50c6      	clr	20678
  34                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  35  0008 725f50c1      	clr	20673
  36                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  37  000c 725f50cb      	clr	20683
  38                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  39  0010 350150c8      	mov	20680,#1
  40                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  41  0014 725f50c9      	clr	20681
  42                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  43  0018 350350c0      	mov	20672,#3
  44                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  45  001c 725f50c3      	clr	20675
  46                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  47  0020 358050c4      	mov	20676,#128
  48                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  49  0024 725f50d0      	clr	20688
  50                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  51  0028 725f50ca      	clr	20682
  52                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  53  002c 725f50c5      	clr	20677
  54                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  55  0030 725f50cd      	clr	20685
  56                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  57  0034 725f50cc      	clr	20684
  58                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  59  0038 725f50ce      	clr	20686
  60                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  61  003c 35b950cf      	mov	20687,#185
  62                     ; 138 }
  63  0040 81            	ret	
  65                     ; 160 void CLK_HSICmd(FunctionalState NewState)
  65                     ; 161 {
  66  0041               _CLK_HSICmd:
  68                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
  69                     ; 165   if (NewState != DISABLE)
  70  0041 4d            	tnz	a
  71  0042 2705          	jreq	L3
  72                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
  73  0044 721050c2      	bset	20674,#0
  75  0048 81            	ret	
  76  0049               L3:
  77                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
  78  0049 721150c2      	bres	20674,#0
  79                     ; 175 }
  80  004d 81            	ret	
  82                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
  82                     ; 189 {
  83  004e               _CLK_AdjustHSICalibrationValue:
  85                     ; 191   CLK->HSIUNLCKR = 0xAC;
  86  004e 35ac50ce      	mov	20686,#172
  87                     ; 192   CLK->HSIUNLCKR = 0x35;
  88  0052 353550ce      	mov	20686,#53
  89                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
  90  0056 c750cd        	ld	20685,a
  91                     ; 196 }
  92  0059 81            	ret	
  94                     ; 212 void CLK_LSICmd(FunctionalState NewState)
  94                     ; 213 {
  95  005a               _CLK_LSICmd:
  97                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
  98                     ; 218   if (NewState != DISABLE)
  99  005a 4d            	tnz	a
 100  005b 2705          	jreq	L7
 101                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 102  005d 721450c2      	bset	20674,#2
 104  0061 81            	ret	
 105  0062               L7:
 106                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 107  0062 721550c2      	bres	20674,#2
 108                     ; 228 }
 109  0066 81            	ret	
 111                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 111                     ; 250 {
 112  0067               _CLK_HSEConfig:
 114                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 115                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 116  0067 721150c6      	bres	20678,#0
 117                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 118  006b 721950c6      	bres	20678,#4
 119                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 120  006f ca50c6        	or	a,20678
 121  0072 c750c6        	ld	20678,a
 122                     ; 263 }
 123  0075 81            	ret	
 125                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 125                     ; 281 {
 126  0076               _CLK_LSEConfig:
 128                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 129                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 130  0076 721550c6      	bres	20678,#2
 131                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 132  007a 721b50c6      	bres	20678,#5
 133                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 134  007e ca50c6        	or	a,20678
 135  0081 c750c6        	ld	20678,a
 136                     ; 295 }
 137  0084 81            	ret	
 139                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 139                     ; 307 {
 140  0085               _CLK_ClockSecuritySystemEnable:
 142                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 143  0085 721050ca      	bset	20682,#0
 144                     ; 310 }
 145  0089 81            	ret	
 147                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 147                     ; 318 {
 148  008a               _CLK_ClockSecuritySytemDeglitchCmd:
 150                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 151                     ; 322   if (NewState != DISABLE)
 152  008a 4d            	tnz	a
 153  008b 2705          	jreq	L31
 154                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 155  008d 721850ca      	bset	20682,#4
 157  0091 81            	ret	
 158  0092               L31:
 159                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 160  0092 721950ca      	bres	20682,#4
 161                     ; 332 }
 162  0096 81            	ret	
 164                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 164                     ; 357 {
 165  0097               _CLK_CCOConfig:
 166  0097 89            	pushw	x
 167       00000000      OFST:	set	0
 169                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 170                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 171                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 172  0098 9f            	ld	a,xl
 173  0099 1a01          	or	a,(OFST+1,sp)
 174  009b c750c5        	ld	20677,a
 175                     ; 364 }
 176  009e 85            	popw	x
 177  009f 81            	ret	
 179                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 179                     ; 417 {
 180  00a0               _CLK_SYSCLKSourceConfig:
 182                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 183                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 184  00a0 c750c8        	ld	20680,a
 185                     ; 423 }
 186  00a3 81            	ret	
 188                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 188                     ; 436 {
 189  00a4               _CLK_GetSYSCLKSource:
 191                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 192  00a4 c650c7        	ld	a,20679
 194  00a7 81            	ret	
 196                     ; 478 uint32_t CLK_GetClockFreq(void)
 196                     ; 479 {
 197  00a8               _CLK_GetClockFreq:
 198  00a8 5209          	subw	sp,#9
 199       00000009      OFST:	set	9
 201                     ; 480   uint32_t clockfrequency = 0;
 202                     ; 481   uint32_t sourcefrequency = 0;
 203  00aa 5f            	clrw	x
 204  00ab 1f07          	ldw	(OFST-2,sp),x
 205  00ad 1f05          	ldw	(OFST-4,sp),x
 206                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 207                     ; 483   uint8_t tmp = 0, presc = 0;
 209                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 210  00af c650c7        	ld	a,20679
 211  00b2 6b09          	ld	(OFST+0,sp),a
 212                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 213  00b4 a101          	cp	a,#1
 214                     ; 490     sourcefrequency = HSI_VALUE;
 216  00b6 2710          	jreq	LC002
 217                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 218  00b8 a102          	cp	a,#2
 219  00ba 2608          	jrne	L32
 220                     ; 494     sourcefrequency = LSI_VALUE;
 221  00bc ae9470        	ldw	x,#38000
 222  00bf 1f07          	ldw	(OFST-2,sp),x
 223  00c1 5f            	clrw	x
 225  00c2 200c          	jp	LC001
 226  00c4               L32:
 227                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 228  00c4 a104          	cp	a,#4
 229  00c6 260a          	jrne	L72
 230                     ; 498     sourcefrequency = HSE_VALUE;
 231  00c8               LC002:
 232  00c8 ae2400        	ldw	x,#9216
 233  00cb 1f07          	ldw	(OFST-2,sp),x
 234  00cd ae00f4        	ldw	x,#244
 235  00d0               LC001:
 236  00d0 1f05          	ldw	(OFST-4,sp),x
 238  00d2               L72:
 239                     ; 502     clockfrequency = LSE_VALUE;
 240                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 241  00d2 c650c0        	ld	a,20672
 242  00d5 a407          	and	a,#7
 243                     ; 507   presc = SYSDivFactor[tmp];
 244  00d7 5f            	clrw	x
 245  00d8 97            	ld	xl,a
 246  00d9 d60000        	ld	a,(_SYSDivFactor,x)
 247  00dc 6b09          	ld	(OFST+0,sp),a
 248                     ; 510   clockfrequency = sourcefrequency / presc;
 249  00de b703          	ld	c_lreg+3,a
 250  00e0 3f02          	clr	c_lreg+2
 251  00e2 3f01          	clr	c_lreg+1
 252  00e4 3f00          	clr	c_lreg
 253  00e6 96            	ldw	x,sp
 254  00e7 5c            	incw	x
 255  00e8 cd0000        	call	c_rtol
 257  00eb 96            	ldw	x,sp
 258  00ec 1c0005        	addw	x,#OFST-4
 259  00ef cd0000        	call	c_ltor
 261  00f2 96            	ldw	x,sp
 262  00f3 5c            	incw	x
 263  00f4 cd0000        	call	c_ludv
 265  00f7 96            	ldw	x,sp
 266  00f8 1c0005        	addw	x,#OFST-4
 267  00fb cd0000        	call	c_rtol
 269                     ; 512   return((uint32_t)clockfrequency);
 270  00fe 96            	ldw	x,sp
 271  00ff 1c0005        	addw	x,#OFST-4
 272  0102 cd0000        	call	c_ltor
 275  0105 5b09          	addw	sp,#9
 276  0107 81            	ret	
 278                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
 278                     ; 529 {
 279  0108               _CLK_SYSCLKDivConfig:
 281                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
 282                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
 283  0108 c750c0        	ld	20672,a
 284                     ; 534 }
 285  010b 81            	ret	
 287                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
 287                     ; 542 {
 288  010c               _CLK_SYSCLKSourceSwitchCmd:
 290                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
 291                     ; 546   if (NewState != DISABLE)
 292  010c 4d            	tnz	a
 293  010d 2705          	jreq	L33
 294                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
 295  010f 721250c9      	bset	20681,#1
 297  0113 81            	ret	
 298  0114               L33:
 299                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 300  0114 721350c9      	bres	20681,#1
 301                     ; 556 }
 302  0118 81            	ret	
 304                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
 304                     ; 617 {
 305  0119               _CLK_RTCClockConfig:
 306  0119 89            	pushw	x
 307       00000000      OFST:	set	0
 309                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
 310                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
 311                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
 312  011a 9f            	ld	a,xl
 313  011b 1a01          	or	a,(OFST+1,sp)
 314  011d c750c1        	ld	20673,a
 315                     ; 624 }
 316  0120 85            	popw	x
 317  0121 81            	ret	
 319                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
 319                     ; 636 {
 320  0122               _CLK_BEEPClockConfig:
 322                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
 323                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
 324  0122 c750cb        	ld	20683,a
 325                     ; 643 }
 326  0125 81            	ret	
 328                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 328                     ; 678 {
 329  0126               _CLK_PeripheralClockConfig:
 330  0126 89            	pushw	x
 331  0127 88            	push	a
 332       00000001      OFST:	set	1
 334                     ; 679   uint8_t reg = 0;
 335                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 336                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
 337                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
 338  0128 9e            	ld	a,xh
 339  0129 a4f0          	and	a,#240
 340  012b 6b01          	ld	(OFST+0,sp),a
 341                     ; 688   if ( reg == 0x00)
 342  012d 2629          	jrne	L73
 343                     ; 690     if (NewState != DISABLE)
 344  012f 7b03          	ld	a,(OFST+2,sp)
 345  0131 2712          	jreq	L14
 346                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 347  0133 7b02          	ld	a,(OFST+1,sp)
 348  0135 ad72          	call	LC005
 349  0137 2704          	jreq	L44
 350  0139               L64:
 351  0139 48            	sll	a
 352  013a 5a            	decw	x
 353  013b 26fc          	jrne	L64
 354  013d               L44:
 355  013d ca50c3        	or	a,20675
 356  0140 c750c3        	ld	20675,a
 358  0143 2061          	jra	L54
 359  0145               L14:
 360                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 361  0145 7b02          	ld	a,(OFST+1,sp)
 362  0147 ad60          	call	LC005
 363  0149 2704          	jreq	L05
 364  014b               L25:
 365  014b 48            	sll	a
 366  014c 5a            	decw	x
 367  014d 26fc          	jrne	L25
 368  014f               L05:
 369  014f 43            	cpl	a
 370  0150 c450c3        	and	a,20675
 371  0153 c750c3        	ld	20675,a
 372  0156 204e          	jra	L54
 373  0158               L73:
 374                     ; 701   else if (reg == 0x10)
 375  0158 a110          	cp	a,#16
 376  015a 2626          	jrne	L74
 377                     ; 703     if (NewState != DISABLE)
 378  015c 7b03          	ld	a,(OFST+2,sp)
 379  015e 270f          	jreq	L15
 380                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 381  0160 7b02          	ld	a,(OFST+1,sp)
 382  0162 ad45          	call	LC005
 383  0164 2704          	jreq	L45
 384  0166               L65:
 385  0166 48            	sll	a
 386  0167 5a            	decw	x
 387  0168 26fc          	jrne	L65
 388  016a               L45:
 389  016a ca50c4        	or	a,20676
 391  016d 200e          	jp	LC004
 392  016f               L15:
 393                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 394  016f 7b02          	ld	a,(OFST+1,sp)
 395  0171 ad36          	call	LC005
 396  0173 2704          	jreq	L06
 397  0175               L26:
 398  0175 48            	sll	a
 399  0176 5a            	decw	x
 400  0177 26fc          	jrne	L26
 401  0179               L06:
 402  0179 43            	cpl	a
 403  017a c450c4        	and	a,20676
 404  017d               LC004:
 405  017d c750c4        	ld	20676,a
 406  0180 2024          	jra	L54
 407  0182               L74:
 408                     ; 716     if (NewState != DISABLE)
 409  0182 7b03          	ld	a,(OFST+2,sp)
 410  0184 270f          	jreq	L75
 411                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 412  0186 7b02          	ld	a,(OFST+1,sp)
 413  0188 ad1f          	call	LC005
 414  018a 2704          	jreq	L46
 415  018c               L66:
 416  018c 48            	sll	a
 417  018d 5a            	decw	x
 418  018e 26fc          	jrne	L66
 419  0190               L46:
 420  0190 ca50d0        	or	a,20688
 422  0193 200e          	jp	LC003
 423  0195               L75:
 424                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 425  0195 7b02          	ld	a,(OFST+1,sp)
 426  0197 ad10          	call	LC005
 427  0199 2704          	jreq	L07
 428  019b               L27:
 429  019b 48            	sll	a
 430  019c 5a            	decw	x
 431  019d 26fc          	jrne	L27
 432  019f               L07:
 433  019f 43            	cpl	a
 434  01a0 c450d0        	and	a,20688
 435  01a3               LC003:
 436  01a3 c750d0        	ld	20688,a
 437  01a6               L54:
 438                     ; 727 }
 439  01a6 5b03          	addw	sp,#3
 440  01a8 81            	ret	
 441  01a9               LC005:
 442  01a9 a40f          	and	a,#15
 443  01ab 5f            	clrw	x
 444  01ac 97            	ld	xl,a
 445  01ad a601          	ld	a,#1
 446  01af 5d            	tnzw	x
 447  01b0 81            	ret	
 449                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
 449                     ; 766 {
 450  01b1               _CLK_LSEClockSecuritySystemEnable:
 452                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
 453  01b1 72105190      	bset	20880,#0
 454                     ; 769 }
 455  01b5 81            	ret	
 457                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
 457                     ; 778 {
 458  01b6               _CLK_RTCCLKSwitchOnLSEFailureEnable:
 460                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
 461  01b6 72125190      	bset	20880,#1
 462                     ; 781 }
 463  01ba 81            	ret	
 465                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
 465                     ; 808 {
 466  01bb               _CLK_HaltConfig:
 467  01bb 89            	pushw	x
 468       00000000      OFST:	set	0
 470                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
 471                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
 472                     ; 813   if (NewState != DISABLE)
 473  01bc 9f            	ld	a,xl
 474  01bd 4d            	tnz	a
 475  01be 2706          	jreq	L36
 476                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
 477  01c0 9e            	ld	a,xh
 478  01c1 ca50c2        	or	a,20674
 480  01c4 2006          	jra	L56
 481  01c6               L36:
 482                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
 483  01c6 7b01          	ld	a,(OFST+1,sp)
 484  01c8 43            	cpl	a
 485  01c9 c450c2        	and	a,20674
 486  01cc               L56:
 487  01cc c750c2        	ld	20674,a
 488                     ; 821 }
 489  01cf 85            	popw	x
 490  01d0 81            	ret	
 492                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
 492                     ; 832 {
 493  01d1               _CLK_MainRegulatorCmd:
 495                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
 496                     ; 836   if (NewState != DISABLE)
 497  01d1 4d            	tnz	a
 498  01d2 2705          	jreq	L76
 499                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
 500  01d4 721350cf      	bres	20687,#1
 502  01d8 81            	ret	
 503  01d9               L76:
 504                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
 505  01d9 721250cf      	bset	20687,#1
 506                     ; 846 }
 507  01dd 81            	ret	
 509                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
 509                     ; 876 {
 510  01de               _CLK_ITConfig:
 511  01de 89            	pushw	x
 512       00000000      OFST:	set	0
 514                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
 515                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
 516                     ; 882   if (NewState != DISABLE)
 517  01df 9f            	ld	a,xl
 518  01e0 4d            	tnz	a
 519  01e1 271d          	jreq	L37
 520                     ; 884     if (CLK_IT == CLK_IT_SWIF)
 521  01e3 9e            	ld	a,xh
 522  01e4 a11c          	cp	a,#28
 523  01e6 2606          	jrne	L57
 524                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
 525  01e8 721450c9      	bset	20681,#2
 527  01ec 202c          	jra	L501
 528  01ee               L57:
 529                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
 530  01ee 7b01          	ld	a,(OFST+1,sp)
 531  01f0 a12c          	cp	a,#44
 532  01f2 2606          	jrne	L101
 533                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
 534  01f4 72145190      	bset	20880,#2
 536  01f8 2020          	jra	L501
 537  01fa               L101:
 538                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
 539  01fa 721450ca      	bset	20682,#2
 540  01fe 201a          	jra	L501
 541  0200               L37:
 542                     ; 902     if (CLK_IT == CLK_IT_SWIF)
 543  0200 7b01          	ld	a,(OFST+1,sp)
 544  0202 a11c          	cp	a,#28
 545  0204 2606          	jrne	L701
 546                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
 547  0206 721550c9      	bres	20681,#2
 549  020a 200e          	jra	L501
 550  020c               L701:
 551                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
 552  020c a12c          	cp	a,#44
 553  020e 2606          	jrne	L311
 554                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
 555  0210 72155190      	bres	20880,#2
 557  0214 2004          	jra	L501
 558  0216               L311:
 559                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
 560  0216 721550ca      	bres	20682,#2
 561  021a               L501:
 562                     ; 918 }
 563  021a 85            	popw	x
 564  021b 81            	ret	
 566                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
 566                     ; 946 {
 567  021c               _CLK_GetFlagStatus:
 568  021c 88            	push	a
 569  021d 89            	pushw	x
 570       00000002      OFST:	set	2
 572                     ; 947   uint8_t reg = 0;
 573                     ; 948   uint8_t pos = 0;
 574                     ; 949   FlagStatus bitstatus = RESET;
 575                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
 576                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
 577  021e a4f0          	and	a,#240
 578  0220 6b02          	ld	(OFST+0,sp),a
 579                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
 580  0222 7b03          	ld	a,(OFST+1,sp)
 581  0224 a40f          	and	a,#15
 582  0226 6b01          	ld	(OFST-1,sp),a
 583                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
 584  0228 7b02          	ld	a,(OFST+0,sp)
 585  022a 2605          	jrne	L711
 586                     ; 962     reg = CLK->CRTCR;
 587  022c c650c1        	ld	a,20673
 589  022f 2042          	jra	L121
 590  0231               L711:
 591                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
 592  0231 a110          	cp	a,#16
 593  0233 2605          	jrne	L321
 594                     ; 966     reg = CLK->ICKCR;
 595  0235 c650c2        	ld	a,20674
 597  0238 2039          	jra	L121
 598  023a               L321:
 599                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
 600  023a a120          	cp	a,#32
 601  023c 2605          	jrne	L721
 602                     ; 970     reg = CLK->CCOR;
 603  023e c650c5        	ld	a,20677
 605  0241 2030          	jra	L121
 606  0243               L721:
 607                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
 608  0243 a130          	cp	a,#48
 609  0245 2605          	jrne	L331
 610                     ; 974     reg = CLK->ECKCR;
 611  0247 c650c6        	ld	a,20678
 613  024a 2027          	jra	L121
 614  024c               L331:
 615                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
 616  024c a140          	cp	a,#64
 617  024e 2605          	jrne	L731
 618                     ; 978     reg = CLK->SWCR;
 619  0250 c650c9        	ld	a,20681
 621  0253 201e          	jra	L121
 622  0255               L731:
 623                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
 624  0255 a150          	cp	a,#80
 625  0257 2605          	jrne	L341
 626                     ; 982     reg = CLK->CSSR;
 627  0259 c650ca        	ld	a,20682
 629  025c 2015          	jra	L121
 630  025e               L341:
 631                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
 632  025e a170          	cp	a,#112
 633  0260 2605          	jrne	L741
 634                     ; 986     reg = CLK->REGCSR;
 635  0262 c650cf        	ld	a,20687
 637  0265 200c          	jra	L121
 638  0267               L741:
 639                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
 640  0267 a180          	cp	a,#128
 641  0269 2605          	jrne	L351
 642                     ; 990     reg = CSSLSE->CSR;
 643  026b c65190        	ld	a,20880
 645  026e 2003          	jra	L121
 646  0270               L351:
 647                     ; 994     reg = CLK->CBEEPR;
 648  0270 c650cb        	ld	a,20683
 649  0273               L121:
 650  0273 6b02          	ld	(OFST+0,sp),a
 651                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
 652  0275 5f            	clrw	x
 653  0276 7b01          	ld	a,(OFST-1,sp)
 654  0278 97            	ld	xl,a
 655  0279 a601          	ld	a,#1
 656  027b 5d            	tnzw	x
 657  027c 2704          	jreq	L011
 658  027e               L211:
 659  027e 48            	sll	a
 660  027f 5a            	decw	x
 661  0280 26fc          	jrne	L211
 662  0282               L011:
 663  0282 1402          	and	a,(OFST+0,sp)
 664  0284 2702          	jreq	L751
 665                     ; 1000     bitstatus = SET;
 666  0286 a601          	ld	a,#1
 668  0288               L751:
 669                     ; 1004     bitstatus = RESET;
 670                     ; 1008   return((FlagStatus)bitstatus);
 672  0288 5b03          	addw	sp,#3
 673  028a 81            	ret	
 675                     ; 1016 void CLK_ClearFlag(void)
 675                     ; 1017 {
 676  028b               _CLK_ClearFlag:
 678                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
 679  028b 72175190      	bres	20880,#3
 680                     ; 1021 }
 681  028f 81            	ret	
 683                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
 683                     ; 1033 {
 684  0290               _CLK_GetITStatus:
 685  0290 88            	push	a
 686  0291 88            	push	a
 687       00000001      OFST:	set	1
 689                     ; 1035   ITStatus bitstatus = RESET;
 690                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
 691                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
 692  0292 a11c          	cp	a,#28
 693  0294 2605          	jrne	L361
 694                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 695  0296 c450c9        	and	a,20681
 696                     ; 1045       bitstatus = SET;
 698  0299 2009          	jp	LC008
 699                     ; 1049       bitstatus = RESET;
 700  029b               L361:
 701                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
 702  029b a12c          	cp	a,#44
 703  029d 260d          	jrne	L371
 704                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 705  029f c65190        	ld	a,20880
 706  02a2 1402          	and	a,(OFST+1,sp)
 707  02a4               LC008:
 708  02a4 a10c          	cp	a,#12
 709  02a6 260d          	jrne	L302
 710                     ; 1057       bitstatus = SET;
 711  02a8               LC007:
 712  02a8 a601          	ld	a,#1
 714  02aa 200a          	jra	L171
 715                     ; 1061       bitstatus = RESET;
 716  02ac               L371:
 717                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 718  02ac c650ca        	ld	a,20682
 719  02af 1402          	and	a,(OFST+1,sp)
 720  02b1 a10c          	cp	a,#12
 721                     ; 1069       bitstatus = SET;
 723  02b3 27f3          	jreq	LC007
 724  02b5               L302:
 725                     ; 1073       bitstatus = RESET;
 726  02b5 4f            	clr	a
 727  02b6               L171:
 728                     ; 1078   return bitstatus;
 730  02b6 85            	popw	x
 731  02b7 81            	ret	
 733                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
 733                     ; 1090 {
 734  02b8               _CLK_ClearITPendingBit:
 736                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
 737                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
 738  02b8 a4f0          	and	a,#240
 739  02ba a120          	cp	a,#32
 740  02bc 2605          	jrne	L702
 741                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
 742  02be 72175190      	bres	20880,#3
 744  02c2 81            	ret	
 745  02c3               L702:
 746                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
 747  02c3 721750c9      	bres	20681,#3
 748                     ; 1105 }
 749  02c7 81            	ret	
 751                     	xdef	_SYSDivFactor
 752                     	xdef	_CLK_ClearITPendingBit
 753                     	xdef	_CLK_GetITStatus
 754                     	xdef	_CLK_ClearFlag
 755                     	xdef	_CLK_GetFlagStatus
 756                     	xdef	_CLK_ITConfig
 757                     	xdef	_CLK_MainRegulatorCmd
 758                     	xdef	_CLK_HaltConfig
 759                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
 760                     	xdef	_CLK_LSEClockSecuritySystemEnable
 761                     	xdef	_CLK_PeripheralClockConfig
 762                     	xdef	_CLK_BEEPClockConfig
 763                     	xdef	_CLK_RTCClockConfig
 764                     	xdef	_CLK_SYSCLKSourceSwitchCmd
 765                     	xdef	_CLK_SYSCLKDivConfig
 766                     	xdef	_CLK_GetClockFreq
 767                     	xdef	_CLK_GetSYSCLKSource
 768                     	xdef	_CLK_SYSCLKSourceConfig
 769                     	xdef	_CLK_CCOConfig
 770                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
 771                     	xdef	_CLK_ClockSecuritySystemEnable
 772                     	xdef	_CLK_LSEConfig
 773                     	xdef	_CLK_HSEConfig
 774                     	xdef	_CLK_LSICmd
 775                     	xdef	_CLK_AdjustHSICalibrationValue
 776                     	xdef	_CLK_HSICmd
 777                     	xdef	_CLK_DeInit
 778                     	xref.b	c_lreg
 779                     	xref.b	c_x
 780                     	xref	c_ludv
 781                     	xref	c_rtol
 782                     	xref	c_ltor
 783                     	end
