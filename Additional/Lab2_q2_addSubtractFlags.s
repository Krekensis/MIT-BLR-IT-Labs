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
        ; Addition examples demonstrate carry, zero, negative, and overflow.
        LDR R0, =ADD_A
        LDR R1, [R0]
        LDR R0, =ADD_B
        LDR R2, [R0]
        ADDS R3, R1, R2         ; 0xFFFFFFFF + 1: Z=1, C=1
        MRS R4, APSR
        LDR R0, =ADD_RESULT
        STR R3, [R0]
        STR R4, [R0, #4]

        LDR R0, =OVF_A
        LDR R1, [R0]
        LDR R0, =OVF_B
        LDR R2, [R0]
        ADDS R3, R1, R2         ; 0x7FFFFFFF + 1: N=1, V=1
        MRS R4, APSR
        LDR R0, =OVF_RESULT
        STR R3, [R0]
        STR R4, [R0, #4]

        ; Subtraction examples demonstrate borrow/carry, zero, negative, overflow.
        LDR R0, =SUB_A
        LDR R1, [R0]
        LDR R0, =SUB_B
        LDR R2, [R0]
        SUBS R3, R1, R2         ; 5 - 5: Z=1, C=1
        MRS R4, APSR
        LDR R0, =SUB_RESULT
        STR R3, [R0]
        STR R4, [R0, #4]

        LDR R0, =NEG_A
        LDR R1, [R0]
        LDR R0, =NEG_B
        LDR R2, [R0]
        SUBS R3, R1, R2         ; 0 - 1: N=1, C=0
        MRS R4, APSR
        LDR R0, =NEG_RESULT
        STR R3, [R0]
        STR R4, [R0, #4]

        LDR R0, =SUB_OVF_A
        LDR R1, [R0]
        LDR R0, =SUB_OVF_B
        LDR R2, [R0]
        SUBS R3, R1, R2         ; 0x80000000 - 1: V=1
        MRS R4, APSR
        LDR R0, =SUB_OVF_RESULT
        STR R3, [R0]
        STR R4, [R0, #4]
STOP    B STOP

ADD_A   DCD 0xFFFFFFFF
ADD_B   DCD 1
OVF_A   DCD 0x7FFFFFFF
OVF_B   DCD 1
SUB_A   DCD 5
SUB_B   DCD 5
NEG_A   DCD 0
NEG_B   DCD 1
SUB_OVF_A DCD 0x80000000
SUB_OVF_B DCD 1
        AREA mydata, DATA, READWRITE
ADD_RESULT SPACE 8
OVF_RESULT SPACE 8
SUB_RESULT SPACE 8
NEG_RESULT SPACE 8
SUB_OVF_RESULT SPACE 8
        END
