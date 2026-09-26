AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler
        LDR R0, =TARGET       ; R0 = Address of target value
        LDR R0, [R0]          ; R0 = Actual target value to search for
        
        LDR R1, =ARRAY        ; R1 = Pointer to the start of the array
        MOV R2, #10           ; R2 = Loop counter (10 elements)
        MOV R3, #0            ; R3 = Index tracker (starts at index 0)

SEARCH_LOOP
        LDR R4, [R1]          ; Load current array element into R4
        CMP R4, R0            ; Compare current element with target
        BEQ FOUND             ; If R4 == target, jump to FOUND

        ADD R1, R1, #4        ; Move array pointer to the next 32-bit word (+4 bytes)
        ADD R3, R3, #1        ; Increment index tracker
        SUBS R2, R2, #1       ; Decrement loop counter
        BNE SEARCH_LOOP       ; Repeat loop if counter is not zero

NOT_FOUND
        MOV R5, #-1           ; Target not found: Store -1 in R5
        B STOP

FOUND
        MOV R5, R3            ; Target found: Store the matched index in R5 
                              ; (Optional: R1 holds the exact RAM address of the element)

STOP
        B STOP                ; Infinite loop to terminate program

        ; --- Data Section ---
TARGET  DCD 42                ; The number we are searching for

        AREA data, DATA, READWRITE
ARRAY   DCD 10, 25, 8, 99, 42, 73, 12, 5, 64, 30  ; Array of ten 32-bit numbers

        END