    .data
buf:
    .byte 0
    .text
    .globl main
main:
    mov $0, %rdi
    mov $buf, %rsi
    mov $1, %rdx
    mov $0, %rax
    syscall
    mov $1, %rdi
    mov $1, %rax
    syscall
    mov $10, %rax
    mov %rax, buf
    mov $1, %rax
    syscall
    mov $0, %rax
    ret
