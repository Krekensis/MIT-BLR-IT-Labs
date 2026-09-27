        AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x40001000
        DCD Reset_Handler
        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler
        LDR R1, =VALUE1
        LDR R2, =VALUE2

        UMULL R3, R4, R2, R1
            ; R3 = Lower 32 bits
            ; R4 = Upper 32 bits

        LDR R2, =RESULT
        STR R3, [R2]
        ADD R2, R2, #4
        STR R4, [R2]

STOP
        B STOP

VALUE1  DCD 0x54000000
VALUE2  DCD 0x10000002

        AREA data, DATA, READWRITE

RESULT  DCD 0

        END