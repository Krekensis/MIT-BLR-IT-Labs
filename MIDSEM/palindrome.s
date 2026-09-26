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
        LDR R0, =src
        LDR R1, =palin
        LDR R2, [R0]         ; R2 = The 32-bit number to check

        MOV R3, #4           ; Loop counter: 4 pairs to check (8 nibbles total)
        MOV R4, #0           ; Right-side shift amount (starts at 0)
        MOV R5, #28          ; Left-side shift amount (starts at 28)

CHECK_LOOP
        ; 1. Extract the Right nibble
        LSR R6, R2, R4       ; Shift right by R4
        AND R6, R6, #0xF     ; Mask to keep only the lowest 4 bits

        ; 2. Extract the Left nibble
        LSR R7, R2, R5       ; Shift right by R5
        AND R7, R7, #0xF     ; Mask to keep only the lowest 4 bits

        ; 3. Compare the outer pair
        CMP R6, R7
        BNE NOT_PALINDROME   ; Early exit! If they don't match, it's not a palindrome

        ; 4. Move pointers/shifts inward for the next pair
        ADD R4, R4, #4       ; Move right pointer inward (0 -> 4 -> 8 -> 12)
        SUBS R5, R5, #4      ; Move left pointer inward (28 -> 24 -> 20 -> 16)

        SUBS R3, R3, #1      ; Decrement pair counter
        BNE CHECK_LOOP       ; Repeat until all 4 pairs match

        ; If it survived the loop, it's a palindrome!
        MOV R8, #1
        STR R8, [R1]
        B STOP

NOT_PALINDROME
        MOV R8, #0           ; Mismatch found
        STR R8, [R1]

STOP
        B STOP

src     DCD 0xFFFAAFFF

        AREA mydata, DATA, READWRITE
palin   DCD 0
        END