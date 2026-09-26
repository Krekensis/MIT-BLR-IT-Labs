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
        LDR R0, =HEX
        LDR R1, =RESULT

        LDRB R2, [R0]          ; R2 = hexadecimal value

        MOV R3, #0             ; Tens digit
        MOV R4, #10

DIV_LOOP
        CMP R2, R4             ; Is number >= 10?
        BLO DONE

        SUB R2, R2, R4         ; Subtract 10
        ADD R3, R3, #1         ; Increment tens digit

        B DIV_LOOP

DONE
        ; R3 = tens digit
        ; R2 = units digit

        LSL R3, R3, #4         ; Move tens digit to upper nibble
        ORR R3, R3, R2         ; Combine tens and units

        STRB R3, [R1]          ; Store BCD result

STOP
        B STOP

HEX     DCB 0x19

        AREA data, DATA, READWRITE

RESULT  DCB 0

        END