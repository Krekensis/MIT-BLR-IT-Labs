;Reverse an array of ten 32 bit numbers in the memory.



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
        LDR R0, =ARRAY        ; Source address
        LDR R1, =REVERSE      ; Destination address
        ADD R0, R0, #36        ; Point to last element
        MOV R2, #10            ; 10 numbers

LOOP
        LDR R3, [R0]           ; Read from end of source
        STR R3, [R1]           ; Store in destination

        SUB R0, R0, #4         ; Move source backwards
        ADD R1, R1, #4         ; Move destination forwards

        SUBS R2, R2, #1
        BNE LOOP

STOP
        B STOP

ARRAY   DCD 1,2,3,4,5,6,7,8,9,10

        AREA mydata, DATA, READWRITE
REVERSE SPACE 40

        END