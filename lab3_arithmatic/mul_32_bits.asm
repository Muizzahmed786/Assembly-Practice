    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =NUM1
    LDR     R0, [R0]
    LDR     R1, =NUM2
    LDR     R1, [R1]

    UMULL   R2, R3, R0, R1
    
    LDR     R3, =RESULT
    STR     R2, [R0]
    STR     R2, [R0, #4]
STOP
    B       STOP
    
