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
        LDR R0, [R0]            ; R0 = 32-bit packed BCD number (0x12345678)

        LDR R1, =RESULT         ; R1 → output character array pointer
        MOV R2, #8              ; Loop counter: 8 digits total

LOOP
        AND R3, R0, #0x0F       ; Extract lowest BCD nibble (4 bits)
        ADD R3, R3, #0x30       ; Convert nibble to 8-bit ASCII character

        STRB R3, [R1]           ; Store 8-bit ASCII character (1 byte) in memory

        ADD R1, R1, #1          ; Move pointer forward by 1 byte
        MOV R0, R0, LSR #4      ; Shift R0 right by 4 bits to expose the next BCD digit

        SUBS R2, R2, #1         ; Decrement digit counter
        BNE LOOP                ; Repeat for all 8 digits

STOP
        B STOP                  ; Infinite loop to end program

BCD     DCD 0x12345678

        AREA data, DATA, READWRITE

RESULT  SPACE 32                ; Allocated 32 bytes (Though 8 bytes are enough for 8 chars)

        END