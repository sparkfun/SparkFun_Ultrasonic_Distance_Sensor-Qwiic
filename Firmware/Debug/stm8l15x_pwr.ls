   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
   4                     ; Optimizer V4.5.6 - 18 Jul 2023
  18                     ; 82 void PWR_DeInit(void)
  18                     ; 83 {
  19                     	scross	off
  20  0000               _PWR_DeInit:
  22                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  23  0000 352050b2      	mov	20658,#32
  24                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  25  0004 725f50b3      	clr	20659
  26                     ; 86 }
  27  0008 81            	ret	
  29                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
  29                     ; 103 {
  30  0009               _PWR_PVDLevelConfig:
  31  0009 88            	push	a
  32       00000000      OFST:	set	0
  34                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
  35                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
  36  000a c650b2        	ld	a,20658
  37  000d a4f1          	and	a,#241
  38  000f c750b2        	ld	20658,a
  39                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
  40  0012 c650b2        	ld	a,20658
  41  0015 1a01          	or	a,(OFST+1,sp)
  42  0017 c750b2        	ld	20658,a
  43                     ; 113 }
  44  001a 84            	pop	a
  45  001b 81            	ret	
  47                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
  47                     ; 122 {
  48  001c               _PWR_PVDCmd:
  50                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
  51                     ; 126   if (NewState != DISABLE)
  52  001c 4d            	tnz	a
  53  001d 2705          	jreq	L3
  54                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
  55  001f 721050b2      	bset	20658,#0
  57  0023 81            	ret	
  58  0024               L3:
  59                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
  60  0024 721150b2      	bres	20658,#0
  61                     ; 136 }
  62  0028 81            	ret	
  64                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
  64                     ; 172 {
  65  0029               _PWR_FastWakeUpCmd:
  67                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
  68                     ; 176   if (NewState != DISABLE)
  69  0029 4d            	tnz	a
  70  002a 2705          	jreq	L7
  71                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
  72  002c 721450b3      	bset	20659,#2
  74  0030 81            	ret	
  75  0031               L7:
  76                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
  77  0031 721550b3      	bres	20659,#2
  78                     ; 186 }
  79  0035 81            	ret	
  81                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
  81                     ; 195 {
  82  0036               _PWR_UltraLowPowerCmd:
  84                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
  85                     ; 199   if (NewState != DISABLE)
  86  0036 4d            	tnz	a
  87  0037 2705          	jreq	L31
  88                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
  89  0039 721250b3      	bset	20659,#1
  91  003d 81            	ret	
  92  003e               L31:
  93                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
  94  003e 721350b3      	bres	20659,#1
  95                     ; 209 }
  96  0042 81            	ret	
  98                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
  98                     ; 233 {
  99  0043               _PWR_PVDITConfig:
 101                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 102                     ; 237   if (NewState != DISABLE)
 103  0043 4d            	tnz	a
 104  0044 2705          	jreq	L71
 105                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 106  0046 721850b2      	bset	20658,#4
 108  004a 81            	ret	
 109  004b               L71:
 110                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 111  004b 721950b2      	bres	20658,#4
 112                     ; 247 }
 113  004f 81            	ret	
 115                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 115                     ; 262 {
 116  0050               _PWR_GetFlagStatus:
 117  0050 88            	push	a
 118  0051 88            	push	a
 119       00000001      OFST:	set	1
 121                     ; 263   FlagStatus bitstatus = RESET;
 122                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 123                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 124  0052 a501          	bcp	a,#1
 125  0054 2709          	jreq	L32
 126                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 127  0056 720150b302    	btjf	20659,#0,L52
 128                     ; 272       bitstatus = SET;
 130  005b 2009          	jp	LC002
 131  005d               L52:
 132                     ; 276       bitstatus = RESET;
 133  005d 200b          	jp	L33
 134  005f               L32:
 135                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 136  005f c650b2        	ld	a,20658
 137  0062 1502          	bcp	a,(OFST+1,sp)
 138  0064 2704          	jreq	L33
 139                     ; 283       bitstatus = SET;
 140  0066               LC002:
 141  0066 a601          	ld	a,#1
 143  0068 2001          	jra	L13
 144  006a               L33:
 145                     ; 287       bitstatus = RESET;
 146  006a 4f            	clr	a
 147  006b               L13:
 148                     ; 292   return((FlagStatus)bitstatus);
 150  006b 85            	popw	x
 151  006c 81            	ret	
 153                     ; 300 void PWR_PVDClearFlag(void)
 153                     ; 301 {
 154  006d               _PWR_PVDClearFlag:
 156                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 157  006d 721a50b2      	bset	20658,#5
 158                     ; 304 }
 159  0071 81            	ret	
 161                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 161                     ; 312 {
 162  0072               _PWR_PVDGetITStatus:
 163  0072 89            	pushw	x
 164       00000002      OFST:	set	2
 166                     ; 313   ITStatus bitstatus = RESET;
 167                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 169                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 170  0073 c650b2        	ld	a,20658
 171  0076 a420          	and	a,#32
 172  0078 6b01          	ld	(OFST-1,sp),a
 173                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 174  007a c650b2        	ld	a,20658
 175  007d a410          	and	a,#16
 176  007f 6b02          	ld	(OFST+0,sp),a
 177                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 178  0081 7b01          	ld	a,(OFST-1,sp)
 179  0083 2708          	jreq	L73
 181  0085 7b02          	ld	a,(OFST+0,sp)
 182  0087 2704          	jreq	L73
 183                     ; 322     bitstatus = (ITStatus)SET;
 184  0089 a601          	ld	a,#1
 186  008b 2001          	jra	L14
 187  008d               L73:
 188                     ; 326     bitstatus = (ITStatus)RESET;
 189  008d 4f            	clr	a
 190  008e               L14:
 191                     ; 328   return ((ITStatus)bitstatus);
 193  008e 85            	popw	x
 194  008f 81            	ret	
 196                     ; 336 void PWR_PVDClearITPendingBit(void)
 196                     ; 337 {
 197  0090               _PWR_PVDClearITPendingBit:
 199                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 200  0090 721a50b2      	bset	20658,#5
 201                     ; 340 }
 202  0094 81            	ret	
 204                     	xdef	_PWR_PVDClearITPendingBit
 205                     	xdef	_PWR_PVDClearFlag
 206                     	xdef	_PWR_GetFlagStatus
 207                     	xdef	_PWR_PVDGetITStatus
 208                     	xdef	_PWR_PVDITConfig
 209                     	xdef	_PWR_UltraLowPowerCmd
 210                     	xdef	_PWR_FastWakeUpCmd
 211                     	xdef	_PWR_PVDCmd
 212                     	xdef	_PWR_PVDLevelConfig
 213                     	xdef	_PWR_DeInit
 214                     	end
