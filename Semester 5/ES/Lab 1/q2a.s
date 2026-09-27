Write an ARM assembly language program to transfer block of ten 32 bit numbers from one location to another

a. When the source and destination blocks are non-overlapping (from code memory to data memory)
b. When the source and destination blocks are overlapping


AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10001000
    DCD Reset_Handler
    ALIGN

    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    LDR R0, =SRC_BLK       ; R0 points to source array in ROM (Code)
    LDR R1, =DST_BLK       ; R1 points to destination in RAM (Data)
    MOV R2, #10            ; Loop counter for 10 numbers

LOOP
    LDR R3, [R0], #4       ; Load value from [R0] to R3, then add 4 to R0 (Post-indexed)
    STR R3, [R1], #4       ; Store value from R3 to [R1], then add 4 to R1
    SUBS R2, R2, #1        ; Subtract 1 from counter, update status flags (S)
    BNE LOOP               ; Branch back to LOOP if counter != 0

STOP 
    B STOP

SRC_BLK DCD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10        ; Source data block stored in CODE memory

    AREA mydata, DATA, READWRITE
DST_BLK SPACE 40           ; Reserve 40 bytes (10 words * 4 bytes) for the destination

    END