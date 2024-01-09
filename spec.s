	.file	"spec.f"
	.text
	.globl	fft_
	.type	fft_, @function
fft_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %edx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	movq	%rax, %rcx
	movl	$0, %ebx
	movl	$1, -36(%rbp)
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movl	$1, -32(%rbp)
.L7:
	cmpl	%ecx, -32(%rbp)
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L17
	movl	-32(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.L3
	movl	-36(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-104(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	movss	%xmm0, -72(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -68(%rbp)
	movl	-32(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-104(%rbp), %rax
	movss	(%rax,%rdx,4), %xmm0
	movl	-36(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	-112(%rbp), %rdx
	movss	%xmm0, (%rdx,%rax,8)
	movq	-112(%rbp), %rdx
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4(%rdx,%rax,8)
	movl	-32(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	-112(%rbp), %rdx
	movss	-20(%rbp), %xmm0
	movss	%xmm0, (%rdx,%rax,8)
	movq	-112(%rbp), %rdx
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4(%rdx,%rax,8)
.L3:
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -40(%rbp)
.L6:
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.L18
	movl	-40(%rbp), %eax
	subl	%eax, -36(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -40(%rbp)
	jmp	.L6
.L18:
	nop
	movl	-40(%rbp), %eax
	addl	%eax, -36(%rbp)
	addl	$1, -32(%rbp)
	jmp	.L7
.L17:
	nop
	movl	$1, -44(%rbp)
.L14:
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -44(%rbp)
	jge	.L19
	movl	-44(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -76(%rbp)
	movl	-76(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -80(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-80(%rbp), %xmm1
	movss	.LC1(%rip), %xmm0
	divss	%xmm1, %xmm0
	movd	%xmm0, %eax
	movd	%eax, %xmm0
	call	cosf@PLT
	movd	%xmm0, %eax
	movl	%eax, -24(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-80(%rbp), %xmm1
	movss	.LC1(%rip), %xmm0
	divss	%xmm1, %xmm0
	movd	%xmm0, %eax
	movd	%eax, %xmm0
	call	sinf@PLT
	movd	%xmm0, %eax
	movss	.LC2(%rip), %xmm0
	movd	%eax, %xmm5
	xorps	%xmm0, %xmm5
	movaps	%xmm5, %xmm0
	movss	%xmm0, -28(%rbp)
	movss	-28(%rbp), %xmm0
	movss	-24(%rbp), %xmm1
	movss	%xmm1, -88(%rbp)
	movss	%xmm0, -84(%rbp)
	movq	-120(%rbp), %rax
	movl	(%rax), %esi
	movl	-76(%rbp), %ecx
	movl	$1, -36(%rbp)
	testl	%ecx, %ecx
	jns	.L10
	movl	%esi, %edx
	movl	$1, %eax
	subl	%edx, %eax
	movl	%ecx, %edx
	movl	%edx, %ebx
	negl	%ebx
	movl	$0, %edx
	divl	%ebx
	cmpl	$1, %esi
	jg	.L20
	jmp	.L13
.L10:
	movl	%esi, %eax
	subl	$1, %eax
	movl	%ecx, %edi
	movl	$0, %edx
	divl	%edi
	testl	%esi, %esi
	jle	.L20
.L13:
	movl	-36(%rbp), %esi
	movl	-80(%rbp), %edx
	addl	%esi, %edx
	movl	%edx, -92(%rbp)
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	movq	-112(%rbp), %rsi
	movss	(%rsi,%rdx,8), %xmm0
	movq	-112(%rbp), %rsi
	movss	4(%rsi,%rdx,8), %xmm1
	movaps	%xmm0, %xmm2
	mulss	-24(%rbp), %xmm2
	movaps	%xmm1, %xmm4
	mulss	-28(%rbp), %xmm4
	movaps	%xmm1, %xmm3
	mulss	-24(%rbp), %xmm3
	movaps	%xmm0, %xmm1
	mulss	-28(%rbp), %xmm1
	subss	%xmm4, %xmm2
	movaps	%xmm2, %xmm0
	movss	%xmm0, -20(%rbp)
	addss	%xmm1, %xmm3
	movaps	%xmm3, %xmm0
	movss	%xmm0, -96(%rbp)
	movss	-96(%rbp), %xmm0
	movss	-20(%rbp), %xmm1
	movss	%xmm1, -72(%rbp)
	movss	%xmm0, -68(%rbp)
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	movq	-112(%rbp), %rsi
	movss	(%rsi,%rdx,8), %xmm1
	movq	-112(%rbp), %rsi
	movss	4(%rsi,%rdx,8), %xmm0
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	subss	-20(%rbp), %xmm1
	subss	-96(%rbp), %xmm0
	movq	-112(%rbp), %rsi
	movss	%xmm1, (%rsi,%rdx,8)
	movq	-112(%rbp), %rsi
	movss	%xmm0, 4(%rsi,%rdx,8)
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	movq	-112(%rbp), %rsi
	movss	(%rsi,%rdx,8), %xmm1
	movq	-112(%rbp), %rsi
	movss	4(%rsi,%rdx,8), %xmm0
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	addss	-20(%rbp), %xmm1
	addss	-96(%rbp), %xmm0
	movq	-112(%rbp), %rsi
	movss	%xmm1, (%rsi,%rdx,8)
	movq	-112(%rbp), %rsi
	movss	%xmm0, 4(%rsi,%rdx,8)
	addl	%ecx, -36(%rbp)
	movl	%eax, %edx
	subl	$1, %eax
	testl	%edx, %edx
	je	.L20
	jmp	.L13
.L20:
	nop
	movl	-76(%rbp), %eax
	movl	%eax, -44(%rbp)
	jmp	.L14
.L19:
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fft_, .-fft_
	.section	.rodata
	.align 4
.LC5:
	.long	256
.LC6:
	.string	"spec.f"
	.text
	.type	MAIN__, @function
MAIN__:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$4152, %rsp
	.cfi_offset 3, -24
	movl	$1, -2068(%rbp)
.L23:
	movl	-2068(%rbp), %eax
	cmpl	$256, %eax
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L28
	movl	-2068(%rbp), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movss	.LC3(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	.LC4(%rip), %xmm1
	divss	%xmm1, %xmm0
	movd	%xmm0, %eax
	movl	-2068(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rbx
	movd	%eax, %xmm0
	call	sinf@PLT
	movd	%xmm0, %eax
	movl	%eax, -3616(%rbp,%rbx,4)
	movl	-2068(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2068(%rbp)
	jmp	.L23
.L28:
	nop
	leaq	-2064(%rbp), %rcx
	leaq	-3616(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	fft_
	movl	$1, -2068(%rbp)
.L25:
	movl	-2068(%rbp), %eax
	cmpl	$128, %eax
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L29
	movl	-2068(%rbp), %eax
	cltq
	subq	$1, %rax
	movss	-2064(%rbp,%rax,8), %xmm1
	movss	-2060(%rbp,%rax,8), %xmm0
	movss	%xmm1, -4152(%rbp)
	movss	%xmm0, -4148(%rbp)
	movq	-4152(%rbp), %rax
	movq	%rax, %xmm0
	call	cabsf@PLT
	mulss	%xmm0, %xmm0
	movl	-2068(%rbp), %eax
	cltq
	subq	$1, %rax
	movss	.LC4(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -2592(%rbp,%rax,4)
	movl	-2068(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2068(%rbp)
	jmp	.L25
.L29:
	nop
	movl	$1, -2068(%rbp)
.L27:
	movl	-2068(%rbp), %eax
	cmpl	$128, %eax
	setg	%al
	movzbl	%al, %eax
	testl	%eax, %eax
	jne	.L30
	leaq	.LC6(%rip), %rax
	movq	%rax, -4136(%rbp)
	movl	$23, -4128(%rbp)
	movl	$128, -4144(%rbp)
	movl	$6, -4140(%rbp)
	leaq	-4144(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write@PLT
	leaq	-2068(%rbp), %rcx
	leaq	-4144(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_integer_write@PLT
	movl	-2068(%rbp), %eax
	cltq
	subq	$1, %rax
	leaq	-2592(%rbp), %rdx
	salq	$2, %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-4144(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_gfortran_transfer_real_write@PLT
	leaq	-4144(%rbp), %rax
	movq	%rax, %rdi
	call	_gfortran_st_write_done@PLT
	movl	-2068(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2068(%rbp)
	jmp	.L27
.L30:
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	MAIN__, .-MAIN__
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	_gfortran_set_args@PLT
	leaq	options.7.0(%rip), %rax
	movq	%rax, %rsi
	movl	$7, %edi
	call	_gfortran_set_options@PLT
	call	MAIN__
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	options.7.0, @object
	.size	options.7.0, 28
options.7.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.align 4
.LC1:
	.long	1078530000
	.align 16
.LC2:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC3:
	.long	1086918608
	.align 4
.LC4:
	.long	1132462080
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
