;		INCLUDE stm32l1xx_constants.s       ; Load Constant Definitions
;		INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants
		AREA BlockData, DATA, READWRITE
src     DCD   1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4
dst     DCD   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
num		EQU   0
		AREA myCode, CODE, READONLY
		EXPORT __main
		ALIGN
		ENTRY
__main	PROC
        LDR r0, =src              ; r0 = pointer to source block
        LDR r1, =dst              ; r1 = pointer to destination block
		MOV  r2, #num
cpyword LDR   r3, [r0], #4          ; load a word from the source and next word is 4bytes
        STR   r3, [r1], #4          ; store it to the destination
        ADDS  r2, r2, #1            ; increment the counter
		CMP  r2, #9
        BNE   cpyword              ; ... copy more
stop 	b stop
		ENDP
		END
