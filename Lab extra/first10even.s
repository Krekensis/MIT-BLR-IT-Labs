    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10001000     ; Initial Stack Pointer
    DCD Reset_Handler  ; Reset Vector
    ALIGN

    AREA mycode, CODE, READONLY
    EXPORT Reset_Handler

Reset_Handler
    LDR R0, =0x00000000 ; Initial even number (0)
    LDR R1, =0x0000000A ; Loop counter (10 in decimal)
    LDR R2, =0x40000000 ; Destination base address in memory
    
    BL EVEN             ; Branch with Link to the EVEN subroutine
    
STOP 
    B STOP              ; Infinite loop to end program

EVEN
    STR R0, [R2], #4    ; Store current even number and increment address by 4
    ADD R0, R0, #0x02   ; Add 2 to generate the next even number
    SUBS R1, R1, #0x01  ; Decrement the loop counter
    BNE EVEN            ; If counter is not zero, branch back to EVEN
    
    MOV PC, LR          ; Return from subroutine (Move Link Register to Program Counter)

    END