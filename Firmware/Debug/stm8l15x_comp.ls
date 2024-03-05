   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 111 void COMP_DeInit(void)
  18                     ; 112 {
  19                     	scross	off
  20  0000               _COMP_DeInit:
  22                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  23  0000 725f5440      	clr	21568
  24                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  25  0004 725f5441      	clr	21569
  26                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  27  0008 35c05442      	mov	21570,#192
  28                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  29  000c 725f5443      	clr	21571
  30                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  31  0010 725f5444      	clr	21572
  32                     ; 127 }
  33  0014 81            	ret	
  35                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
  35                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
  35                     ; 155 {
  36  0015               _COMP_Init:
  37       fffffffe      OFST: set -2
  39                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
  40                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
  41                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
  42                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
  43  0015 c65442        	ld	a,21570
  44  0018 a4c7          	and	a,#199
  45  001a c75442        	ld	21570,a
  46                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
  47  001d 9e            	ld	a,xh
  48  001e ca5442        	or	a,21570
  49  0021 c75442        	ld	21570,a
  50                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
  51  0024 c65442        	ld	a,21570
  52  0027 a43f          	and	a,#63
  53  0029 c75442        	ld	21570,a
  54                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
  55  002c 9f            	ld	a,xl
  56  002d ca5442        	or	a,21570
  57  0030 c75442        	ld	21570,a
  58                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
  59  0033 72155441      	bres	21569,#2
  60                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
  61  0037 c65441        	ld	a,21569
  62  003a 1a03          	or	a,(OFST+5,sp)
  63  003c c75441        	ld	21569,a
  64                     ; 175 }
  65  003f 81            	ret	
  67                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
  67                     ; 184 {
  68  0040               _COMP_VrefintToCOMP1Connect:
  70                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
  71                     ; 188   if (NewState != DISABLE)
  72  0040 4d            	tnz	a
  73  0041 2705          	jreq	L3
  74                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
  75  0043 72145442      	bset	21570,#2
  77  0047 81            	ret	
  78  0048               L3:
  79                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
  80  0048 72155442      	bres	21570,#2
  81                     ; 198 }
  82  004c 81            	ret	
  84                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
  84                     ; 213 {
  85  004d               _COMP_EdgeConfig:
  86  004d 89            	pushw	x
  87       00000000      OFST:	set	0
  89                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
  90                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
  91                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
  92  004e 9e            	ld	a,xh
  93  004f 4a            	dec	a
  94  0050 2611          	jrne	L7
  95                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
  96  0052 c65440        	ld	a,21568
  97  0055 a4fc          	and	a,#252
  98  0057 c75440        	ld	21568,a
  99                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 100  005a 9f            	ld	a,xl
 101  005b ca5440        	or	a,21568
 102  005e c75440        	ld	21568,a
 104  0061 2010          	jra	L11
 105  0063               L7:
 106                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 107  0063 c65441        	ld	a,21569
 108  0066 a4fc          	and	a,#252
 109  0068 c75441        	ld	21569,a
 110                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 111  006b c65441        	ld	a,21569
 112  006e 1a02          	or	a,(OFST+2,sp)
 113  0070 c75441        	ld	21569,a
 114  0073               L11:
 115                     ; 236 }
 116  0073 85            	popw	x
 117  0074 81            	ret	
 119                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 119                     ; 252 {
 120  0075               _COMP_GetOutputLevel:
 121       00000001      OFST:	set	1
 123                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 124                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 125  0075 4a            	dec	a
 126  0076 2609          	jrne	L31
 127                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 128  0078 7207544002    	btjf	21568,#3,L51
 129                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 131  007d 2007          	jp	LC002
 132  007f               L51:
 133                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 134  007f 2008          	jp	L32
 135  0081               L31:
 136                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 137  0081 7207544103    	btjf	21569,#3,L32
 138                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 139  0086               LC002:
 140  0086 a601          	ld	a,#1
 142  0088 81            	ret	
 143  0089               L32:
 144                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 145  0089 4f            	clr	a
 146                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 148  008a 81            	ret	
 150                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 150                     ; 325 {
 151  008b               _COMP_WindowCmd:
 153                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 154                     ; 329   if (NewState != DISABLE)
 155  008b 4d            	tnz	a
 156  008c 2705          	jreq	L72
 157                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 158  008e 72125442      	bset	21570,#1
 160  0092 81            	ret	
 161  0093               L72:
 162                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 163  0093 72135442      	bres	21570,#1
 164                     ; 339 }
 165  0097 81            	ret	
 167                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 167                     ; 363 {
 168  0098               _COMP_VrefintOutputCmd:
 170                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 171                     ; 367   if (NewState != DISABLE)
 172  0098 4d            	tnz	a
 173  0099 2705          	jreq	L33
 174                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 175  009b 72105442      	bset	21570,#0
 177  009f 81            	ret	
 178  00a0               L33:
 179                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 180  00a0 72115442      	bres	21570,#0
 181                     ; 377 }
 182  00a4 81            	ret	
 184                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 184                     ; 402 {
 185  00a5               _COMP_SchmittTriggerCmd:
 187                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 188                     ; 406   if (NewState != DISABLE)
 189  00a5 4d            	tnz	a
 190  00a6 2705          	jreq	L73
 191                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 192  00a8 72145440      	bset	21568,#2
 194  00ac 81            	ret	
 195  00ad               L73:
 196                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 197  00ad 72155440      	bres	21568,#2
 198                     ; 416 }
 199  00b1 81            	ret	
 201                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 201                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 201                     ; 437                         FunctionalState NewState)
 201                     ; 438 {
 202  00b2               _COMP_TriggerConfig:
 203  00b2 89            	pushw	x
 204       00000000      OFST:	set	0
 206                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 207                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 208                     ; 443   switch (COMP_TriggerGroup)
 209  00b3 9e            	ld	a,xh
 211                     ; 490     default:
 211                     ; 491       break;
 212  00b4 4a            	dec	a
 213  00b5 270b          	jreq	L34
 214  00b7 4a            	dec	a
 215  00b8 2717          	jreq	L54
 216  00ba 4a            	dec	a
 217  00bb 2730          	jreq	L74
 218  00bd 4a            	dec	a
 219  00be 2740          	jreq	L15
 220  00c0 2058          	jra	L75
 221  00c2               L34:
 222                     ; 445     case COMP_TriggerGroup_InvertingInput:
 222                     ; 446 
 222                     ; 447       if (NewState != DISABLE)
 223  00c2 7b05          	ld	a,(OFST+5,sp)
 224  00c4 2704          	jreq	L16
 225                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 226  00c6 7b02          	ld	a,(OFST+2,sp)
 228  00c8 2010          	jp	LC005
 229  00ca               L16:
 230                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 231  00ca c65443        	ld	a,21571
 232  00cd 1a02          	or	a,(OFST+2,sp)
 233  00cf 2017          	jp	LC004
 234  00d1               L54:
 235                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 235                     ; 458       if (NewState != DISABLE)
 236  00d1 7b05          	ld	a,(OFST+5,sp)
 237  00d3 270b          	jreq	L56
 238                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 239  00d5 7b02          	ld	a,(OFST+2,sp)
 240  00d7 48            	sll	a
 241  00d8 48            	sll	a
 242  00d9 48            	sll	a
 243  00da               LC005:
 244  00da 43            	cpl	a
 245  00db c45443        	and	a,21571
 247  00de 2008          	jp	LC004
 248  00e0               L56:
 249                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 250  00e0 7b02          	ld	a,(OFST+2,sp)
 251  00e2 48            	sll	a
 252  00e3 48            	sll	a
 253  00e4 48            	sll	a
 254  00e5 ca5443        	or	a,21571
 255  00e8               LC004:
 256  00e8 c75443        	ld	21571,a
 257  00eb 202d          	jra	L75
 258  00ed               L74:
 259                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
 259                     ; 469       if (NewState != DISABLE)
 260  00ed 7b05          	ld	a,(OFST+5,sp)
 261  00ef 2708          	jreq	L17
 262                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 263  00f1 7b02          	ld	a,(OFST+2,sp)
 264  00f3 43            	cpl	a
 265  00f4 c45444        	and	a,21572
 267  00f7 201e          	jp	LC003
 268  00f9               L17:
 269                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
 270  00f9 c65444        	ld	a,21572
 271  00fc 1a02          	or	a,(OFST+2,sp)
 272  00fe 2017          	jp	LC003
 273  0100               L15:
 274                     ; 479     case COMP_TriggerGroup_DACOutput:
 274                     ; 480       if (NewState != DISABLE)
 275  0100 7b05          	ld	a,(OFST+5,sp)
 276  0102 270b          	jreq	L57
 277                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 278  0104 7b02          	ld	a,(OFST+2,sp)
 279  0106 48            	sll	a
 280  0107 48            	sll	a
 281  0108 48            	sll	a
 282  0109 43            	cpl	a
 283  010a c45444        	and	a,21572
 285  010d 2008          	jp	LC003
 286  010f               L57:
 287                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
 288  010f 7b02          	ld	a,(OFST+2,sp)
 289  0111 48            	sll	a
 290  0112 48            	sll	a
 291  0113 48            	sll	a
 292  0114 ca5444        	or	a,21572
 293  0117               LC003:
 294  0117 c75444        	ld	21572,a
 295                     ; 490     default:
 295                     ; 491       break;
 296  011a               L75:
 297                     ; 493 }
 298  011a 85            	popw	x
 299  011b 81            	ret	
 301                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
 301                     ; 522 {
 302  011c               _COMP_ITConfig:
 303  011c 89            	pushw	x
 304       00000000      OFST:	set	0
 306                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 307                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
 308                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
 309  011d 9e            	ld	a,xh
 310  011e 4a            	dec	a
 311  011f 2610          	jrne	L101
 312                     ; 530     if (NewState != DISABLE)
 313  0121 9f            	ld	a,xl
 314  0122 4d            	tnz	a
 315  0123 2706          	jreq	L301
 316                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
 317  0125 721a5440      	bset	21568,#5
 319  0129 2014          	jra	L701
 320  012b               L301:
 321                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
 322  012b 721b5440      	bres	21568,#5
 323  012f 200e          	jra	L701
 324  0131               L101:
 325                     ; 543     if (NewState != DISABLE)
 326  0131 7b02          	ld	a,(OFST+2,sp)
 327  0133 2706          	jreq	L111
 328                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
 329  0135 721a5441      	bset	21569,#5
 331  0139 2004          	jra	L701
 332  013b               L111:
 333                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
 334  013b 721b5441      	bres	21569,#5
 335  013f               L701:
 336                     ; 554 }
 337  013f 85            	popw	x
 338  0140 81            	ret	
 340                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
 340                     ; 565 {
 341  0141               _COMP_GetFlagStatus:
 342       00000001      OFST:	set	1
 344                     ; 566   FlagStatus bitstatus = RESET;
 345                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 346                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
 347  0141 4a            	dec	a
 348  0142 2609          	jrne	L511
 349                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
 350  0144 7209544002    	btjf	21568,#4,L711
 351                     ; 577       bitstatus = SET;
 353  0149 2007          	jp	LC007
 354  014b               L711:
 355                     ; 582       bitstatus = RESET;
 356  014b 2008          	jp	L521
 357  014d               L511:
 358                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
 359  014d 7209544103    	btjf	21569,#4,L521
 360                     ; 590       bitstatus = SET;
 361  0152               LC007:
 362  0152 a601          	ld	a,#1
 364  0154 81            	ret	
 365  0155               L521:
 366                     ; 595       bitstatus = RESET;
 367  0155 4f            	clr	a
 368                     ; 600   return (FlagStatus)(bitstatus);
 370  0156 81            	ret	
 372                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
 372                     ; 612 {
 373  0157               _COMP_ClearFlag:
 375                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 376                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
 377  0157 4a            	dec	a
 378  0158 2605          	jrne	L131
 379                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
 380  015a 72195440      	bres	21568,#4
 382  015e 81            	ret	
 383  015f               L131:
 384                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
 385  015f 72195441      	bres	21569,#4
 386                     ; 626 }
 387  0163 81            	ret	
 389                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
 389                     ; 637 {
 390  0164               _COMP_GetITStatus:
 391  0164 89            	pushw	x
 392       00000002      OFST:	set	2
 394                     ; 638   ITStatus bitstatus = RESET;
 395                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
 397                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 398                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
 399  0165 4a            	dec	a
 400  0166 2618          	jrne	L531
 401                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
 402  0168 c65440        	ld	a,21568
 403  016b a410          	and	a,#16
 404  016d 6b01          	ld	(OFST-1,sp),a
 405                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
 406  016f c65440        	ld	a,21568
 407  0172 a420          	and	a,#32
 408  0174 6b02          	ld	(OFST+0,sp),a
 409                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
 410  0176 7b01          	ld	a,(OFST-1,sp)
 411  0178 2720          	jreq	L541
 413  017a 7b02          	ld	a,(OFST+0,sp)
 414  017c 271c          	jreq	L541
 415                     ; 655       bitstatus = SET;
 417  017e 2016          	jp	LC009
 418                     ; 660       bitstatus = RESET;
 419  0180               L531:
 420                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
 421  0180 c65441        	ld	a,21569
 422  0183 a410          	and	a,#16
 423  0185 6b01          	ld	(OFST-1,sp),a
 424                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
 425  0187 c65441        	ld	a,21569
 426  018a a420          	and	a,#32
 427  018c 6b02          	ld	(OFST+0,sp),a
 428                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
 429  018e 7b01          	ld	a,(OFST-1,sp)
 430  0190 2708          	jreq	L541
 432  0192 7b02          	ld	a,(OFST+0,sp)
 433  0194 2704          	jreq	L541
 434                     ; 674       bitstatus = SET;
 435  0196               LC009:
 436  0196 a601          	ld	a,#1
 438  0198 2001          	jra	L341
 439  019a               L541:
 440                     ; 679       bitstatus = RESET;
 441  019a 4f            	clr	a
 442  019b               L341:
 443                     ; 684   return (ITStatus) bitstatus;
 445  019b 85            	popw	x
 446  019c 81            	ret	
 448                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
 448                     ; 696 {
 449  019d               _COMP_ClearITPendingBit:
 451                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 452                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
 453  019d 4a            	dec	a
 454  019e 2605          	jrne	L151
 455                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
 456  01a0 72195440      	bres	21568,#4
 458  01a4 81            	ret	
 459  01a5               L151:
 460                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
 461  01a5 72195441      	bres	21569,#4
 462                     ; 710 }
 463  01a9 81            	ret	
 465                     	xdef	_COMP_ClearITPendingBit
 466                     	xdef	_COMP_GetITStatus
 467                     	xdef	_COMP_ClearFlag
 468                     	xdef	_COMP_GetFlagStatus
 469                     	xdef	_COMP_ITConfig
 470                     	xdef	_COMP_TriggerConfig
 471                     	xdef	_COMP_SchmittTriggerCmd
 472                     	xdef	_COMP_VrefintOutputCmd
 473                     	xdef	_COMP_WindowCmd
 474                     	xdef	_COMP_GetOutputLevel
 475                     	xdef	_COMP_EdgeConfig
 476                     	xdef	_COMP_VrefintToCOMP1Connect
 477                     	xdef	_COMP_Init
 478                     	xdef	_COMP_DeInit
 479                     	end
