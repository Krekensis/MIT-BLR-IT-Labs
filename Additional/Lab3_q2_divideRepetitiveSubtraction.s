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
        LDR R0, =DIVIDEND
        LDR R0, [R0]
        LDR R1, =DIVISOR
        LDRH R1, [R1]
        MOV R2, #0
DIV_LOOP
        CMP R0, R1
        BLO DONE
        SUB R0, R0, R1
        ADD R2, R2, #1
        B DIV_LOOP
DONE    LDR R3, =RESULT
        STR R2, [R3]            ; Quotient
        STR R0, [R3, #4]        ; Remainder
STOP    B STOP
DIVIDEND DCD 100
DIVISOR DCW 7
        AREA mydata, DATA, READWRITE
RESULT  SPACE 8
        END
