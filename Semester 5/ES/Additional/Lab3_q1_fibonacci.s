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
        MOV R1, #10
        MOV R2, #0
        MOV R3, #1
LOOP    STR R2, [R0], #4
        ADD R4, R2, R3
        MOV R2, R3
        MOV R3, R4
        SUBS R1, R1, #1
        BNE LOOP
STOP    B STOP
        AREA mydata, DATA, READWRITE
RESULT  SPACE 40
        END
