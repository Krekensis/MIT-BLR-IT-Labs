AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10001000
    DCD Reset_Handler
    ALIGN

    AREA mycode, CODE, READONLY
    EXPORT Reset_Handler

Reset_Handler
    ; --- Part 1: Check if R0 is even/odd ---
    LDR R0, =0x00000004 ; Load test value 4 into R0
    MOV R2, #0x00       ; Clear R2 (will act as a flag)
    TST R0, #0x01       ; Test the least significant bit (LSB) of R0
    MOVEQ R2, #0x01     ; If LSB is 0 (number is even), set R2 to 1
    
    ; --- Part 2: Check Highest Bit / Sign ---
    LDR R3, =0x00000005 ; Load test value 5 into R3
    MOV R4, #0x00       ; Clear R4 (will act as a flag)
    MOV R5, R3, LSL #31 ; Logical Shift Left by 31 to isolate the LSB at the highest bit
    TEQ R5, #0x80000000 ; Test Equivalence against 0x80000000 (highest bit set)
    MOVNE R4, #0x01     ; If they are Not Equal, set R4 to 1
    
STOP 
    B STOP

    END