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
        LDR R2, =NUMBER
        LDR R0, [R2]            ; Low word in R0
        LDR R1, [R2, #4]        ; High word in R1

        MVN R0, R0
        MVN R1, R1
        ADDS R0, R0, #1         ; Carry indicates low word wrapped
        ADC R1, R1, #0

        LDR R2, =RESULT
        STR R0, [R2]            ; Result low word
        STR R1, [R2, #4]        ; Result high word
STOP    B STOP

NUMBER  DCD 0x89ABCDEF, 0x12345678
        AREA mydata, DATA, READWRITE
RESULT  SPACE 8
        END
