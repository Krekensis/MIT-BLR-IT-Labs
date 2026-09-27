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
        LDR R1, =NUM2
        LDR R2, =RESULT

        LDR R3, [R0]
        LDR R4, [R1]
        ADDS R5, R3, R4
        STR R5, [R2]

        LDR R3, [R0, #4]        ; #4 = increment by 4 bytes (32bits)
        LDR R4, [R1, #4]
        ADCS R5, R3, R4
        STR R5, [R2, #4]

        LDR R3, [R0, #8]
        LDR R4, [R1, #8]
        ADCS R5, R3, R4
        STR R5, [R2, #8]

        LDR R3, [R0, #12]
        LDR R4, [R1, #12]
        ADCS R5, R3, R4
        STR R5, [R2, #12]

STOP
        B STOP

NUM1    DCD 0x12345678, 0x23456789, 0x34567890, 0x45678901    ; 4*32 = 128bits
NUM2    DCD 0x11111111, 0x22222222, 0x33333333, 0x44444444    ; 4*32 = 128bits

        AREA data, DATA, READWRITE

RESULT  SPACE 16        ; this is bytes so 16*8 = 128bits

        END



-------------- OR -----------------

Reset_Handler
        LDR R0, =NUM1
        LDR R1, =NUM2
        LDR R2, =RESULT

        ; --- Word 0 (Least Significant) ---
        LDR R3, [R0], #4    ; Load from R0, then R0 = R0 + 4
        LDR R4, [R1], #4    ; Load from R1, then R1 = R1 + 4
        ADDS R5, R3, R4     ; Add with carry setup
        STR R5, [R2], #4    ; Store to R2, then R2 = R2 + 4

        ; --- Word 1 ---
        LDR R3, [R0], #4    ; R0 moves to offset 8
        LDR R4, [R1], #4    ; R1 moves to offset 8
        ADCS R5, R3, R4     ; Add with previous carry
        STR R5, [R2], #4    ; R2 moves to offset 4

        ; --- Word 2 ---
        LDR R3, [R0], #4    ; R0 moves to offset 12
        LDR R4, [R1], #4    ; R1 moves to offset 12
        ADCS R5, R3, R4
        STR R5, [R2], #4    ; R2 moves to offset 8

        ; --- Word 3 (Most Significant) ---
        LDR R3, [R0], #4    ; R0 finishes traversal
        LDR R4, [R1], #4    ; R1 finishes traversal
        ADCS R5, R3, R4
        STR R5, [R2], #4    ; R2 finishes traversal