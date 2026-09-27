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
        LDR R0, =BCD
        LDR R1, =RESULT

        LDRB R2, [R0]          ; Load BCD number

        AND R3, R2, #0xF0      ; Extract tens digit = 20
        LSR R3, R3, #4         ; 02

        AND R4, R2, #0x0F      ; Extract units digit = 05

        MOV R5, #10
        MUL R3, R3, R5         ; Tens (02) × 10 = 20

        ADD R3, R3, R4         ; Decimal value = 20 + 05 = 25

        STRB R3, [R1]          ; Store hexadecimal result

STOP
        B STOP

BCD     DCB 0x25

        AREA data, DATA, READWRITE

RESULT  DCB 0

        END