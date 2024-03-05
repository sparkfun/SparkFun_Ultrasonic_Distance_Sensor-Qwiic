   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 198                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 198                     ; 142 {
 200                     	switch	.text
 201  0000               _I2C_DeInit:
 205                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 207  0000 7f            	clr	(x)
 208                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 210  0001 6f01          	clr	(1,x)
 211                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 213  0003 6f02          	clr	(2,x)
 214                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 216  0005 6f03          	clr	(3,x)
 217                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 219  0007 6f04          	clr	(4,x)
 220                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 222  0009 6f05          	clr	(5,x)
 223                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 225  000b 6f0a          	clr	(10,x)
 226                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 228  000d 6f0b          	clr	(11,x)
 229                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 231  000f 6f0c          	clr	(12,x)
 232                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 234  0011 a602          	ld	a,#2
 235  0013 e70d          	ld	(13,x),a
 236                     ; 153 }
 239  0015 81            	ret
 451                     .const:	section	.text
 452  0000               L01:
 453  0000 000f4240      	dc.l	1000000
 454  0004               L21:
 455  0004 000186a1      	dc.l	100001
 456  0008               L41:
 457  0008 00000004      	dc.l	4
 458                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 458                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 458                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 458                     ; 187 {
 459                     	switch	.text
 460  0016               _I2C_Init:
 462  0016 89            	pushw	x
 463  0017 520c          	subw	sp,#12
 464       0000000c      OFST:	set	12
 467                     ; 188   uint32_t result = 0x0004;
 469                     ; 189   uint16_t tmpval = 0;
 471                     ; 190   uint8_t tmpccrh = 0;
 473  0019 0f07          	clr	(OFST-5,sp)
 475                     ; 191   uint8_t input_clock = 0;
 477                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 479                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 481                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 483                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 485                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 487                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 489                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 491  001b cd0000        	call	_CLK_GetClockFreq
 493  001e ae0000        	ldw	x,#L01
 494  0021 cd0000        	call	c_ludv
 496  0024 b603          	ld	a,c_lreg+3
 497  0026 6b08          	ld	(OFST-4,sp),a
 499                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 501  0028 1e0d          	ldw	x,(OFST+1,sp)
 502  002a e602          	ld	a,(2,x)
 503  002c a4c0          	and	a,#192
 504  002e e702          	ld	(2,x),a
 505                     ; 209   I2Cx->FREQR |= input_clock;
 507  0030 1e0d          	ldw	x,(OFST+1,sp)
 508  0032 e602          	ld	a,(2,x)
 509  0034 1a08          	or	a,(OFST-4,sp)
 510  0036 e702          	ld	(2,x),a
 511                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 513  0038 1e0d          	ldw	x,(OFST+1,sp)
 514  003a f6            	ld	a,(x)
 515  003b a4fe          	and	a,#254
 516  003d f7            	ld	(x),a
 517                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 519  003e 1e0d          	ldw	x,(OFST+1,sp)
 520  0040 e60c          	ld	a,(12,x)
 521  0042 a430          	and	a,#48
 522  0044 e70c          	ld	(12,x),a
 523                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 525  0046 1e0d          	ldw	x,(OFST+1,sp)
 526  0048 6f0b          	clr	(11,x)
 527                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 529  004a 96            	ldw	x,sp
 530  004b 1c0011        	addw	x,#OFST+5
 531  004e cd0000        	call	c_ltor
 533  0051 ae0004        	ldw	x,#L21
 534  0054 cd0000        	call	c_lcmp
 536  0057 2403          	jruge	L61
 537  0059 cc00f7        	jp	L742
 538  005c               L61:
 539                     ; 223     tmpccrh = I2C_CCRH_FS;
 541  005c a680          	ld	a,#128
 542  005e 6b07          	ld	(OFST-5,sp),a
 544                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 546  0060 0d18          	tnz	(OFST+12,sp)
 547  0062 2633          	jrne	L152
 548                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 550  0064 96            	ldw	x,sp
 551  0065 1c0011        	addw	x,#OFST+5
 552  0068 cd0000        	call	c_ltor
 554  006b a603          	ld	a,#3
 555  006d cd0000        	call	c_smul
 557  0070 96            	ldw	x,sp
 558  0071 1c0001        	addw	x,#OFST-11
 559  0074 cd0000        	call	c_rtol
 562  0077 7b08          	ld	a,(OFST-4,sp)
 563  0079 b703          	ld	c_lreg+3,a
 564  007b 3f02          	clr	c_lreg+2
 565  007d 3f01          	clr	c_lreg+1
 566  007f 3f00          	clr	c_lreg
 567  0081 ae0000        	ldw	x,#L01
 568  0084 cd0000        	call	c_lmul
 570  0087 96            	ldw	x,sp
 571  0088 1c0001        	addw	x,#OFST-11
 572  008b cd0000        	call	c_ludv
 574  008e 96            	ldw	x,sp
 575  008f 1c0009        	addw	x,#OFST-3
 576  0092 cd0000        	call	c_rtol
 580  0095 2037          	jra	L352
 581  0097               L152:
 582                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 584  0097 96            	ldw	x,sp
 585  0098 1c0011        	addw	x,#OFST+5
 586  009b cd0000        	call	c_ltor
 588  009e a619          	ld	a,#25
 589  00a0 cd0000        	call	c_smul
 591  00a3 96            	ldw	x,sp
 592  00a4 1c0001        	addw	x,#OFST-11
 593  00a7 cd0000        	call	c_rtol
 596  00aa 7b08          	ld	a,(OFST-4,sp)
 597  00ac b703          	ld	c_lreg+3,a
 598  00ae 3f02          	clr	c_lreg+2
 599  00b0 3f01          	clr	c_lreg+1
 600  00b2 3f00          	clr	c_lreg
 601  00b4 ae0000        	ldw	x,#L01
 602  00b7 cd0000        	call	c_lmul
 604  00ba 96            	ldw	x,sp
 605  00bb 1c0001        	addw	x,#OFST-11
 606  00be cd0000        	call	c_ludv
 608  00c1 96            	ldw	x,sp
 609  00c2 1c0009        	addw	x,#OFST-3
 610  00c5 cd0000        	call	c_rtol
 613                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 615  00c8 7b07          	ld	a,(OFST-5,sp)
 616  00ca aa40          	or	a,#64
 617  00cc 6b07          	ld	(OFST-5,sp),a
 619  00ce               L352:
 620                     ; 239     if (result < (uint16_t)0x01)
 622  00ce 96            	ldw	x,sp
 623  00cf 1c0009        	addw	x,#OFST-3
 624  00d2 cd0000        	call	c_lzmp
 626  00d5 260a          	jrne	L552
 627                     ; 242       result = (uint16_t)0x0001;
 629  00d7 ae0001        	ldw	x,#1
 630  00da 1f0b          	ldw	(OFST-1,sp),x
 631  00dc ae0000        	ldw	x,#0
 632  00df 1f09          	ldw	(OFST-3,sp),x
 634  00e1               L552:
 635                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 637  00e1 7b08          	ld	a,(OFST-4,sp)
 638  00e3 97            	ld	xl,a
 639  00e4 a603          	ld	a,#3
 640  00e6 42            	mul	x,a
 641  00e7 a60a          	ld	a,#10
 642  00e9 cd0000        	call	c_sdivx
 644  00ec 5c            	incw	x
 645  00ed 1f05          	ldw	(OFST-7,sp),x
 647                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 649  00ef 7b06          	ld	a,(OFST-6,sp)
 650  00f1 1e0d          	ldw	x,(OFST+1,sp)
 651  00f3 e70d          	ld	(13,x),a
 653  00f5 205c          	jra	L752
 654  00f7               L742:
 655                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 657  00f7 96            	ldw	x,sp
 658  00f8 1c0011        	addw	x,#OFST+5
 659  00fb cd0000        	call	c_ltor
 661  00fe 3803          	sll	c_lreg+3
 662  0100 3902          	rlc	c_lreg+2
 663  0102 3901          	rlc	c_lreg+1
 664  0104 3900          	rlc	c_lreg
 665  0106 96            	ldw	x,sp
 666  0107 1c0001        	addw	x,#OFST-11
 667  010a cd0000        	call	c_rtol
 670  010d 7b08          	ld	a,(OFST-4,sp)
 671  010f b703          	ld	c_lreg+3,a
 672  0111 3f02          	clr	c_lreg+2
 673  0113 3f01          	clr	c_lreg+1
 674  0115 3f00          	clr	c_lreg
 675  0117 ae0000        	ldw	x,#L01
 676  011a cd0000        	call	c_lmul
 678  011d 96            	ldw	x,sp
 679  011e 1c0001        	addw	x,#OFST-11
 680  0121 cd0000        	call	c_ludv
 682  0124 b602          	ld	a,c_lreg+2
 683  0126 97            	ld	xl,a
 684  0127 b603          	ld	a,c_lreg+3
 685  0129 cd0000        	call	c_uitol
 687  012c 96            	ldw	x,sp
 688  012d 1c0009        	addw	x,#OFST-3
 689  0130 cd0000        	call	c_rtol
 692                     ; 259     if (result < (uint16_t)0x0004)
 694  0133 96            	ldw	x,sp
 695  0134 1c0009        	addw	x,#OFST-3
 696  0137 cd0000        	call	c_ltor
 698  013a ae0008        	ldw	x,#L41
 699  013d cd0000        	call	c_lcmp
 701  0140 240a          	jruge	L162
 702                     ; 262       result = (uint16_t)0x0004;
 704  0142 ae0004        	ldw	x,#4
 705  0145 1f0b          	ldw	(OFST-1,sp),x
 706  0147 ae0000        	ldw	x,#0
 707  014a 1f09          	ldw	(OFST-3,sp),x
 709  014c               L162:
 710                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 712  014c 7b08          	ld	a,(OFST-4,sp)
 713  014e 4c            	inc	a
 714  014f 1e0d          	ldw	x,(OFST+1,sp)
 715  0151 e70d          	ld	(13,x),a
 716  0153               L752:
 717                     ; 273   I2Cx->CCRL = (uint8_t)result;
 719  0153 7b0c          	ld	a,(OFST+0,sp)
 720  0155 1e0d          	ldw	x,(OFST+1,sp)
 721  0157 e70b          	ld	(11,x),a
 722                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 724  0159 7b07          	ld	a,(OFST-5,sp)
 725  015b 1e0d          	ldw	x,(OFST+1,sp)
 726  015d e70c          	ld	(12,x),a
 727                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 729  015f 1e0d          	ldw	x,(OFST+1,sp)
 730  0161 7b17          	ld	a,(OFST+11,sp)
 731  0163 aa01          	or	a,#1
 732  0165 fa            	or	a,(x)
 733  0166 f7            	ld	(x),a
 734                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 736  0167 1e0d          	ldw	x,(OFST+1,sp)
 737  0169 e601          	ld	a,(1,x)
 738  016b 1a19          	or	a,(OFST+13,sp)
 739  016d e701          	ld	(1,x),a
 740                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 742  016f 7b16          	ld	a,(OFST+10,sp)
 743  0171 1e0d          	ldw	x,(OFST+1,sp)
 744  0173 e703          	ld	(3,x),a
 745                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 745                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 747  0175 1e15          	ldw	x,(OFST+9,sp)
 748  0177 4f            	clr	a
 749  0178 01            	rrwa	x,a
 750  0179 48            	sll	a
 751  017a 59            	rlcw	x
 752  017b 01            	rrwa	x,a
 753  017c a406          	and	a,#6
 754  017e 5f            	clrw	x
 755  017f 6b04          	ld	(OFST-8,sp),a
 757  0181 7b1a          	ld	a,(OFST+14,sp)
 758  0183 aa40          	or	a,#64
 759  0185 1a04          	or	a,(OFST-8,sp)
 760  0187 1e0d          	ldw	x,(OFST+1,sp)
 761  0189 e704          	ld	(4,x),a
 762                     ; 286 }
 765  018b 5b0e          	addw	sp,#14
 766  018d 81            	ret
 833                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 833                     ; 296 {
 834                     	switch	.text
 835  018e               _I2C_Cmd:
 837  018e 89            	pushw	x
 838       00000000      OFST:	set	0
 841                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 843                     ; 301   if (NewState != DISABLE)
 845  018f 0d05          	tnz	(OFST+5,sp)
 846  0191 2706          	jreq	L713
 847                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 849  0193 f6            	ld	a,(x)
 850  0194 aa01          	or	a,#1
 851  0196 f7            	ld	(x),a
 853  0197 2006          	jra	L123
 854  0199               L713:
 855                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 857  0199 1e01          	ldw	x,(OFST+1,sp)
 858  019b f6            	ld	a,(x)
 859  019c a4fe          	and	a,#254
 860  019e f7            	ld	(x),a
 861  019f               L123:
 862                     ; 311 }
 865  019f 85            	popw	x
 866  01a0 81            	ret
 913                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 913                     ; 321 {
 914                     	switch	.text
 915  01a1               _I2C_GeneralCallCmd:
 917  01a1 89            	pushw	x
 918       00000000      OFST:	set	0
 921                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 923                     ; 326   if (NewState != DISABLE)
 925  01a2 0d05          	tnz	(OFST+5,sp)
 926  01a4 2706          	jreq	L743
 927                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 929  01a6 f6            	ld	a,(x)
 930  01a7 aa40          	or	a,#64
 931  01a9 f7            	ld	(x),a
 933  01aa 2006          	jra	L153
 934  01ac               L743:
 935                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 937  01ac 1e01          	ldw	x,(OFST+1,sp)
 938  01ae f6            	ld	a,(x)
 939  01af a4bf          	and	a,#191
 940  01b1 f7            	ld	(x),a
 941  01b2               L153:
 942                     ; 336 }
 945  01b2 85            	popw	x
 946  01b3 81            	ret
 993                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 993                     ; 348 {
 994                     	switch	.text
 995  01b4               _I2C_GenerateSTART:
 997  01b4 89            	pushw	x
 998       00000000      OFST:	set	0
1001                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1003                     ; 353   if (NewState != DISABLE)
1005  01b5 0d05          	tnz	(OFST+5,sp)
1006  01b7 2708          	jreq	L773
1007                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1009  01b9 e601          	ld	a,(1,x)
1010  01bb aa01          	or	a,#1
1011  01bd e701          	ld	(1,x),a
1013  01bf 2008          	jra	L104
1014  01c1               L773:
1015                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1017  01c1 1e01          	ldw	x,(OFST+1,sp)
1018  01c3 e601          	ld	a,(1,x)
1019  01c5 a4fe          	and	a,#254
1020  01c7 e701          	ld	(1,x),a
1021  01c9               L104:
1022                     ; 363 }
1025  01c9 85            	popw	x
1026  01ca 81            	ret
1073                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1073                     ; 373 {
1074                     	switch	.text
1075  01cb               _I2C_GenerateSTOP:
1077  01cb 89            	pushw	x
1078       00000000      OFST:	set	0
1081                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1083                     ; 378   if (NewState != DISABLE)
1085  01cc 0d05          	tnz	(OFST+5,sp)
1086  01ce 2708          	jreq	L724
1087                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1089  01d0 e601          	ld	a,(1,x)
1090  01d2 aa02          	or	a,#2
1091  01d4 e701          	ld	(1,x),a
1093  01d6 2008          	jra	L134
1094  01d8               L724:
1095                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1097  01d8 1e01          	ldw	x,(OFST+1,sp)
1098  01da e601          	ld	a,(1,x)
1099  01dc a4fd          	and	a,#253
1100  01de e701          	ld	(1,x),a
1101  01e0               L134:
1102                     ; 388 }
1105  01e0 85            	popw	x
1106  01e1 81            	ret
1154                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1154                     ; 398 {
1155                     	switch	.text
1156  01e2               _I2C_SoftwareResetCmd:
1158  01e2 89            	pushw	x
1159       00000000      OFST:	set	0
1162                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1164                     ; 402   if (NewState != DISABLE)
1166  01e3 0d05          	tnz	(OFST+5,sp)
1167  01e5 2708          	jreq	L754
1168                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1170  01e7 e601          	ld	a,(1,x)
1171  01e9 aa80          	or	a,#128
1172  01eb e701          	ld	(1,x),a
1174  01ed 2008          	jra	L164
1175  01ef               L754:
1176                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1178  01ef 1e01          	ldw	x,(OFST+1,sp)
1179  01f1 e601          	ld	a,(1,x)
1180  01f3 a47f          	and	a,#127
1181  01f5 e701          	ld	(1,x),a
1182  01f7               L164:
1183                     ; 412 }
1186  01f7 85            	popw	x
1187  01f8 81            	ret
1235                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1235                     ; 422 {
1236                     	switch	.text
1237  01f9               _I2C_StretchClockCmd:
1239  01f9 89            	pushw	x
1240       00000000      OFST:	set	0
1243                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1245                     ; 426   if (NewState != DISABLE)
1247  01fa 0d05          	tnz	(OFST+5,sp)
1248  01fc 2706          	jreq	L705
1249                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1251  01fe f6            	ld	a,(x)
1252  01ff a47f          	and	a,#127
1253  0201 f7            	ld	(x),a
1255  0202 2006          	jra	L115
1256  0204               L705:
1257                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1259  0204 1e01          	ldw	x,(OFST+1,sp)
1260  0206 f6            	ld	a,(x)
1261  0207 aa80          	or	a,#128
1262  0209 f7            	ld	(x),a
1263  020a               L115:
1264                     ; 437 }
1267  020a 85            	popw	x
1268  020b 81            	ret
1315                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1315                     ; 447 {
1316                     	switch	.text
1317  020c               _I2C_ARPCmd:
1319  020c 89            	pushw	x
1320       00000000      OFST:	set	0
1323                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1325                     ; 451   if (NewState != DISABLE)
1327  020d 0d05          	tnz	(OFST+5,sp)
1328  020f 2706          	jreq	L735
1329                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1331  0211 f6            	ld	a,(x)
1332  0212 aa10          	or	a,#16
1333  0214 f7            	ld	(x),a
1335  0215 2006          	jra	L145
1336  0217               L735:
1337                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1339  0217 1e01          	ldw	x,(OFST+1,sp)
1340  0219 f6            	ld	a,(x)
1341  021a a4ef          	and	a,#239
1342  021c f7            	ld	(x),a
1343  021d               L145:
1344                     ; 462 }
1347  021d 85            	popw	x
1348  021e 81            	ret
1396                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1396                     ; 472 {
1397                     	switch	.text
1398  021f               _I2C_AcknowledgeConfig:
1400  021f 89            	pushw	x
1401       00000000      OFST:	set	0
1404                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1406                     ; 476   if (NewState != DISABLE)
1408  0220 0d05          	tnz	(OFST+5,sp)
1409  0222 2708          	jreq	L765
1410                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1412  0224 e601          	ld	a,(1,x)
1413  0226 aa04          	or	a,#4
1414  0228 e701          	ld	(1,x),a
1416  022a 2008          	jra	L175
1417  022c               L765:
1418                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1420  022c 1e01          	ldw	x,(OFST+1,sp)
1421  022e e601          	ld	a,(1,x)
1422  0230 a4fb          	and	a,#251
1423  0232 e701          	ld	(1,x),a
1424  0234               L175:
1425                     ; 486 }
1428  0234 85            	popw	x
1429  0235 81            	ret
1481                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1481                     ; 495 {
1482                     	switch	.text
1483  0236               _I2C_OwnAddress2Config:
1485  0236 89            	pushw	x
1486  0237 88            	push	a
1487       00000001      OFST:	set	1
1490                     ; 496   uint8_t tmpreg = 0;
1492                     ; 499   tmpreg = I2Cx->OAR2;
1494  0238 e605          	ld	a,(5,x)
1495  023a 6b01          	ld	(OFST+0,sp),a
1497                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1499  023c 7b01          	ld	a,(OFST+0,sp)
1500  023e a401          	and	a,#1
1501  0240 6b01          	ld	(OFST+0,sp),a
1503                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1505  0242 7b06          	ld	a,(OFST+5,sp)
1506  0244 a4fe          	and	a,#254
1507  0246 1a01          	or	a,(OFST+0,sp)
1508  0248 6b01          	ld	(OFST+0,sp),a
1510                     ; 508   I2Cx->OAR2 = tmpreg;
1512  024a 7b01          	ld	a,(OFST+0,sp)
1513  024c 1e02          	ldw	x,(OFST+1,sp)
1514  024e e705          	ld	(5,x),a
1515                     ; 509 }
1518  0250 5b03          	addw	sp,#3
1519  0252 81            	ret
1566                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1566                     ; 519 {
1567                     	switch	.text
1568  0253               _I2C_DualAddressCmd:
1570  0253 89            	pushw	x
1571       00000000      OFST:	set	0
1574                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1576                     ; 523   if (NewState != DISABLE)
1578  0254 0d05          	tnz	(OFST+5,sp)
1579  0256 2708          	jreq	L346
1580                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1582  0258 e605          	ld	a,(5,x)
1583  025a aa01          	or	a,#1
1584  025c e705          	ld	(5,x),a
1586  025e 2008          	jra	L546
1587  0260               L346:
1588                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1590  0260 1e01          	ldw	x,(OFST+1,sp)
1591  0262 e605          	ld	a,(5,x)
1592  0264 a4fe          	and	a,#254
1593  0266 e705          	ld	(5,x),a
1594  0268               L546:
1595                     ; 533 }
1598  0268 85            	popw	x
1599  0269 81            	ret
1669                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1669                     ; 546 {
1670                     	switch	.text
1671  026a               _I2C_AckPositionConfig:
1673  026a 89            	pushw	x
1674       00000000      OFST:	set	0
1677                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1679                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1681  026b e601          	ld	a,(1,x)
1682  026d a4f7          	and	a,#247
1683  026f e701          	ld	(1,x),a
1684                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1686  0271 e601          	ld	a,(1,x)
1687  0273 1a05          	or	a,(OFST+5,sp)
1688  0275 e701          	ld	(1,x),a
1689                     ; 554 }
1692  0277 85            	popw	x
1693  0278 81            	ret
1762                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1762                     ; 566 {
1763                     	switch	.text
1764  0279               _I2C_SMBusAlertConfig:
1766  0279 89            	pushw	x
1767       00000000      OFST:	set	0
1770                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1772                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1774  027a 0d05          	tnz	(OFST+5,sp)
1775  027c 2708          	jreq	L737
1776                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1778  027e e601          	ld	a,(1,x)
1779  0280 aa20          	or	a,#32
1780  0282 e701          	ld	(1,x),a
1782  0284 2008          	jra	L147
1783  0286               L737:
1784                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1786  0286 1e01          	ldw	x,(OFST+1,sp)
1787  0288 e601          	ld	a,(1,x)
1788  028a a4df          	and	a,#223
1789  028c e701          	ld	(1,x),a
1790  028e               L147:
1791                     ; 581 }
1794  028e 85            	popw	x
1795  028f 81            	ret
1843                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1843                     ; 593 {
1844                     	switch	.text
1845  0290               _I2C_FastModeDutyCycleConfig:
1847  0290 89            	pushw	x
1848       00000000      OFST:	set	0
1851                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1853                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1855  0291 7b05          	ld	a,(OFST+5,sp)
1856  0293 a140          	cp	a,#64
1857  0295 2608          	jrne	L767
1858                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1860  0297 e60c          	ld	a,(12,x)
1861  0299 aa40          	or	a,#64
1862  029b e70c          	ld	(12,x),a
1864  029d 2008          	jra	L177
1865  029f               L767:
1866                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1868  029f 1e01          	ldw	x,(OFST+1,sp)
1869  02a1 e60c          	ld	a,(12,x)
1870  02a3 a4bf          	and	a,#191
1871  02a5 e70c          	ld	(12,x),a
1872  02a7               L177:
1873                     ; 608 }
1876  02a7 85            	popw	x
1877  02a8 81            	ret
1954                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1954                     ; 622 {
1955                     	switch	.text
1956  02a9               _I2C_Send7bitAddress:
1958  02a9 89            	pushw	x
1959       00000000      OFST:	set	0
1962                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1964                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1966                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1968  02aa 0d06          	tnz	(OFST+6,sp)
1969  02ac 2708          	jreq	L1301
1970                     ; 631     Address |= OAR1_ADD0_Set;
1972  02ae 7b05          	ld	a,(OFST+5,sp)
1973  02b0 aa01          	or	a,#1
1974  02b2 6b05          	ld	(OFST+5,sp),a
1976  02b4 2006          	jra	L3301
1977  02b6               L1301:
1978                     ; 636     Address &= OAR1_ADD0_Reset;
1980  02b6 7b05          	ld	a,(OFST+5,sp)
1981  02b8 a4fe          	and	a,#254
1982  02ba 6b05          	ld	(OFST+5,sp),a
1983  02bc               L3301:
1984                     ; 639   I2Cx->DR = Address;
1986  02bc 7b05          	ld	a,(OFST+5,sp)
1987  02be 1e01          	ldw	x,(OFST+1,sp)
1988  02c0 e706          	ld	(6,x),a
1989                     ; 640 }
1992  02c2 85            	popw	x
1993  02c3 81            	ret
2037                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2037                     ; 665 {
2038                     	switch	.text
2039  02c4               _I2C_SendData:
2041  02c4 89            	pushw	x
2042       00000000      OFST:	set	0
2045                     ; 667   I2Cx->DR = Data;
2047  02c5 7b05          	ld	a,(OFST+5,sp)
2048  02c7 1e01          	ldw	x,(OFST+1,sp)
2049  02c9 e706          	ld	(6,x),a
2050                     ; 668 }
2053  02cb 85            	popw	x
2054  02cc 81            	ret
2091                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2091                     ; 677 {
2092                     	switch	.text
2093  02cd               _I2C_ReceiveData:
2097                     ; 679   return ((uint8_t)I2Cx->DR);
2099  02cd e606          	ld	a,(6,x)
2102  02cf 81            	ret
2149                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2149                     ; 706 {
2150                     	switch	.text
2151  02d0               _I2C_TransmitPEC:
2153  02d0 89            	pushw	x
2154       00000000      OFST:	set	0
2157                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2159                     ; 710   if (NewState != DISABLE)
2161  02d1 0d05          	tnz	(OFST+5,sp)
2162  02d3 2708          	jreq	L3211
2163                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2165  02d5 e601          	ld	a,(1,x)
2166  02d7 aa10          	or	a,#16
2167  02d9 e701          	ld	(1,x),a
2169  02db 2008          	jra	L5211
2170  02dd               L3211:
2171                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2173  02dd 1e01          	ldw	x,(OFST+1,sp)
2174  02df e601          	ld	a,(1,x)
2175  02e1 a4ef          	and	a,#239
2176  02e3 e701          	ld	(1,x),a
2177  02e5               L5211:
2178                     ; 720 }
2181  02e5 85            	popw	x
2182  02e6 81            	ret
2229                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2229                     ; 730 {
2230                     	switch	.text
2231  02e7               _I2C_CalculatePEC:
2233  02e7 89            	pushw	x
2234       00000000      OFST:	set	0
2237                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2239                     ; 734   if (NewState != DISABLE)
2241  02e8 0d05          	tnz	(OFST+5,sp)
2242  02ea 2706          	jreq	L3511
2243                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2245  02ec f6            	ld	a,(x)
2246  02ed aa20          	or	a,#32
2247  02ef f7            	ld	(x),a
2249  02f0 2006          	jra	L5511
2250  02f2               L3511:
2251                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2253  02f2 1e01          	ldw	x,(OFST+1,sp)
2254  02f4 f6            	ld	a,(x)
2255  02f5 a4df          	and	a,#223
2256  02f7 f7            	ld	(x),a
2257  02f8               L5511:
2258                     ; 744 }
2261  02f8 85            	popw	x
2262  02f9 81            	ret
2332                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2332                     ; 756 {
2333                     	switch	.text
2334  02fa               _I2C_PECPositionConfig:
2336  02fa 89            	pushw	x
2337       00000000      OFST:	set	0
2340                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2342                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2344  02fb e601          	ld	a,(1,x)
2345  02fd a4f7          	and	a,#247
2346  02ff e701          	ld	(1,x),a
2347                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2349  0301 e601          	ld	a,(1,x)
2350  0303 1a05          	or	a,(OFST+5,sp)
2351  0305 e701          	ld	(1,x),a
2352                     ; 764 }
2355  0307 85            	popw	x
2356  0308 81            	ret
2393                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2393                     ; 773 {
2394                     	switch	.text
2395  0309               _I2C_GetPEC:
2399                     ; 775   return (I2Cx->PECR);
2401  0309 e60e          	ld	a,(14,x)
2404  030b 81            	ret
2451                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2451                     ; 804 {
2452                     	switch	.text
2453  030c               _I2C_DMACmd:
2455  030c 89            	pushw	x
2456       00000000      OFST:	set	0
2459                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2461                     ; 808   if (NewState != DISABLE)
2463  030d 0d05          	tnz	(OFST+5,sp)
2464  030f 2708          	jreq	L7521
2465                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2467  0311 e60a          	ld	a,(10,x)
2468  0313 aa08          	or	a,#8
2469  0315 e70a          	ld	(10,x),a
2471  0317 2008          	jra	L1621
2472  0319               L7521:
2473                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2475  0319 1e01          	ldw	x,(OFST+1,sp)
2476  031b e60a          	ld	a,(10,x)
2477  031d a4f7          	and	a,#247
2478  031f e70a          	ld	(10,x),a
2479  0321               L1621:
2480                     ; 818 }
2483  0321 85            	popw	x
2484  0322 81            	ret
2532                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2532                     ; 828 {
2533                     	switch	.text
2534  0323               _I2C_DMALastTransferCmd:
2536  0323 89            	pushw	x
2537       00000000      OFST:	set	0
2540                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2542                     ; 832   if (NewState != DISABLE)
2544  0324 0d05          	tnz	(OFST+5,sp)
2545  0326 2708          	jreq	L7031
2546                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2548  0328 e60a          	ld	a,(10,x)
2549  032a aa10          	or	a,#16
2550  032c e70a          	ld	(10,x),a
2552  032e 2008          	jra	L1131
2553  0330               L7031:
2554                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2556  0330 1e01          	ldw	x,(OFST+1,sp)
2557  0332 e60a          	ld	a,(10,x)
2558  0334 a4ef          	and	a,#239
2559  0336 e70a          	ld	(10,x),a
2560  0338               L1131:
2561                     ; 842 }
2564  0338 85            	popw	x
2565  0339 81            	ret
2754                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2754                     ; 955 {
2755                     	switch	.text
2756  033a               _I2C_ITConfig:
2758  033a 89            	pushw	x
2759       00000000      OFST:	set	0
2762                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2764                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2766                     ; 960   if (NewState != DISABLE)
2768  033b 0d07          	tnz	(OFST+7,sp)
2769  033d 2708          	jreq	L3141
2770                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2772  033f e60a          	ld	a,(10,x)
2773  0341 1a06          	or	a,(OFST+6,sp)
2774  0343 e70a          	ld	(10,x),a
2776  0345 2009          	jra	L5141
2777  0347               L3141:
2778                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2780  0347 1e01          	ldw	x,(OFST+1,sp)
2781  0349 7b06          	ld	a,(OFST+6,sp)
2782  034b 43            	cpl	a
2783  034c e40a          	and	a,(10,x)
2784  034e e70a          	ld	(10,x),a
2785  0350               L5141:
2786                     ; 970 }
2789  0350 85            	popw	x
2790  0351 81            	ret
2951                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2951                     ; 995 {
2952                     	switch	.text
2953  0352               _I2C_ReadRegister:
2955  0352 89            	pushw	x
2956  0353 5204          	subw	sp,#4
2957       00000004      OFST:	set	4
2960                     ; 996   __IO uint16_t tmp = 0;
2962  0355 5f            	clrw	x
2963  0356 1f03          	ldw	(OFST-1,sp),x
2965                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2967                     ; 1000   tmp = (uint16_t) I2Cx;
2969  0358 1e05          	ldw	x,(OFST+1,sp)
2970  035a 1f03          	ldw	(OFST-1,sp),x
2972                     ; 1001   tmp += I2C_Register;
2974  035c 7b09          	ld	a,(OFST+5,sp)
2975  035e 5f            	clrw	x
2976  035f 97            	ld	xl,a
2977  0360 1f01          	ldw	(OFST-3,sp),x
2979  0362 1e03          	ldw	x,(OFST-1,sp)
2980  0364 72fb01        	addw	x,(OFST-3,sp)
2981  0367 1f03          	ldw	(OFST-1,sp),x
2983                     ; 1004   return (*(__IO uint8_t *) tmp);
2985  0369 1e03          	ldw	x,(OFST-1,sp)
2986  036b f6            	ld	a,(x)
2989  036c 5b06          	addw	sp,#6
2990  036e 81            	ret
3240                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3240                     ; 1045 {
3241                     	switch	.text
3242  036f               _I2C_CheckEvent:
3244  036f 89            	pushw	x
3245  0370 5206          	subw	sp,#6
3246       00000006      OFST:	set	6
3249                     ; 1046   __IO uint16_t lastevent = 0x00;
3251  0372 5f            	clrw	x
3252  0373 1f04          	ldw	(OFST-2,sp),x
3254                     ; 1047   uint8_t flag1 = 0x00 ;
3256                     ; 1048   uint8_t flag2 = 0x00;
3258                     ; 1049   ErrorStatus status = ERROR;
3260                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3262                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3264  0375 1e0b          	ldw	x,(OFST+5,sp)
3265  0377 a30004        	cpw	x,#4
3266  037a 260c          	jrne	L5261
3267                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3269  037c 1e07          	ldw	x,(OFST+1,sp)
3270  037e e608          	ld	a,(8,x)
3271  0380 a404          	and	a,#4
3272  0382 5f            	clrw	x
3273  0383 97            	ld	xl,a
3274  0384 1f04          	ldw	(OFST-2,sp),x
3277  0386 2021          	jra	L7261
3278  0388               L5261:
3279                     ; 1060     flag1 = I2Cx->SR1;
3281  0388 1e07          	ldw	x,(OFST+1,sp)
3282  038a e607          	ld	a,(7,x)
3283  038c 6b03          	ld	(OFST-3,sp),a
3285                     ; 1061     flag2 = I2Cx->SR3;
3287  038e 1e07          	ldw	x,(OFST+1,sp)
3288  0390 e609          	ld	a,(9,x)
3289  0392 6b06          	ld	(OFST+0,sp),a
3291                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3293  0394 7b03          	ld	a,(OFST-3,sp)
3294  0396 5f            	clrw	x
3295  0397 97            	ld	xl,a
3296  0398 1f01          	ldw	(OFST-5,sp),x
3298  039a 7b06          	ld	a,(OFST+0,sp)
3299  039c 5f            	clrw	x
3300  039d 97            	ld	xl,a
3301  039e 4f            	clr	a
3302  039f 02            	rlwa	x,a
3303  03a0 01            	rrwa	x,a
3304  03a1 1a02          	or	a,(OFST-4,sp)
3305  03a3 01            	rrwa	x,a
3306  03a4 1a01          	or	a,(OFST-5,sp)
3307  03a6 01            	rrwa	x,a
3308  03a7 1f04          	ldw	(OFST-2,sp),x
3310  03a9               L7261:
3311                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3313  03a9 1e04          	ldw	x,(OFST-2,sp)
3314  03ab 01            	rrwa	x,a
3315  03ac 140c          	and	a,(OFST+6,sp)
3316  03ae 01            	rrwa	x,a
3317  03af 140b          	and	a,(OFST+5,sp)
3318  03b1 01            	rrwa	x,a
3319  03b2 130b          	cpw	x,(OFST+5,sp)
3320  03b4 2606          	jrne	L1361
3321                     ; 1068     status = SUCCESS;
3323  03b6 a601          	ld	a,#1
3324  03b8 6b06          	ld	(OFST+0,sp),a
3327  03ba 2002          	jra	L3361
3328  03bc               L1361:
3329                     ; 1073     status = ERROR;
3331  03bc 0f06          	clr	(OFST+0,sp)
3333  03be               L3361:
3334                     ; 1077   return status;
3336  03be 7b06          	ld	a,(OFST+0,sp)
3339  03c0 5b08          	addw	sp,#8
3340  03c2 81            	ret
3401                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3401                     ; 1096 {
3402                     	switch	.text
3403  03c3               _I2C_GetLastEvent:
3405  03c3 89            	pushw	x
3406  03c4 5206          	subw	sp,#6
3407       00000006      OFST:	set	6
3410                     ; 1097   __IO uint16_t lastevent = 0;
3412  03c6 5f            	clrw	x
3413  03c7 1f05          	ldw	(OFST-1,sp),x
3415                     ; 1098   uint16_t flag1 = 0;
3417                     ; 1099   uint16_t flag2 = 0;
3419                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3421  03c9 1e07          	ldw	x,(OFST+1,sp)
3422  03cb e608          	ld	a,(8,x)
3423  03cd a504          	bcp	a,#4
3424  03cf 2707          	jreq	L5661
3425                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3427  03d1 ae0004        	ldw	x,#4
3428  03d4 1f05          	ldw	(OFST-1,sp),x
3431  03d6 201d          	jra	L7661
3432  03d8               L5661:
3433                     ; 1108     flag1 = I2Cx->SR1;
3435  03d8 1e07          	ldw	x,(OFST+1,sp)
3436  03da e607          	ld	a,(7,x)
3437  03dc 5f            	clrw	x
3438  03dd 97            	ld	xl,a
3439  03de 1f01          	ldw	(OFST-5,sp),x
3441                     ; 1109     flag2 = I2Cx->SR3;
3443  03e0 1e07          	ldw	x,(OFST+1,sp)
3444  03e2 e609          	ld	a,(9,x)
3445  03e4 5f            	clrw	x
3446  03e5 97            	ld	xl,a
3447  03e6 1f03          	ldw	(OFST-3,sp),x
3449                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3451  03e8 1e03          	ldw	x,(OFST-3,sp)
3452  03ea 4f            	clr	a
3453  03eb 02            	rlwa	x,a
3454  03ec 01            	rrwa	x,a
3455  03ed 1a02          	or	a,(OFST-4,sp)
3456  03ef 01            	rrwa	x,a
3457  03f0 1a01          	or	a,(OFST-5,sp)
3458  03f2 01            	rrwa	x,a
3459  03f3 1f05          	ldw	(OFST-1,sp),x
3461  03f5               L7661:
3462                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3464  03f5 1e05          	ldw	x,(OFST-1,sp)
3467  03f7 5b08          	addw	sp,#8
3468  03f9 81            	ret
3721                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3721                     ; 1153 {
3722                     	switch	.text
3723  03fa               _I2C_GetFlagStatus:
3725  03fa 89            	pushw	x
3726  03fb 89            	pushw	x
3727       00000002      OFST:	set	2
3730                     ; 1154   uint8_t tempreg = 0;
3732  03fc 0f02          	clr	(OFST+0,sp)
3734                     ; 1155   uint8_t regindex = 0;
3736                     ; 1156   FlagStatus bitstatus = RESET;
3738                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3740                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3742  03fe 7b07          	ld	a,(OFST+5,sp)
3743  0400 6b01          	ld	(OFST-1,sp),a
3745                     ; 1164   switch (regindex)
3747  0402 7b01          	ld	a,(OFST-1,sp)
3749                     ; 1181     default:
3749                     ; 1182       break;
3750  0404 4a            	dec	a
3751  0405 2708          	jreq	L1761
3752  0407 4a            	dec	a
3753  0408 270d          	jreq	L3761
3754  040a 4a            	dec	a
3755  040b 2712          	jreq	L5761
3756  040d 2016          	jra	L7202
3757  040f               L1761:
3758                     ; 1167     case 0x01:
3758                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3760  040f 1e03          	ldw	x,(OFST+1,sp)
3761  0411 e607          	ld	a,(7,x)
3762  0413 6b02          	ld	(OFST+0,sp),a
3764                     ; 1169       break;
3766  0415 200e          	jra	L7202
3767  0417               L3761:
3768                     ; 1172     case 0x02:
3768                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3770  0417 1e03          	ldw	x,(OFST+1,sp)
3771  0419 e608          	ld	a,(8,x)
3772  041b 6b02          	ld	(OFST+0,sp),a
3774                     ; 1174       break;
3776  041d 2006          	jra	L7202
3777  041f               L5761:
3778                     ; 1177     case 0x03:
3778                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3780  041f 1e03          	ldw	x,(OFST+1,sp)
3781  0421 e609          	ld	a,(9,x)
3782  0423 6b02          	ld	(OFST+0,sp),a
3784                     ; 1179       break;
3786  0425               L7761:
3787                     ; 1181     default:
3787                     ; 1182       break;
3789  0425               L7202:
3790                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3792  0425 7b08          	ld	a,(OFST+6,sp)
3793  0427 1502          	bcp	a,(OFST+0,sp)
3794  0429 2706          	jreq	L1302
3795                     ; 1189     bitstatus = SET;
3797  042b a601          	ld	a,#1
3798  042d 6b02          	ld	(OFST+0,sp),a
3801  042f 2002          	jra	L3302
3802  0431               L1302:
3803                     ; 1194     bitstatus = RESET;
3805  0431 0f02          	clr	(OFST+0,sp)
3807  0433               L3302:
3808                     ; 1197   return bitstatus;
3810  0433 7b02          	ld	a,(OFST+0,sp)
3813  0435 5b04          	addw	sp,#4
3814  0437 81            	ret
3868                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3868                     ; 1230 {
3869                     	switch	.text
3870  0438               _I2C_ClearFlag:
3872  0438 89            	pushw	x
3873  0439 89            	pushw	x
3874       00000002      OFST:	set	2
3877                     ; 1231   uint16_t flagpos = 0;
3879                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3881                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3883  043a 7b07          	ld	a,(OFST+5,sp)
3884  043c 97            	ld	xl,a
3885  043d 7b08          	ld	a,(OFST+6,sp)
3886  043f a4ff          	and	a,#255
3887  0441 5f            	clrw	x
3888  0442 02            	rlwa	x,a
3889  0443 1f01          	ldw	(OFST-1,sp),x
3890  0445 01            	rrwa	x,a
3892                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3894  0446 7b02          	ld	a,(OFST+0,sp)
3895  0448 43            	cpl	a
3896  0449 1e03          	ldw	x,(OFST+1,sp)
3897  044b e708          	ld	(8,x),a
3898                     ; 1239 }
3901  044d 5b04          	addw	sp,#4
3902  044f 81            	ret
3976                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3976                     ; 1265 {
3977                     	switch	.text
3978  0450               _I2C_GetITStatus:
3980  0450 89            	pushw	x
3981  0451 5204          	subw	sp,#4
3982       00000004      OFST:	set	4
3985                     ; 1266   ITStatus bitstatus = RESET;
3987                     ; 1267   __IO uint8_t enablestatus = 0;
3989  0453 0f03          	clr	(OFST-1,sp)
3991                     ; 1268   uint16_t tempregister = 0;
3993                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3995                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3997  0455 7b09          	ld	a,(OFST+5,sp)
3998  0457 a407          	and	a,#7
3999  0459 5f            	clrw	x
4000  045a 97            	ld	xl,a
4001  045b 1f01          	ldw	(OFST-3,sp),x
4003                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4005  045d 1e05          	ldw	x,(OFST+1,sp)
4006  045f e60a          	ld	a,(10,x)
4007  0461 1402          	and	a,(OFST-2,sp)
4008  0463 6b03          	ld	(OFST-1,sp),a
4010                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4012  0465 7b09          	ld	a,(OFST+5,sp)
4013  0467 97            	ld	xl,a
4014  0468 7b0a          	ld	a,(OFST+6,sp)
4015  046a 9f            	ld	a,xl
4016  046b a430          	and	a,#48
4017  046d 97            	ld	xl,a
4018  046e 4f            	clr	a
4019  046f 02            	rlwa	x,a
4020  0470 a30100        	cpw	x,#256
4021  0473 2616          	jrne	L1212
4022                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4024  0475 1e05          	ldw	x,(OFST+1,sp)
4025  0477 e607          	ld	a,(7,x)
4026  0479 150a          	bcp	a,(OFST+6,sp)
4027  047b 270a          	jreq	L3212
4029  047d 0d03          	tnz	(OFST-1,sp)
4030  047f 2706          	jreq	L3212
4031                     ; 1284       bitstatus = SET;
4033  0481 a601          	ld	a,#1
4034  0483 6b04          	ld	(OFST+0,sp),a
4037  0485 2018          	jra	L7212
4038  0487               L3212:
4039                     ; 1289       bitstatus = RESET;
4041  0487 0f04          	clr	(OFST+0,sp)
4043  0489 2014          	jra	L7212
4044  048b               L1212:
4045                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4047  048b 1e05          	ldw	x,(OFST+1,sp)
4048  048d e608          	ld	a,(8,x)
4049  048f 150a          	bcp	a,(OFST+6,sp)
4050  0491 270a          	jreq	L1312
4052  0493 0d03          	tnz	(OFST-1,sp)
4053  0495 2706          	jreq	L1312
4054                     ; 1298       bitstatus = SET;
4056  0497 a601          	ld	a,#1
4057  0499 6b04          	ld	(OFST+0,sp),a
4060  049b 2002          	jra	L7212
4061  049d               L1312:
4062                     ; 1303       bitstatus = RESET;
4064  049d 0f04          	clr	(OFST+0,sp)
4066  049f               L7212:
4067                     ; 1307   return  bitstatus;
4069  049f 7b04          	ld	a,(OFST+0,sp)
4072  04a1 5b06          	addw	sp,#6
4073  04a3 81            	ret
4128                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4128                     ; 1341 {
4129                     	switch	.text
4130  04a4               _I2C_ClearITPendingBit:
4132  04a4 89            	pushw	x
4133  04a5 89            	pushw	x
4134       00000002      OFST:	set	2
4137                     ; 1342   uint16_t flagpos = 0;
4139                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4141                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4143  04a6 7b07          	ld	a,(OFST+5,sp)
4144  04a8 97            	ld	xl,a
4145  04a9 7b08          	ld	a,(OFST+6,sp)
4146  04ab a4ff          	and	a,#255
4147  04ad 5f            	clrw	x
4148  04ae 02            	rlwa	x,a
4149  04af 1f01          	ldw	(OFST-1,sp),x
4150  04b1 01            	rrwa	x,a
4152                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4154  04b2 7b02          	ld	a,(OFST+0,sp)
4155  04b4 43            	cpl	a
4156  04b5 1e03          	ldw	x,(OFST+1,sp)
4157  04b7 e708          	ld	(8,x),a
4158                     ; 1352 }
4161  04b9 5b04          	addw	sp,#4
4162  04bb 81            	ret
4175                     	xdef	_I2C_ClearITPendingBit
4176                     	xdef	_I2C_GetITStatus
4177                     	xdef	_I2C_ClearFlag
4178                     	xdef	_I2C_GetFlagStatus
4179                     	xdef	_I2C_GetLastEvent
4180                     	xdef	_I2C_CheckEvent
4181                     	xdef	_I2C_ReadRegister
4182                     	xdef	_I2C_ITConfig
4183                     	xdef	_I2C_DMALastTransferCmd
4184                     	xdef	_I2C_DMACmd
4185                     	xdef	_I2C_CalculatePEC
4186                     	xdef	_I2C_TransmitPEC
4187                     	xdef	_I2C_GetPEC
4188                     	xdef	_I2C_PECPositionConfig
4189                     	xdef	_I2C_ReceiveData
4190                     	xdef	_I2C_SendData
4191                     	xdef	_I2C_Send7bitAddress
4192                     	xdef	_I2C_SMBusAlertConfig
4193                     	xdef	_I2C_FastModeDutyCycleConfig
4194                     	xdef	_I2C_AckPositionConfig
4195                     	xdef	_I2C_DualAddressCmd
4196                     	xdef	_I2C_OwnAddress2Config
4197                     	xdef	_I2C_AcknowledgeConfig
4198                     	xdef	_I2C_GenerateSTOP
4199                     	xdef	_I2C_GenerateSTART
4200                     	xdef	_I2C_ARPCmd
4201                     	xdef	_I2C_StretchClockCmd
4202                     	xdef	_I2C_SoftwareResetCmd
4203                     	xdef	_I2C_GeneralCallCmd
4204                     	xdef	_I2C_Cmd
4205                     	xdef	_I2C_Init
4206                     	xdef	_I2C_DeInit
4207                     	xref	_CLK_GetClockFreq
4208                     	xref.b	c_lreg
4209                     	xref.b	c_x
4228                     	xref	c_uitol
4229                     	xref	c_sdivx
4230                     	xref	c_lzmp
4231                     	xref	c_rtol
4232                     	xref	c_smul
4233                     	xref	c_lmul
4234                     	xref	c_lcmp
4235                     	xref	c_ltor
4236                     	xref	c_ludv
4237                     	end
