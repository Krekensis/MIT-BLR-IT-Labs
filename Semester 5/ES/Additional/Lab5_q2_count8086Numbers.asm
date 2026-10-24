; 8086 MASM/TASM program: count even, odd, and values greater than 10.
DATA SEGMENT
    NUMBERS DB 3, 12, 7, 20, 10, 15, 2, 11
    COUNT   EQU 8
    EVEN_CT DW 0
    ODD_CT  DW 0
    GT10_CT DW 0
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
    LEA SI, NUMBERS
    MOV CX, COUNT
    XOR BX, BX              ; BL = even count, BH = odd count
    XOR DI, DI              ; DI = count greater than 10

NEXT_NUM:
    MOV AL, [SI]
    TEST AL, 1
    JNZ IS_ODD
    INC BL
    JMP CHECK_TEN
IS_ODD:
    INC BH
CHECK_TEN:
    CMP AL, 10
    JBE NOT_GREATER
    INC DI
NOT_GREATER:
    INC SI
    LOOP NEXT_NUM

    XOR AX, AX
    MOV AL, BL
    MOV EVEN_CT, AX
    XOR AX, AX
    MOV AL, BH
    MOV ODD_CT, AX
    MOV GT10_CT, DI

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
