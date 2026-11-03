        AREA RESET, DATA, READONLY
        EXPORT __Vectors
__Vectors
        DCD 0x10001000
        DCD Reset_Handler
        ALIGN
        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler
Reset_Handler
        LDR R0, =RESULT
        MOV R1, #0x12
        STRB R1, [R0, #1]!
        MOV R1, #0x34
        STRB R1, [R0, #1]!
STOP    B STOP

        AREA mydata, DATA, READWRITE
RESULT  SPACE 3
        END
; Expected RESULT bytes: 00 12 34. Pre-indexed stores write at RESULT+1,
; then RESULT+2; R0 finishes at RESULT+2.
