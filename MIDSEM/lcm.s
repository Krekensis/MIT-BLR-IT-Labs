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
        LDR R0, =NUM1
        LDR R0, [R0]

        LDR R1, =NUM2
        LDR R1, [R1]

        MOV R2, R0
        MOV R3, R1

; ---------- Find GCD ----------
GCD_LOOP
        CMP R2, R3
        BEQ GCD_DONE

        BHI A_GREATER

        SUB R3, R3, R2
        B GCD_LOOP

A_GREATER
        SUB R2, R2, R3
        B GCD_LOOP

GCD_DONE
        MOV R4, R2          ; R4 = GCD

; ---------- Product ----------
        MUL R5, R0, R1      ; R5 = NUM1 * NUM2

; ---------- Divide product by GCD ----------
        MOV R6, #0          ; Quotient

DIV_LOOP
        CMP R5, R4          ; Compare R5 with R4 Is R5 < R4?
        BLO DONE            ; If R5 < R4, division is finished
        SUB R5, R5, R4      ; R5 = R5 - R4  Subtract divisor once
        ADD R6, R6, #1      ; R6 = R6 + 1  Count one subtraction
        B DIV_LOOP          ; Repeat

DONE
        LDR R7, =RESULT
        STR R6, [R7]

STOP
        B STOP

NUM1    DCD 12
NUM2    DCD 18

        AREA data, DATA, READWRITE

RESULT  DCD 0

        END