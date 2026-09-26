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
        LDR R0, [R0]            ; R0 = 32-bit BCD number

        LDR R1, =RESULT        ; R1 → output array
        MOV R2, #8              ; 8 digits

LOOP
        AND R3, R0, #0x0F      ; Extract lowest BCD digit
        ADD R3, R3, #0x30       ; Convert digit to ASCII

        STR R3, [R1]            ; Store 32-bit ASCII value

        ADD R1, R1, #4          ; Next output location
        MOV R0, R0, LSR #4      ; Move next digit into lower nibble

        SUBS R2, R2, #1
        BNE LOOP

STOP
        B STOP

BCD     DCD 0x12345678

        AREA data, DATA, READWRITE

RESULT  SPACE 32              ; 8 × 4 bytes

        END