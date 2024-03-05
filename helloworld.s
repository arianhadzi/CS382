.data
msg:    .string "Hello World!\n"
msg_len:    .quad   . - msg

.text
.global _start

_start:
    mov     x0, #1
    ldr     x1, =msg
    ldr     x2, =msg_len
    mov     x8, #64

    svc     #0

    mov     x0, #0
    mov     x8, #93
    svc     #0