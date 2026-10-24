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
        MOV R1, #32
        MOV R2, #0
LOOP    LSRS R0, R0, #1         ; Carry receives the bit shifted out
        ADC R2, R2, #0          ; Add carry to population count
        SUBS R1, R1, #1
        BNE LOOP
        LDR R3, =RESULT
        STR R2, [R3]
STOP    B STOP
        AREA mydata, DATA, READWRITE
NUMBER  DCD 0xF0F00F0F
RESULT  DCD 0
        END
