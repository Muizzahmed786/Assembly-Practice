    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =ARR
    MOV     R1, #0 ; I = 0
OUTER_LOOP
    MOV     R2, R1 ; MIN_INDEX = I
    MOV     R3, R1, #1 ; J = I + 1
INNER_LOOP
    LDR     R4, [R0, R3, LSL #2] ; ARR[J]
    LDR     R5, [R0, R2, LSL #2] ; ARR[MIN_INDEX]

    CMP     R4, R5
    BGT     NEXT ; IF ARR[J] > ARR[MIN_INDEX], THEN SKIP

    MOV     R2, R3 ; MIN_INDEX = J
    ADD     R3, R3, #1
    CMP     R3, #4 ; CHECK J < N
    BLO     INNER_LOOP
NEXT
    CMP     R2, R1
    BNE     SWAP

    ADD     R1, R1, #1
    CMP     R1, #3
    BLO     OUTER_LOOP

    B       STOP
SWAP
    LDR     R6, [R0, R1, LSL #2] ; ARR[I]
    LDR     R5, [R0, R2, LSL #2] ; ARR[MIN_INDEX]

    STR     R5, [R0, R1, LSL #2]
    STR     R6, [R0, R2, LSL #2]

    ADD     R1, R1, #1
    CMP     R1, #3
    BLO     OUTER_LOOP

    B       STOP
STOP
    B       STOP
    
    AREA    DATASEG, DATA, READWRITE
ARR     DCD     10, 30, 20, 50, 40
    END