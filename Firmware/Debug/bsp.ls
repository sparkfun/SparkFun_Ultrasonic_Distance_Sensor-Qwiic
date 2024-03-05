   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  51                     ; 3 void Delay(uint16_t n)
  51                     ; 4 {
  53                     	switch	.text
  54  0000               _Delay:
  56  0000 89            	pushw	x
  57       00000000      OFST:	set	0
  60  0001               L72:
  61                     ; 5   while(n--);
  63  0001 1e01          	ldw	x,(OFST+1,sp)
  64  0003 1d0001        	subw	x,#1
  65  0006 1f01          	ldw	(OFST+1,sp),x
  66  0008 1c0001        	addw	x,#1
  67  000b a30000        	cpw	x,#0
  68  000e 26f1          	jrne	L72
  69                     ; 6 }
  72  0010 85            	popw	x
  73  0011 81            	ret
 110                     ; 7 void EIGHT(void)
 110                     ; 8 {
 111                     	switch	.text
 112  0012               _EIGHT:
 114  0012 88            	push	a
 115       00000001      OFST:	set	1
 118                     ; 10   uint8_t i=0;
 120                     ; 11   GPIO_ResetBits(GPIOB,GPIO_Pin_0);
 122  0013 4b01          	push	#1
 123  0015 ae5005        	ldw	x,#20485
 124  0018 cd0000        	call	_GPIO_ResetBits
 126  001b 84            	pop	a
 127                     ; 13   for(i=0;i<4;i++)
 129  001c 0f01          	clr	(OFST+0,sp)
 131  001e               L74:
 132                     ; 16    GPIO_ResetBits(GPIOD,GPIO_Pin_0);
 134  001e 4b01          	push	#1
 135  0020 ae500f        	ldw	x,#20495
 136  0023 cd0000        	call	_GPIO_ResetBits
 138  0026 84            	pop	a
 139                     ; 17    GPIO_SetBits(GPIOB,GPIO_Pin_0);
 141  0027 4b01          	push	#1
 142  0029 ae5005        	ldw	x,#20485
 143  002c cd0000        	call	_GPIO_SetBits
 145  002f 84            	pop	a
 146                     ; 19    Delay(22);
 148  0030 ae0016        	ldw	x,#22
 149  0033 adcb          	call	_Delay
 151                     ; 21    GPIO_SetBits(GPIOD,GPIO_Pin_0);
 153  0035 4b01          	push	#1
 154  0037 ae500f        	ldw	x,#20495
 155  003a cd0000        	call	_GPIO_SetBits
 157  003d 84            	pop	a
 158                     ; 22    GPIO_ResetBits(GPIOB,GPIO_Pin_0);
 160  003e 4b01          	push	#1
 161  0040 ae5005        	ldw	x,#20485
 162  0043 cd0000        	call	_GPIO_ResetBits
 164  0046 84            	pop	a
 165                     ; 23    Delay(22);
 167  0047 ae0016        	ldw	x,#22
 168  004a adb4          	call	_Delay
 170                     ; 13   for(i=0;i<4;i++)
 172  004c 0c01          	inc	(OFST+0,sp)
 176  004e 7b01          	ld	a,(OFST+0,sp)
 177  0050 a104          	cp	a,#4
 178  0052 25ca          	jrult	L74
 179                     ; 26   for(i=0;i<4;i++)
 181  0054 0f01          	clr	(OFST+0,sp)
 183  0056               L55:
 184                     ; 29    GPIO_ResetBits(GPIOD,GPIO_Pin_0);
 186  0056 4b01          	push	#1
 187  0058 ae500f        	ldw	x,#20495
 188  005b cd0000        	call	_GPIO_ResetBits
 190  005e 84            	pop	a
 191                     ; 30    GPIO_SetBits(GPIOB,GPIO_Pin_0);
 193  005f 4b01          	push	#1
 194  0061 ae5005        	ldw	x,#20485
 195  0064 cd0000        	call	_GPIO_SetBits
 197  0067 84            	pop	a
 198                     ; 32    Delay(22);
 200  0068 ae0016        	ldw	x,#22
 201  006b ad93          	call	_Delay
 203                     ; 34    GPIO_SetBits(GPIOD,GPIO_Pin_0);
 205  006d 4b01          	push	#1
 206  006f ae500f        	ldw	x,#20495
 207  0072 cd0000        	call	_GPIO_SetBits
 209  0075 84            	pop	a
 210                     ; 35    GPIO_ResetBits(GPIOB,GPIO_Pin_0);
 212  0076 4b01          	push	#1
 213  0078 ae5005        	ldw	x,#20485
 214  007b cd0000        	call	_GPIO_ResetBits
 216  007e 84            	pop	a
 217                     ; 36    Delay(22);
 219  007f ae0016        	ldw	x,#22
 220  0082 cd0000        	call	_Delay
 222                     ; 26   for(i=0;i<4;i++)
 224  0085 0c01          	inc	(OFST+0,sp)
 228  0087 7b01          	ld	a,(OFST+0,sp)
 229  0089 a104          	cp	a,#4
 230  008b 25c9          	jrult	L55
 231                     ; 38   GPIO_SetBits(GPIOB,GPIO_Pin_2);
 233  008d 4b04          	push	#4
 234  008f ae5005        	ldw	x,#20485
 235  0092 cd0000        	call	_GPIO_SetBits
 237  0095 84            	pop	a
 238                     ; 39   TIM2_SetCounter(0);
 240  0096 5f            	clrw	x
 241  0097 cd0000        	call	_TIM2_SetCounter
 243                     ; 40   TIM2_Cmd(ENABLE);
 245  009a a601          	ld	a,#1
 246  009c cd0000        	call	_TIM2_Cmd
 248                     ; 41 }
 251  009f 84            	pop	a
 252  00a0 81            	ret
 287                     ; 43 void I2C_DeInit_Config(uint8_t SLAVE_ADDR)
 287                     ; 44 {
 288                     	switch	.text
 289  00a1               _I2C_DeInit_Config:
 291  00a1 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 45       I2C_DeInit(I2C1);
 297  00a2 ae5210        	ldw	x,#21008
 298  00a5 cd0000        	call	_I2C_DeInit
 300                     ; 49     I2C1->CR1 |= 0x01;
 302  00a8 72105210      	bset	21008,#0
 303                     ; 52     I2C1->CR2 |= 0x04;
 305  00ac 72145211      	bset	21009,#2
 306                     ; 55     I2C1->FREQR = 16; 
 308  00b0 35105212      	mov	21010,#16
 309                     ; 58     I2C1->OARL |= (SLAVE_ADDR << 1) ;
 311  00b4 7b01          	ld	a,(OFST+1,sp)
 312  00b6 48            	sll	a
 313  00b7 ca5213        	or	a,21011
 314  00ba c75213        	ld	21011,a
 315                     ; 61     I2C1->OARH |= 0x40;
 317  00bd 721c5214      	bset	21012,#6
 318                     ; 65     I2C1->ITR|= 0x07;
 320  00c1 c6521a        	ld	a,21018
 321  00c4 aa07          	or	a,#7
 322  00c6 c7521a        	ld	21018,a
 323                     ; 69     I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
 325  00c9 4b01          	push	#1
 326  00cb ae0007        	ldw	x,#7
 327  00ce 89            	pushw	x
 328  00cf ae5210        	ldw	x,#21008
 329  00d2 cd0000        	call	_I2C_ITConfig
 331  00d5 5b03          	addw	sp,#3
 332                     ; 70     I2C_Cmd(I2C1,ENABLE);
 334  00d7 4b01          	push	#1
 335  00d9 ae5210        	ldw	x,#21008
 336  00dc cd0000        	call	_I2C_Cmd
 338  00df 84            	pop	a
 339                     ; 71 }
 342  00e0 84            	pop	a
 343  00e1 81            	ret
 396                     .const:	section	.text
 397  0000               L41:
 398  0000 00001000      	dc.l	4096
 399                     ; 85 void EEPROM_WriteByte(uint16_t Addr,uint8_t Data)
 399                     ; 86 
 399                     ; 87 {
 400                     	switch	.text
 401  00e2               _EEPROM_WriteByte:
 403  00e2 89            	pushw	x
 404  00e3 89            	pushw	x
 405       00000002      OFST:	set	2
 408                     ; 91    Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+Addr);  //Initialize  pointer
 410  00e4 cd0000        	call	c_uitolx
 412  00e7 ae0000        	ldw	x,#L41
 413  00ea cd0000        	call	c_ladd
 415  00ed be02          	ldw	x,c_lreg+2
 416  00ef 1f01          	ldw	(OFST-1,sp),x
 418                     ; 93    FLASH_Unlock(FLASH_MemType_Data);
 420  00f1 a6f7          	ld	a,#247
 421  00f3 cd0000        	call	_FLASH_Unlock
 423                     ; 97    disableInterrupts();
 426  00f6 9b            sim
 428                     ; 101    while(!FLASH_IAPSR_EOP);
 432  00f7 7b07          	ld	a,(OFST+5,sp)
 433  00f9 1e01          	ldw	x,(OFST-1,sp)
 434  00fb f7            	ld	(x),a
 435                     ; 103    enableInterrupts();
 438  00fc 9a            rim
 440                     ; 105    FLASH_Lock(FLASH_MemType_Data);
 443  00fd a6f7          	ld	a,#247
 444  00ff cd0000        	call	_FLASH_Lock
 446                     ; 108 }
 449  0102 5b04          	addw	sp,#4
 450  0104 81            	ret
 499                     ; 123 uint8_t EEPROM_ReadByte(uint16_t Addr)
 499                     ; 124 
 499                     ; 125 {
 500                     	switch	.text
 501  0105               _EEPROM_ReadByte:
 503  0105 89            	pushw	x
 504       00000002      OFST:	set	2
 507                     ; 127    uint16_t Data=0;
 509                     ; 131    Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+Addr);  //Initialize  pointer
 511  0106 cd0000        	call	c_uitolx
 513  0109 ae0000        	ldw	x,#L41
 514  010c cd0000        	call	c_ladd
 516  010f be02          	ldw	x,c_lreg+2
 517  0111 1f01          	ldw	(OFST-1,sp),x
 519                     ; 133    Data=*Ptr_SegAddr;
 521  0113 1e01          	ldw	x,(OFST-1,sp)
 522  0115 f6            	ld	a,(x)
 523  0116 5f            	clrw	x
 524  0117 97            	ld	xl,a
 525  0118 1f01          	ldw	(OFST-1,sp),x
 527                     ; 135    return Data;
 529  011a 7b02          	ld	a,(OFST+0,sp)
 532  011c 85            	popw	x
 533  011d 81            	ret
 557                     ; 145 void BSP_Initializes(void)
 557                     ; 146 {
 558                     	switch	.text
 559  011e               _BSP_Initializes:
 563                     ; 147   EIGHT();
 565  011e cd0012        	call	_EIGHT
 567                     ; 148 }
 570  0121 81            	ret
 583                     	xdef	_BSP_Initializes
 584                     	xdef	_Delay
 585                     	xdef	_EEPROM_ReadByte
 586                     	xdef	_EEPROM_WriteByte
 587                     	xdef	_I2C_DeInit_Config
 588                     	xdef	_EIGHT
 589                     	xref	_TIM2_Cmd
 590                     	xref	_TIM2_SetCounter
 591                     	xref	_I2C_ITConfig
 592                     	xref	_I2C_Cmd
 593                     	xref	_I2C_DeInit
 594                     	xref	_GPIO_ResetBits
 595                     	xref	_GPIO_SetBits
 596                     	xref	_FLASH_Lock
 597                     	xref	_FLASH_Unlock
 598                     	xref.b	c_lreg
 617                     	xref	c_ladd
 618                     	xref	c_uitolx
 619                     	end
