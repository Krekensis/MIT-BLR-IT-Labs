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
        LDR R0, =NO_ALIGN
        MOV R1, #0x12
        STRB R1, [R0]
        MOV R1, #0x34
        STRB R1, [R0, #1]

        LDR R0, =ALIGN_TWO
        MOV R1, #0x56
        STRB R1, [R0]
        MOV R1, #0x78
        STRB R1, [R0, #1]

        LDR R0, =ALIGN_FOUR
        MOV R1, #0x9A
        STRB R1, [R0]
        MOV R1, #0xBC
        STRB R1, [R0, #1]
STOP    B STOP

        AREA mydata, DATA, READWRITE
NO_ALIGN SPACE 2
        ALIGN 2
ALIGN_TWO SPACE 2
        ALIGN 4
ALIGN_FOUR SPACE 2
        END
