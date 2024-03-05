// Author: Arian Hadzibrahimi
// Pledge: I pledge my honor that I have abided by the Stevens Honor System
// Date: 10/5/23
// Name: Lab 4, Task 1

.text
.global _start

_start:
    // Load variable addresses 
    ADR X0, [side_a]
    ADR X1, [side_b]
    ADR X2, [side_c]

    // Load variable values from variable addresses
    LDR X3, X0 // X3 = a = 3
    LDR X4, X1 // X4 = b = 4
    LDR X5, X2 // X5 = c = 5

    // Calculation of a^2 + b^2
    MUL X3, X3, X3 // X3 = a^2 = 9
    MUL X4, X4, X4 // X4 = b^2 = 16
    ADD X6, X3, X4 // X6 = X3 + X4

    // Calculate c^2 and check equality using CMP 
    MUL X5, X5, X5
    CMP X5, X6

    B.EQ right_triangle // branch to if c^2 = a^2 + b^2
    B not_right_triangle // branch to otherwise

right_triangle:
    // Label to print "It is a right triangle."
    MOV X0, 1
    ADR X1, yes
    ADR X3, len_yes
    LDR X2, [X3]
    MOV X8, 64
    SVC 0

not_right_triangle:
    // Print "It is not a right triangle."
    MOV X0, 1
    ADR X1, yes
    ADR X3, len_yes
    LDR X2, [X3]
    MOV X8, 64
    SVC 0 

MOV x0, 0
MOV x8, 93
SVC 0


.data
side_a: .quad 3
side_b: .quad 4
side_c: .quad 5
yes: .string "It is a right triangle.\n"
len_yes: .quad . - yes // Calculate the length of string yes
no: .string "It is not a right triangle.\n"
len_no: .quad . - no // Calculate the length of string no