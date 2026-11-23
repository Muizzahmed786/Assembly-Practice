    AREA    RESET, READONLY
    EXPORT  __Vectors
__Vectors   
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    AREA    mycode, CODE, READONLY
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =VAL
    LDR     R0, [R0]

    AND     R1, R0, 0xFF00 ; STORE UPPER BYTE WHICH IS SENSOR ID
    AND     R2, R0, 0x00FF ; STORE LOWER BYTE WHICH IS DATA VALUE

    LSR     R1, R1, #8
    LSL     R2, R2, #8
    ORR     R0, R1, R2

    CMP     R1, R2
    BHI     LOWER_GREATER

    MOV     R3, R2
    B       STOP
LOWER_GREATER
    MOV     R3, R1
    B       STOP
STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
VAL     DCW     0x1234
DEST    DCB     0x00
