   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 56 uint8_t ITC_GetCPUCC(void)
  42                     ; 57 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 59   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 60   _asm("pop a");
  57  0001 84            pop a
  59                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 87 void ITC_DeInit(void)
  85                     ; 88 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 97 }
 118  0023 81            	ret
 143                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 105 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 438                     .const:	section	.text
 439  0000               L22:
 440  0000 004d          	dc.w	L14
 441  0002 004d          	dc.w	L14
 442  0004 004d          	dc.w	L14
 443  0006 0056          	dc.w	L34
 444  0008 0056          	dc.w	L34
 445  000a 0056          	dc.w	L34
 446  000c 0056          	dc.w	L34
 447  000e 005f          	dc.w	L54
 448  0010 005f          	dc.w	L54
 449  0012 005f          	dc.w	L54
 450  0014 005f          	dc.w	L54
 451  0016 0068          	dc.w	L74
 452  0018 0068          	dc.w	L74
 453  001a 0068          	dc.w	L74
 454  001c 0068          	dc.w	L74
 455  001e 0093          	dc.w	L312
 456  0020 0071          	dc.w	L15
 457  0022 0071          	dc.w	L15
 458  0024 0071          	dc.w	L15
 459  0026 007a          	dc.w	L35
 460  0028 007a          	dc.w	L35
 461  002a 007a          	dc.w	L35
 462  002c 0093          	dc.w	L312
 463  002e 0093          	dc.w	L312
 464  0030 0083          	dc.w	L55
 465  0032 0083          	dc.w	L55
 466  0034 0083          	dc.w	L55
 467  0036 008c          	dc.w	L75
 468  0038 008c          	dc.w	L75
 469                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 469                     ; 115 {
 470                     	switch	.text
 471  0029               _ITC_GetSoftwarePriority:
 473  0029 88            	push	a
 474  002a 89            	pushw	x
 475       00000002      OFST:	set	2
 478                     ; 116   uint8_t Value = 0;
 480  002b 0f02          	clr	(OFST+0,sp)
 482                     ; 117   uint8_t Mask = 0;
 484                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 486                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 488  002d a403          	and	a,#3
 489  002f 48            	sll	a
 490  0030 5f            	clrw	x
 491  0031 97            	ld	xl,a
 492  0032 a603          	ld	a,#3
 493  0034 5d            	tnzw	x
 494  0035 2704          	jreq	L41
 495  0037               L61:
 496  0037 48            	sll	a
 497  0038 5a            	decw	x
 498  0039 26fc          	jrne	L61
 499  003b               L41:
 500  003b 6b01          	ld	(OFST-1,sp),a
 502                     ; 125   switch (IRQn)
 504  003d 7b03          	ld	a,(OFST+1,sp)
 506                     ; 223     default:
 506                     ; 224       break;
 507  003f 4a            	dec	a
 508  0040 a11d          	cp	a,#29
 509  0042 2407          	jruge	L02
 510  0044 5f            	clrw	x
 511  0045 97            	ld	xl,a
 512  0046 58            	sllw	x
 513  0047 de0000        	ldw	x,(L22,x)
 514  004a fc            	jp	(x)
 515  004b               L02:
 516  004b 2046          	jra	L312
 517  004d               L14:
 518                     ; 127     case FLASH_IRQn:
 518                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 518                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 518                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 520  004d c67f70        	ld	a,32624
 521  0050 1401          	and	a,(OFST-1,sp)
 522  0052 6b02          	ld	(OFST+0,sp),a
 524                     ; 131       break;
 526  0054 203d          	jra	L312
 527  0056               L34:
 528                     ; 133     case EXTIE_F_PVD_IRQn:
 528                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 528                     ; 135     case RTC_IRQn:
 528                     ; 136     case EXTIB_IRQn:
 528                     ; 137     case EXTID_IRQn:
 528                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 528                     ; 139     case RTC_CSSLSE_IRQn:
 528                     ; 140     case EXTIB_IRQn:
 528                     ; 141     case EXTID_IRQn:
 528                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 528                     ; 143     case RTC_CSSLSE_IRQn:
 528                     ; 144     case EXTIB_G_IRQn:
 528                     ; 145     case EXTID_H_IRQn:
 528                     ; 146 #endif  /* STM8L15X_MD */
 528                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 530  0056 c67f71        	ld	a,32625
 531  0059 1401          	and	a,(OFST-1,sp)
 532  005b 6b02          	ld	(OFST+0,sp),a
 534                     ; 148       break;
 536  005d 2034          	jra	L312
 537  005f               L54:
 538                     ; 150     case EXTI0_IRQn:
 538                     ; 151     case EXTI1_IRQn:
 538                     ; 152     case EXTI2_IRQn:
 538                     ; 153     case EXTI3_IRQn:
 538                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 540  005f c67f72        	ld	a,32626
 541  0062 1401          	and	a,(OFST-1,sp)
 542  0064 6b02          	ld	(OFST+0,sp),a
 544                     ; 155       break;
 546  0066 202b          	jra	L312
 547  0068               L74:
 548                     ; 157     case EXTI4_IRQn:
 548                     ; 158     case EXTI5_IRQn:
 548                     ; 159     case EXTI6_IRQn:
 548                     ; 160     case EXTI7_IRQn:
 548                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 550  0068 c67f73        	ld	a,32627
 551  006b 1401          	and	a,(OFST-1,sp)
 552  006d 6b02          	ld	(OFST+0,sp),a
 554                     ; 162       break;
 556  006f 2022          	jra	L312
 557  0071               L15:
 558                     ; 165     case SWITCH_CSS_IRQn:
 558                     ; 166 #else
 558                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 558                     ; 168 #endif /* STM8L15X_LD */		
 558                     ; 169     case ADC1_COMP_IRQn:
 558                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 558                     ; 171     case LCD_IRQn:
 558                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 558                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 558                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 558                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 558                     ; 176     case LCD_AES_IRQn:
 558                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 558                     ; 178 #endif  /* STM8L15X_MD */
 558                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 560  0071 c67f74        	ld	a,32628
 561  0074 1401          	and	a,(OFST-1,sp)
 562  0076 6b02          	ld	(OFST+0,sp),a
 564                     ; 180       break;
 566  0078 2019          	jra	L312
 567  007a               L35:
 568                     ; 187     case TIM2_CC_IRQn:
 568                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 568                     ; 189     case TIM3_CC_IRQn:
 568                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 568                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 568                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 568                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 568                     ; 194 #endif  /* STM8L15X_MD */
 568                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 570  007a c67f75        	ld	a,32629
 571  007d 1401          	and	a,(OFST-1,sp)
 572  007f 6b02          	ld	(OFST+0,sp),a
 574                     ; 196       break;
 576  0081 2010          	jra	L312
 577  0083               L55:
 578                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 578                     ; 202     case SPI1_IRQn:
 578                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 578                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 578                     ; 205     case USART1_TX_IRQn:
 578                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 578                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 578                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 578                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 580  0083 c67f76        	ld	a,32630
 581  0086 1401          	and	a,(OFST-1,sp)
 582  0088 6b02          	ld	(OFST+0,sp),a
 584                     ; 210       break;
 586  008a 2007          	jra	L312
 587  008c               L75:
 588                     ; 214     case USART1_RX_IRQn:
 588                     ; 215     case I2C1_IRQn:
 588                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 588                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 588                     ; 218     case I2C1_SPI2_IRQn:
 588                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 588                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 590  008c c67f77        	ld	a,32631
 591  008f 1401          	and	a,(OFST-1,sp)
 592  0091 6b02          	ld	(OFST+0,sp),a
 594                     ; 221       break;
 596  0093               L16:
 597                     ; 223     default:
 597                     ; 224       break;
 599  0093               L312:
 600                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 602  0093 7b03          	ld	a,(OFST+1,sp)
 603  0095 a403          	and	a,#3
 604  0097 48            	sll	a
 605  0098 5f            	clrw	x
 606  0099 97            	ld	xl,a
 607  009a 7b02          	ld	a,(OFST+0,sp)
 608  009c 5d            	tnzw	x
 609  009d 2704          	jreq	L42
 610  009f               L62:
 611  009f 44            	srl	a
 612  00a0 5a            	decw	x
 613  00a1 26fc          	jrne	L62
 614  00a3               L42:
 615  00a3 6b02          	ld	(OFST+0,sp),a
 617                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 619  00a5 7b02          	ld	a,(OFST+0,sp)
 622  00a7 5b03          	addw	sp,#3
 623  00a9 81            	ret
 683                     	switch	.const
 684  003a               L44:
 685  003a 00e2          	dc.w	L512
 686  003c 00e2          	dc.w	L512
 687  003e 00e2          	dc.w	L512
 688  0040 00f4          	dc.w	L712
 689  0042 00f4          	dc.w	L712
 690  0044 00f4          	dc.w	L712
 691  0046 00f4          	dc.w	L712
 692  0048 0106          	dc.w	L122
 693  004a 0106          	dc.w	L122
 694  004c 0106          	dc.w	L122
 695  004e 0106          	dc.w	L122
 696  0050 0118          	dc.w	L322
 697  0052 0118          	dc.w	L322
 698  0054 0118          	dc.w	L322
 699  0056 0118          	dc.w	L322
 700  0058 0170          	dc.w	L762
 701  005a 012a          	dc.w	L522
 702  005c 012a          	dc.w	L522
 703  005e 012a          	dc.w	L522
 704  0060 013c          	dc.w	L722
 705  0062 013c          	dc.w	L722
 706  0064 013c          	dc.w	L722
 707  0066 0170          	dc.w	L762
 708  0068 0170          	dc.w	L762
 709  006a 014e          	dc.w	L132
 710  006c 014e          	dc.w	L132
 711  006e 014e          	dc.w	L132
 712  0070 0160          	dc.w	L332
 713  0072 0160          	dc.w	L332
 714                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 714                     ; 251 {
 715                     	switch	.text
 716  00aa               _ITC_SetSoftwarePriority:
 718  00aa 89            	pushw	x
 719  00ab 89            	pushw	x
 720       00000002      OFST:	set	2
 723                     ; 252   uint8_t Mask = 0;
 725                     ; 253   uint8_t NewPriority = 0;
 727                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 729                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 731                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 733                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 735  00ac 9e            	ld	a,xh
 736  00ad a403          	and	a,#3
 737  00af 48            	sll	a
 738  00b0 5f            	clrw	x
 739  00b1 97            	ld	xl,a
 740  00b2 a603          	ld	a,#3
 741  00b4 5d            	tnzw	x
 742  00b5 2704          	jreq	L23
 743  00b7               L43:
 744  00b7 48            	sll	a
 745  00b8 5a            	decw	x
 746  00b9 26fc          	jrne	L43
 747  00bb               L23:
 748  00bb 43            	cpl	a
 749  00bc 6b01          	ld	(OFST-1,sp),a
 751                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 753  00be 7b03          	ld	a,(OFST+1,sp)
 754  00c0 a403          	and	a,#3
 755  00c2 48            	sll	a
 756  00c3 5f            	clrw	x
 757  00c4 97            	ld	xl,a
 758  00c5 7b04          	ld	a,(OFST+2,sp)
 759  00c7 5d            	tnzw	x
 760  00c8 2704          	jreq	L63
 761  00ca               L04:
 762  00ca 48            	sll	a
 763  00cb 5a            	decw	x
 764  00cc 26fc          	jrne	L04
 765  00ce               L63:
 766  00ce 6b02          	ld	(OFST+0,sp),a
 768                     ; 268   switch (IRQn)
 770  00d0 7b03          	ld	a,(OFST+1,sp)
 772                     ; 372     default:
 772                     ; 373       break;
 773  00d2 4a            	dec	a
 774  00d3 a11d          	cp	a,#29
 775  00d5 2407          	jruge	L24
 776  00d7 5f            	clrw	x
 777  00d8 97            	ld	xl,a
 778  00d9 58            	sllw	x
 779  00da de003a        	ldw	x,(L44,x)
 780  00dd fc            	jp	(x)
 781  00de               L24:
 782  00de ac700170      	jpf	L762
 783  00e2               L512:
 784                     ; 270     case FLASH_IRQn:
 784                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 784                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 784                     ; 273       ITC->ISPR1 &= Mask;
 786  00e2 c67f70        	ld	a,32624
 787  00e5 1401          	and	a,(OFST-1,sp)
 788  00e7 c77f70        	ld	32624,a
 789                     ; 274       ITC->ISPR1 |= NewPriority;
 791  00ea c67f70        	ld	a,32624
 792  00ed 1a02          	or	a,(OFST+0,sp)
 793  00ef c77f70        	ld	32624,a
 794                     ; 275       break;
 796  00f2 207c          	jra	L762
 797  00f4               L712:
 798                     ; 277     case EXTIE_F_PVD_IRQn:
 798                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 798                     ; 279     case RTC_IRQn:
 798                     ; 280     case EXTIB_IRQn:
 798                     ; 281     case EXTID_IRQn:
 798                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 798                     ; 283     case RTC_CSSLSE_IRQn:
 798                     ; 284     case EXTIB_IRQn:
 798                     ; 285     case EXTID_IRQn:
 798                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 798                     ; 287     case RTC_CSSLSE_IRQn:
 798                     ; 288     case EXTIB_G_IRQn:
 798                     ; 289     case EXTID_H_IRQn:
 798                     ; 290 #endif  /* STM8L15X_MD */
 798                     ; 291       ITC->ISPR2 &= Mask;
 800  00f4 c67f71        	ld	a,32625
 801  00f7 1401          	and	a,(OFST-1,sp)
 802  00f9 c77f71        	ld	32625,a
 803                     ; 292       ITC->ISPR2 |= NewPriority;
 805  00fc c67f71        	ld	a,32625
 806  00ff 1a02          	or	a,(OFST+0,sp)
 807  0101 c77f71        	ld	32625,a
 808                     ; 293       break;
 810  0104 206a          	jra	L762
 811  0106               L122:
 812                     ; 295     case EXTI0_IRQn:
 812                     ; 296     case EXTI1_IRQn:
 812                     ; 297     case EXTI2_IRQn:
 812                     ; 298     case EXTI3_IRQn:
 812                     ; 299       ITC->ISPR3 &= Mask;
 814  0106 c67f72        	ld	a,32626
 815  0109 1401          	and	a,(OFST-1,sp)
 816  010b c77f72        	ld	32626,a
 817                     ; 300       ITC->ISPR3 |= NewPriority;
 819  010e c67f72        	ld	a,32626
 820  0111 1a02          	or	a,(OFST+0,sp)
 821  0113 c77f72        	ld	32626,a
 822                     ; 301       break;
 824  0116 2058          	jra	L762
 825  0118               L322:
 826                     ; 303     case EXTI4_IRQn:
 826                     ; 304     case EXTI5_IRQn:
 826                     ; 305     case EXTI6_IRQn:
 826                     ; 306     case EXTI7_IRQn:
 826                     ; 307       ITC->ISPR4 &= Mask;
 828  0118 c67f73        	ld	a,32627
 829  011b 1401          	and	a,(OFST-1,sp)
 830  011d c77f73        	ld	32627,a
 831                     ; 308       ITC->ISPR4 |= NewPriority;
 833  0120 c67f73        	ld	a,32627
 834  0123 1a02          	or	a,(OFST+0,sp)
 835  0125 c77f73        	ld	32627,a
 836                     ; 309       break;
 838  0128 2046          	jra	L762
 839  012a               L522:
 840                     ; 313     case SWITCH_CSS_IRQn:
 840                     ; 314 #endif /*	STM8L15X_LD	*/
 840                     ; 315     case ADC1_COMP_IRQn:
 840                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 840                     ; 317     case LCD_IRQn:
 840                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 840                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 840                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 840                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 840                     ; 322     case LCD_AES_IRQn:
 840                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 840                     ; 324 #endif  /* STM8L15X_MD */
 840                     ; 325       ITC->ISPR5 &= Mask;
 842  012a c67f74        	ld	a,32628
 843  012d 1401          	and	a,(OFST-1,sp)
 844  012f c77f74        	ld	32628,a
 845                     ; 326       ITC->ISPR5 |= NewPriority;
 847  0132 c67f74        	ld	a,32628
 848  0135 1a02          	or	a,(OFST+0,sp)
 849  0137 c77f74        	ld	32628,a
 850                     ; 327       break;
 852  013a 2034          	jra	L762
 853  013c               L722:
 854                     ; 333     case TIM2_CC_IRQn:
 854                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 854                     ; 335     case TIM3_CC_IRQn:
 854                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 854                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 854                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 854                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 854                     ; 340 #endif  /* STM8L15X_MD */
 854                     ; 341       ITC->ISPR6 &= Mask;
 856  013c c67f75        	ld	a,32629
 857  013f 1401          	and	a,(OFST-1,sp)
 858  0141 c77f75        	ld	32629,a
 859                     ; 342       ITC->ISPR6 |= NewPriority;
 861  0144 c67f75        	ld	a,32629
 862  0147 1a02          	or	a,(OFST+0,sp)
 863  0149 c77f75        	ld	32629,a
 864                     ; 343       break;
 866  014c 2022          	jra	L762
 867  014e               L132:
 868                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 868                     ; 349     case SPI1_IRQn:
 868                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 868                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 868                     ; 352     case USART1_TX_IRQn:
 868                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 868                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 868                     ; 355 #endif  /* STM8L15X_MD */
 868                     ; 356       ITC->ISPR7 &= Mask;
 870  014e c67f76        	ld	a,32630
 871  0151 1401          	and	a,(OFST-1,sp)
 872  0153 c77f76        	ld	32630,a
 873                     ; 357       ITC->ISPR7 |= NewPriority;
 875  0156 c67f76        	ld	a,32630
 876  0159 1a02          	or	a,(OFST+0,sp)
 877  015b c77f76        	ld	32630,a
 878                     ; 358       break;
 880  015e 2010          	jra	L762
 881  0160               L332:
 882                     ; 362     case USART1_RX_IRQn:
 882                     ; 363     case I2C1_IRQn:
 882                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 882                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 882                     ; 366     case I2C1_SPI2_IRQn:
 882                     ; 367 #endif  /* STM8L15X_MD */
 882                     ; 368       ITC->ISPR8 &= Mask;
 884  0160 c67f77        	ld	a,32631
 885  0163 1401          	and	a,(OFST-1,sp)
 886  0165 c77f77        	ld	32631,a
 887                     ; 369       ITC->ISPR8 |= NewPriority;
 889  0168 c67f77        	ld	a,32631
 890  016b 1a02          	or	a,(OFST+0,sp)
 891  016d c77f77        	ld	32631,a
 892                     ; 370       break;
 894  0170               L532:
 895                     ; 372     default:
 895                     ; 373       break;
 897  0170               L762:
 898                     ; 375 }
 901  0170 5b04          	addw	sp,#4
 902  0172 81            	ret
 915                     	xdef	_ITC_GetSoftwarePriority
 916                     	xdef	_ITC_SetSoftwarePriority
 917                     	xdef	_ITC_GetSoftIntStatus
 918                     	xdef	_ITC_GetCPUCC
 919                     	xdef	_ITC_DeInit
 938                     	end
