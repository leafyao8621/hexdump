    .data
buf:
    .quad 0
tmp:
    .quad 0
    .text
    .globl main
main:
    mov $buf, %rsi
l1:
    mov $0, %rdi

    mov $1, %rdx
    mov $0, %rax
    syscall

    mov $0, %rbx
    cmp %rax, %rbx
    je el1

    mov $10, %rbx

    mov buf, %rax
    mov %rax, tmp
    shr $4, %rax

    cmp %rbx, %rax
    jge c1_a

    add $0x30, %rax
    jmp c1_end
c1_a:
    sub $10, %rax
    add $0x41, %rax
c1_end:
    mov %rax, buf
    mov $1, %rdi
    mov $1, %rax
    syscall

    mov tmp, %rax
    and $0xf, %rax

    cmp %rbx, %rax
    jge c2_a

    add $0x30, %rax
    jmp c2_end
c2_a:
    sub $10, %rax
    add $0x41, %rax
c2_end:
    mov %rax, buf
    mov $1, %rax
    syscall

    mov $10, %rax
    mov %rax, buf
    mov $1, %rax
    syscall
    jmp l1
el1:
    mov $0, %rax
    ret
