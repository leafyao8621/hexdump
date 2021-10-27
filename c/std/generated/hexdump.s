	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%02X\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	stdin(%rip), %rdi
	call	getc@PLT
	cmpl	$-1, %eax
	je	.L2
	movl	%eax, %esi
	leaq	.LC0(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdi
	call	getc@PLT
	movl	%eax, %esi
	cmpl	$-1, %eax
	jne	.L3
.L2:
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
