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
        LDR R0, =SOURCE
        LDR R1, [R0]
        LDR R2, [R0, #4]
        LDR R3, [R0, #8]
        LDR R4, [R0, #12]

        LDR SP, =STACK_TOP
        STMDB SP!, {R1-R4}      ; Push on a fully descending stack
        LDMIA SP!, {R5-R8}      ; Pop the same values in ascending address order

        LDR R0, =RESULT
        STMIA R0!, {R5-R8}
STOP    B STOP
        AREA mydata, DATA, READWRITE
SOURCE  DCD 11, 22, 33, 44
RESULT  SPACE 16
        ALIGN 3
STACK   SPACE 64
STACK_TOP
        END
