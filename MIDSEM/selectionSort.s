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
        LDR R0, =LIST          ; R0 = address of array
        MOV R1, #0             ; i = 0

OUTER
        MOV R2, R1             ; R2 = min index
        ADD R3, R1, #1         ; R3 = j = i + 1

INNER
        CMP R3, #10            ; j == 10?
        BGE SWAP               ; If yes, finish this pass

        LSL R4, R2, #2         ; R4 = min index × 4
        LSL R5, R3, #2         ; R5 = j × 4

        LDR R6, [R0, R4]       ; R6 = A[min]
        LDR R7, [R0, R5]       ; R7 = A[j]

        CMP R7, R6             ; Is A[j] < A[min]?
        BLT NEW_MIN

NEXT
        ADD R3, R3, #1         ; j++
        B INNER

NEW_MIN
        MOV R2, R3             ; min = j
        B NEXT

SWAP
        LSL R4, R1, #2         ; Address offset of A[i]
        LSL R5, R2, #2         ; Address offset of A[min]

        LDR R6, [R0, R4]       ; R6 = A[i]
        LDR R7, [R0, R5]       ; R7 = A[min]

        STR R7, [R0, R4]       ; A[i] = A[min]
        STR R6, [R0, R5]       ; A[min] = A[i]

        ADD R1, R1, #1         ; i++
        CMP R1, #9
        BLT OUTER

STOP
        B STOP

LIST
        DCD 16, 5, 33, 24, 56
        DCD 77, 21, 4, 87, 1

        END