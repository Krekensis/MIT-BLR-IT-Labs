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
        LDR R0, =VALUE1
        LDR R0, [R0]

        LDR R1, =VALUE2
        LDR R1, [R1]

        MOV R2, #0          ; Lower 32-bit result
        MOV R3, #0          ; Carry

LOOP
        ADDS R2, R2, R0     ; Add VALUE1
        ADC R3, R3, #0      ; Add carry

        SUBS R1, R1, #1
        BNE LOOP

        LDR R4, =RESULT
        STR R2, [R4]

        ADD R4, R4, #4
        STR R3, [R4]

STOP
        B STOP

VALUE1  DCD 5
VALUE2  DCD 6

        AREA data, DATA, READWRITE

RESULT  SPACE 8

        END