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
        LDR R0, =ASCII
        LDR R1, =RESULT

        LDRB R2, [R0]          ; Load first ASCII digit
        LDRB R3, [R0, #1]      ; Load second ASCII digit

        SUB R2, R2, #0x30      ; ASCII → hexadecimal
        SUB R3, R3, #0x30

        LSL R2, R2, #4         ; First digit → upper nibble

        ORR R4, R2, R3         ; Combine both nibbles

        STRB R4, [R1]          ; Store packed hexadecimal result

STOP
        B STOP

ASCII   DCB '3', 'A'

        AREA data, DATA, READWRITE

RESULT  DCB 0

        END