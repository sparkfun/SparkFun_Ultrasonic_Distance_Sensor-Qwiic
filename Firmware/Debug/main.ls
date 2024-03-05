   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  14                     	switch	.data
  15  0000               _SLAVE_ADDRESS:
  16  0000 00            	dc.b	0
  17  0001               _SBUF:
  18  0001 00            	dc.b	0
  19  0002               _measure_flag:
  20  0002 0000          	dc.w	0
  73                     ; 29 int main( void )
  73                     ; 30 {
  75                     	switch	.text
  76  0000               _main:
  80                     ; 31   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);    
  82  0000 4f            	clr	a
  83  0001 cd0000        	call	_CLK_SYSCLKDivConfig
  85                     ; 32   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  87  0004 a601          	ld	a,#1
  88  0006 cd0000        	call	_CLK_SYSCLKSourceConfig
  90                     ; 33   CLK_HSICmd(ENABLE);                      
  92  0009 a601          	ld	a,#1
  93  000b cd0000        	call	_CLK_HSICmd
  95                     ; 35   GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast); // DIN2
  97  000e 4be0          	push	#224
  98  0010 4b01          	push	#1
  99  0012 ae500f        	ldw	x,#20495
 100  0015 cd0000        	call	_GPIO_Init
 102  0018 85            	popw	x
 103                     ; 36   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast); // DIN1
 105  0019 4be0          	push	#224
 106  001b 4b02          	push	#2
 107  001d ae5005        	ldw	x,#20485
 108  0020 cd0000        	call	_GPIO_Init
 110  0023 85            	popw	x
 111                     ; 37   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast); // ECHO
 113  0024 4be0          	push	#224
 114  0026 4b04          	push	#4
 115  0028 ae5005        	ldw	x,#20485
 116  002b cd0000        	call	_GPIO_Init
 118  002e 85            	popw	x
 119                     ; 42   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast); //PB4, INPUT
 121  002f 4be0          	push	#224
 122  0031 4b10          	push	#16
 123  0033 ae5005        	ldw	x,#20485
 124  0036 cd0000        	call	_GPIO_Init
 126  0039 85            	popw	x
 127                     ; 43   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_3, GPIO_Mode_In_FL_IT); // TRIG
 129  003a 4b20          	push	#32
 130  003c 4b08          	push	#8
 131  003e ae5005        	ldw	x,#20485
 132  0041 cd0000        	call	_GPIO_Init
 134  0044 85            	popw	x
 135                     ; 44   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_6, GPIO_Mode_In_FL_IT); // INT
 137  0045 4b20          	push	#32
 138  0047 4b40          	push	#64
 139  0049 ae5005        	ldw	x,#20485
 140  004c cd0000        	call	_GPIO_Init
 142  004f 85            	popw	x
 143                     ; 45   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_5, GPIO_Mode_In_PU_IT); // ADDR_RST
 145  0050 4b60          	push	#96
 146  0052 4b20          	push	#32
 147  0054 ae5005        	ldw	x,#20485
 148  0057 cd0000        	call	_GPIO_Init
 150  005a 85            	popw	x
 151                     ; 47   EXTI_DeInit (); 
 153  005b cd0000        	call	_EXTI_DeInit
 155                     ; 48   EXTI_SetPinSensitivity (EXTI_Pin_3, EXTI_Trigger_Rising);
 157  005e ae0601        	ldw	x,#1537
 158  0061 cd0000        	call	_EXTI_SetPinSensitivity
 160                     ; 49   EXTI_SetPinSensitivity (EXTI_Pin_6, EXTI_Trigger_Rising);
 162  0064 ae1401        	ldw	x,#5121
 163  0067 cd0000        	call	_EXTI_SetPinSensitivity
 165                     ; 50   EXTI_SetPinSensitivity (EXTI_Pin_5, EXTI_Trigger_Falling);
 167  006a ae1202        	ldw	x,#4610
 168  006d cd0000        	call	_EXTI_SetPinSensitivity
 170                     ; 53   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2,ENABLE);         
 172  0070 ae0001        	ldw	x,#1
 173  0073 cd0000        	call	_CLK_PeripheralClockConfig
 175                     ; 54   TIM2_DeInit();    
 177  0076 cd0000        	call	_TIM2_DeInit
 179                     ; 55   TIM2_TimeBaseInit(TIM2_Prescaler_8, TIM2_CounterMode_Up, 65535);         
 181  0079 aeffff        	ldw	x,#65535
 182  007c 89            	pushw	x
 183  007d ae0300        	ldw	x,#768
 184  0080 cd0000        	call	_TIM2_TimeBaseInit
 186  0083 85            	popw	x
 187                     ; 56   TIM2_ARRPreloadConfig(ENABLE);    
 189  0084 a601          	ld	a,#1
 190  0086 cd0000        	call	_TIM2_ARRPreloadConfig
 192                     ; 57   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 194  0089 ae0101        	ldw	x,#257
 195  008c cd0000        	call	_TIM2_ITConfig
 197                     ; 61   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3,ENABLE);         
 199  008f ae0101        	ldw	x,#257
 200  0092 cd0000        	call	_CLK_PeripheralClockConfig
 202                     ; 62   TIM3_DeInit();    
 204  0095 cd0000        	call	_TIM3_DeInit
 206                     ; 63   TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 5500); 
 208  0098 ae157c        	ldw	x,#5500
 209  009b 89            	pushw	x
 210  009c ae0700        	ldw	x,#1792
 211  009f cd0000        	call	_TIM3_TimeBaseInit
 213  00a2 85            	popw	x
 214                     ; 64   TIM3_ARRPreloadConfig(ENABLE);    
 216  00a3 a601          	ld	a,#1
 217  00a5 cd0000        	call	_TIM3_ARRPreloadConfig
 219                     ; 65   TIM3_ITConfig(TIM3_IT_Update, ENABLE);    
 221  00a8 ae0101        	ldw	x,#257
 222  00ab cd0000        	call	_TIM3_ITConfig
 224                     ; 68   CLK_PeripheralClockConfig (CLK_Peripheral_TIM4,ENABLE); 
 226  00ae ae0201        	ldw	x,#513
 227  00b1 cd0000        	call	_CLK_PeripheralClockConfig
 229                     ; 69   TIM4_DeInit();
 231  00b4 cd0000        	call	_TIM4_DeInit
 233                     ; 70   TIM4_TimeBaseInit(TIM4_Prescaler_128, TIM4_PERIOD);
 235  00b7 ae07a0        	ldw	x,#1952
 236  00ba cd0000        	call	_TIM4_TimeBaseInit
 238                     ; 71   TIM4_ARRPreloadConfig(ENABLE);
 240  00bd a601          	ld	a,#1
 241  00bf cd0000        	call	_TIM4_ARRPreloadConfig
 243                     ; 72   TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 245  00c2 ae0101        	ldw	x,#257
 246  00c5 cd0000        	call	_TIM4_ITConfig
 248                     ; 75   FLASH_DeInit();
 250  00c8 cd0000        	call	_FLASH_DeInit
 252                     ; 79   CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 254  00cb ae0301        	ldw	x,#769
 255  00ce cd0000        	call	_CLK_PeripheralClockConfig
 257                     ; 80   I2C_DeInit_Config(EEPROM_ReadByte(0));
 259  00d1 5f            	clrw	x
 260  00d2 cd0000        	call	_EEPROM_ReadByte
 262  00d5 cd0000        	call	_I2C_DeInit_Config
 264                     ; 81   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 266  00d8 4b10          	push	#16
 267  00da ae5005        	ldw	x,#20485
 268  00dd cd0000        	call	_GPIO_SetBits
 270  00e0 84            	pop	a
 271                     ; 82   enableInterrupts();
 274  00e1 9a            rim
 276  00e2               L12:
 278  00e2 20fe          	jra	L12
 314                     	xdef	_main
 315                     	xdef	_measure_flag
 316                     	xdef	_SBUF
 317                     	xdef	_SLAVE_ADDRESS
 318                     	xref	_EEPROM_ReadByte
 319                     	xref	_I2C_DeInit_Config
 320                     	xref	_TIM4_ITConfig
 321                     	xref	_TIM4_ARRPreloadConfig
 322                     	xref	_TIM4_TimeBaseInit
 323                     	xref	_TIM4_DeInit
 324                     	xref	_TIM3_ITConfig
 325                     	xref	_TIM3_ARRPreloadConfig
 326                     	xref	_TIM3_TimeBaseInit
 327                     	xref	_TIM3_DeInit
 328                     	xref	_TIM2_ITConfig
 329                     	xref	_TIM2_ARRPreloadConfig
 330                     	xref	_TIM2_TimeBaseInit
 331                     	xref	_TIM2_DeInit
 332                     	xref	_GPIO_SetBits
 333                     	xref	_GPIO_Init
 334                     	xref	_FLASH_DeInit
 335                     	xref	_EXTI_SetPinSensitivity
 336                     	xref	_EXTI_DeInit
 337                     	xref	_CLK_PeripheralClockConfig
 338                     	xref	_CLK_SYSCLKDivConfig
 339                     	xref	_CLK_SYSCLKSourceConfig
 340                     	xref	_CLK_HSICmd
 359                     	end
