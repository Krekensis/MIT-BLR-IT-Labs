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
        LDR R0, =NUMBER
        LDR R0, [R0]            ; Load number into R0

        TST R0, #1              ; Check least significant bit

        BEQ EVEN                ; Z = 1 → LSB is 0 → Even
        BNE ODD                 ; Z = 0 → LSB is 1 → Odd

ODD
        MOV R1, #1              ; R1 = 1 → Odd
        B STORE

EVEN
        MOV R1, #0              ; R1 = 0 → Even
        B STORE

STORE
        LDR R2, =RESULT
        STR R1, [R2]            ; Store result

STOP
        B STOP

NUMBER  DCD 25                  ; Change this number to test

        AREA data, DATA, READWRITE
RESULT  DCD 0                   ; 0 = Even, 1 = Odd

        END