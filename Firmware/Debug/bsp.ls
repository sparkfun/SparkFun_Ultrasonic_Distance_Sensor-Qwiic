   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 3 void Delay(uint16_t n)
  18                     ; 4 {
  19                     	scross	off
  20  0000               _Delay:
  21  0000 89            	pushw	x
  22       00000000      OFST:	set	0
  24  0001               L5:
  25                     ; 5   while(n--);
  26  0001 1e01          	ldw	x,(OFST+1,sp)
  27  0003 5a            	decw	x
  28  0004 1f01          	ldw	(OFST+1,sp),x
  29  0006 5c            	incw	x
  30  0007 26f8          	jrne	L5
  31                     ; 6 }
  32  0009 85            	popw	x
  33  000a 81            	ret	
  35                     ; 7 void EIGHT(void)
  35                     ; 8 {
  36  000b               _EIGHT:
  37  000b 88            	push	a
  38       00000001      OFST:	set	1
  40                     ; 10   uint8_t i=0;
  41                     ; 11   GPIO_ResetBits(GPIOB,GPIO_Pin_0);
  42  000c 4b01          	push	#1
  43  000e ae5005        	ldw	x,#20485
  44  0011 cd0000        	call	_GPIO_ResetBits
  46  0014 84            	pop	a
  47                     ; 13   for(i=0;i<4;i++)
  48  0015 0f01          	clr	(OFST+0,sp)
  49  0017               L11:
  50                     ; 16    GPIO_ResetBits(GPIOD,GPIO_Pin_0);
  51  0017 ad28          	call	LC001
  53                     ; 13   for(i=0;i<4;i++)
  54  0019 0c01          	inc	(OFST+0,sp)
  56  001b 7b01          	ld	a,(OFST+0,sp)
  57  001d a104          	cp	a,#4
  58  001f 25f6          	jrult	L11
  59                     ; 26   for(i=0;i<4;i++)
  60  0021 0f01          	clr	(OFST+0,sp)
  61  0023               L71:
  62                     ; 29    GPIO_ResetBits(GPIOD,GPIO_Pin_0);
  63  0023 ad1c          	call	LC001
  65                     ; 26   for(i=0;i<4;i++)
  66  0025 0c01          	inc	(OFST+0,sp)
  68  0027 7b01          	ld	a,(OFST+0,sp)
  69  0029 a104          	cp	a,#4
  70  002b 25f6          	jrult	L71
  71                     ; 38   GPIO_SetBits(GPIOB,GPIO_Pin_2);
  72  002d 4b04          	push	#4
  73  002f ae5005        	ldw	x,#20485
  74  0032 cd0000        	call	_GPIO_SetBits
  76  0035 5f            	clrw	x
  77  0036 84            	pop	a
  78                     ; 39   TIM2_SetCounter(0);
  79  0037 cd0000        	call	_TIM2_SetCounter
  81                     ; 40   TIM2_Cmd(ENABLE);
  82  003a a601          	ld	a,#1
  83  003c cd0000        	call	_TIM2_Cmd
  85                     ; 41 }
  86  003f 84            	pop	a
  87  0040 81            	ret	
  88  0041               LC001:
  89  0041 4b01          	push	#1
  90  0043 ae500f        	ldw	x,#20495
  91  0046 cd0000        	call	_GPIO_ResetBits
  93  0049 84            	pop	a
  94                     ; 17    GPIO_SetBits(GPIOB,GPIO_Pin_0);
  95  004a 4b01          	push	#1
  96  004c ae5005        	ldw	x,#20485
  97  004f cd0000        	call	_GPIO_SetBits
  99  0052 ae0016        	ldw	x,#22
 100  0055 84            	pop	a
 101                     ; 19    Delay(22);
 102  0056 ada8          	call	_Delay
 104                     ; 21    GPIO_SetBits(GPIOD,GPIO_Pin_0);
 105  0058 4b01          	push	#1
 106  005a ae500f        	ldw	x,#20495
 107  005d cd0000        	call	_GPIO_SetBits
 109  0060 84            	pop	a
 110                     ; 22    GPIO_ResetBits(GPIOB,GPIO_Pin_0);
 111  0061 4b01          	push	#1
 112  0063 ae5005        	ldw	x,#20485
 113  0066 cd0000        	call	_GPIO_ResetBits
 115  0069 ae0016        	ldw	x,#22
 116  006c 84            	pop	a
 117                     ; 23    Delay(22);
 118  006d 2091          	jp	_Delay
 120                     ; 43 void I2C_DeInit_Config(uint8_t SLAVE_ADDR)
 120                     ; 44 {
 121  006f               _I2C_DeInit_Config:
 122  006f 88            	push	a
 123       00000000      OFST:	set	0
 125                     ; 45       I2C_DeInit(I2C1);
 126  0070 ae5210        	ldw	x,#21008
 127  0073 cd0000        	call	_I2C_DeInit
 129                     ; 49     I2C1->CR1 |= 0x01;
 130  0076 72105210      	bset	21008,#0
 131                     ; 52     I2C1->CR2 |= 0x04;
 132  007a 72145211      	bset	21009,#2
 133                     ; 55     I2C1->FREQR = 16; 
 134  007e 35105212      	mov	21010,#16
 135                     ; 58     I2C1->OARL |= (SLAVE_ADDR << 1) ;
 136  0082 7b01          	ld	a,(OFST+1,sp)
 137  0084 48            	sll	a
 138  0085 ca5213        	or	a,21011
 139  0088 c75213        	ld	21011,a
 140                     ; 61     I2C1->OARH |= 0x40;
 141  008b 721c5214      	bset	21012,#6
 142                     ; 65     I2C1->ITR|= 0x07;
 143  008f c6521a        	ld	a,21018
 144  0092 aa07          	or	a,#7
 145  0094 c7521a        	ld	21018,a
 146                     ; 69     I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
 147  0097 4b01          	push	#1
 148  0099 ae0007        	ldw	x,#7
 149  009c 89            	pushw	x
 150  009d ae5210        	ldw	x,#21008
 151  00a0 cd0000        	call	_I2C_ITConfig
 153  00a3 5b03          	addw	sp,#3
 154                     ; 70     I2C_Cmd(I2C1,ENABLE);
 155  00a5 4b01          	push	#1
 156  00a7 ae5210        	ldw	x,#21008
 157  00aa cd0000        	call	_I2C_Cmd
 159                     ; 71 }
 160  00ad 5b02          	addw	sp,#2
 161  00af 81            	ret	
 163                     .const:	section	.text
 164  0000               L06:
 165  0000 00001000      	dc.l	4096
 166                     ; 85 void EEPROM_WriteByte(uint16_t Addr,uint8_t Data)
 166                     ; 86 
 166                     ; 87 {
 167                     	switch	.text
 168  00b0               _EEPROM_WriteByte:
 169  00b0 89            	pushw	x
 170  00b1 89            	pushw	x
 171       00000002      OFST:	set	2
 173                     ; 91    Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+Addr);  //Initialize  pointer
 174  00b2 cd0000        	call	c_uitolx
 176  00b5 ae0000        	ldw	x,#L06
 177  00b8 cd0000        	call	c_ladd
 179  00bb be02          	ldw	x,c_lreg+2
 180  00bd 1f01          	ldw	(OFST-1,sp),x
 181                     ; 93    FLASH_Unlock(FLASH_MemType_Data);
 182  00bf a6f7          	ld	a,#247
 183  00c1 cd0000        	call	_FLASH_Unlock
 185                     ; 97    disableInterrupts();
 187  00c4 9b            	sim	
 189                     ; 101    while(!FLASH_IAPSR_EOP);
 190  00c5 1e01          	ldw	x,(OFST-1,sp)
 191  00c7 7b07          	ld	a,(OFST+5,sp)
 192  00c9 f7            	ld	(x),a
 193                     ; 103    enableInterrupts();
 195  00ca 9a            	rim	
 197                     ; 105    FLASH_Lock(FLASH_MemType_Data);
 198  00cb a6f7          	ld	a,#247
 199  00cd cd0000        	call	_FLASH_Lock
 201                     ; 108 }
 202  00d0 5b04          	addw	sp,#4
 203  00d2 81            	ret	
 205                     ; 123 uint8_t EEPROM_ReadByte(uint16_t Addr)
 205                     ; 124 
 205                     ; 125 {
 206  00d3               _EEPROM_ReadByte:
 207  00d3 89            	pushw	x
 208       00000002      OFST:	set	2
 210                     ; 127    uint16_t Data=0;
 211                     ; 131    Ptr_SegAddr = (uint8_t *)(FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+Addr);  //Initialize  pointer
 212  00d4 cd0000        	call	c_uitolx
 214  00d7 ae0000        	ldw	x,#L06
 215  00da cd0000        	call	c_ladd
 217  00dd be02          	ldw	x,c_lreg+2
 218                     ; 133    Data=*Ptr_SegAddr;
 219  00df f6            	ld	a,(x)
 220  00e0 5f            	clrw	x
 221  00e1 97            	ld	xl,a
 222  00e2 1f01          	ldw	(OFST-1,sp),x
 223                     ; 135    return Data;
 224  00e4 7b02          	ld	a,(OFST+0,sp)
 226  00e6 85            	popw	x
 227  00e7 81            	ret	
 229                     ; 145 void BSP_Initializes(void)
 229                     ; 146 {
 230  00e8               _BSP_Initializes:
 232                     ; 147   EIGHT();
 234                     ; 148 }
 235  00e8 cc000b        	jp	_EIGHT
 237                     	xdef	_BSP_Initializes
 238                     	xdef	_Delay
 239                     	xdef	_EEPROM_ReadByte
 240                     	xdef	_EEPROM_WriteByte
 241                     	xdef	_I2C_DeInit_Config
 242                     	xdef	_EIGHT
 243                     	xref	_TIM2_Cmd
 244                     	xref	_TIM2_SetCounter
 245                     	xref	_I2C_ITConfig
 246                     	xref	_I2C_Cmd
 247                     	xref	_I2C_DeInit
 248                     	xref	_GPIO_ResetBits
 249                     	xref	_GPIO_SetBits
 250                     	xref	_FLASH_Lock
 251                     	xref	_FLASH_Unlock
 252                     	xref.b	c_lreg
 253                     	xref	c_ladd
 254                     	xref	c_uitolx
 255                     	end
