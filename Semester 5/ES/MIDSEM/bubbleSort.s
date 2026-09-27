        AREA RESET, DATA, READONLY
        EXPORT Vectors

Vectors
        DCD 0x40001000
        DCD Reset_Handler
        ALIGN

        AREA ascend, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler
        LDR R0, =LIST          ; R0 → array
        MOV R9, #9             ; 9 passes

; ---------- Bubble Sort ----------
OUTER_LOOP
        MOV R5, R0             ; R5 → beginning of array
        MOV R4, R9             ; Number of comparisons

INNER_LOOP
        LDR R6, [R5], #4       ; R6 = current, R5 moves to next
        LDR R7, [R5]           ; R7 = next element

        CMP R7, R6             ; Compare current and next

        ; If R7 <= R6, swap
        STRLS R6, [R5]
        STRLS R7, [R5, #-4]

        SUBS R4, R4, #1
        BNE INNER_LOOP

        SUBS R9, R9, #1
        BNE OUTER_LOOP

STOP
        B STOP

LIST
        DCD 0x10, 0x05, 0x33, 0x24, 0x56
        DCD 0x77, 0x21, 0x04, 0x87, 0x01

        END