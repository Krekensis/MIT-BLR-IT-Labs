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

LOOP  
        CMP R0, R1          ; Compare the two numbers (sets condition flags)
        BEQ DONE            ; If R0 == R1, we found the GCD; exit loop (Branch equal)

        BHI A_GREATER       ; If R0 > R1, branch to A_GREATER (Branch higher)

        SUB R1, R1, R0      ; If R1 > R0, subtract R0 from R1 and store in R1
        B LOOP              ; Repeat loop (Branch)

A_GREATER
        SUB R0, R0, R1      ; If R0 > R1, subtract R1 from R0 and store in R0
        B LOOP              ; Repeat loop

DONE
        LDR R2, =RESULT
        STR R0, [R2]

STOP
        B STOP              ; Infinite loop to halt program execution

NUM1    DCD 48              ; First number input
NUM2    DCD 18              ; Second number input

        AREA data, DATA, READWRITE

RESULT  DCD 0               ; Variable to store the final output

        END