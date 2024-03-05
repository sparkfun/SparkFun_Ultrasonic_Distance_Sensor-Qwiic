   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 119 void SYSCFG_RIDeInit(void)
  18                     ; 120 {
  19                     	scross	off
  20  0000               _SYSCFG_RIDeInit:
  22                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  23  0000 725f5431      	clr	21553
  24                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  25  0004 725f5432      	clr	21554
  26                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  27  0008 725f5439      	clr	21561
  28                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  29  000c 725f543a      	clr	21562
  30                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  31  0010 725f543b      	clr	21563
  32                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  33  0014 725f5457      	clr	21591
  34                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  35  0018 725f543d      	clr	21565
  36                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  37  001c 725f543e      	clr	21566
  38                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  39  0020 725f543f      	clr	21567
  40                     ; 130 }
  41  0024 81            	ret	
  43                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
  43                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
  43                     ; 144 {
  44  0025               _SYSCFG_RITIMInputCaptureConfig:
  45  0025 89            	pushw	x
  46       00000000      OFST:	set	0
  48                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
  49                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
  50                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
  51  0026 9e            	ld	a,xh
  52  0027 a102          	cp	a,#2
  53  0029 2606          	jrne	L3
  54                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
  55  002b 9f            	ld	a,xl
  56  002c c75431        	ld	21553,a
  58  002f 2005          	jra	L5
  59  0031               L3:
  60                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
  61  0031 7b02          	ld	a,(OFST+2,sp)
  62  0033 c75432        	ld	21554,a
  63  0036               L5:
  64                     ; 161 }
  65  0036 85            	popw	x
  66  0037 81            	ret	
  68                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
  68                     ; 185                                  FunctionalState NewState)
  68                     ; 186 {
  69  0038               _SYSCFG_RIAnalogSwitchConfig:
  70  0038 89            	pushw	x
  71  0039 89            	pushw	x
  72       00000002      OFST:	set	2
  74                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
  75                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
  76                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
  77                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
  78  003a 9e            	ld	a,xh
  79  003b a4f0          	and	a,#240
  80  003d 6b01          	ld	(OFST-1,sp),a
  81                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
  82  003f 7b03          	ld	a,(OFST+1,sp)
  83  0041 a40f          	and	a,#15
  84  0043 6b02          	ld	(OFST+0,sp),a
  85                     ; 199   if (NewState != DISABLE)
  86  0045 7b04          	ld	a,(OFST+2,sp)
  87  0047 2724          	jreq	L7
  88                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
  89  0049 7b01          	ld	a,(OFST-1,sp)
  90  004b a110          	cp	a,#16
  91  004d 260f          	jrne	L11
  92                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
  93  004f 7b02          	ld	a,(OFST+0,sp)
  94  0051 ad47          	call	LC003
  95  0053 2704          	jreq	L01
  96  0055               L21:
  97  0055 48            	sll	a
  98  0056 5a            	decw	x
  99  0057 26fc          	jrne	L21
 100  0059               L01:
 101  0059 ca543d        	or	a,21565
 103  005c 2023          	jp	LC002
 104  005e               L11:
 105                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 106  005e 7b02          	ld	a,(OFST+0,sp)
 107  0060 ad38          	call	LC003
 108  0062 2704          	jreq	L41
 109  0064               L61:
 110  0064 48            	sll	a
 111  0065 5a            	decw	x
 112  0066 26fc          	jrne	L61
 113  0068               L41:
 114  0068 ca543e        	or	a,21566
 115  006b 2027          	jp	LC001
 116  006d               L7:
 117                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 118  006d 7b01          	ld	a,(OFST-1,sp)
 119  006f a110          	cp	a,#16
 120  0071 2613          	jrne	L71
 121                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 122  0073 7b02          	ld	a,(OFST+0,sp)
 123  0075 ad23          	call	LC003
 124  0077 2704          	jreq	L02
 125  0079               L22:
 126  0079 48            	sll	a
 127  007a 5a            	decw	x
 128  007b 26fc          	jrne	L22
 129  007d               L02:
 130  007d 43            	cpl	a
 131  007e c4543d        	and	a,21565
 132  0081               LC002:
 133  0081 c7543d        	ld	21565,a
 135  0084 2011          	jra	L51
 136  0086               L71:
 137                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 138  0086 7b02          	ld	a,(OFST+0,sp)
 139  0088 ad10          	call	LC003
 140  008a 2704          	jreq	L42
 141  008c               L62:
 142  008c 48            	sll	a
 143  008d 5a            	decw	x
 144  008e 26fc          	jrne	L62
 145  0090               L42:
 146  0090 43            	cpl	a
 147  0091 c4543e        	and	a,21566
 148  0094               LC001:
 149  0094 c7543e        	ld	21566,a
 150  0097               L51:
 151                     ; 225 }
 152  0097 5b04          	addw	sp,#4
 153  0099 81            	ret	
 154  009a               LC003:
 155  009a 5f            	clrw	x
 156  009b 97            	ld	xl,a
 157  009c a601          	ld	a,#1
 158  009e 5d            	tnzw	x
 159  009f 81            	ret	
 161                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 161                     ; 235                              FunctionalState NewState)
 161                     ; 236 {
 162  00a0               _SYSCFG_RIIOSwitchConfig:
 163  00a0 89            	pushw	x
 164  00a1 89            	pushw	x
 165       00000002      OFST:	set	2
 167                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 168                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 169                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 170                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 171  00a2 9e            	ld	a,xh
 172  00a3 a40f          	and	a,#15
 173  00a5 6b02          	ld	(OFST+0,sp),a
 174                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 175  00a7 7b03          	ld	a,(OFST+1,sp)
 176  00a9 a4f0          	and	a,#240
 177  00ab 6b01          	ld	(OFST-1,sp),a
 178                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 179  00ad a110          	cp	a,#16
 180  00af 262c          	jrne	L32
 181                     ; 252     if (NewState != DISABLE)
 182  00b1 7b04          	ld	a,(OFST+2,sp)
 183  00b3 2714          	jreq	L52
 184                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 185  00b5 7b02          	ld	a,(OFST+0,sp)
 186  00b7 cd015b        	call	LC006
 187  00ba 2704          	jreq	L23
 188  00bc               L43:
 189  00bc 48            	sll	a
 190  00bd 5a            	decw	x
 191  00be 26fc          	jrne	L43
 192  00c0               L23:
 193  00c0 ca5439        	or	a,21561
 194  00c3 c75439        	ld	21561,a
 196  00c6 cc0158        	jra	L13
 197  00c9               L52:
 198                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 199  00c9 7b02          	ld	a,(OFST+0,sp)
 200  00cb cd015b        	call	LC006
 201  00ce 2704          	jreq	L63
 202  00d0               L04:
 203  00d0 48            	sll	a
 204  00d1 5a            	decw	x
 205  00d2 26fc          	jrne	L04
 206  00d4               L63:
 207  00d4 43            	cpl	a
 208  00d5 c45439        	and	a,21561
 209  00d8 c75439        	ld	21561,a
 210  00db 207b          	jra	L13
 211  00dd               L32:
 212                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
 213  00dd a120          	cp	a,#32
 214  00df 2629          	jrne	L33
 215                     ; 267     if (NewState != DISABLE)
 216  00e1 7b04          	ld	a,(OFST+2,sp)
 217  00e3 2712          	jreq	L53
 218                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 219  00e5 7b02          	ld	a,(OFST+0,sp)
 220  00e7 ad72          	call	LC006
 221  00e9 2704          	jreq	L24
 222  00eb               L44:
 223  00eb 48            	sll	a
 224  00ec 5a            	decw	x
 225  00ed 26fc          	jrne	L44
 226  00ef               L24:
 227  00ef ca543a        	or	a,21562
 228  00f2 c7543a        	ld	21562,a
 230  00f5 2061          	jra	L13
 231  00f7               L53:
 232                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
 233  00f7 7b02          	ld	a,(OFST+0,sp)
 234  00f9 ad60          	call	LC006
 235  00fb 2704          	jreq	L64
 236  00fd               L05:
 237  00fd 48            	sll	a
 238  00fe 5a            	decw	x
 239  00ff 26fc          	jrne	L05
 240  0101               L64:
 241  0101 43            	cpl	a
 242  0102 c4543a        	and	a,21562
 243  0105 c7543a        	ld	21562,a
 244  0108 204e          	jra	L13
 245  010a               L33:
 246                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
 247  010a a130          	cp	a,#48
 248  010c 2626          	jrne	L34
 249                     ; 282     if (NewState != DISABLE)
 250  010e 7b04          	ld	a,(OFST+2,sp)
 251  0110 270f          	jreq	L54
 252                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 253  0112 7b02          	ld	a,(OFST+0,sp)
 254  0114 ad45          	call	LC006
 255  0116 2704          	jreq	L25
 256  0118               L45:
 257  0118 48            	sll	a
 258  0119 5a            	decw	x
 259  011a 26fc          	jrne	L45
 260  011c               L25:
 261  011c ca543b        	or	a,21563
 263  011f 200e          	jp	LC005
 264  0121               L54:
 265                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
 266  0121 7b02          	ld	a,(OFST+0,sp)
 267  0123 ad36          	call	LC006
 268  0125 2704          	jreq	L65
 269  0127               L06:
 270  0127 48            	sll	a
 271  0128 5a            	decw	x
 272  0129 26fc          	jrne	L06
 273  012b               L65:
 274  012b 43            	cpl	a
 275  012c c4543b        	and	a,21563
 276  012f               LC005:
 277  012f c7543b        	ld	21563,a
 278  0132 2024          	jra	L13
 279  0134               L34:
 280                     ; 297     if (NewState != DISABLE)
 281  0134 7b04          	ld	a,(OFST+2,sp)
 282  0136 270f          	jreq	L35
 283                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 284  0138 7b02          	ld	a,(OFST+0,sp)
 285  013a ad1f          	call	LC006
 286  013c 2704          	jreq	L26
 287  013e               L46:
 288  013e 48            	sll	a
 289  013f 5a            	decw	x
 290  0140 26fc          	jrne	L46
 291  0142               L26:
 292  0142 ca5457        	or	a,21591
 294  0145 200e          	jp	LC004
 295  0147               L35:
 296                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
 297  0147 7b02          	ld	a,(OFST+0,sp)
 298  0149 ad10          	call	LC006
 299  014b 2704          	jreq	L66
 300  014d               L07:
 301  014d 48            	sll	a
 302  014e 5a            	decw	x
 303  014f 26fc          	jrne	L07
 304  0151               L66:
 305  0151 43            	cpl	a
 306  0152 c45457        	and	a,21591
 307  0155               LC004:
 308  0155 c75457        	ld	21591,a
 309  0158               L13:
 310                     ; 308 }
 311  0158 5b04          	addw	sp,#4
 312  015a 81            	ret	
 313  015b               LC006:
 314  015b 5f            	clrw	x
 315  015c 97            	ld	xl,a
 316  015d a601          	ld	a,#1
 317  015f 5d            	tnzw	x
 318  0160 81            	ret	
 320                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
 320                     ; 321 {
 321  0161               _SYSCFG_RIResistorConfig:
 322  0161 89            	pushw	x
 323       00000000      OFST:	set	0
 325                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
 326                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 327                     ; 326   if (NewState != DISABLE)
 328  0162 9f            	ld	a,xl
 329  0163 4d            	tnz	a
 330  0164 2706          	jreq	L75
 331                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
 332  0166 9e            	ld	a,xh
 333  0167 ca543f        	or	a,21567
 335  016a 2006          	jra	L16
 336  016c               L75:
 337                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
 338  016c 7b01          	ld	a,(OFST+1,sp)
 339  016e 43            	cpl	a
 340  016f c4543f        	and	a,21567
 341  0172               L16:
 342  0172 c7543f        	ld	21567,a
 343                     ; 336 }
 344  0175 85            	popw	x
 345  0176 81            	ret	
 347                     ; 368 void SYSCFG_REMAPDeInit(void)
 347                     ; 369 {
 348  0177               _SYSCFG_REMAPDeInit:
 350                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
 351  0177 350c509e      	mov	20638,#12
 352                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
 353  017b 725f509f      	clr	20639
 354                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
 355  017f 725f509d      	clr	20637
 356                     ; 378 }
 357  0183 81            	ret	
 359                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
 359                     ; 412 {
 360  0184               _SYSCFG_REMAPPinConfig:
 361  0184 89            	pushw	x
 362  0185 88            	push	a
 363       00000001      OFST:	set	1
 365                     ; 413   uint8_t regindex = 0;
 366                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
 367                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
 368                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
 369  0186 9e            	ld	a,xh
 370  0187 6b01          	ld	(OFST+0,sp),a
 371                     ; 422   if (regindex == 0x01)
 372  0189 a101          	cp	a,#1
 373  018b 261c          	jrne	L36
 374                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
 375  018d a610          	ld	a,#16
 376  018f 42            	mul	x,a
 377  0190 9f            	ld	a,xl
 378  0191 aa0f          	or	a,#15
 379  0193 c4509e        	and	a,20638
 380  0196 c7509e        	ld	20638,a
 381                     ; 425     if (NewState != DISABLE)
 382  0199 7b06          	ld	a,(OFST+5,sp)
 383  019b 273a          	jreq	L76
 384                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
 385  019d 7b03          	ld	a,(OFST+2,sp)
 386  019f a4f0          	and	a,#240
 387  01a1 ca509e        	or	a,20638
 388  01a4 c7509e        	ld	20638,a
 389  01a7 202e          	jra	L76
 390  01a9               L36:
 391                     ; 431   else if (regindex == 0x02)
 392  01a9 a102          	cp	a,#2
 393  01ab 2616          	jrne	L17
 394                     ; 433     if (NewState != DISABLE)
 395  01ad 7b06          	ld	a,(OFST+5,sp)
 396  01af 2707          	jreq	L37
 397                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
 398  01b1 c6509f        	ld	a,20639
 399  01b4 1a03          	or	a,(OFST+2,sp)
 401  01b6 2006          	jp	LC008
 402  01b8               L37:
 403                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
 404  01b8 7b03          	ld	a,(OFST+2,sp)
 405  01ba 43            	cpl	a
 406  01bb c4509f        	and	a,20639
 407  01be               LC008:
 408  01be c7509f        	ld	20639,a
 409  01c1 2014          	jra	L76
 410  01c3               L17:
 411                     ; 445     if (NewState != DISABLE)
 412  01c3 7b06          	ld	a,(OFST+5,sp)
 413  01c5 2707          	jreq	L101
 414                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
 415  01c7 c6509d        	ld	a,20637
 416  01ca 1a03          	or	a,(OFST+2,sp)
 418  01cc 2006          	jp	LC007
 419  01ce               L101:
 420                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
 421  01ce 7b03          	ld	a,(OFST+2,sp)
 422  01d0 43            	cpl	a
 423  01d1 c4509d        	and	a,20637
 424  01d4               LC007:
 425  01d4 c7509d        	ld	20637,a
 426  01d7               L76:
 427                     ; 454 }
 428  01d7 5b03          	addw	sp,#3
 429  01d9 81            	ret	
 431                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
 431                     ; 471 {
 432  01da               _SYSCFG_REMAPDMAChannelConfig:
 433  01da 88            	push	a
 434       00000000      OFST:	set	0
 436                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
 437                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
 438  01db a5f0          	bcp	a,#240
 439  01dd 2707          	jreq	L501
 440                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
 441  01df c6509e        	ld	a,20638
 442  01e2 a4f3          	and	a,#243
 444  01e4 2005          	jra	L701
 445  01e6               L501:
 446                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
 447  01e6 c6509e        	ld	a,20638
 448  01e9 a4fc          	and	a,#252
 449  01eb               L701:
 450  01eb c7509e        	ld	20638,a
 451                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
 452  01ee 7b01          	ld	a,(OFST+1,sp)
 453  01f0 a40f          	and	a,#15
 454  01f2 ca509e        	or	a,20638
 455  01f5 c7509e        	ld	20638,a
 456                     ; 489 }
 457  01f8 84            	pop	a
 458  01f9 81            	ret	
 460                     	xdef	_SYSCFG_REMAPDMAChannelConfig
 461                     	xdef	_SYSCFG_REMAPPinConfig
 462                     	xdef	_SYSCFG_REMAPDeInit
 463                     	xdef	_SYSCFG_RIResistorConfig
 464                     	xdef	_SYSCFG_RIIOSwitchConfig
 465                     	xdef	_SYSCFG_RIAnalogSwitchConfig
 466                     	xdef	_SYSCFG_RITIMInputCaptureConfig
 467                     	xdef	_SYSCFG_RIDeInit
 468                     	end
