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
        LDR R0, =RESULT       ; R0 → destination array
        MOV R1, #10           ; Generate 10 numbers

        MOV R2, #0            ; First Fibonacci number
        MOV R3, #1            ; Second Fibonacci number

LOOP
        STR R2, [R0]          ; Store current Fibonacci number

        ADD R0, R0, #4        ; Move to next memory location

        ADD R4, R2, R3        ; R4 = R2 + R3
        MOV R2, R3             ; Shift R3 into R2
        MOV R3, R4             ; New Fibonacci number

        SUBS R1, R1, #1        ; Decrease counter
        BNE LOOP               ; Repeat until 10 numbers generated

STOP
        B STOP

        AREA data, DATA, READWRITE

RESULT  SPACE 40              ; Space for 10 × 4 bytes

        END