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
        LDR R0, =NUM
        LDR R3, =RESULT

        LDRB R1, [R0]          ; Load hexadecimal number

        AND R2, R1, #0x0F      ; Mask upper 4 bits (isolating A from 3A)
        CMP R2, #09             ; Check if digit <= 9
        BLS DOWN

        ADD R2, R2, #07         ; A-F → add 7

DOWN
        ADD R2, R2, #0x30       ; Convert to ASCII
        STRB R2, [R3]           ; Store first ASCII digit

        AND R4, R1, #0xF0       ; Mask lower 4 bits
        MOV R4, R4, LSR #4      ; Shift to lower position

        CMP R4, #09             ; Check if digit <= 9
        BLS DOWN1

        ADD R4, R4, #07         ; A-F → add 7

DOWN1
        ADD R4, R4, #0x30       ; Convert to ASCII
        STRB R4, [R3, #1]       ; Store second ASCII digit

STOP
        B STOP

NUM     DCD 0x0000003A

        AREA data, DATA, READWRITE

RESULT  SPACE 2

        END