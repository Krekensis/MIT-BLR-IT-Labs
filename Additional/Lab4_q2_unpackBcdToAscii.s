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
        LDR R0, =BCD
        LDR R0, [R0]
        LDR R1, =RESULT
        MOV R2, #8
LOOP    AND R3, R0, #0x0F
        ADD R3, R3, #0x30       ; ASCII digit (BCD input assumed valid)
        STR R3, [R1], #4        ; Eight 32-bit ASCII values
        MOV R0, R0, LSR #4
        SUBS R2, R2, #1
        BNE LOOP
STOP    B STOP
BCD     DCD 0x12345678
        AREA mydata, DATA, READWRITE
RESULT  SPACE 32
        END
