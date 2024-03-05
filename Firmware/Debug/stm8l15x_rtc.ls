   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  91                     ; 232 ErrorStatus RTC_DeInit(void)
  91                     ; 233 {
  93                     	switch	.text
  94  0000               _RTC_DeInit:
  96  0000 5205          	subw	sp,#5
  97       00000005      OFST:	set	5
 100                     ; 234   ErrorStatus status = ERROR;
 102                     ; 235   uint16_t wutwfcount = 0;
 104  0002 5f            	clrw	x
 105  0003 1f02          	ldw	(OFST-3,sp),x
 107                     ; 236   uint16_t recalpfcount = 0;
 109  0005 5f            	clrw	x
 110  0006 1f04          	ldw	(OFST-1,sp),x
 112                     ; 239   RTC->WPR = 0xCA;
 114  0008 35ca5159      	mov	20825,#202
 115                     ; 240   RTC->WPR = 0x53;
 117  000c 35535159      	mov	20825,#83
 118                     ; 243   if (RTC_EnterInitMode() == ERROR)
 120  0010 cd0161        	call	_RTC_EnterInitMode
 122  0013 4d            	tnz	a
 123  0014 260b          	jrne	L74
 124                     ; 245     status = ERROR;
 126  0016 0f01          	clr	(OFST-4,sp)
 128                     ; 247     RTC->WPR = 0xFF; 
 130  0018 35ff5159      	mov	20825,#255
 132  001c               L15:
 133                     ; 343   return (ErrorStatus)status;
 135  001c 7b01          	ld	a,(OFST-4,sp)
 138  001e 5b05          	addw	sp,#5
 139  0020 81            	ret
 140  0021               L74:
 141                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 143  0021 725f5140      	clr	20800
 144                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 146  0025 725f5141      	clr	20801
 147                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 149  0029 725f5142      	clr	20802
 150                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 152  002d 35015144      	mov	20804,#1
 153                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 155  0031 35215145      	mov	20805,#33
 156                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 158  0035 725f5146      	clr	20806
 159                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 161  0039 725f5150      	clr	20816
 162                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 164  003d 35ff5151      	mov	20817,#255
 165                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 167  0041 357f5152      	mov	20818,#127
 168                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 170  0045 725f516c      	clr	20844
 171                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 173  0049 725f516d      	clr	20845
 174                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 176  004d 725f5148      	clr	20808
 177                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 179  0051 725f5149      	clr	20809
 180                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 182  0055 725f514a      	clr	20810
 184  0059 200b          	jra	L75
 185  005b               L35:
 186                     ; 278       wutwfcount++;
 188  005b 1e02          	ldw	x,(OFST-3,sp)
 189  005d 1c0001        	addw	x,#1
 190  0060 1f02          	ldw	(OFST-3,sp),x
 192                     ; 279       RTC->ISR1 = 0;
 194  0062 725f514c      	clr	20812
 195  0066               L75:
 196                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 198  0066 c6514c        	ld	a,20812
 199  0069 a504          	bcp	a,#4
 200  006b 2607          	jrne	L36
 202  006d 1e02          	ldw	x,(OFST-3,sp)
 203  006f a3ffff        	cpw	x,#65535
 204  0072 26e7          	jrne	L35
 205  0074               L36:
 206                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 208  0074 c6514c        	ld	a,20812
 209  0077 a504          	bcp	a,#4
 210  0079 2608          	jrne	L56
 211                     ; 284       status = ERROR;
 213  007b 0f01          	clr	(OFST-4,sp)
 215                     ; 286       RTC->WPR = 0xFF; 
 217  007d 35ff5159      	mov	20825,#255
 219  0081 2099          	jra	L15
 220  0083               L56:
 221                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 223  0083 725f5148      	clr	20808
 224                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 226  0087 35ff5154      	mov	20820,#255
 227                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 229  008b 35ff5155      	mov	20821,#255
 230                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 232  008f 725f515c      	clr	20828
 233                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 235  0093 725f515d      	clr	20829
 236                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 238  0097 725f515e      	clr	20830
 239                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 241  009b 725f515f      	clr	20831
 242                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 244  009f 725f5164      	clr	20836
 245                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 247  00a3 725f5165      	clr	20837
 248                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 250  00a7 725f5166      	clr	20838
 251                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 253  00ab 725f514c      	clr	20812
 254                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 256  00af 725f514d      	clr	20813
 257                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 259  00b3 c6514c        	ld	a,20812
 260  00b6 a502          	bcp	a,#2
 261  00b8 2717          	jreq	L17
 263  00ba 2007          	jra	L57
 264  00bc               L37:
 265                     ; 315           recalpfcount++;
 267  00bc 1e04          	ldw	x,(OFST-1,sp)
 268  00be 1c0001        	addw	x,#1
 269  00c1 1f04          	ldw	(OFST-1,sp),x
 271  00c3               L57:
 272                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 274  00c3 c6514c        	ld	a,20812
 275  00c6 a502          	bcp	a,#2
 276  00c8 2707          	jreq	L17
 278  00ca 1e04          	ldw	x,(OFST-1,sp)
 279  00cc a3ffff        	cpw	x,#65535
 280  00cf 26eb          	jrne	L37
 281  00d1               L17:
 282                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 284  00d1 c6514c        	ld	a,20812
 285  00d4 a502          	bcp	a,#2
 286  00d6 2618          	jrne	L301
 287                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 289  00d8 725f516a      	clr	20842
 290                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 292  00dc 725f516b      	clr	20843
 293                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 295  00e0 cd01a1        	call	_RTC_WaitForSynchro
 297  00e3 4d            	tnz	a
 298  00e4 2604          	jrne	L501
 299                     ; 325           status = ERROR;
 301  00e6 0f01          	clr	(OFST-4,sp)
 304  00e8 2008          	jra	L111
 305  00ea               L501:
 306                     ; 329           status = SUCCESS;
 308  00ea a601          	ld	a,#1
 309  00ec 6b01          	ld	(OFST-4,sp),a
 311  00ee 2002          	jra	L111
 312  00f0               L301:
 313                     ; 334         status = ERROR;
 315  00f0 0f01          	clr	(OFST-4,sp)
 317  00f2               L111:
 318                     ; 338       RTC->WPR = 0xFF; 
 320  00f2 35ff5159      	mov	20825,#255
 321  00f6 ac1c001c      	jpf	L15
 421                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 421                     ; 360 {
 422                     	switch	.text
 423  00fa               _RTC_Init:
 425  00fa 89            	pushw	x
 426  00fb 88            	push	a
 427       00000001      OFST:	set	1
 430                     ; 361   ErrorStatus status = ERROR;
 432                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 434                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 436                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 438                     ; 369   RTC->WPR = 0xCA;
 440  00fc 35ca5159      	mov	20825,#202
 441                     ; 370   RTC->WPR = 0x53;
 443  0100 35535159      	mov	20825,#83
 444                     ; 373   if (RTC_EnterInitMode() == ERROR)
 446  0104 ad5b          	call	_RTC_EnterInitMode
 448  0106 4d            	tnz	a
 449  0107 2604          	jrne	L361
 450                     ; 375     status = ERROR;
 452  0109 0f01          	clr	(OFST+0,sp)
 455  010b 202d          	jra	L561
 456  010d               L361:
 457                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 459  010d 721d5148      	bres	20808,#6
 460                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 462  0111 1e02          	ldw	x,(OFST+1,sp)
 463  0113 c65148        	ld	a,20808
 464  0116 fa            	or	a,(x)
 465  0117 c75148        	ld	20808,a
 466                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 468  011a 1e02          	ldw	x,(OFST+1,sp)
 469  011c ee02          	ldw	x,(2,x)
 470  011e 4f            	clr	a
 471  011f 01            	rrwa	x,a
 472  0120 9f            	ld	a,xl
 473  0121 c75150        	ld	20816,a
 474                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 476  0124 1e02          	ldw	x,(OFST+1,sp)
 477  0126 e603          	ld	a,(3,x)
 478  0128 c75151        	ld	20817,a
 479                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 481  012b 1e02          	ldw	x,(OFST+1,sp)
 482  012d e601          	ld	a,(1,x)
 483  012f c75152        	ld	20818,a
 484                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 486  0132 721f514c      	bres	20812,#7
 487                     ; 393     status = SUCCESS;
 489  0136 a601          	ld	a,#1
 490  0138 6b01          	ld	(OFST+0,sp),a
 492  013a               L561:
 493                     ; 397   RTC->WPR = 0xFF; 
 495  013a 35ff5159      	mov	20825,#255
 496                     ; 400   return (ErrorStatus)(status);
 498  013e 7b01          	ld	a,(OFST+0,sp)
 501  0140 5b03          	addw	sp,#3
 502  0142 81            	ret
 539                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 539                     ; 411 {
 540                     	switch	.text
 541  0143               _RTC_StructInit:
 545                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 547  0143 7f            	clr	(x)
 548                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 550  0144 a67f          	ld	a,#127
 551  0146 e701          	ld	(1,x),a
 552                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 554  0148 90ae00ff      	ldw	y,#255
 555  014c ef02          	ldw	(2,x),y
 556                     ; 420 }
 559  014e 81            	ret
 615                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 615                     ; 431 {
 616                     	switch	.text
 617  014f               _RTC_WriteProtectionCmd:
 621                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 623                     ; 435   if (NewState != DISABLE)
 625  014f 4d            	tnz	a
 626  0150 2706          	jreq	L532
 627                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 629  0152 35ff5159      	mov	20825,#255
 631  0156 2008          	jra	L732
 632  0158               L532:
 633                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 635  0158 35ca5159      	mov	20825,#202
 636                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 638  015c 35535159      	mov	20825,#83
 639  0160               L732:
 640                     ; 446 }
 643  0160 81            	ret
 686                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 686                     ; 459 {
 687                     	switch	.text
 688  0161               _RTC_EnterInitMode:
 690  0161 5203          	subw	sp,#3
 691       00000003      OFST:	set	3
 694                     ; 460   ErrorStatus status = ERROR;
 696                     ; 461   uint16_t initfcount = 0;
 698  0163 5f            	clrw	x
 699  0164 1f02          	ldw	(OFST-1,sp),x
 701                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 703  0166 c6514c        	ld	a,20812
 704  0169 a540          	bcp	a,#64
 705  016b 261b          	jrne	L162
 706                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 708  016d 3580514c      	mov	20812,#128
 710  0171 2007          	jra	L762
 711  0173               L362:
 712                     ; 472       initfcount++;
 714  0173 1e02          	ldw	x,(OFST-1,sp)
 715  0175 1c0001        	addw	x,#1
 716  0178 1f02          	ldw	(OFST-1,sp),x
 718  017a               L762:
 719                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 721  017a c6514c        	ld	a,20812
 722  017d a540          	bcp	a,#64
 723  017f 2607          	jrne	L162
 725  0181 1e02          	ldw	x,(OFST-1,sp)
 726  0183 a3ffff        	cpw	x,#65535
 727  0186 26eb          	jrne	L362
 728  0188               L162:
 729                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 731  0188 c6514c        	ld	a,20812
 732  018b a540          	bcp	a,#64
 733  018d 2604          	jrne	L572
 734                     ; 478     status = ERROR;
 736  018f 0f01          	clr	(OFST-2,sp)
 739  0191 2004          	jra	L772
 740  0193               L572:
 741                     ; 482     status = SUCCESS;
 743  0193 a601          	ld	a,#1
 744  0195 6b01          	ld	(OFST-2,sp),a
 746  0197               L772:
 747                     ; 485   return (ErrorStatus)status;
 749  0197 7b01          	ld	a,(OFST-2,sp)
 752  0199 5b03          	addw	sp,#3
 753  019b 81            	ret
 776                     ; 498 void RTC_ExitInitMode(void)
 776                     ; 499 {
 777                     	switch	.text
 778  019c               _RTC_ExitInitMode:
 782                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 784  019c 721f514c      	bres	20812,#7
 785                     ; 502 }
 788  01a0 81            	ret
 831                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 831                     ; 528 {
 832                     	switch	.text
 833  01a1               _RTC_WaitForSynchro:
 835  01a1 5203          	subw	sp,#3
 836       00000003      OFST:	set	3
 839                     ; 529   uint16_t rsfcount = 0;
 841  01a3 5f            	clrw	x
 842  01a4 1f02          	ldw	(OFST-1,sp),x
 844                     ; 530   ErrorStatus status = ERROR;
 846                     ; 533   RTC->WPR = 0xCA;
 848  01a6 35ca5159      	mov	20825,#202
 849                     ; 534   RTC->WPR = 0x53;
 851  01aa 35535159      	mov	20825,#83
 852                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 854  01ae c6514c        	ld	a,20812
 855  01b1 a45f          	and	a,#95
 856  01b3 c7514c        	ld	20812,a
 858  01b6 2007          	jra	L333
 859  01b8               L133:
 860                     ; 542     rsfcount++;
 862  01b8 1e02          	ldw	x,(OFST-1,sp)
 863  01ba 1c0001        	addw	x,#1
 864  01bd 1f02          	ldw	(OFST-1,sp),x
 866  01bf               L333:
 867                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 869  01bf c6514c        	ld	a,20812
 870  01c2 a520          	bcp	a,#32
 871  01c4 2607          	jrne	L733
 873  01c6 1e02          	ldw	x,(OFST-1,sp)
 874  01c8 a3ffff        	cpw	x,#65535
 875  01cb 26eb          	jrne	L133
 876  01cd               L733:
 877                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 879  01cd c6514c        	ld	a,20812
 880  01d0 a520          	bcp	a,#32
 881  01d2 2706          	jreq	L143
 882                     ; 548     status = SUCCESS;
 884  01d4 a601          	ld	a,#1
 885  01d6 6b01          	ld	(OFST-2,sp),a
 888  01d8 2002          	jra	L343
 889  01da               L143:
 890                     ; 552     status = ERROR;
 892  01da 0f01          	clr	(OFST-2,sp)
 894  01dc               L343:
 895                     ; 556   RTC->WPR = 0xFF; 
 897  01dc 35ff5159      	mov	20825,#255
 898                     ; 558   return (ErrorStatus)status;
 900  01e0 7b01          	ld	a,(OFST-2,sp)
 903  01e2 5b03          	addw	sp,#3
 904  01e4 81            	ret
 939                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 939                     ; 569 {
 940                     	switch	.text
 941  01e5               _RTC_RatioCmd:
 945                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 947                     ; 574   RTC->WPR = 0xCA;
 949  01e5 35ca5159      	mov	20825,#202
 950                     ; 575   RTC->WPR = 0x53;
 952  01e9 35535159      	mov	20825,#83
 953                     ; 577   if (NewState != DISABLE)
 955  01ed 4d            	tnz	a
 956  01ee 2706          	jreq	L363
 957                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 959  01f0 721a5148      	bset	20808,#5
 961  01f4 2004          	jra	L563
 962  01f6               L363:
 963                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 965  01f6 721b5148      	bres	20808,#5
 966  01fa               L563:
 967                     ; 589   RTC->WPR = 0xFF; 
 969  01fa 35ff5159      	mov	20825,#255
 970                     ; 590 }
 973  01fe 81            	ret
1009                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
1009                     ; 599 {
1010                     	switch	.text
1011  01ff               _RTC_BypassShadowCmd:
1015                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1017                     ; 604   RTC->WPR = 0xCA;
1019  01ff 35ca5159      	mov	20825,#202
1020                     ; 605   RTC->WPR = 0x53;
1022  0203 35535159      	mov	20825,#83
1023                     ; 607   if (NewState != DISABLE)
1025  0207 4d            	tnz	a
1026  0208 2706          	jreq	L504
1027                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1029  020a 72185148      	bset	20808,#4
1031  020e 2004          	jra	L704
1032  0210               L504:
1033                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1035  0210 72195148      	bres	20808,#4
1036  0214               L704:
1037                     ; 619   RTC->WPR = 0xFF; 
1039  0214 35ff5159      	mov	20825,#255
1040                     ; 620 }
1043  0218 81            	ret
1189                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1189                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1189                     ; 661 {
1190                     	switch	.text
1191  0219               _RTC_SetTime:
1193  0219 88            	push	a
1194  021a 88            	push	a
1195       00000001      OFST:	set	1
1198                     ; 662   ErrorStatus status = ERROR;
1200                     ; 663   uint8_t temp = 0;
1202                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1204                     ; 668   if (RTC_Format == RTC_Format_BIN)
1206  021b 4d            	tnz	a
1207  021c 2609          	jrne	L105
1208                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1210  021e c65148        	ld	a,20808
1211  0221 a540          	bcp	a,#64
1212  0223 2700          	jreq	L305
1213                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1215                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1218  0225               L305:
1219                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1221                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1223                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1226  0225 2007          	jra	L705
1227  0227               L105:
1228                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1230  0227 c65148        	ld	a,20808
1231  022a a540          	bcp	a,#64
1232  022c 2700          	jreq	L115
1233                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1235                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1238  022e               L115:
1239                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1241                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1243                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1245  022e               L705:
1246                     ; 701   RTC->WPR = 0xCA;
1248  022e 35ca5159      	mov	20825,#202
1249                     ; 702   RTC->WPR = 0x53;
1251  0232 35535159      	mov	20825,#83
1252                     ; 705   if (RTC_EnterInitMode() == ERROR)
1254  0236 cd0161        	call	_RTC_EnterInitMode
1256  0239 4d            	tnz	a
1257  023a 2608          	jrne	L515
1258                     ; 707     status = ERROR;
1260  023c 0f01          	clr	(OFST+0,sp)
1262                     ; 709     RTC->WPR = 0xFF; 
1264  023e 35ff5159      	mov	20825,#255
1266  0242 2072          	jra	L715
1267  0244               L515:
1268                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1270  0244 c65148        	ld	a,20808
1271  0247 a540          	bcp	a,#64
1272  0249 2708          	jreq	L125
1273                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1275                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1277  024b 1e05          	ldw	x,(OFST+4,sp)
1278  024d e603          	ld	a,(3,x)
1279  024f 6b01          	ld	(OFST+0,sp),a
1282  0251 2002          	jra	L325
1283  0253               L125:
1284                     ; 721       temp = 0;
1286  0253 0f01          	clr	(OFST+0,sp)
1288  0255               L325:
1289                     ; 724     if (RTC_Format != RTC_Format_BIN)
1291  0255 0d02          	tnz	(OFST+1,sp)
1292  0257 2718          	jreq	L525
1293                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1295  0259 1e05          	ldw	x,(OFST+4,sp)
1296  025b e602          	ld	a,(2,x)
1297  025d c75140        	ld	20800,a
1298                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1300  0260 1e05          	ldw	x,(OFST+4,sp)
1301  0262 e601          	ld	a,(1,x)
1302  0264 c75141        	ld	20801,a
1303                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1305  0267 1e05          	ldw	x,(OFST+4,sp)
1306  0269 f6            	ld	a,(x)
1307  026a 1a01          	or	a,(OFST+0,sp)
1308  026c c75142        	ld	20802,a
1310  026f 201f          	jra	L725
1311  0271               L525:
1312                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1314  0271 1e05          	ldw	x,(OFST+4,sp)
1315  0273 e602          	ld	a,(2,x)
1316  0275 cd0994        	call	L3_ByteToBcd2
1318  0278 c75140        	ld	20800,a
1319                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1321  027b 1e05          	ldw	x,(OFST+4,sp)
1322  027d e601          	ld	a,(1,x)
1323  027f cd0994        	call	L3_ByteToBcd2
1325  0282 c75141        	ld	20801,a
1326                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1328  0285 1e05          	ldw	x,(OFST+4,sp)
1329  0287 f6            	ld	a,(x)
1330  0288 cd0994        	call	L3_ByteToBcd2
1332  028b 1a01          	or	a,(OFST+0,sp)
1333  028d c75142        	ld	20802,a
1334  0290               L725:
1335                     ; 737     (void)(RTC->DR3);
1337  0290 c65146        	ld	a,20806
1338                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1340  0293 721f514c      	bres	20812,#7
1341                     ; 743     RTC->WPR = 0xFF; 
1343  0297 35ff5159      	mov	20825,#255
1344                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1346  029b c65148        	ld	a,20808
1347  029e a510          	bcp	a,#16
1348  02a0 2610          	jrne	L135
1349                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1351  02a2 cd01a1        	call	_RTC_WaitForSynchro
1353  02a5 4d            	tnz	a
1354  02a6 2604          	jrne	L335
1355                     ; 750         status = ERROR;
1357  02a8 0f01          	clr	(OFST+0,sp)
1360  02aa 200a          	jra	L715
1361  02ac               L335:
1362                     ; 754         status = SUCCESS;
1364  02ac a601          	ld	a,#1
1365  02ae 6b01          	ld	(OFST+0,sp),a
1367  02b0 2004          	jra	L715
1368  02b2               L135:
1369                     ; 759       status = SUCCESS;
1371  02b2 a601          	ld	a,#1
1372  02b4 6b01          	ld	(OFST+0,sp),a
1374  02b6               L715:
1375                     ; 763   return (ErrorStatus)status;
1377  02b6 7b01          	ld	a,(OFST+0,sp)
1380  02b8 85            	popw	x
1381  02b9 81            	ret
1418                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1418                     ; 776 {
1419                     	switch	.text
1420  02ba               _RTC_TimeStructInit:
1424                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1426  02ba 6f03          	clr	(3,x)
1427                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1429  02bc 7f            	clr	(x)
1430                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1432  02bd 6f01          	clr	(1,x)
1433                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1435  02bf 6f02          	clr	(2,x)
1436                     ; 782 }
1439  02c1 81            	ret
1494                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1494                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1494                     ; 800 {
1495                     	switch	.text
1496  02c2               _RTC_GetTime:
1498  02c2 88            	push	a
1499  02c3 88            	push	a
1500       00000001      OFST:	set	1
1503                     ; 801   uint8_t  tmpreg = 0;
1505                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1507                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1509  02c4 1e05          	ldw	x,(OFST+4,sp)
1510  02c6 c65140        	ld	a,20800
1511  02c9 e702          	ld	(2,x),a
1512                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1514  02cb 1e05          	ldw	x,(OFST+4,sp)
1515  02cd c65141        	ld	a,20801
1516  02d0 e701          	ld	(1,x),a
1517                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1519  02d2 c65142        	ld	a,20802
1520  02d5 6b01          	ld	(OFST+0,sp),a
1522                     ; 817   (void) (RTC->DR3) ;
1524  02d7 c65146        	ld	a,20806
1525                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1527  02da 7b01          	ld	a,(OFST+0,sp)
1528  02dc a4bf          	and	a,#191
1529  02de 1e05          	ldw	x,(OFST+4,sp)
1530  02e0 f7            	ld	(x),a
1531                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1533  02e1 7b01          	ld	a,(OFST+0,sp)
1534  02e3 a440          	and	a,#64
1535  02e5 1e05          	ldw	x,(OFST+4,sp)
1536  02e7 e703          	ld	(3,x),a
1537                     ; 827   if (RTC_Format == RTC_Format_BIN)
1539  02e9 0d02          	tnz	(OFST+1,sp)
1540  02eb 261f          	jrne	L706
1541                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1543  02ed 1e05          	ldw	x,(OFST+4,sp)
1544  02ef f6            	ld	a,(x)
1545  02f0 cd09b3        	call	L5_Bcd2ToByte
1547  02f3 1e05          	ldw	x,(OFST+4,sp)
1548  02f5 f7            	ld	(x),a
1549                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1551  02f6 1e05          	ldw	x,(OFST+4,sp)
1552  02f8 e601          	ld	a,(1,x)
1553  02fa cd09b3        	call	L5_Bcd2ToByte
1555  02fd 1e05          	ldw	x,(OFST+4,sp)
1556  02ff e701          	ld	(1,x),a
1557                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1559  0301 1e05          	ldw	x,(OFST+4,sp)
1560  0303 e602          	ld	a,(2,x)
1561  0305 cd09b3        	call	L5_Bcd2ToByte
1563  0308 1e05          	ldw	x,(OFST+4,sp)
1564  030a e702          	ld	(2,x),a
1565  030c               L706:
1566                     ; 834 }
1569  030c 85            	popw	x
1570  030d 81            	ret
1616                     ; 845 uint16_t RTC_GetSubSecond(void)
1616                     ; 846 {
1617                     	switch	.text
1618  030e               _RTC_GetSubSecond:
1620  030e 5206          	subw	sp,#6
1621       00000006      OFST:	set	6
1624                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1628                     ; 848   uint16_t ssrreg = 0;
1630                     ; 851   ssrhreg = RTC->SSRH;
1632  0310 c65157        	ld	a,20823
1633  0313 6b03          	ld	(OFST-3,sp),a
1635                     ; 852   ssrlreg = RTC->SSRL;
1637  0315 c65158        	ld	a,20824
1638  0318 6b04          	ld	(OFST-2,sp),a
1640                     ; 855   (void) (RTC->DR3);
1642  031a c65146        	ld	a,20806
1643                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1645  031d 7b04          	ld	a,(OFST-2,sp)
1646  031f 5f            	clrw	x
1647  0320 97            	ld	xl,a
1648  0321 1f01          	ldw	(OFST-5,sp),x
1650  0323 7b03          	ld	a,(OFST-3,sp)
1651  0325 5f            	clrw	x
1652  0326 97            	ld	xl,a
1653  0327 4f            	clr	a
1654  0328 02            	rlwa	x,a
1655  0329 01            	rrwa	x,a
1656  032a 1a02          	or	a,(OFST-4,sp)
1657  032c 01            	rrwa	x,a
1658  032d 1a01          	or	a,(OFST-5,sp)
1659  032f 01            	rrwa	x,a
1660  0330 1f05          	ldw	(OFST-1,sp),x
1662                     ; 859   return (uint16_t)(ssrreg);
1664  0332 1e05          	ldw	x,(OFST-1,sp)
1667  0334 5b06          	addw	sp,#6
1668  0336 81            	ret
1920                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1920                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1920                     ; 878 {
1921                     	switch	.text
1922  0337               _RTC_SetDate:
1924  0337 88            	push	a
1925  0338 89            	pushw	x
1926       00000002      OFST:	set	2
1929                     ; 879   ErrorStatus status = ERROR;
1931                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1933  0339 4d            	tnz	a
1934  033a 2616          	jrne	L757
1936  033c 1e06          	ldw	x,(OFST+4,sp)
1937  033e e601          	ld	a,(1,x)
1938  0340 a410          	and	a,#16
1939  0342 a110          	cp	a,#16
1940  0344 260c          	jrne	L757
1941                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1943  0346 1e06          	ldw	x,(OFST+4,sp)
1944  0348 e601          	ld	a,(1,x)
1945  034a a4ef          	and	a,#239
1946  034c ab0a          	add	a,#10
1947  034e 1e06          	ldw	x,(OFST+4,sp)
1948  0350 e701          	ld	(1,x),a
1949  0352               L757:
1950                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1952                     ; 888   if (RTC_Format == RTC_Format_BIN)
1954  0352 0d03          	tnz	(OFST+1,sp)
1955  0354 2600          	jrne	L167
1956                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1958                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1960                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1962                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1964                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1967  0356               L167:
1968                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1970                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1972                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1974                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1976                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1978                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1980                     ; 907   RTC->WPR = 0xCA;
1982  0356 35ca5159      	mov	20825,#202
1983                     ; 908   RTC->WPR = 0x53;
1985  035a 35535159      	mov	20825,#83
1986                     ; 911   if (RTC_EnterInitMode() == ERROR)
1988  035e cd0161        	call	_RTC_EnterInitMode
1990  0361 4d            	tnz	a
1991  0362 2608          	jrne	L567
1992                     ; 913     status = ERROR;
1994  0364 0f02          	clr	(OFST+0,sp)
1996                     ; 915     RTC->WPR = 0xFF; 
1998  0366 35ff5159      	mov	20825,#255
2000  036a 2073          	jra	L767
2001  036c               L567:
2002                     ; 919     (void)(RTC->TR1);
2004  036c c65140        	ld	a,20800
2005                     ; 922     if (RTC_Format != RTC_Format_BIN)
2007  036f 0d03          	tnz	(OFST+1,sp)
2008  0371 271f          	jreq	L177
2009                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2011  0373 1e06          	ldw	x,(OFST+4,sp)
2012  0375 e602          	ld	a,(2,x)
2013  0377 c75144        	ld	20804,a
2014                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2016  037a 1e06          	ldw	x,(OFST+4,sp)
2017  037c f6            	ld	a,(x)
2018  037d 97            	ld	xl,a
2019  037e a620          	ld	a,#32
2020  0380 42            	mul	x,a
2021  0381 9f            	ld	a,xl
2022  0382 1e06          	ldw	x,(OFST+4,sp)
2023  0384 ea01          	or	a,(1,x)
2024  0386 c75145        	ld	20805,a
2025                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2027  0389 1e06          	ldw	x,(OFST+4,sp)
2028  038b e603          	ld	a,(3,x)
2029  038d c75146        	ld	20806,a
2031  0390 202a          	jra	L377
2032  0392               L177:
2033                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2035  0392 1e06          	ldw	x,(OFST+4,sp)
2036  0394 e602          	ld	a,(2,x)
2037  0396 cd0994        	call	L3_ByteToBcd2
2039  0399 c75144        	ld	20804,a
2040                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2042  039c 1e06          	ldw	x,(OFST+4,sp)
2043  039e f6            	ld	a,(x)
2044  039f 97            	ld	xl,a
2045  03a0 a620          	ld	a,#32
2046  03a2 42            	mul	x,a
2047  03a3 9f            	ld	a,xl
2048  03a4 6b01          	ld	(OFST-1,sp),a
2050  03a6 1e06          	ldw	x,(OFST+4,sp)
2051  03a8 e601          	ld	a,(1,x)
2052  03aa cd0994        	call	L3_ByteToBcd2
2054  03ad 1a01          	or	a,(OFST-1,sp)
2055  03af c75145        	ld	20805,a
2056                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2058  03b2 1e06          	ldw	x,(OFST+4,sp)
2059  03b4 e603          	ld	a,(3,x)
2060  03b6 cd0994        	call	L3_ByteToBcd2
2062  03b9 c75146        	ld	20806,a
2063  03bc               L377:
2064                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2066  03bc 721f514c      	bres	20812,#7
2067                     ; 939     RTC->WPR = 0xFF; 
2069  03c0 35ff5159      	mov	20825,#255
2070                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2072  03c4 c65148        	ld	a,20808
2073  03c7 a510          	bcp	a,#16
2074  03c9 2610          	jrne	L577
2075                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2077  03cb cd01a1        	call	_RTC_WaitForSynchro
2079  03ce 4d            	tnz	a
2080  03cf 2604          	jrne	L777
2081                     ; 946         status = ERROR;
2083  03d1 0f02          	clr	(OFST+0,sp)
2086  03d3 200a          	jra	L767
2087  03d5               L777:
2088                     ; 950         status = SUCCESS;
2090  03d5 a601          	ld	a,#1
2091  03d7 6b02          	ld	(OFST+0,sp),a
2093  03d9 2004          	jra	L767
2094  03db               L577:
2095                     ; 955       status = SUCCESS;
2097  03db a601          	ld	a,#1
2098  03dd 6b02          	ld	(OFST+0,sp),a
2100  03df               L767:
2101                     ; 959   return (ErrorStatus)status;
2103  03df 7b02          	ld	a,(OFST+0,sp)
2106  03e1 5b03          	addw	sp,#3
2107  03e3 81            	ret
2144                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2144                     ; 969 {
2145                     	switch	.text
2146  03e4               _RTC_DateStructInit:
2150                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2152  03e4 a601          	ld	a,#1
2153  03e6 f7            	ld	(x),a
2154                     ; 972   RTC_DateStruct->RTC_Date = 1;
2156  03e7 a601          	ld	a,#1
2157  03e9 e702          	ld	(2,x),a
2158                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2160  03eb a601          	ld	a,#1
2161  03ed e701          	ld	(1,x),a
2162                     ; 974   RTC_DateStruct->RTC_Year = 0;
2164  03ef 6f03          	clr	(3,x)
2165                     ; 975 }
2168  03f1 81            	ret
2223                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2223                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2223                     ; 990 {
2224                     	switch	.text
2225  03f2               _RTC_GetDate:
2227  03f2 88            	push	a
2228  03f3 88            	push	a
2229       00000001      OFST:	set	1
2232                     ; 991   uint8_t tmpreg = 0;
2234                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2236                     ; 997   (void) (RTC->TR1) ;
2238  03f4 c65140        	ld	a,20800
2239                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2241  03f7 1e05          	ldw	x,(OFST+4,sp)
2242  03f9 c65144        	ld	a,20804
2243  03fc e702          	ld	(2,x),a
2244                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2246  03fe c65145        	ld	a,20805
2247  0401 6b01          	ld	(OFST+0,sp),a
2249                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2251  0403 1e05          	ldw	x,(OFST+4,sp)
2252  0405 c65146        	ld	a,20806
2253  0408 e703          	ld	(3,x),a
2254                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2256  040a 7b01          	ld	a,(OFST+0,sp)
2257  040c a41f          	and	a,#31
2258  040e 1e05          	ldw	x,(OFST+4,sp)
2259  0410 e701          	ld	(1,x),a
2260                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2262  0412 7b01          	ld	a,(OFST+0,sp)
2263  0414 a4e0          	and	a,#224
2264  0416 4e            	swap	a
2265  0417 44            	srl	a
2266  0418 a407          	and	a,#7
2267  041a 1e05          	ldw	x,(OFST+4,sp)
2268  041c f7            	ld	(x),a
2269                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2271  041d 0d02          	tnz	(OFST+1,sp)
2272  041f 2621          	jrne	L3501
2273                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2275  0421 1e05          	ldw	x,(OFST+4,sp)
2276  0423 e603          	ld	a,(3,x)
2277  0425 cd09b3        	call	L5_Bcd2ToByte
2279  0428 1e05          	ldw	x,(OFST+4,sp)
2280  042a e703          	ld	(3,x),a
2281                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2283  042c 1e05          	ldw	x,(OFST+4,sp)
2284  042e e601          	ld	a,(1,x)
2285  0430 cd09b3        	call	L5_Bcd2ToByte
2287  0433 1e05          	ldw	x,(OFST+4,sp)
2288  0435 e701          	ld	(1,x),a
2289                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2291  0437 1e05          	ldw	x,(OFST+4,sp)
2292  0439 e602          	ld	a,(2,x)
2293  043b cd09b3        	call	L5_Bcd2ToByte
2295  043e 1e05          	ldw	x,(OFST+4,sp)
2296  0440 e702          	ld	(2,x),a
2297  0442               L3501:
2298                     ; 1014 }
2301  0442 85            	popw	x
2302  0443 81            	ret
2443                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2443                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2443                     ; 1046 {
2444                     	switch	.text
2445  0444               _RTC_SetAlarm:
2447  0444 88            	push	a
2448  0445 5205          	subw	sp,#5
2449       00000005      OFST:	set	5
2452                     ; 1047   uint8_t tmpreg1 = 0;
2454                     ; 1048   uint8_t tmpreg2 = 0;
2456                     ; 1049   uint8_t tmpreg3 = 0;
2458                     ; 1050   uint8_t tmpreg4 = 0;
2460                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2462                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2464                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2466                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2468                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2470  0447 4d            	tnz	a
2471  0448 2609          	jrne	L1411
2472                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2474  044a c65148        	ld	a,20808
2475  044d a540          	bcp	a,#64
2476  044f 2700          	jreq	L3411
2477                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2479                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2482  0451               L3411:
2483                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2485                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2487                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2490  0451 2007          	jra	L7411
2491  0453               L1411:
2492                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2494  0453 c65148        	ld	a,20808
2495  0456 a540          	bcp	a,#64
2496  0458 2700          	jreq	L1511
2497                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2499                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2502  045a               L1511:
2503                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2505                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2507                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2509  045a               L7411:
2510                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2512  045a 1e09          	ldw	x,(OFST+4,sp)
2513  045c e604          	ld	a,(4,x)
2514  045e a510          	bcp	a,#16
2515  0460 2608          	jrne	L5511
2516                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2518  0462 1e09          	ldw	x,(OFST+4,sp)
2519  0464 e605          	ld	a,(5,x)
2520  0466 a140          	cp	a,#64
2521  0468 2600          	jrne	L7511
2522                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2525  046a               L7511:
2526                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2528                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2530  046a               L5511:
2531                     ; 1108   RTC->WPR = 0xCA;
2533  046a 35ca5159      	mov	20825,#202
2534                     ; 1109   RTC->WPR = 0x53;
2536  046e 35535159      	mov	20825,#83
2537                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2539  0472 0d06          	tnz	(OFST+1,sp)
2540  0474 2747          	jreq	L3611
2541                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2541                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2543  0476 1e09          	ldw	x,(OFST+4,sp)
2544  0478 e604          	ld	a,(4,x)
2545  047a a480          	and	a,#128
2546  047c 1e09          	ldw	x,(OFST+4,sp)
2547  047e ea02          	or	a,(2,x)
2548  0480 6b02          	ld	(OFST-3,sp),a
2550                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2550                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2552  0482 1e09          	ldw	x,(OFST+4,sp)
2553  0484 e604          	ld	a,(4,x)
2554  0486 48            	sll	a
2555  0487 a480          	and	a,#128
2556  0489 1e09          	ldw	x,(OFST+4,sp)
2557  048b ea01          	or	a,(1,x)
2558  048d 6b03          	ld	(OFST-2,sp),a
2560                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2560                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2560                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2562  048f 1e09          	ldw	x,(OFST+4,sp)
2563  0491 e604          	ld	a,(4,x)
2564  0493 48            	sll	a
2565  0494 48            	sll	a
2566  0495 a480          	and	a,#128
2567  0497 6b01          	ld	(OFST-4,sp),a
2569  0499 1e09          	ldw	x,(OFST+4,sp)
2570  049b e603          	ld	a,(3,x)
2571  049d 1e09          	ldw	x,(OFST+4,sp)
2572  049f fa            	or	a,(x)
2573  04a0 1a01          	or	a,(OFST-4,sp)
2574  04a2 6b04          	ld	(OFST-1,sp),a
2576                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2576                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2576                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2578  04a4 1e09          	ldw	x,(OFST+4,sp)
2579  04a6 e604          	ld	a,(4,x)
2580  04a8 48            	sll	a
2581  04a9 48            	sll	a
2582  04aa 48            	sll	a
2583  04ab a480          	and	a,#128
2584  04ad 6b01          	ld	(OFST-4,sp),a
2586  04af 1e09          	ldw	x,(OFST+4,sp)
2587  04b1 e605          	ld	a,(5,x)
2588  04b3 1e09          	ldw	x,(OFST+4,sp)
2589  04b5 ea06          	or	a,(6,x)
2590  04b7 1a01          	or	a,(OFST-4,sp)
2591  04b9 6b05          	ld	(OFST+0,sp),a
2594  04bb 2059          	jra	L5611
2595  04bd               L3611:
2596                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2596                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2598  04bd 1e09          	ldw	x,(OFST+4,sp)
2599  04bf e604          	ld	a,(4,x)
2600  04c1 a480          	and	a,#128
2601  04c3 6b01          	ld	(OFST-4,sp),a
2603  04c5 1e09          	ldw	x,(OFST+4,sp)
2604  04c7 e602          	ld	a,(2,x)
2605  04c9 cd0994        	call	L3_ByteToBcd2
2607  04cc 1a01          	or	a,(OFST-4,sp)
2608  04ce 6b02          	ld	(OFST-3,sp),a
2610                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2610                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2612  04d0 1e09          	ldw	x,(OFST+4,sp)
2613  04d2 e604          	ld	a,(4,x)
2614  04d4 48            	sll	a
2615  04d5 a480          	and	a,#128
2616  04d7 6b01          	ld	(OFST-4,sp),a
2618  04d9 1e09          	ldw	x,(OFST+4,sp)
2619  04db e601          	ld	a,(1,x)
2620  04dd cd0994        	call	L3_ByteToBcd2
2622  04e0 1a01          	or	a,(OFST-4,sp)
2623  04e2 6b03          	ld	(OFST-2,sp),a
2625                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2625                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2625                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2627  04e4 1e09          	ldw	x,(OFST+4,sp)
2628  04e6 e604          	ld	a,(4,x)
2629  04e8 48            	sll	a
2630  04e9 48            	sll	a
2631  04ea a480          	and	a,#128
2632  04ec 6b01          	ld	(OFST-4,sp),a
2634  04ee 1e09          	ldw	x,(OFST+4,sp)
2635  04f0 f6            	ld	a,(x)
2636  04f1 cd0994        	call	L3_ByteToBcd2
2638  04f4 1e09          	ldw	x,(OFST+4,sp)
2639  04f6 ea03          	or	a,(3,x)
2640  04f8 1a01          	or	a,(OFST-4,sp)
2641  04fa 6b04          	ld	(OFST-1,sp),a
2643                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2643                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2643                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2645  04fc 1e09          	ldw	x,(OFST+4,sp)
2646  04fe e604          	ld	a,(4,x)
2647  0500 48            	sll	a
2648  0501 48            	sll	a
2649  0502 48            	sll	a
2650  0503 a480          	and	a,#128
2651  0505 6b01          	ld	(OFST-4,sp),a
2653  0507 1e09          	ldw	x,(OFST+4,sp)
2654  0509 e606          	ld	a,(6,x)
2655  050b cd0994        	call	L3_ByteToBcd2
2657  050e 1e09          	ldw	x,(OFST+4,sp)
2658  0510 ea05          	or	a,(5,x)
2659  0512 1a01          	or	a,(OFST-4,sp)
2660  0514 6b05          	ld	(OFST+0,sp),a
2662  0516               L5611:
2663                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2665  0516 7b02          	ld	a,(OFST-3,sp)
2666  0518 c7515c        	ld	20828,a
2667                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2669  051b 7b03          	ld	a,(OFST-2,sp)
2670  051d c7515d        	ld	20829,a
2671                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2673  0520 7b04          	ld	a,(OFST-1,sp)
2674  0522 c7515e        	ld	20830,a
2675                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2677  0525 7b05          	ld	a,(OFST+0,sp)
2678  0527 c7515f        	ld	20831,a
2679                     ; 1154   RTC->WPR = 0xFF; 
2681  052a 35ff5159      	mov	20825,#255
2682                     ; 1155 }
2685  052e 5b06          	addw	sp,#6
2686  0530 81            	ret
2724                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2724                     ; 1166 {
2725                     	switch	.text
2726  0531               _RTC_AlarmStructInit:
2730                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2732  0531 6f03          	clr	(3,x)
2733                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2735  0533 7f            	clr	(x)
2736                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2738  0534 6f01          	clr	(1,x)
2739                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2741  0536 6f02          	clr	(2,x)
2742                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2744  0538 6f05          	clr	(5,x)
2745                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2747  053a a601          	ld	a,#1
2748  053c e706          	ld	(6,x),a
2749                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2751  053e a6f0          	ld	a,#240
2752  0540 e704          	ld	(4,x),a
2753                     ; 1179 }
2756  0542 81            	ret
2839                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2839                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2839                     ; 1190 {
2840                     	switch	.text
2841  0543               _RTC_GetAlarm:
2843  0543 88            	push	a
2844  0544 5204          	subw	sp,#4
2845       00000004      OFST:	set	4
2848                     ; 1191   uint8_t tmpreg1 = 0;
2850                     ; 1192   uint8_t tmpreg2 = 0;
2852                     ; 1193   uint8_t tmpreg3 = 0;
2854                     ; 1194   uint8_t tmpreg4 = 0;
2856                     ; 1195   uint8_t alarmmask = 0;
2858                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2860                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2862  0546 c6515c        	ld	a,20828
2863  0549 6b04          	ld	(OFST+0,sp),a
2865                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2867  054b c6515d        	ld	a,20829
2868  054e 6b01          	ld	(OFST-3,sp),a
2870                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2872  0550 c6515e        	ld	a,20830
2873  0553 6b02          	ld	(OFST-2,sp),a
2875                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2877  0555 c6515f        	ld	a,20831
2878  0558 6b03          	ld	(OFST-1,sp),a
2880                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2882  055a 7b04          	ld	a,(OFST+0,sp)
2883  055c a47f          	and	a,#127
2884  055e 1e08          	ldw	x,(OFST+4,sp)
2885  0560 e702          	ld	(2,x),a
2886                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2888  0562 7b04          	ld	a,(OFST+0,sp)
2889  0564 a480          	and	a,#128
2890  0566 6b04          	ld	(OFST+0,sp),a
2892                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2894  0568 7b01          	ld	a,(OFST-3,sp)
2895  056a a47f          	and	a,#127
2896  056c 1e08          	ldw	x,(OFST+4,sp)
2897  056e e701          	ld	(1,x),a
2898                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2900  0570 7b01          	ld	a,(OFST-3,sp)
2901  0572 a480          	and	a,#128
2902  0574 44            	srl	a
2903  0575 1a04          	or	a,(OFST+0,sp)
2904  0577 6b04          	ld	(OFST+0,sp),a
2906                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2908  0579 7b02          	ld	a,(OFST-2,sp)
2909  057b a43f          	and	a,#63
2910  057d 1e08          	ldw	x,(OFST+4,sp)
2911  057f f7            	ld	(x),a
2912                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2914  0580 7b02          	ld	a,(OFST-2,sp)
2915  0582 a440          	and	a,#64
2916  0584 1e08          	ldw	x,(OFST+4,sp)
2917  0586 e703          	ld	(3,x),a
2918                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2920  0588 7b02          	ld	a,(OFST-2,sp)
2921  058a a480          	and	a,#128
2922  058c 44            	srl	a
2923  058d 44            	srl	a
2924  058e 1a04          	or	a,(OFST+0,sp)
2925  0590 6b04          	ld	(OFST+0,sp),a
2927                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2929  0592 7b03          	ld	a,(OFST-1,sp)
2930  0594 a43f          	and	a,#63
2931  0596 1e08          	ldw	x,(OFST+4,sp)
2932  0598 e706          	ld	(6,x),a
2933                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2935  059a 7b03          	ld	a,(OFST-1,sp)
2936  059c a440          	and	a,#64
2937  059e 1e08          	ldw	x,(OFST+4,sp)
2938  05a0 e705          	ld	(5,x),a
2939                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2941  05a2 7b03          	ld	a,(OFST-1,sp)
2942  05a4 a480          	and	a,#128
2943  05a6 44            	srl	a
2944  05a7 44            	srl	a
2945  05a8 44            	srl	a
2946  05a9 1a04          	or	a,(OFST+0,sp)
2947  05ab 6b04          	ld	(OFST+0,sp),a
2949                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2951  05ad 7b04          	ld	a,(OFST+0,sp)
2952  05af 1e08          	ldw	x,(OFST+4,sp)
2953  05b1 e704          	ld	(4,x),a
2954                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2956  05b3 0d05          	tnz	(OFST+1,sp)
2957  05b5 262a          	jrne	L5421
2958                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2960  05b7 1e08          	ldw	x,(OFST+4,sp)
2961  05b9 f6            	ld	a,(x)
2962  05ba cd09b3        	call	L5_Bcd2ToByte
2964  05bd 1e08          	ldw	x,(OFST+4,sp)
2965  05bf f7            	ld	(x),a
2966                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2968  05c0 1e08          	ldw	x,(OFST+4,sp)
2969  05c2 e601          	ld	a,(1,x)
2970  05c4 cd09b3        	call	L5_Bcd2ToByte
2972  05c7 1e08          	ldw	x,(OFST+4,sp)
2973  05c9 e701          	ld	(1,x),a
2974                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2976  05cb 1e08          	ldw	x,(OFST+4,sp)
2977  05cd e602          	ld	a,(2,x)
2978  05cf cd09b3        	call	L5_Bcd2ToByte
2980  05d2 1e08          	ldw	x,(OFST+4,sp)
2981  05d4 e702          	ld	(2,x),a
2982                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2984  05d6 1e08          	ldw	x,(OFST+4,sp)
2985  05d8 e606          	ld	a,(6,x)
2986  05da cd09b3        	call	L5_Bcd2ToByte
2988  05dd 1e08          	ldw	x,(OFST+4,sp)
2989  05df e706          	ld	(6,x),a
2990  05e1               L5421:
2991                     ; 1233 }
2994  05e1 5b05          	addw	sp,#5
2995  05e3 81            	ret
3057                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3057                     ; 1243 {
3058                     	switch	.text
3059  05e4               _RTC_AlarmCmd:
3061  05e4 5203          	subw	sp,#3
3062       00000003      OFST:	set	3
3065                     ; 1244   __IO uint16_t alrawfcount = 0;
3067  05e6 5f            	clrw	x
3068  05e7 1f01          	ldw	(OFST-2,sp),x
3070                     ; 1245   ErrorStatus status = ERROR;
3072                     ; 1246   uint8_t temp1 = 0;
3074                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3076                     ; 1252   RTC->WPR = 0xCA;
3078  05e9 35ca5159      	mov	20825,#202
3079                     ; 1253   RTC->WPR = 0x53;
3081  05ed 35535159      	mov	20825,#83
3082                     ; 1256   if (NewState != DISABLE)
3084  05f1 4d            	tnz	a
3085  05f2 2711          	jreq	L7721
3086                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3088  05f4 72105149      	bset	20809,#0
3089                     ; 1259     status = SUCCESS;
3091  05f8 a601          	ld	a,#1
3092  05fa 6b03          	ld	(OFST+0,sp),a
3095  05fc               L1031:
3096                     ; 1283   RTC->WPR = 0xFF; 
3098  05fc 35ff5159      	mov	20825,#255
3099                     ; 1286   return (ErrorStatus)status;
3101  0600 7b03          	ld	a,(OFST+0,sp)
3104  0602 5b03          	addw	sp,#3
3105  0604 81            	ret
3106  0605               L7721:
3107                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3109  0605 72115149      	bres	20809,#0
3110                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3112  0609 c6514c        	ld	a,20812
3113  060c a401          	and	a,#1
3114  060e 6b03          	ld	(OFST+0,sp),a
3117  0610 2007          	jra	L7031
3118  0612               L3031:
3119                     ; 1269       alrawfcount++;
3121  0612 1e01          	ldw	x,(OFST-2,sp)
3122  0614 1c0001        	addw	x,#1
3123  0617 1f01          	ldw	(OFST-2,sp),x
3125  0619               L7031:
3126                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3128  0619 1e01          	ldw	x,(OFST-2,sp)
3129  061b a3ffff        	cpw	x,#65535
3130  061e 2704          	jreq	L3131
3132  0620 0d03          	tnz	(OFST+0,sp)
3133  0622 27ee          	jreq	L3031
3134  0624               L3131:
3135                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3137  0624 c6514c        	ld	a,20812
3138  0627 a501          	bcp	a,#1
3139  0629 2604          	jrne	L5131
3140                     ; 1274       status = ERROR;
3142  062b 0f03          	clr	(OFST+0,sp)
3145  062d 20cd          	jra	L1031
3146  062f               L5131:
3147                     ; 1278       status = SUCCESS;
3149  062f a601          	ld	a,#1
3150  0631 6b03          	ld	(OFST+0,sp),a
3152  0633 20c7          	jra	L1031
3349                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3349                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3349                     ; 1300 {
3350                     	switch	.text
3351  0635               _RTC_AlarmSubSecondConfig:
3353  0635 89            	pushw	x
3354  0636 88            	push	a
3355       00000001      OFST:	set	1
3358                     ; 1301   uint8_t alarmstatus = 0;
3360                     ; 1302   ErrorStatus status = ERROR;
3362                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3364                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3366                     ; 1309   RTC->WPR = 0xCA;
3368  0637 35ca5159      	mov	20825,#202
3369                     ; 1310   RTC->WPR = 0x53;
3371  063b 35535159      	mov	20825,#83
3372                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3374  063f c6514c        	ld	a,20812
3375  0642 a540          	bcp	a,#64
3376  0644 2626          	jrne	L3141
3377                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3379  0646 c65149        	ld	a,20809
3380  0649 aa01          	or	a,#1
3381  064b 6b01          	ld	(OFST+0,sp),a
3383                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3385  064d 72115149      	bres	20809,#0
3386                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3388  0651 9e            	ld	a,xh
3389  0652 c75164        	ld	20836,a
3390                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3392  0655 9f            	ld	a,xl
3393  0656 c75165        	ld	20837,a
3394                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3396  0659 7b06          	ld	a,(OFST+5,sp)
3397  065b c75166        	ld	20838,a
3398                     ; 1327     RTC->CR2 |= alarmstatus;
3400  065e c65149        	ld	a,20809
3401  0661 1a01          	or	a,(OFST+0,sp)
3402  0663 c75149        	ld	20809,a
3403                     ; 1329     status = SUCCESS;
3405  0666 a601          	ld	a,#1
3406  0668 6b01          	ld	(OFST+0,sp),a
3409  066a 2002          	jra	L5141
3410  066c               L3141:
3411                     ; 1333     status = ERROR;
3413  066c 0f01          	clr	(OFST+0,sp)
3415  066e               L5141:
3416                     ; 1337   RTC->WPR = 0xFF; 
3418  066e 35ff5159      	mov	20825,#255
3419                     ; 1339   return (ErrorStatus)status;
3421  0672 7b01          	ld	a,(OFST+0,sp)
3424  0674 5b03          	addw	sp,#3
3425  0676 81            	ret
3515                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3515                     ; 1370 {
3516                     	switch	.text
3517  0677               _RTC_WakeUpClockConfig:
3519  0677 88            	push	a
3520       00000000      OFST:	set	0
3523                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3525                     ; 1376   RTC->WPR = 0xCA;
3527  0678 35ca5159      	mov	20825,#202
3528                     ; 1377   RTC->WPR = 0x53;
3530  067c 35535159      	mov	20825,#83
3531                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3533  0680 72155149      	bres	20809,#2
3534                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3536  0684 c65148        	ld	a,20808
3537  0687 a4f8          	and	a,#248
3538  0689 c75148        	ld	20808,a
3539                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3541  068c c65148        	ld	a,20808
3542  068f 1a01          	or	a,(OFST+1,sp)
3543  0691 c75148        	ld	20808,a
3544                     ; 1389   RTC->WPR = 0xFF; 
3546  0694 35ff5159      	mov	20825,#255
3547                     ; 1390 }
3550  0698 84            	pop	a
3551  0699 81            	ret
3584                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3584                     ; 1401 {
3585                     	switch	.text
3586  069a               _RTC_SetWakeUpCounter:
3590                     ; 1403   RTC->WPR = 0xCA;
3592  069a 35ca5159      	mov	20825,#202
3593                     ; 1404   RTC->WPR = 0x53;
3595  069e 35535159      	mov	20825,#83
3596                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3598  06a2 9e            	ld	a,xh
3599  06a3 c75154        	ld	20820,a
3600                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3602  06a6 9f            	ld	a,xl
3603  06a7 c75155        	ld	20821,a
3604                     ; 1412   RTC->WPR = 0xFF; 
3606  06aa 35ff5159      	mov	20825,#255
3607                     ; 1413 }
3610  06ae 81            	ret
3643                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3643                     ; 1421 {
3644                     	switch	.text
3645  06af               _RTC_GetWakeUpCounter:
3647  06af 89            	pushw	x
3648       00000002      OFST:	set	2
3651                     ; 1422   uint16_t tmpreg = 0;
3653                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3655  06b0 c65154        	ld	a,20820
3656  06b3 5f            	clrw	x
3657  06b4 97            	ld	xl,a
3658  06b5 4f            	clr	a
3659  06b6 02            	rlwa	x,a
3660  06b7 1f01          	ldw	(OFST-1,sp),x
3662                     ; 1426   tmpreg |= RTC->WUTRL;
3664  06b9 c65155        	ld	a,20821
3665  06bc 5f            	clrw	x
3666  06bd 97            	ld	xl,a
3667  06be 01            	rrwa	x,a
3668  06bf 1a02          	or	a,(OFST+0,sp)
3669  06c1 01            	rrwa	x,a
3670  06c2 1a01          	or	a,(OFST-1,sp)
3671  06c4 01            	rrwa	x,a
3672  06c5 1f01          	ldw	(OFST-1,sp),x
3674                     ; 1429   return (uint16_t)tmpreg;
3676  06c7 1e01          	ldw	x,(OFST-1,sp)
3679  06c9 5b02          	addw	sp,#2
3680  06cb 81            	ret
3733                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3733                     ; 1441 {
3734                     	switch	.text
3735  06cc               _RTC_WakeUpCmd:
3737  06cc 5203          	subw	sp,#3
3738       00000003      OFST:	set	3
3741                     ; 1442   ErrorStatus status = ERROR;
3743                     ; 1443   uint16_t wutwfcount = 0;
3745  06ce 5f            	clrw	x
3746  06cf 1f02          	ldw	(OFST-1,sp),x
3748                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3750                     ; 1449   RTC->WPR = 0xCA;
3752  06d1 35ca5159      	mov	20825,#202
3753                     ; 1450   RTC->WPR = 0x53;
3755  06d5 35535159      	mov	20825,#83
3756                     ; 1452   if (NewState != DISABLE)
3758  06d9 4d            	tnz	a
3759  06da 2711          	jreq	L1351
3760                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3762  06dc 72145149      	bset	20809,#2
3763                     ; 1457     status = SUCCESS;
3765  06e0 a601          	ld	a,#1
3766  06e2 6b01          	ld	(OFST-2,sp),a
3769  06e4               L3351:
3770                     ; 1482   RTC->WPR = 0xFF; 
3772  06e4 35ff5159      	mov	20825,#255
3773                     ; 1485   return (ErrorStatus)status;
3775  06e8 7b01          	ld	a,(OFST-2,sp)
3778  06ea 5b03          	addw	sp,#3
3779  06ec 81            	ret
3780  06ed               L1351:
3781                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3783  06ed 72155149      	bres	20809,#2
3785  06f1 2007          	jra	L7351
3786  06f3               L5351:
3787                     ; 1467       wutwfcount++;
3789  06f3 1e02          	ldw	x,(OFST-1,sp)
3790  06f5 1c0001        	addw	x,#1
3791  06f8 1f02          	ldw	(OFST-1,sp),x
3793  06fa               L7351:
3794                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3796  06fa c6514c        	ld	a,20812
3797  06fd a504          	bcp	a,#4
3798  06ff 2607          	jrne	L3451
3800  0701 1e02          	ldw	x,(OFST-1,sp)
3801  0703 a3ffff        	cpw	x,#65535
3802  0706 26eb          	jrne	L5351
3803  0708               L3451:
3804                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3806  0708 c6514c        	ld	a,20812
3807  070b a504          	bcp	a,#4
3808  070d 2604          	jrne	L5451
3809                     ; 1473       status = ERROR;
3811  070f 0f01          	clr	(OFST-2,sp)
3814  0711 20d1          	jra	L3351
3815  0713               L5451:
3816                     ; 1477       status = SUCCESS;
3818  0713 a601          	ld	a,#1
3819  0715 6b01          	ld	(OFST-2,sp),a
3821  0717 20cb          	jra	L3351
3911                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3911                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3911                     ; 1524 {
3912                     	switch	.text
3913  0719               _RTC_DayLightSavingConfig:
3915  0719 89            	pushw	x
3916       00000000      OFST:	set	0
3919                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3921                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3923                     ; 1530   RTC->WPR = 0xCA;
3925  071a 35ca5159      	mov	20825,#202
3926                     ; 1531   RTC->WPR = 0x53;
3928  071e 35535159      	mov	20825,#83
3929                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3931  0722 7215514a      	bres	20810,#2
3932                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3934  0726 9f            	ld	a,xl
3935  0727 1a01          	or	a,(OFST+1,sp)
3936  0729 ca514a        	or	a,20810
3937  072c c7514a        	ld	20810,a
3938                     ; 1540   RTC->WPR = 0xFF; 
3940  072f 35ff5159      	mov	20825,#255
3941                     ; 1541 }
3944  0733 85            	popw	x
3945  0734 81            	ret
3970                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3970                     ; 1550 {
3971                     	switch	.text
3972  0735               _RTC_GetStoreOperation:
3976                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3978  0735 c6514a        	ld	a,20810
3979  0738 a404          	and	a,#4
3982  073a 81            	ret
4076                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4076                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4076                     ; 1589 {
4077                     	switch	.text
4078  073b               _RTC_OutputConfig:
4080  073b 89            	pushw	x
4081       00000000      OFST:	set	0
4084                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4086                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4088                     ; 1595   RTC->WPR = 0xCA;
4090  073c 35ca5159      	mov	20825,#202
4091                     ; 1596   RTC->WPR = 0x53;
4093  0740 35535159      	mov	20825,#83
4094                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4096  0744 c6514a        	ld	a,20810
4097  0747 a48f          	and	a,#143
4098  0749 c7514a        	ld	20810,a
4099                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4101  074c 9f            	ld	a,xl
4102  074d 1a01          	or	a,(OFST+1,sp)
4103  074f ca514a        	or	a,20810
4104  0752 c7514a        	ld	20810,a
4105                     ; 1605   RTC->WPR = 0xFF; 
4107  0755 35ff5159      	mov	20825,#255
4108                     ; 1606 }
4111  0759 85            	popw	x
4112  075a 81            	ret
4201                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4201                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4201                     ; 1641 {
4202                     	switch	.text
4203  075b               _RTC_SynchroShiftConfig:
4205  075b 88            	push	a
4206  075c 5203          	subw	sp,#3
4207       00000003      OFST:	set	3
4210                     ; 1642   uint8_t shiftrhreg = 0;
4212                     ; 1643   ErrorStatus status = ERROR;
4214                     ; 1644   uint16_t shpfcount = 0;
4216  075e 5f            	clrw	x
4217  075f 1f02          	ldw	(OFST-1,sp),x
4219                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4221                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4223                     ; 1651   RTC->WPR = 0xCA;
4225  0761 35ca5159      	mov	20825,#202
4226                     ; 1652   RTC->WPR = 0x53;
4228  0765 35535159      	mov	20825,#83
4229                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4231  0769 c6514c        	ld	a,20812
4232  076c a508          	bcp	a,#8
4233  076e 2717          	jreq	L7271
4235  0770 2007          	jra	L3371
4236  0772               L1371:
4237                     ; 1660       shpfcount++;
4239  0772 1e02          	ldw	x,(OFST-1,sp)
4240  0774 1c0001        	addw	x,#1
4241  0777 1f02          	ldw	(OFST-1,sp),x
4243  0779               L3371:
4244                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4246  0779 c6514c        	ld	a,20812
4247  077c a508          	bcp	a,#8
4248  077e 2707          	jreq	L7271
4250  0780 1e02          	ldw	x,(OFST-1,sp)
4251  0782 a3ffff        	cpw	x,#65535
4252  0785 26eb          	jrne	L1371
4253  0787               L7271:
4254                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4256  0787 c6514c        	ld	a,20812
4257  078a a508          	bcp	a,#8
4258  078c 2616          	jrne	L1471
4259                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4261  078e 7b07          	ld	a,(OFST+4,sp)
4262  0790 1a04          	or	a,(OFST+1,sp)
4263  0792 6b01          	ld	(OFST-2,sp),a
4265                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4267  0794 7b01          	ld	a,(OFST-2,sp)
4268  0796 c7515a        	ld	20826,a
4269                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4271  0799 7b08          	ld	a,(OFST+5,sp)
4272  079b c7515b        	ld	20827,a
4273                     ; 1672     status = SUCCESS;
4275  079e a601          	ld	a,#1
4276  07a0 6b01          	ld	(OFST-2,sp),a
4279  07a2 2002          	jra	L3471
4280  07a4               L1471:
4281                     ; 1676     status = ERROR;
4283  07a4 0f01          	clr	(OFST-2,sp)
4285  07a6               L3471:
4286                     ; 1680   RTC->WPR = 0xFF; 
4288  07a6 35ff5159      	mov	20825,#255
4289                     ; 1682   return (ErrorStatus)(status);
4291  07aa 7b01          	ld	a,(OFST-2,sp)
4294  07ac 5b04          	addw	sp,#4
4295  07ae 81            	ret
4421                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4421                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4421                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4421                     ; 1721 {
4422                     	switch	.text
4423  07af               _RTC_SmoothCalibConfig:
4425  07af 89            	pushw	x
4426  07b0 5203          	subw	sp,#3
4427       00000003      OFST:	set	3
4430                     ; 1722   ErrorStatus status = ERROR;
4432                     ; 1723   uint16_t recalpfcount = 0;
4434  07b2 5f            	clrw	x
4435  07b3 1f02          	ldw	(OFST-1,sp),x
4437                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4439                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4441                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4443                     ; 1731   RTC->WPR = 0xCA;
4445  07b5 35ca5159      	mov	20825,#202
4446                     ; 1732   RTC->WPR = 0x53;
4448  07b9 35535159      	mov	20825,#83
4449                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4451  07bd c6514c        	ld	a,20812
4452  07c0 a502          	bcp	a,#2
4453  07c2 2717          	jreq	L1202
4455  07c4 2007          	jra	L5202
4456  07c6               L3202:
4457                     ; 1740       recalpfcount++;
4459  07c6 1e02          	ldw	x,(OFST-1,sp)
4460  07c8 1c0001        	addw	x,#1
4461  07cb 1f02          	ldw	(OFST-1,sp),x
4463  07cd               L5202:
4464                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4466  07cd c6514c        	ld	a,20812
4467  07d0 a502          	bcp	a,#2
4468  07d2 2707          	jreq	L1202
4470  07d4 1e02          	ldw	x,(OFST-1,sp)
4471  07d6 a3ffff        	cpw	x,#65535
4472  07d9 26eb          	jrne	L3202
4473  07db               L1202:
4474                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4476  07db c6514c        	ld	a,20812
4477  07de a502          	bcp	a,#2
4478  07e0 2614          	jrne	L3302
4479                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4479                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4479                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4481  07e2 7b04          	ld	a,(OFST+1,sp)
4482  07e4 1a05          	or	a,(OFST+2,sp)
4483  07e6 1a08          	or	a,(OFST+5,sp)
4484  07e8 c7516a        	ld	20842,a
4485                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4487  07eb 7b09          	ld	a,(OFST+6,sp)
4488  07ed c7516b        	ld	20843,a
4489                     ; 1754     status = SUCCESS;
4491  07f0 a601          	ld	a,#1
4492  07f2 6b01          	ld	(OFST-2,sp),a
4495  07f4 2002          	jra	L5302
4496  07f6               L3302:
4497                     ; 1758     status = ERROR;
4499  07f6 0f01          	clr	(OFST-2,sp)
4501  07f8               L5302:
4502                     ; 1762   RTC->WPR = 0xFF; 
4504  07f8 35ff5159      	mov	20825,#255
4505                     ; 1764   return (ErrorStatus)(status);
4507  07fc 7b01          	ld	a,(OFST-2,sp)
4510  07fe 5b05          	addw	sp,#5
4511  0800 81            	ret
4569                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4569                     ; 1791 {
4570                     	switch	.text
4571  0801               _RTC_CalibOutputConfig:
4575                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4577                     ; 1796   RTC->WPR = 0xCA;
4579  0801 35ca5159      	mov	20825,#202
4580                     ; 1797   RTC->WPR = 0x53;
4582  0805 35535159      	mov	20825,#83
4583                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4585  0809 4d            	tnz	a
4586  080a 2706          	jreq	L5602
4587                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4589  080c 7216514a      	bset	20810,#3
4591  0810 2004          	jra	L7602
4592  0812               L5602:
4593                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4595  0812 7217514a      	bres	20810,#3
4596  0816               L7602:
4597                     ; 1811   RTC->WPR = 0xFF; 
4599  0816 35ff5159      	mov	20825,#255
4600                     ; 1812 }
4603  081a 81            	ret
4638                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4638                     ; 1821 {
4639                     	switch	.text
4640  081b               _RTC_CalibOutputCmd:
4644                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4646                     ; 1826   RTC->WPR = 0xCA;
4648  081b 35ca5159      	mov	20825,#202
4649                     ; 1827   RTC->WPR = 0x53;
4651  081f 35535159      	mov	20825,#83
4652                     ; 1829   if (NewState != DISABLE)
4654  0823 4d            	tnz	a
4655  0824 2706          	jreq	L7012
4656                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4658  0826 721e514a      	bset	20810,#7
4660  082a 2004          	jra	L1112
4661  082c               L7012:
4662                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4664  082c 721f514a      	bres	20810,#7
4665  0830               L1112:
4666                     ; 1841   RTC->WPR = 0xFF; 
4668  0830 35ff5159      	mov	20825,#255
4669                     ; 1842 }
4672  0834 81            	ret
4767                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4767                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4767                     ; 1873 {
4768                     	switch	.text
4769  0835               _RTC_TamperLevelConfig:
4771  0835 89            	pushw	x
4772       00000000      OFST:	set	0
4775                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4777                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4779                     ; 1879   RTC->WPR = 0xCA;
4781  0836 35ca5159      	mov	20825,#202
4782                     ; 1880   RTC->WPR = 0x53;
4784  083a 35535159      	mov	20825,#83
4785                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4787  083e 9f            	ld	a,xl
4788  083f 4d            	tnz	a
4789  0840 270a          	jreq	L7512
4790                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4792  0842 9e            	ld	a,xh
4793  0843 48            	sll	a
4794  0844 ca516c        	or	a,20844
4795  0847 c7516c        	ld	20844,a
4797  084a 200a          	jra	L1612
4798  084c               L7512:
4799                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4801  084c 7b01          	ld	a,(OFST+1,sp)
4802  084e 48            	sll	a
4803  084f 43            	cpl	a
4804  0850 c4516c        	and	a,20844
4805  0853 c7516c        	ld	20844,a
4806  0856               L1612:
4807                     ; 1894   RTC->WPR = 0xFF; 
4809  0856 35ff5159      	mov	20825,#255
4810                     ; 1895 }
4813  085a 85            	popw	x
4814  085b 81            	ret
4888                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4888                     ; 1904 {
4889                     	switch	.text
4890  085c               _RTC_TamperFilterConfig:
4892  085c 88            	push	a
4893       00000000      OFST:	set	0
4896                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4898                     ; 1910   RTC->WPR = 0xCA;
4900  085d 35ca5159      	mov	20825,#202
4901                     ; 1911   RTC->WPR = 0x53;
4903  0861 35535159      	mov	20825,#83
4904                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4906  0865 c6516d        	ld	a,20845
4907  0868 a4e7          	and	a,#231
4908  086a c7516d        	ld	20845,a
4909                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4911  086d c6516d        	ld	a,20845
4912  0870 1a01          	or	a,(OFST+1,sp)
4913  0872 c7516d        	ld	20845,a
4914                     ; 1920   RTC->WPR = 0xFF; 
4916  0875 35ff5159      	mov	20825,#255
4917                     ; 1922 }
4920  0879 84            	pop	a
4921  087a 81            	ret
5034                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5034                     ; 1932 {
5035                     	switch	.text
5036  087b               _RTC_TamperSamplingFreqConfig:
5038  087b 88            	push	a
5039       00000000      OFST:	set	0
5042                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5044                     ; 1937   RTC->WPR = 0xCA;
5046  087c 35ca5159      	mov	20825,#202
5047                     ; 1938   RTC->WPR = 0x53;
5049  0880 35535159      	mov	20825,#83
5050                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5052  0884 c6516d        	ld	a,20845
5053  0887 a4f8          	and	a,#248
5054  0889 c7516d        	ld	20845,a
5055                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5057  088c c6516d        	ld	a,20845
5058  088f 1a01          	or	a,(OFST+1,sp)
5059  0891 c7516d        	ld	20845,a
5060                     ; 1947   RTC->WPR = 0xFF; 
5062  0894 35ff5159      	mov	20825,#255
5063                     ; 1948 }
5066  0898 84            	pop	a
5067  0899 81            	ret
5150                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5150                     ; 1959 {
5151                     	switch	.text
5152  089a               _RTC_TamperPinsPrechargeDuration:
5154  089a 88            	push	a
5155       00000000      OFST:	set	0
5158                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5160                     ; 1964   RTC->WPR = 0xCA;
5162  089b 35ca5159      	mov	20825,#202
5163                     ; 1965   RTC->WPR = 0x53;
5165  089f 35535159      	mov	20825,#83
5166                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5168  08a3 c6516d        	ld	a,20845
5169  08a6 a41f          	and	a,#31
5170  08a8 c7516d        	ld	20845,a
5171                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5173  08ab c6516d        	ld	a,20845
5174  08ae 1a01          	or	a,(OFST+1,sp)
5175  08b0 c7516d        	ld	20845,a
5176                     ; 1974   RTC->WPR = 0xFF; 
5178  08b3 35ff5159      	mov	20825,#255
5179                     ; 1975 }
5182  08b7 84            	pop	a
5183  08b8 81            	ret
5228                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5228                     ; 1988                    FunctionalState NewState)
5228                     ; 1989 {
5229                     	switch	.text
5230  08b9               _RTC_TamperCmd:
5232  08b9 89            	pushw	x
5233       00000000      OFST:	set	0
5236                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5238                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5240                     ; 1996   RTC->WPR = 0xCA;
5242  08ba 35ca5159      	mov	20825,#202
5243                     ; 1997   RTC->WPR = 0x53;
5245  08be 35535159      	mov	20825,#83
5246                     ; 2000   if (NewState != DISABLE)
5248  08c2 9f            	ld	a,xl
5249  08c3 4d            	tnz	a
5250  08c4 2709          	jreq	L5332
5251                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5253  08c6 9e            	ld	a,xh
5254  08c7 ca516c        	or	a,20844
5255  08ca c7516c        	ld	20844,a
5257  08cd 2009          	jra	L7332
5258  08cf               L5332:
5259                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5261  08cf 7b01          	ld	a,(OFST+1,sp)
5262  08d1 43            	cpl	a
5263  08d2 c4516c        	and	a,20844
5264  08d5 c7516c        	ld	20844,a
5265  08d8               L7332:
5266                     ; 2013   RTC->WPR = 0xFF; 
5268  08d8 35ff5159      	mov	20825,#255
5269                     ; 2014 }
5272  08dc 85            	popw	x
5273  08dd 81            	ret
5345                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5345                     ; 2059 {
5346                     	switch	.text
5347  08de               _RTC_ITConfig:
5349  08de 89            	pushw	x
5350       00000000      OFST:	set	0
5353                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5355                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5357                     ; 2065   RTC->WPR = 0xCA;
5359  08df 35ca5159      	mov	20825,#202
5360                     ; 2066   RTC->WPR = 0x53;
5362  08e3 35535159      	mov	20825,#83
5363                     ; 2068   if (NewState != DISABLE)
5365  08e7 0d05          	tnz	(OFST+5,sp)
5366  08e9 2715          	jreq	L5732
5367                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5369  08eb 9f            	ld	a,xl
5370  08ec a4f0          	and	a,#240
5371  08ee ca5149        	or	a,20809
5372  08f1 c75149        	ld	20809,a
5373                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5375  08f4 7b02          	ld	a,(OFST+2,sp)
5376  08f6 a401          	and	a,#1
5377  08f8 ca516c        	or	a,20844
5378  08fb c7516c        	ld	20844,a
5380  08fe 2016          	jra	L7732
5381  0900               L5732:
5382                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5384  0900 7b02          	ld	a,(OFST+2,sp)
5385  0902 a4f0          	and	a,#240
5386  0904 43            	cpl	a
5387  0905 c45149        	and	a,20809
5388  0908 c75149        	ld	20809,a
5389                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5391  090b 7b02          	ld	a,(OFST+2,sp)
5392  090d a401          	and	a,#1
5393  090f 43            	cpl	a
5394  0910 c4516c        	and	a,20844
5395  0913 c7516c        	ld	20844,a
5396  0916               L7732:
5397                     ; 2082   RTC->WPR = 0xFF; 
5399  0916 35ff5159      	mov	20825,#255
5400                     ; 2083 }
5403  091a 85            	popw	x
5404  091b 81            	ret
5574                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5574                     ; 2091 {
5575                     	switch	.text
5576  091c               _RTC_GetFlagStatus:
5578  091c 89            	pushw	x
5579  091d 5203          	subw	sp,#3
5580       00000003      OFST:	set	3
5583                     ; 2092   FlagStatus flagstatus = RESET;
5585                     ; 2093   uint16_t tmpreg1 = 0;
5587                     ; 2094   uint16_t tmpreg2 = 0;
5589                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5591                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5593  091f c6514c        	ld	a,20812
5594  0922 5f            	clrw	x
5595  0923 97            	ld	xl,a
5596  0924 4f            	clr	a
5597  0925 02            	rlwa	x,a
5598  0926 1f02          	ldw	(OFST-1,sp),x
5600                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5602  0928 c6514d        	ld	a,20813
5603  092b 5f            	clrw	x
5604  092c 97            	ld	xl,a
5605  092d 01            	rrwa	x,a
5606  092e 1a03          	or	a,(OFST+0,sp)
5607  0930 01            	rrwa	x,a
5608  0931 1a02          	or	a,(OFST-1,sp)
5609  0933 01            	rrwa	x,a
5610  0934 1f02          	ldw	(OFST-1,sp),x
5612                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5614  0936 1e02          	ldw	x,(OFST-1,sp)
5615  0938 01            	rrwa	x,a
5616  0939 1405          	and	a,(OFST+2,sp)
5617  093b 01            	rrwa	x,a
5618  093c 1404          	and	a,(OFST+1,sp)
5619  093e 01            	rrwa	x,a
5620  093f a30000        	cpw	x,#0
5621  0942 2706          	jreq	L3742
5622                     ; 2106     flagstatus = SET;
5624  0944 a601          	ld	a,#1
5625  0946 6b01          	ld	(OFST-2,sp),a
5628  0948 2002          	jra	L5742
5629  094a               L3742:
5630                     ; 2110     flagstatus = RESET;
5632  094a 0f01          	clr	(OFST-2,sp)
5634  094c               L5742:
5635                     ; 2112   return (FlagStatus)flagstatus;
5637  094c 7b01          	ld	a,(OFST-2,sp)
5640  094e 5b05          	addw	sp,#5
5641  0950 81            	ret
5676                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5676                     ; 2123 {
5677                     	switch	.text
5678  0951               _RTC_ClearFlag:
5680  0951 89            	pushw	x
5681       00000000      OFST:	set	0
5684                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5686                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5688  0952 9f            	ld	a,xl
5689  0953 43            	cpl	a
5690  0954 c7514d        	ld	20813,a
5691                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5693  0957 7b01          	ld	a,(OFST+1,sp)
5694  0959 43            	cpl	a
5695  095a a47f          	and	a,#127
5696  095c c7514c        	ld	20812,a
5697                     ; 2130 }
5700  095f 85            	popw	x
5701  0960 81            	ret
5761                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5761                     ; 2139 {
5762                     	switch	.text
5763  0961               _RTC_GetITStatus:
5765  0961 89            	pushw	x
5766  0962 89            	pushw	x
5767       00000002      OFST:	set	2
5770                     ; 2140   ITStatus itstatus = RESET;
5772                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5776                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5778                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5780  0963 9f            	ld	a,xl
5781  0964 c45149        	and	a,20809
5782  0967 6b01          	ld	(OFST-1,sp),a
5784                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5786  0969 1e03          	ldw	x,(OFST+1,sp)
5787  096b 54            	srlw	x
5788  096c 54            	srlw	x
5789  096d 54            	srlw	x
5790  096e 54            	srlw	x
5791  096f 9f            	ld	a,xl
5792  0970 c4514d        	and	a,20813
5793  0973 6b02          	ld	(OFST+0,sp),a
5795                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5797  0975 0d01          	tnz	(OFST-1,sp)
5798  0977 270a          	jreq	L3452
5800  0979 0d02          	tnz	(OFST+0,sp)
5801  097b 2706          	jreq	L3452
5802                     ; 2155     itstatus = SET;
5804  097d a601          	ld	a,#1
5805  097f 6b02          	ld	(OFST+0,sp),a
5808  0981 2002          	jra	L5452
5809  0983               L3452:
5810                     ; 2159     itstatus = RESET;
5812  0983 0f02          	clr	(OFST+0,sp)
5814  0985               L5452:
5815                     ; 2162   return (ITStatus)itstatus;
5817  0985 7b02          	ld	a,(OFST+0,sp)
5820  0987 5b04          	addw	sp,#4
5821  0989 81            	ret
5857                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5857                     ; 2173 {
5858                     	switch	.text
5859  098a               _RTC_ClearITPendingBit:
5863                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5865                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5867  098a 54            	srlw	x
5868  098b 54            	srlw	x
5869  098c 54            	srlw	x
5870  098d 54            	srlw	x
5871  098e 9f            	ld	a,xl
5872  098f 43            	cpl	a
5873  0990 c7514d        	ld	20813,a
5874                     ; 2179 }
5877  0993 81            	ret
5916                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5916                     ; 2203 {
5917                     	switch	.text
5918  0994               L3_ByteToBcd2:
5920  0994 88            	push	a
5921  0995 88            	push	a
5922       00000001      OFST:	set	1
5925                     ; 2204   uint8_t bcdhigh = 0;
5927  0996 0f01          	clr	(OFST+0,sp)
5930  0998 2008          	jra	L7062
5931  099a               L3062:
5932                     ; 2208     bcdhigh++;
5934  099a 0c01          	inc	(OFST+0,sp)
5936                     ; 2209     Value -= 10;
5938  099c 7b02          	ld	a,(OFST+1,sp)
5939  099e a00a          	sub	a,#10
5940  09a0 6b02          	ld	(OFST+1,sp),a
5941  09a2               L7062:
5942                     ; 2206   while (Value >= 10)
5944  09a2 7b02          	ld	a,(OFST+1,sp)
5945  09a4 a10a          	cp	a,#10
5946  09a6 24f2          	jruge	L3062
5947                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5949  09a8 7b01          	ld	a,(OFST+0,sp)
5950  09aa 97            	ld	xl,a
5951  09ab a610          	ld	a,#16
5952  09ad 42            	mul	x,a
5953  09ae 9f            	ld	a,xl
5954  09af 1a02          	or	a,(OFST+1,sp)
5957  09b1 85            	popw	x
5958  09b2 81            	ret
5997                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5997                     ; 2221 {
5998                     	switch	.text
5999  09b3               L5_Bcd2ToByte:
6001  09b3 88            	push	a
6002  09b4 88            	push	a
6003       00000001      OFST:	set	1
6006                     ; 2222   uint8_t tmp = 0;
6008                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6010  09b5 a4f0          	and	a,#240
6011  09b7 4e            	swap	a
6012  09b8 a40f          	and	a,#15
6013  09ba 97            	ld	xl,a
6014  09bb a60a          	ld	a,#10
6015  09bd 42            	mul	x,a
6016  09be 9f            	ld	a,xl
6017  09bf 6b01          	ld	(OFST+0,sp),a
6019                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6021  09c1 7b02          	ld	a,(OFST+1,sp)
6022  09c3 a40f          	and	a,#15
6023  09c5 1b01          	add	a,(OFST+0,sp)
6026  09c7 85            	popw	x
6027  09c8 81            	ret
6040                     	xdef	_RTC_ClearITPendingBit
6041                     	xdef	_RTC_GetITStatus
6042                     	xdef	_RTC_ClearFlag
6043                     	xdef	_RTC_GetFlagStatus
6044                     	xdef	_RTC_ITConfig
6045                     	xdef	_RTC_TamperCmd
6046                     	xdef	_RTC_TamperPinsPrechargeDuration
6047                     	xdef	_RTC_TamperSamplingFreqConfig
6048                     	xdef	_RTC_TamperFilterConfig
6049                     	xdef	_RTC_TamperLevelConfig
6050                     	xdef	_RTC_CalibOutputCmd
6051                     	xdef	_RTC_CalibOutputConfig
6052                     	xdef	_RTC_SmoothCalibConfig
6053                     	xdef	_RTC_SynchroShiftConfig
6054                     	xdef	_RTC_OutputConfig
6055                     	xdef	_RTC_GetStoreOperation
6056                     	xdef	_RTC_DayLightSavingConfig
6057                     	xdef	_RTC_WakeUpCmd
6058                     	xdef	_RTC_GetWakeUpCounter
6059                     	xdef	_RTC_SetWakeUpCounter
6060                     	xdef	_RTC_WakeUpClockConfig
6061                     	xdef	_RTC_AlarmSubSecondConfig
6062                     	xdef	_RTC_AlarmCmd
6063                     	xdef	_RTC_GetAlarm
6064                     	xdef	_RTC_AlarmStructInit
6065                     	xdef	_RTC_SetAlarm
6066                     	xdef	_RTC_GetDate
6067                     	xdef	_RTC_DateStructInit
6068                     	xdef	_RTC_SetDate
6069                     	xdef	_RTC_GetSubSecond
6070                     	xdef	_RTC_GetTime
6071                     	xdef	_RTC_TimeStructInit
6072                     	xdef	_RTC_SetTime
6073                     	xdef	_RTC_BypassShadowCmd
6074                     	xdef	_RTC_RatioCmd
6075                     	xdef	_RTC_WaitForSynchro
6076                     	xdef	_RTC_ExitInitMode
6077                     	xdef	_RTC_EnterInitMode
6078                     	xdef	_RTC_WriteProtectionCmd
6079                     	xdef	_RTC_StructInit
6080                     	xdef	_RTC_Init
6081                     	xdef	_RTC_DeInit
6100                     	end
