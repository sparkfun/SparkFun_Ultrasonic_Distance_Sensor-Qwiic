   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     	bsct
  19  0000               _SLAVE_ADDRESS:
  20  0000 00            	dc.b	0
  21  0001               _SBUF:
  22  0001 00            	dc.b	0
  23  0002               _measure_flag:
  24  0002 0000          	dc.w	0
  25                     ; 29 int main( void )
  25                     ; 30 {
  26                     	scross	off
  27                     	switch	.text
  28  0000               _main:
  30                     ; 31   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);    
  31  0000 4f            	clr	a
  32  0001 cd0000        	call	_CLK_SYSCLKDivConfig
  34                     ; 32   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  35  0004 a601          	ld	a,#1
  36  0006 cd0000        	call	_CLK_SYSCLKSourceConfig
  38                     ; 33   CLK_HSICmd(ENABLE);                      
  39  0009 a601          	ld	a,#1
  40  000b cd0000        	call	_CLK_HSICmd
  42                     ; 35   GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast); // DIN2
  43  000e 4be0          	push	#224
  44  0010 4b01          	push	#1
  45  0012 ae500f        	ldw	x,#20495
  46  0015 cd0000        	call	_GPIO_Init
  48  0018 85            	popw	x
  49                     ; 36   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast); // DIN1
  50  0019 4be0          	push	#224
  51  001b 4b02          	push	#2
  52  001d ae5005        	ldw	x,#20485
  53  0020 cd0000        	call	_GPIO_Init
  55  0023 85            	popw	x
  56                     ; 37   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast); // ECHO
  57  0024 4be0          	push	#224
  58  0026 4b04          	push	#4
  59  0028 ae5005        	ldw	x,#20485
  60  002b cd0000        	call	_GPIO_Init
  62  002e 85            	popw	x
  63                     ; 42   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast); //PB4, INPUT
  64  002f 4be0          	push	#224
  65  0031 4b10          	push	#16
  66  0033 ae5005        	ldw	x,#20485
  67  0036 cd0000        	call	_GPIO_Init
  69  0039 85            	popw	x
  70                     ; 43   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_3, GPIO_Mode_In_FL_IT); // TRIG
  71  003a 4b20          	push	#32
  72  003c 4b08          	push	#8
  73  003e ae5005        	ldw	x,#20485
  74  0041 cd0000        	call	_GPIO_Init
  76  0044 85            	popw	x
  77                     ; 44   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_6, GPIO_Mode_In_FL_IT); // INT
  78  0045 4b20          	push	#32
  79  0047 4b40          	push	#64
  80  0049 ae5005        	ldw	x,#20485
  81  004c cd0000        	call	_GPIO_Init
  83  004f 85            	popw	x
  84                     ; 45   GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_Pin_5, GPIO_Mode_In_PU_IT); // ADDR_RST
  85  0050 4b60          	push	#96
  86  0052 4b20          	push	#32
  87  0054 ae5005        	ldw	x,#20485
  88  0057 cd0000        	call	_GPIO_Init
  90  005a 85            	popw	x
  91                     ; 47   EXTI_DeInit (); 
  92  005b cd0000        	call	_EXTI_DeInit
  94                     ; 48   EXTI_SetPinSensitivity (EXTI_Pin_3, EXTI_Trigger_Rising);
  95  005e ae0601        	ldw	x,#1537
  96  0061 cd0000        	call	_EXTI_SetPinSensitivity
  98                     ; 49   EXTI_SetPinSensitivity (EXTI_Pin_6, EXTI_Trigger_Rising);
  99  0064 ae1401        	ldw	x,#5121
 100  0067 cd0000        	call	_EXTI_SetPinSensitivity
 102                     ; 50   EXTI_SetPinSensitivity (EXTI_Pin_5, EXTI_Trigger_Falling);
 103  006a ae1202        	ldw	x,#4610
 104  006d cd0000        	call	_EXTI_SetPinSensitivity
 106                     ; 53   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2,ENABLE);         
 107  0070 ae0001        	ldw	x,#1
 108  0073 cd0000        	call	_CLK_PeripheralClockConfig
 110                     ; 54   TIM2_DeInit();    
 111  0076 cd0000        	call	_TIM2_DeInit
 113                     ; 55   TIM2_TimeBaseInit(TIM2_Prescaler_8, TIM2_CounterMode_Up, 65535);         
 114  0079 aeffff        	ldw	x,#65535
 115  007c 89            	pushw	x
 116  007d ae0300        	ldw	x,#768
 117  0080 cd0000        	call	_TIM2_TimeBaseInit
 119  0083 a601          	ld	a,#1
 120  0085 85            	popw	x
 121                     ; 56   TIM2_ARRPreloadConfig(ENABLE);    
 122  0086 cd0000        	call	_TIM2_ARRPreloadConfig
 124                     ; 57   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 125  0089 ae0101        	ldw	x,#257
 126  008c cd0000        	call	_TIM2_ITConfig
 128                     ; 61   CLK_PeripheralClockConfig(CLK_Peripheral_TIM3,ENABLE);         
 129  008f ae0101        	ldw	x,#257
 130  0092 cd0000        	call	_CLK_PeripheralClockConfig
 132                     ; 62   TIM3_DeInit();    
 133  0095 cd0000        	call	_TIM3_DeInit
 135                     ; 63   TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 5500); 
 136  0098 ae157c        	ldw	x,#5500
 137  009b 89            	pushw	x
 138  009c ae0700        	ldw	x,#1792
 139  009f cd0000        	call	_TIM3_TimeBaseInit
 141  00a2 a601          	ld	a,#1
 142  00a4 85            	popw	x
 143                     ; 64   TIM3_ARRPreloadConfig(ENABLE);    
 144  00a5 cd0000        	call	_TIM3_ARRPreloadConfig
 146                     ; 65   TIM3_ITConfig(TIM3_IT_Update, ENABLE);    
 147  00a8 ae0101        	ldw	x,#257
 148  00ab cd0000        	call	_TIM3_ITConfig
 150                     ; 68   CLK_PeripheralClockConfig (CLK_Peripheral_TIM4,ENABLE); 
 151  00ae ae0201        	ldw	x,#513
 152  00b1 cd0000        	call	_CLK_PeripheralClockConfig
 154                     ; 69   TIM4_DeInit();
 155  00b4 cd0000        	call	_TIM4_DeInit
 157                     ; 70   TIM4_TimeBaseInit(TIM4_Prescaler_128, TIM4_PERIOD);
 158  00b7 ae07a0        	ldw	x,#1952
 159  00ba cd0000        	call	_TIM4_TimeBaseInit
 161                     ; 71   TIM4_ARRPreloadConfig(ENABLE);
 162  00bd a601          	ld	a,#1
 163  00bf cd0000        	call	_TIM4_ARRPreloadConfig
 165                     ; 72   TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 166  00c2 ae0101        	ldw	x,#257
 167  00c5 cd0000        	call	_TIM4_ITConfig
 169                     ; 75   FLASH_DeInit();
 170  00c8 cd0000        	call	_FLASH_DeInit
 172                     ; 79   CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 173  00cb ae0301        	ldw	x,#769
 174  00ce cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 80   I2C_DeInit_Config(EEPROM_ReadByte(0));
 177  00d1 5f            	clrw	x
 178  00d2 cd0000        	call	_EEPROM_ReadByte
 180  00d5 cd0000        	call	_I2C_DeInit_Config
 182                     ; 81   GPIO_SetBits(GPIOB,GPIO_Pin_4);
 183  00d8 4b10          	push	#16
 184  00da ae5005        	ldw	x,#20485
 185  00dd cd0000        	call	_GPIO_SetBits
 187  00e0 9a            	rim	
 188  00e1 84            	pop	a
 189                     ; 82   enableInterrupts();
 192  00e2               L3:
 194  00e2 20fe          	jra	L3
 196                     	xdef	_main
 197                     	xdef	_measure_flag
 198                     	xdef	_SBUF
 199                     	xdef	_SLAVE_ADDRESS
 200                     	xref	_EEPROM_ReadByte
 201                     	xref	_I2C_DeInit_Config
 202                     	xref	_TIM4_ITConfig
 203                     	xref	_TIM4_ARRPreloadConfig
 204                     	xref	_TIM4_TimeBaseInit
 205                     	xref	_TIM4_DeInit
 206                     	xref	_TIM3_ITConfig
 207                     	xref	_TIM3_ARRPreloadConfig
 208                     	xref	_TIM3_TimeBaseInit
 209                     	xref	_TIM3_DeInit
 210                     	xref	_TIM2_ITConfig
 211                     	xref	_TIM2_ARRPreloadConfig
 212                     	xref	_TIM2_TimeBaseInit
 213                     	xref	_TIM2_DeInit
 214                     	xref	_GPIO_SetBits
 215                     	xref	_GPIO_Init
 216                     	xref	_FLASH_DeInit
 217                     	xref	_EXTI_SetPinSensitivity
 218                     	xref	_EXTI_DeInit
 219                     	xref	_CLK_PeripheralClockConfig
 220                     	xref	_CLK_SYSCLKDivConfig
 221                     	xref	_CLK_SYSCLKSourceConfig
 222                     	xref	_CLK_HSICmd
 223                     	end
