	.file	"hexdump.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	buf(%rip), %rbx
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	movq	buf(%rip), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	%rax, tmp(%rip)
	shrq	$4, %rax
	leaq	48(%rax), %rcx
	cmpq	$9, %rax
	leaq	55(%rax), %rdx
	movq	%rcx, %rax
	cmova	%rdx, %rax
	movl	$1, %edx
	movq	%rax, buf(%rip)
	call	write@PLT
	movq	tmp(%rip), %rax
	movq	%rbx, %rsi
	movl	$1, %edi
	andl	$15, %eax
	leaq	48(%rax), %rcx
	leaq	55(%rax), %rdx
	cmpq	$9, %rax
	movq	%rcx, %rax
	cmova	%rdx, %rax
	movl	$1, %edx
	movq	%rax, buf(%rip)
	call	write@PLT
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	$1, %edi
	movq	$10, buf(%rip)
	call	write@PLT
.L2:
	xorl	%edi, %edi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	read@PLT
	testq	%rax, %rax
	jne	.L7
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	tmp
	.bss
	.align 8
	.type	tmp, @object
	.size	tmp, 8
tmp:
	.zero	8
	.globl	buf
	.align 8
	.type	buf, @object
	.size	buf, 8
buf:
	.zero	8
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
