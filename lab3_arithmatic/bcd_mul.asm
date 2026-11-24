    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler

Reset_Handler
    LDR     R0, =A
    LDR     R0, [R0]       ; First BCD number

    LDR     R1, =B
    LDR     R1, [R1]       ; Second BCD number

    MOV     R2, #0         ; Result
    MOV     R3, #0         ; Counter

LOOP
    CMP     R3, R1
    BEQ     END

    ADD     R2, R2, R0     ; Add A repeatedly
    ADD     R3, R3, #1
    B       LOOP
END
    LDR     R4, =RESULT
    STR     R2, [R4]

STOP
    B       STOP

        AREA    DATASEG, DATA, READWRITE
A       DCD     0x12
B       DCD     0x03
RESULT  DCD     0
        END