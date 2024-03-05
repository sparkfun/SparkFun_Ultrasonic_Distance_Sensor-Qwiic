   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 93 void AES_DeInit(void)
  42                     ; 94 {
  44                     	switch	.text
  45  0000               _AES_DeInit:
  49                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  51  0000 351853d0      	mov	21456,#24
  52                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  54  0004 725f53d2      	clr	21458
  55                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  57  0008 725f53d3      	clr	21459
  58                     ; 99 }
  61  000c 81            	ret
 135                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 135                     ; 113 {
 136                     	switch	.text
 137  000d               _AES_OperationModeConfig:
 139  000d 88            	push	a
 140       00000000      OFST:	set	0
 143                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 145                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 147  000e c653d0        	ld	a,21456
 148  0011 a4f9          	and	a,#249
 149  0013 c753d0        	ld	21456,a
 150                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 152  0016 c653d0        	ld	a,21456
 153  0019 1a01          	or	a,(OFST+1,sp)
 154  001b c753d0        	ld	21456,a
 155                     ; 122 }
 158  001e 84            	pop	a
 159  001f 81            	ret
 214                     ; 132 void AES_Cmd(FunctionalState NewState)
 214                     ; 133 {
 215                     	switch	.text
 216  0020               _AES_Cmd:
 220                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 222                     ; 137   if (NewState != DISABLE)
 224  0020 4d            	tnz	a
 225  0021 2706          	jreq	L101
 226                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 228  0023 721053d0      	bset	21456,#0
 230  0027 2004          	jra	L301
 231  0029               L101:
 232                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 234  0029 721153d0      	bres	21456,#0
 235  002d               L301:
 236                     ; 145 }
 239  002d 81            	ret
 271                     ; 170 void AES_WriteSubData(uint8_t Data)
 271                     ; 171 {
 272                     	switch	.text
 273  002e               _AES_WriteSubData:
 277                     ; 173   AES->DINR = Data;
 279  002e c753d2        	ld	21458,a
 280                     ; 174 }
 283  0031 81            	ret
 315                     ; 183 void AES_WriteSubKey(uint8_t Key)
 315                     ; 184 {
 316                     	switch	.text
 317  0032               _AES_WriteSubKey:
 321                     ; 186   AES->DINR = Key;
 323  0032 c753d2        	ld	21458,a
 324                     ; 187 }
 327  0035 81            	ret
 350                     ; 195 uint8_t AES_ReadSubData(void)
 350                     ; 196 {
 351                     	switch	.text
 352  0036               _AES_ReadSubData:
 356                     ; 197   return AES->DOUTR;
 358  0036 c653d3        	ld	a,21459
 361  0039 81            	ret
 384                     ; 206 uint8_t AES_ReadSubKey(void)
 384                     ; 207 {
 385                     	switch	.text
 386  003a               _AES_ReadSubKey:
 390                     ; 208   return AES->DOUTR;
 392  003a c653d3        	ld	a,21459
 395  003d 81            	ret
 454                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 454                     ; 238 {
 455                     	switch	.text
 456  003e               _AES_DMAConfig:
 458  003e 89            	pushw	x
 459       00000000      OFST:	set	0
 462                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 464                     ; 242   if (NewState != DISABLE)
 466  003f 9f            	ld	a,xl
 467  0040 4d            	tnz	a
 468  0041 2709          	jreq	L502
 469                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 471  0043 9e            	ld	a,xh
 472  0044 ca53d0        	or	a,21456
 473  0047 c753d0        	ld	21456,a
 475  004a 2009          	jra	L702
 476  004c               L502:
 477                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 479  004c 7b01          	ld	a,(OFST+1,sp)
 480  004e 43            	cpl	a
 481  004f c453d0        	and	a,21456
 482  0052 c753d0        	ld	21456,a
 483  0055               L702:
 484                     ; 252 }
 487  0055 85            	popw	x
 488  0056 81            	ret
 553                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 553                     ; 282 {
 554                     	switch	.text
 555  0057               _AES_ITConfig:
 557  0057 89            	pushw	x
 558       00000000      OFST:	set	0
 561                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 563                     ; 285   assert_param(IS_AES_IT(AES_IT));
 565                     ; 287   if (NewState != DISABLE)
 567  0058 9f            	ld	a,xl
 568  0059 4d            	tnz	a
 569  005a 2709          	jreq	L342
 570                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 572  005c 9e            	ld	a,xh
 573  005d ca53d0        	or	a,21456
 574  0060 c753d0        	ld	21456,a
 576  0063 2009          	jra	L542
 577  0065               L342:
 578                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 580  0065 7b01          	ld	a,(OFST+1,sp)
 581  0067 43            	cpl	a
 582  0068 c453d0        	and	a,21456
 583  006b c753d0        	ld	21456,a
 584  006e               L542:
 585                     ; 295 }
 588  006e 85            	popw	x
 589  006f 81            	ret
 682                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 682                     ; 308 {
 683                     	switch	.text
 684  0070               _AES_GetFlagStatus:
 686  0070 88            	push	a
 687  0071 88            	push	a
 688       00000001      OFST:	set	1
 691                     ; 309   FlagStatus status = RESET;
 693                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 695                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 697  0072 a101          	cp	a,#1
 698  0074 2611          	jrne	L313
 699                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 701  0076 c653d1        	ld	a,21457
 702  0079 a501          	bcp	a,#1
 703  007b 2706          	jreq	L513
 704                     ; 319       status = (FlagStatus) SET;
 706  007d a601          	ld	a,#1
 707  007f 6b01          	ld	(OFST+0,sp),a
 710  0081 202a          	jra	L123
 711  0083               L513:
 712                     ; 324       status = (FlagStatus) RESET;
 714  0083 0f01          	clr	(OFST+0,sp)
 716  0085 2026          	jra	L123
 717  0087               L313:
 718                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 720  0087 7b02          	ld	a,(OFST+1,sp)
 721  0089 a102          	cp	a,#2
 722  008b 2611          	jrne	L323
 723                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 725  008d c653d1        	ld	a,21457
 726  0090 a502          	bcp	a,#2
 727  0092 2706          	jreq	L523
 728                     ; 332       status = (FlagStatus) SET;
 730  0094 a601          	ld	a,#1
 731  0096 6b01          	ld	(OFST+0,sp),a
 734  0098 2013          	jra	L123
 735  009a               L523:
 736                     ; 337       status = (FlagStatus) RESET;
 738  009a 0f01          	clr	(OFST+0,sp)
 740  009c 200f          	jra	L123
 741  009e               L323:
 742                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 744  009e c653d1        	ld	a,21457
 745  00a1 a504          	bcp	a,#4
 746  00a3 2706          	jreq	L333
 747                     ; 345       status = (FlagStatus) SET;
 749  00a5 a601          	ld	a,#1
 750  00a7 6b01          	ld	(OFST+0,sp),a
 753  00a9 2002          	jra	L123
 754  00ab               L333:
 755                     ; 350       status = (FlagStatus) RESET;
 757  00ab 0f01          	clr	(OFST+0,sp)
 759  00ad               L123:
 760                     ; 354   return ((FlagStatus) status);
 762  00ad 7b01          	ld	a,(OFST+0,sp)
 765  00af 85            	popw	x
 766  00b0 81            	ret
 801                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 801                     ; 367 {
 802                     	switch	.text
 803  00b1               _AES_ClearFlag:
 807                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 809                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 811  00b1 a101          	cp	a,#1
 812  00b3 2606          	jrne	L553
 813                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 815  00b5 721653d0      	bset	21456,#3
 817  00b9 2004          	jra	L753
 818  00bb               L553:
 819                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 821  00bb 721853d0      	bset	21456,#4
 822  00bf               L753:
 823                     ; 382 }
 826  00bf 81            	ret
 892                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 892                     ; 393 {
 893                     	switch	.text
 894  00c0               _AES_GetITStatus:
 896  00c0 88            	push	a
 897  00c1 89            	pushw	x
 898       00000002      OFST:	set	2
 901                     ; 394   ITStatus itstatus = RESET;
 903                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 905                     ; 398   assert_param(IS_AES_IT(AES_IT));
 907                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 909  00c2 c653d0        	ld	a,21456
 910  00c5 a420          	and	a,#32
 911  00c7 6b01          	ld	(OFST-1,sp),a
 913                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 915  00c9 c653d1        	ld	a,21457
 916  00cc a401          	and	a,#1
 917  00ce 6b02          	ld	(OFST+0,sp),a
 919                     ; 404   if (AES_IT == AES_IT_CCIE)
 921  00d0 7b03          	ld	a,(OFST+1,sp)
 922  00d2 a120          	cp	a,#32
 923  00d4 2612          	jrne	L314
 924                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 926  00d6 0d01          	tnz	(OFST-1,sp)
 927  00d8 270a          	jreq	L514
 929  00da 0d02          	tnz	(OFST+0,sp)
 930  00dc 2706          	jreq	L514
 931                     ; 410       itstatus = (ITStatus) SET;
 933  00de a601          	ld	a,#1
 934  00e0 6b02          	ld	(OFST+0,sp),a
 937  00e2 201e          	jra	L124
 938  00e4               L514:
 939                     ; 415       itstatus = (ITStatus) RESET;
 941  00e4 0f02          	clr	(OFST+0,sp)
 943  00e6 201a          	jra	L124
 944  00e8               L314:
 945                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 947  00e8 c653d0        	ld	a,21456
 948  00eb a540          	bcp	a,#64
 949  00ed 2711          	jreq	L324
 950                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 952  00ef c653d1        	ld	a,21457
 953  00f2 a506          	bcp	a,#6
 954  00f4 2706          	jreq	L524
 955                     ; 427         itstatus = (ITStatus) SET;
 957  00f6 a601          	ld	a,#1
 958  00f8 6b02          	ld	(OFST+0,sp),a
 961  00fa 2006          	jra	L124
 962  00fc               L524:
 963                     ; 432         itstatus = (ITStatus) RESET;
 965  00fc 0f02          	clr	(OFST+0,sp)
 967  00fe 2002          	jra	L124
 968  0100               L324:
 969                     ; 438       itstatus = (ITStatus) RESET;
 971  0100 0f02          	clr	(OFST+0,sp)
 973  0102               L124:
 974                     ; 443   return ((ITStatus)itstatus);
 976  0102 7b02          	ld	a,(OFST+0,sp)
 979  0104 5b03          	addw	sp,#3
 980  0106 81            	ret
1016                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1016                     ; 455 {
1017                     	switch	.text
1018  0107               _AES_ClearITPendingBit:
1022                     ; 457   assert_param(IS_AES_IT(AES_IT));
1024                     ; 460   if (AES_IT == AES_IT_CCIE)
1026  0107 a120          	cp	a,#32
1027  0109 2606          	jrne	L154
1028                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
1030  010b 721653d0      	bset	21456,#3
1032  010f 2004          	jra	L354
1033  0111               L154:
1034                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1036  0111 721853d0      	bset	21456,#4
1037  0115               L354:
1038                     ; 470 }
1041  0115 81            	ret
1054                     	xdef	_AES_ClearITPendingBit
1055                     	xdef	_AES_GetITStatus
1056                     	xdef	_AES_ClearFlag
1057                     	xdef	_AES_GetFlagStatus
1058                     	xdef	_AES_ITConfig
1059                     	xdef	_AES_DMAConfig
1060                     	xdef	_AES_ReadSubKey
1061                     	xdef	_AES_ReadSubData
1062                     	xdef	_AES_WriteSubKey
1063                     	xdef	_AES_WriteSubData
1064                     	xdef	_AES_Cmd
1065                     	xdef	_AES_OperationModeConfig
1066                     	xdef	_AES_DeInit
1085                     	end
