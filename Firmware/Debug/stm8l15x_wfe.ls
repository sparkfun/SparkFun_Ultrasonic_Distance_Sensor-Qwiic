   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 95 void WFE_DeInit(void)
  42                     ; 96 {
  44                     	switch	.text
  45  0000               _WFE_DeInit:
  49                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  51  0000 725f50a6      	clr	20646
  52                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  54  0004 725f50a7      	clr	20647
  55                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  57  0008 725f50a8      	clr	20648
  58                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  60  000c 725f50a9      	clr	20649
  61                     ; 101 }
  64  0010 81            	ret
 386                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 386                     ; 142 {
 387                     	switch	.text
 388  0011               _WFE_WakeUpSourceEventCmd:
 390  0011 89            	pushw	x
 391  0012 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 143   uint8_t register_index = 0;
 397                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 399                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 401                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 403  0013 9e            	ld	a,xh
 404  0014 6b01          	ld	(OFST+0,sp),a
 406                     ; 151   if (NewState != DISABLE)
 408  0016 0d06          	tnz	(OFST+5,sp)
 409  0018 273c          	jreq	L302
 410                     ; 153     switch (register_index)
 412  001a 7b01          	ld	a,(OFST+0,sp)
 414                     ; 171       default:
 414                     ; 172         break;
 415  001c 4a            	dec	a
 416  001d 270b          	jreq	L12
 417  001f 4a            	dec	a
 418  0020 2712          	jreq	L32
 419  0022 4a            	dec	a
 420  0023 2719          	jreq	L52
 421  0025 4a            	dec	a
 422  0026 2720          	jreq	L72
 423  0028 2045          	jra	L112
 424  002a               L12:
 425                     ; 155       case 1:
 425                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 427  002a c650a6        	ld	a,20646
 428  002d 1a03          	or	a,(OFST+2,sp)
 429  002f c750a6        	ld	20646,a
 430                     ; 157         break;
 432  0032 203b          	jra	L112
 433  0034               L32:
 434                     ; 159       case 2:
 434                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 436  0034 c650a7        	ld	a,20647
 437  0037 1a03          	or	a,(OFST+2,sp)
 438  0039 c750a7        	ld	20647,a
 439                     ; 161         break;
 441  003c 2031          	jra	L112
 442  003e               L52:
 443                     ; 163       case 3:
 443                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 445  003e c650a8        	ld	a,20648
 446  0041 1a03          	or	a,(OFST+2,sp)
 447  0043 c750a8        	ld	20648,a
 448                     ; 165         break;
 450  0046 2027          	jra	L112
 451  0048               L72:
 452                     ; 167       case 4:
 452                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 454  0048 c650a9        	ld	a,20649
 455  004b 1a03          	or	a,(OFST+2,sp)
 456  004d c750a9        	ld	20649,a
 457                     ; 169         break;
 459  0050 201d          	jra	L112
 460  0052               L13:
 461                     ; 171       default:
 461                     ; 172         break;
 463  0052 201b          	jra	L112
 464  0054               L702:
 466  0054 2019          	jra	L112
 467  0056               L302:
 468                     ; 177     switch (register_index)
 470  0056 7b01          	ld	a,(OFST+0,sp)
 472                     ; 195       default:
 472                     ; 196         break;
 473  0058 4a            	dec	a
 474  0059 270b          	jreq	L33
 475  005b 4a            	dec	a
 476  005c 2714          	jreq	L53
 477  005e 4a            	dec	a
 478  005f 271c          	jreq	L73
 479  0061 4a            	dec	a
 480  0062 2724          	jreq	L14
 481  0064 2009          	jra	L112
 482  0066               L33:
 483                     ; 179       case 1:
 483                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 485  0066 7b03          	ld	a,(OFST+2,sp)
 486  0068 43            	cpl	a
 487  0069 c450a6        	and	a,20646
 488  006c c750a6        	ld	20646,a
 489                     ; 181         break;
 490  006f               L112:
 491                     ; 199 }
 494  006f 5b03          	addw	sp,#3
 495  0071 81            	ret
 496  0072               L53:
 497                     ; 183       case 2:
 497                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 499  0072 7b03          	ld	a,(OFST+2,sp)
 500  0074 43            	cpl	a
 501  0075 c450a7        	and	a,20647
 502  0078 c750a7        	ld	20647,a
 503                     ; 185         break;
 505  007b 20f2          	jra	L112
 506  007d               L73:
 507                     ; 187       case 3:
 507                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 509  007d 7b03          	ld	a,(OFST+2,sp)
 510  007f 43            	cpl	a
 511  0080 c450a8        	and	a,20648
 512  0083 c750a8        	ld	20648,a
 513                     ; 189         break;
 515  0086 20e7          	jra	L112
 516  0088               L14:
 517                     ; 191       case 4:
 517                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 519  0088 7b03          	ld	a,(OFST+2,sp)
 520  008a 43            	cpl	a
 521  008b c450a9        	and	a,20649
 522  008e c750a9        	ld	20649,a
 523                     ; 193         break;
 525  0091 20dc          	jra	L112
 526  0093               L34:
 527                     ; 195       default:
 527                     ; 196         break;
 529  0093 20da          	jra	L112
 530  0095               L512:
 531  0095 20d8          	jra	L112
 578                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 578                     ; 238 {
 579                     	switch	.text
 580  0097               _WFE_GetWakeUpSourceEventStatus:
 582  0097 89            	pushw	x
 583  0098 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 239   FunctionalState status = DISABLE;
 589  0099 0f01          	clr	(OFST+0,sp)
 591                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 593                     ; 243   switch (WFE_Source)
 596                     ; 326     default:
 596                     ; 327       break;
 597  009b 1d0101        	subw	x,#257
 598  009e 2603          	jrne	L21
 599  00a0 cc013e        	jp	L712
 600  00a3               L21:
 601  00a3 5a            	decw	x
 602  00a4 2603          	jrne	L41
 603  00a6 cc013e        	jp	L712
 604  00a9               L41:
 605  00a9 1d0002        	subw	x,#2
 606  00ac 2603          	jrne	L61
 607  00ae cc013e        	jp	L712
 608  00b1               L61:
 609  00b1 1d0004        	subw	x,#4
 610  00b4 2603          	jrne	L02
 611  00b6 cc013e        	jp	L712
 612  00b9               L02:
 613  00b9 1d0008        	subw	x,#8
 614  00bc 2602          	jrne	L22
 615  00be 207e          	jp	L712
 616  00c0               L22:
 617  00c0 1d0010        	subw	x,#16
 618  00c3 2779          	jreq	L712
 619  00c5 1d0020        	subw	x,#32
 620  00c8 2774          	jreq	L712
 621  00ca 1d0040        	subw	x,#64
 622  00cd 276f          	jreq	L712
 623  00cf 1d0081        	subw	x,#129
 624  00d2 277b          	jreq	L122
 625  00d4 5a            	decw	x
 626  00d5 2778          	jreq	L122
 627  00d7 1d0002        	subw	x,#2
 628  00da 2773          	jreq	L122
 629  00dc 1d0004        	subw	x,#4
 630  00df 276e          	jreq	L122
 631  00e1 1d0008        	subw	x,#8
 632  00e4 2769          	jreq	L122
 633  00e6 1d0010        	subw	x,#16
 634  00e9 2764          	jreq	L122
 635  00eb 1d0020        	subw	x,#32
 636  00ee 275f          	jreq	L122
 637  00f0 1d0040        	subw	x,#64
 638  00f3 275a          	jreq	L122
 639  00f5 1d0081        	subw	x,#129
 640  00f8 2766          	jreq	L322
 641  00fa 5a            	decw	x
 642  00fb 2763          	jreq	L322
 643  00fd 1d0002        	subw	x,#2
 644  0100 275e          	jreq	L322
 645  0102 1d0004        	subw	x,#4
 646  0105 2759          	jreq	L322
 647  0107 1d0008        	subw	x,#8
 648  010a 2754          	jreq	L322
 649  010c 1d0010        	subw	x,#16
 650  010f 274f          	jreq	L322
 651  0111 1d0020        	subw	x,#32
 652  0114 274a          	jreq	L322
 653  0116 1d0040        	subw	x,#64
 654  0119 2745          	jreq	L322
 655  011b 1d0081        	subw	x,#129
 656  011e 2751          	jreq	L522
 657  0120 5a            	decw	x
 658  0121 274e          	jreq	L522
 659  0123 1d0002        	subw	x,#2
 660  0126 2749          	jreq	L522
 661  0128 1d0004        	subw	x,#4
 662  012b 2744          	jreq	L522
 663  012d 1d0008        	subw	x,#8
 664  0130 273f          	jreq	L522
 665  0132 1d0010        	subw	x,#16
 666  0135 273a          	jreq	L522
 667  0137 1d0020        	subw	x,#32
 668  013a 2735          	jreq	L522
 669  013c 2042          	jra	L552
 670  013e               L712:
 671                     ; 245     case WFE_Source_TIM2_EV0:
 671                     ; 246     case WFE_Source_TIM2_EV1:
 671                     ; 247     case WFE_Source_TIM1_EV0:
 671                     ; 248     case WFE_Source_TIM1_EV1:
 671                     ; 249     case WFE_Source_EXTI_EV0:
 671                     ; 250     case WFE_Source_EXTI_EV1:
 671                     ; 251     case WFE_Source_EXTI_EV2:
 671                     ; 252     case WFE_Source_EXTI_EV3:
 671                     ; 253 
 671                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 673  013e c650a6        	ld	a,20646
 674  0141 1503          	bcp	a,(OFST+2,sp)
 675  0143 2706          	jreq	L752
 676                     ; 257         status = ENABLE;
 678  0145 a601          	ld	a,#1
 679  0147 6b01          	ld	(OFST+0,sp),a
 682  0149 2035          	jra	L552
 683  014b               L752:
 684                     ; 262         status = DISABLE;
 686  014b 0f01          	clr	(OFST+0,sp)
 688  014d 2031          	jra	L552
 689  014f               L122:
 690                     ; 266     case WFE_Source_EXTI_EV4:
 690                     ; 267     case WFE_Source_EXTI_EV5:
 690                     ; 268     case WFE_Source_EXTI_EV6:
 690                     ; 269     case WFE_Source_EXTI_EV7:
 690                     ; 270     case WFE_Source_EXTI_EVB_G:
 690                     ; 271     case WFE_Source_EXTI_EVD_H:
 690                     ; 272     case WFE_Source_EXTI_EVE_F:
 690                     ; 273     case WFE_Source_ADC1_COMP_EV:
 690                     ; 274 
 690                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 692  014f c650a7        	ld	a,20647
 693  0152 1503          	bcp	a,(OFST+2,sp)
 694  0154 2706          	jreq	L362
 695                     ; 278         status = ENABLE;
 697  0156 a601          	ld	a,#1
 698  0158 6b01          	ld	(OFST+0,sp),a
 701  015a 2024          	jra	L552
 702  015c               L362:
 703                     ; 283         status = DISABLE;
 705  015c 0f01          	clr	(OFST+0,sp)
 707  015e 2020          	jra	L552
 708  0160               L322:
 709                     ; 286     case WFE_Source_TIM3_EV0:
 709                     ; 287     case WFE_Source_TIM3_EV1:
 709                     ; 288     case WFE_Source_TIM4_EV:
 709                     ; 289     case WFE_Source_SPI1_EV:
 709                     ; 290     case WFE_Source_I2C1_EV:
 709                     ; 291     case WFE_Source_USART1_EV:
 709                     ; 292     case WFE_Source_DMA1CH01_EV:
 709                     ; 293     case WFE_Source_DMA1CH23_EV:
 709                     ; 294 
 709                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 711  0160 c650a8        	ld	a,20648
 712  0163 1503          	bcp	a,(OFST+2,sp)
 713  0165 2706          	jreq	L762
 714                     ; 298         status = ENABLE;
 716  0167 a601          	ld	a,#1
 717  0169 6b01          	ld	(OFST+0,sp),a
 720  016b 2013          	jra	L552
 721  016d               L762:
 722                     ; 303         status = DISABLE;
 724  016d 0f01          	clr	(OFST+0,sp)
 726  016f 200f          	jra	L552
 727  0171               L522:
 728                     ; 307     case WFE_Source_TIM5_EV0:
 728                     ; 308     case WFE_Source_TIM5_EV1:
 728                     ; 309     case WFE_Source_AES_EV:
 728                     ; 310     case WFE_Source_SPI2_EV:
 728                     ; 311     case WFE_Source_USART2_EV:
 728                     ; 312     case WFE_Source_USART3_EV:
 728                     ; 313     case WFE_Source_RTC_CSS_EV:
 728                     ; 314 
 728                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 730  0171 c650a9        	ld	a,20649
 731  0174 1503          	bcp	a,(OFST+2,sp)
 732  0176 2706          	jreq	L372
 733                     ; 318         status = ENABLE;
 735  0178 a601          	ld	a,#1
 736  017a 6b01          	ld	(OFST+0,sp),a
 739  017c 2002          	jra	L552
 740  017e               L372:
 741                     ; 323         status = DISABLE;
 743  017e 0f01          	clr	(OFST+0,sp)
 745  0180               L722:
 746                     ; 326     default:
 746                     ; 327       break;
 748  0180               L552:
 749                     ; 329   return status;
 751  0180 7b01          	ld	a,(OFST+0,sp)
 754  0182 5b03          	addw	sp,#3
 755  0184 81            	ret
 768                     	xdef	_WFE_GetWakeUpSourceEventStatus
 769                     	xdef	_WFE_WakeUpSourceEventCmd
 770                     	xdef	_WFE_DeInit
 789                     	end
