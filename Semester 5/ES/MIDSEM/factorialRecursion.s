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
        MOV R0, #5             ; Find 5!
        BL FACTORIAL           ; Call recursive function

        LDR R1, =RESULT
        STR R0, [R1]           ; Store result

STOP
        B STOP


; ---------- Factorial ----------
FACTORIAL
        CMP R0, #1
        BEQ BASE               ; If n = 1, return 1

        PUSH {R0, LR}          ; Save n and return address

        SUB R0, R0, #1         ; n = n - 1
        BL FACTORIAL           ; factorial(n-1)

        POP {R1, LR}           ; Restore original n
        MUL R0, R0, R1         ; n × factorial(n-1)

        BX LR

BASE
        MOV R0, #1             ; factorial(1) = 1
        BX LR

        AREA data, DATA, READWRITE

RESULT  DCD 0

        END