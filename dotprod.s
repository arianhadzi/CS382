.text
.global _start

_start:
    adr x0, vec1
    adr x1, vec2    // Load vectors into registers 0, 1

    ldr x2, [x0]
    ldr x3, [x1]    // Load vec1[0] and vec2[0] into 2, 3 
    mul x4, x3, x2  // x4 = vec1[0] * vec2[0]

    ldr x2, [x0, #8]
    ldr x3, [x1, #8]
    mul x5, x3, x2  // x5 = vec1[1] * vec2[1]

    ldr x2, [x0, #16]
    ldr x3, [x1, #16]
    mul x6, x3, x2  // x6 = vec1[2] * vec2[2]

    add x7, x4, x5  // x7 = x4 + x5
    add x7, x7, x6  // x7 = x7 + x6

    str x7, [dot]

    MOV x0, 0
    MOV x8, 93
    SVC 0
    
    

.data
vec1: .quad 10,20,30
vec2: .quad 1, 2, 3
dot: .quad 0