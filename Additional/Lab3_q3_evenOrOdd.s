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
        LDR R0, =NUMBER
        LDR R0, [R0]
        TST R0, #1
        MOVEQ R1, #0            ; 0 means even
        MOVNE R1, #1            ; 1 means odd
        LDR R2, =RESULT
        STR R1, [R2]
STOP    B STOP
NUMBER  DCD 25
        AREA mydata, DATA, READWRITE
RESULT  DCD 0
        END
