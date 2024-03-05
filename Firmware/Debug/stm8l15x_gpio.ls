   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  18                     ; 97 {
  19                     	scross	off
  20  0000               _GPIO_DeInit:
  22                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
  23  0000 6f04          	clr	(4,x)
  24                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
  25  0002 7f            	clr	(x)
  26                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
  27  0003 6f02          	clr	(2,x)
  28                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
  29  0005 6f03          	clr	(3,x)
  30                     ; 102 }
  31  0007 81            	ret	
  33                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
  33                     ; 134 {
  34  0008               _GPIO_Init:
  35  0008 89            	pushw	x
  36       00000000      OFST:	set	0
  38                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
  39                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
  40                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
  41  0009 7b05          	ld	a,(OFST+5,sp)
  42  000b 43            	cpl	a
  43  000c e404          	and	a,(4,x)
  44  000e e704          	ld	(4,x),a
  45                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
  46  0010 7b06          	ld	a,(OFST+6,sp)
  47  0012 2a16          	jrpl	L3
  48                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
  49  0014 a510          	bcp	a,#16
  50  0016 2705          	jreq	L5
  51                     ; 153       GPIOx->ODR |= GPIO_Pin;
  52  0018 f6            	ld	a,(x)
  53  0019 1a05          	or	a,(OFST+5,sp)
  55  001b 2004          	jra	L7
  56  001d               L5:
  57                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
  58  001d 7b05          	ld	a,(OFST+5,sp)
  59  001f 43            	cpl	a
  60  0020 f4            	and	a,(x)
  61  0021               L7:
  62  0021 f7            	ld	(x),a
  63                     ; 159     GPIOx->DDR |= GPIO_Pin;
  64  0022 1e01          	ldw	x,(OFST+1,sp)
  65  0024 e602          	ld	a,(2,x)
  66  0026 1a05          	or	a,(OFST+5,sp)
  68  0028 2005          	jra	L11
  69  002a               L3:
  70                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
  71  002a 7b05          	ld	a,(OFST+5,sp)
  72  002c 43            	cpl	a
  73  002d e402          	and	a,(2,x)
  74  002f               L11:
  75  002f e702          	ld	(2,x),a
  76                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
  77  0031 7b06          	ld	a,(OFST+6,sp)
  78  0033 a540          	bcp	a,#64
  79  0035 2706          	jreq	L31
  80                     ; 172     GPIOx->CR1 |= GPIO_Pin;
  81  0037 e603          	ld	a,(3,x)
  82  0039 1a05          	or	a,(OFST+5,sp)
  84  003b 2005          	jra	L51
  85  003d               L31:
  86                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
  87  003d 7b05          	ld	a,(OFST+5,sp)
  88  003f 43            	cpl	a
  89  0040 e403          	and	a,(3,x)
  90  0042               L51:
  91  0042 e703          	ld	(3,x),a
  92                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
  93  0044 7b06          	ld	a,(OFST+6,sp)
  94  0046 a520          	bcp	a,#32
  95  0048 2706          	jreq	L71
  96                     ; 184     GPIOx->CR2 |= GPIO_Pin;
  97  004a e604          	ld	a,(4,x)
  98  004c 1a05          	or	a,(OFST+5,sp)
 100  004e 2005          	jra	L12
 101  0050               L71:
 102                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 103  0050 7b05          	ld	a,(OFST+5,sp)
 104  0052 43            	cpl	a
 105  0053 e404          	and	a,(4,x)
 106  0055               L12:
 107  0055 e704          	ld	(4,x),a
 108                     ; 190 }
 109  0057 85            	popw	x
 110  0058 81            	ret	
 112                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 112                     ; 210 {
 113  0059               _GPIO_ExternalPullUpConfig:
 114       fffffffe      OFST: set -2
 116                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 117                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 118                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 119  0059 7b04          	ld	a,(OFST+6,sp)
 120  005b 2706          	jreq	L32
 121                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 122  005d e603          	ld	a,(3,x)
 123  005f 1a03          	or	a,(OFST+5,sp)
 125  0061 2005          	jra	L52
 126  0063               L32:
 127                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 128  0063 7b03          	ld	a,(OFST+5,sp)
 129  0065 43            	cpl	a
 130  0066 e403          	and	a,(3,x)
 131  0068               L52:
 132  0068 e703          	ld	(3,x),a
 133                     ; 222 }
 134  006a 81            	ret	
 136                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 136                     ; 249 {
 137  006b               _GPIO_Write:
 138       fffffffe      OFST: set -2
 140                     ; 250   GPIOx->ODR = GPIO_PortVal;
 141  006b 7b03          	ld	a,(OFST+5,sp)
 142  006d f7            	ld	(x),a
 143                     ; 251 }
 144  006e 81            	ret	
 146                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 146                     ; 271 {
 147  006f               _GPIO_WriteBit:
 148       fffffffe      OFST: set -2
 150                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 151                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 152                     ; 276   if (GPIO_BitVal != RESET)
 153  006f 7b04          	ld	a,(OFST+6,sp)
 154  0071 2705          	jreq	L72
 155                     ; 278     GPIOx->ODR |= GPIO_Pin;
 156  0073 f6            	ld	a,(x)
 157  0074 1a03          	or	a,(OFST+5,sp)
 159  0076 2004          	jra	L13
 160  0078               L72:
 161                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 162  0078 7b03          	ld	a,(OFST+5,sp)
 163  007a 43            	cpl	a
 164  007b f4            	and	a,(x)
 165  007c               L13:
 166  007c f7            	ld	(x),a
 167                     ; 285 }
 168  007d 81            	ret	
 170                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 170                     ; 304 {
 171  007e               _GPIO_SetBits:
 172       fffffffe      OFST: set -2
 174                     ; 305   GPIOx->ODR |= GPIO_Pin;
 175  007e f6            	ld	a,(x)
 176  007f 1a03          	or	a,(OFST+5,sp)
 177  0081 f7            	ld	(x),a
 178                     ; 306 }
 179  0082 81            	ret	
 181                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 181                     ; 325 {
 182  0083               _GPIO_ResetBits:
 183       fffffffe      OFST: set -2
 185                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 186  0083 7b03          	ld	a,(OFST+5,sp)
 187  0085 43            	cpl	a
 188  0086 f4            	and	a,(x)
 189  0087 f7            	ld	(x),a
 190                     ; 327 }
 191  0088 81            	ret	
 193                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 193                     ; 337 {
 194  0089               _GPIO_ToggleBits:
 195       fffffffe      OFST: set -2
 197                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 198  0089 f6            	ld	a,(x)
 199  008a 1803          	xor	a,(OFST+5,sp)
 200  008c f7            	ld	(x),a
 201                     ; 339 }
 202  008d 81            	ret	
 204                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 204                     ; 348 {
 205  008e               _GPIO_ReadInputData:
 207                     ; 349   return ((uint8_t)GPIOx->IDR);
 208  008e e601          	ld	a,(1,x)
 210  0090 81            	ret	
 212                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 212                     ; 359 {
 213  0091               _GPIO_ReadOutputData:
 215                     ; 360   return ((uint8_t)GPIOx->ODR);
 216  0091 f6            	ld	a,(x)
 218  0092 81            	ret	
 220                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 220                     ; 379 {
 221  0093               _GPIO_ReadInputDataBit:
 222       fffffffe      OFST: set -2
 224                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 225  0093 e601          	ld	a,(1,x)
 226  0095 1403          	and	a,(OFST+5,sp)
 228  0097 81            	ret	
 230                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 230                     ; 390 {
 231  0098               _GPIO_ReadOutputDataBit:
 232       fffffffe      OFST: set -2
 234                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
 235  0098 f6            	ld	a,(x)
 236  0099 1403          	and	a,(OFST+5,sp)
 238  009b 81            	ret	
 240                     	xdef	_GPIO_ReadOutputDataBit
 241                     	xdef	_GPIO_ReadInputDataBit
 242                     	xdef	_GPIO_ReadOutputData
 243                     	xdef	_GPIO_ReadInputData
 244                     	xdef	_GPIO_ToggleBits
 245                     	xdef	_GPIO_ResetBits
 246                     	xdef	_GPIO_SetBits
 247                     	xdef	_GPIO_WriteBit
 248                     	xdef	_GPIO_Write
 249                     	xdef	_GPIO_ExternalPullUpConfig
 250                     	xdef	_GPIO_Init
 251                     	xdef	_GPIO_DeInit
 252                     	end
