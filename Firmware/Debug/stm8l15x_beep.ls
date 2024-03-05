   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 92 void BEEP_DeInit(void)
  42                     ; 93 {
  44                     	switch	.text
  45  0000               _BEEP_DeInit:
  49                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  51  0000 725f50f0      	clr	20720
  52                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  54  0004 351f50f3      	mov	20723,#31
  55                     ; 96 }
  58  0008 81            	ret
 123                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 123                     ; 106 {
 124                     	switch	.text
 125  0009               _BEEP_Init:
 127  0009 88            	push	a
 128       00000000      OFST:	set	0
 131                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 133                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 135  000a c650f3        	ld	a,20723
 136  000d a41f          	and	a,#31
 137  000f a11f          	cp	a,#31
 138  0011 260c          	jrne	L15
 139                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 141  0013 c650f3        	ld	a,20723
 142  0016 a4e0          	and	a,#224
 143  0018 c750f3        	ld	20723,a
 144                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 146  001b 721050f3      	bset	20723,#0
 147  001f               L15:
 148                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 150  001f c650f3        	ld	a,20723
 151  0022 a43f          	and	a,#63
 152  0024 c750f3        	ld	20723,a
 153                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 155  0027 c650f3        	ld	a,20723
 156  002a 1a01          	or	a,(OFST+1,sp)
 157  002c c750f3        	ld	20723,a
 158                     ; 122 }
 161  002f 84            	pop	a
 162  0030 81            	ret
 217                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 217                     ; 131 {
 218                     	switch	.text
 219  0031               _BEEP_Cmd:
 223                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 225                     ; 135   if (NewState != DISABLE)
 227  0031 4d            	tnz	a
 228  0032 2706          	jreq	L101
 229                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 231  0034 721a50f3      	bset	20723,#5
 233  0038 2004          	jra	L301
 234  003a               L101:
 235                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 237  003a 721b50f3      	bres	20723,#5
 238  003e               L301:
 239                     ; 145 }
 242  003e 81            	ret
 278                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 278                     ; 179 {
 279                     	switch	.text
 280  003f               _BEEP_LSClockToTIMConnectCmd:
 284                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 286                     ; 183   if (NewState != DISABLE)
 288  003f 4d            	tnz	a
 289  0040 2706          	jreq	L321
 290                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 292  0042 721050f0      	bset	20720,#0
 294  0046 2004          	jra	L521
 295  0048               L321:
 296                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 298  0048 721150f0      	bres	20720,#0
 299  004c               L521:
 300                     ; 193 }
 303  004c 81            	ret
 350                     .const:	section	.text
 351  0000               L61:
 352  0000 000003e8      	dc.l	1000
 353                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 353                     ; 208 {
 354                     	switch	.text
 355  004d               _BEEP_LSICalibrationConfig:
 357  004d 5206          	subw	sp,#6
 358       00000006      OFST:	set	6
 361                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 363                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 365  004f 96            	ldw	x,sp
 366  0050 1c0009        	addw	x,#OFST+3
 367  0053 cd0000        	call	c_ltor
 369  0056 ae0000        	ldw	x,#L61
 370  0059 cd0000        	call	c_ludv
 372  005c be02          	ldw	x,c_lreg+2
 373  005e 1f03          	ldw	(OFST-3,sp),x
 375                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 377  0060 c650f3        	ld	a,20723
 378  0063 a4e0          	and	a,#224
 379  0065 c750f3        	ld	20723,a
 380                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 382  0068 1e03          	ldw	x,(OFST-3,sp)
 383  006a 54            	srlw	x
 384  006b 54            	srlw	x
 385  006c 54            	srlw	x
 386  006d 1f05          	ldw	(OFST-1,sp),x
 388                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 390  006f 1e05          	ldw	x,(OFST-1,sp)
 391  0071 58            	sllw	x
 392  0072 58            	sllw	x
 393  0073 58            	sllw	x
 394  0074 1f01          	ldw	(OFST-5,sp),x
 396  0076 1e03          	ldw	x,(OFST-3,sp)
 397  0078 72f001        	subw	x,(OFST-5,sp)
 398  007b 1605          	ldw	y,(OFST-1,sp)
 399  007d 9058          	sllw	y
 400  007f 905c          	incw	y
 401  0081 cd0000        	call	c_imul
 403  0084 1605          	ldw	y,(OFST-1,sp)
 404  0086 9058          	sllw	y
 405  0088 9058          	sllw	y
 406  008a 9058          	sllw	y
 407  008c bf00          	ldw	c_x,x
 408  008e 90b300        	cpw	y,c_x
 409  0091 250c          	jrult	L741
 410                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 412  0093 7b06          	ld	a,(OFST+0,sp)
 413  0095 a002          	sub	a,#2
 414  0097 ca50f3        	or	a,20723
 415  009a c750f3        	ld	20723,a
 417  009d 2009          	jra	L151
 418  009f               L741:
 419                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 421  009f 7b06          	ld	a,(OFST+0,sp)
 422  00a1 4a            	dec	a
 423  00a2 ca50f3        	or	a,20723
 424  00a5 c750f3        	ld	20723,a
 425  00a8               L151:
 426                     ; 231 }
 429  00a8 5b06          	addw	sp,#6
 430  00aa 81            	ret
 443                     	xdef	_BEEP_LSICalibrationConfig
 444                     	xdef	_BEEP_LSClockToTIMConnectCmd
 445                     	xdef	_BEEP_Cmd
 446                     	xdef	_BEEP_Init
 447                     	xdef	_BEEP_DeInit
 448                     	xref.b	c_lreg
 449                     	xref.b	c_x
 468                     	xref	c_imul
 469                     	xref	c_ludv
 470                     	xref	c_ltor
 471                     	end
