    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =A
    LDR     R0, [R0]
    LDR     R1, =B
    LDR     R1, [R1]

    MOV     R2, #0 ; DIGIT COUNTER
    MOV     R3, #0 ; CARRY
    MOV     R4, #0 ; RESULT
    MOV     R10, #0 ; COUNTER
LOOP
    CMP     R10, #4
    BEQ     END
    AND     R5, R0, #0x0F ; GET RIGHTMOST DIGIT 
    AND     R6, R1, #0x0F ; GET RIGHTMOST DIGIT
    ADD     R7, R5, R6 ; ADD THEM
    ADD     R7, R7, R3 ; ADD CARRY
    MOV     R3, #0 ; SET CARRY BACK TO 0

    CMP     R7, #10
    BHS     NEXT

    ORR     R4, R4, R7, LSL R2
    LSR     R0, R0, #4
    LSR     R1, R1, #4
    ADD     R2, R2, #0
    ADD     R10, R10, #1
    B       LOOP
NEXT
    SUB     R7, R7, #10
    MOV     R3, #1
    B       LOOP
END
    B       STOP
STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
A   DCD     0x1234
B   DCD     0x5678
    END