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
        LDR R0, =DIVIDEND
        LDR R0, [R0]           ; R0 = 32-bit dividend

        LDR R1, =DIVISOR
        LDRH R1, [R1]          ; R1 = 16-bit divisor

        MOV R2, #0             ; R2 = quotient

DIV_LOOP
        CMP R0, R1              ; Compare dividend with divisor
        BLO DONE                ; If dividend < divisor, stop

        SUB R0, R0, R1          ; Dividend = dividend - divisor
        ADD R2, R2, #1          ; Increment quotient

        B DIV_LOOP              ; Repeat subtraction

DONE
        ; R2 = quotient
        ; R0 = remainder

        LDR R3, =QUOTIENT
        STR R2, [R3]            ; Store quotient

        LDR R3, =REMAINDER
        STR R0, [R3]            ; Store remainder

STOP
        B STOP

DIVIDEND  DCD 100
DIVISOR   DCW 7

        AREA data, DATA, READWRITE

QUOTIENT  DCD 0
REMAINDER DCD 0

        END