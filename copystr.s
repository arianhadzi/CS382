/**
 * Name: Arian Hadzibrahimi
 * Pledge: I pledge my honor that i have abided by the Stevens Honor System
*/

.text
.global _start

_start:
    
mov x0, 0   // loop counter for src_str
mov x1, 0   // loop counter for dst_str 


loop:
    ldrb w2, [src_str, x0] // Loads a single byte from src_str at an offset of the value of x0
    strb w2, [dst_str, x1] 
    cmp w2, #0 // Check if dst_str has reached null terminator
    beq print // If null terminator reached, jump to printing call
    add x0, x0, #1 // increment by immediate value #1
    add x1, x1, #1
    b loop

print: 
    mov x0, 1   // Stdout call
    adr x1, =dst_str // Address of string
    adr x3, len_dst  // Load length 
    ldr x2, [x3]
    mov x8, 64
    svc 0


mov x0, 0
mov x8, 93
svc 0

/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */

 .data 
    len_dst: .quad . - dst_str


