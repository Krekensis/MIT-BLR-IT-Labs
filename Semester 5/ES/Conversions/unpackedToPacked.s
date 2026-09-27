        AREA RESET, DATA, READONLY
        EXPORT Vectors

Vectors
        DCD 0x40001000
        DCD Reset_Handler
        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler
        LDR R0, =UNPACKED
        LDR R1, =RESULT

        MOV R2, #0             ; Packed result
        MOV R3, #8             ; 8 hexadecimal digits

LOOP
        LDRB R4, [R0]          ; Get one unpacked digit
        LSL R2, R2, #4         ; Make room for new digit
        ORR R2, R2, R4         ; Add digit to result

        ADD R0, R0, #1         ; Next digit
        SUBS R3, R3, #1
        BNE LOOP

        STR R2, [R1]           ; Store packed 32-bit result

STOP
        B STOP

UNPACKED
        DCB 0x01, 0x02, 0x03, 0x04
        DCB 0x05, 0x06, 0x07, 0x08

        AREA data, DATA, READWRITE

RESULT  DCD 0

        END