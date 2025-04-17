global _start

section .data
	code:		db "global _startBBsection .dataBAcode:AAdb C?C, 0BAcode_len:Add $ - code - 1BAtable:AAdqA_quine._quine_codeBAAAAdqA_quine._single_charBAAAAdqA_quine._ascii_0x09BAAAAdqA_quine._ascii_0x0aBAAAAdqA_quine._ascii_0x22BAAAAdqA_quine._sully_genBAkid_name:Adb CSully_X.sC, 0BAshell:AAdb C/bin/bashC, 0BAshellf:AAdb C-cC, 0BAexec:AAdb Cnasm -felf64 Sully_X.s && ld -o Sully_X Sully_X.o && rm Sully_X.o && ./Sully_XC, 0BAexec_cmd:Adq shellBAAAAdq shellfBAAAAdq execBAAAAdq 0BBsection .textB_quine:BAmovAArbp, rspBApushArdiBApushA0x220a09BApushArbxBAmovAAedi, dword [code_len]BAmovAAdword [rbp - 0x0c], ediBAmovAAr8, qword [rbp - 0x08]BAmovAAr9d, dword [rbp - 0x0c]BAjmpAA._switchB._code_char:BAmovAArsi, r8B._single_char:BAmovAAedx, 1B._write:BAmovAAedi, dword [rbp + 0x08]BAmovAArax, 1BAsyscallBAincAAr8BAdecAAr9BAjeAA._stopB._switch:BAmovzxAeax, byte [r8]BAsubAAal, 63BAcmpAAal, 5BAjaAA._code_charBAjmpAAqword [8 * rax + table]B._quine_code:BAmovAArsi, qword [rbp - 0x08]BAmovAAedx, dword [rbp - 0x0c]BAjmpAA._writeB._ascii_0x09:BAleaAArsi, [rbp - 0x10]BAjmpAA._single_charB._ascii_0x0a:BAleaAArsi, [rbp - 0x0f]BAjmpAA._single_charB._ascii_0x22:BAleaAArsi, [rbp - 0x0e]BAjmpAA._single_charB._sully_gen:BAleaAArsi, [rsp]BAjmpAA._single_charB._stop:BAaddAArsp, 0x18BAretBB_start:BAmovAArbx, DBAmovAArax, 21BAsubAArbx, 1BAcmpAArbx, 0BAjlAA._endB._replicate:BAaddAAbl, 0x30BAmovAArdi, kid_name BAmovAAbyte [rdi + 6], blBAmovAArax, 2BAmovAArsi, 0o101BAmovAArdx, 0o644BAsyscallBAcmpAArax, -1BAjneAA._formatBAmovAArdi, 1BAjmpAA._endB._format:BApushAraxBAmovAArdi, codeBAcallA_quineBAmovAArdi, execBAmovAAbyte [rdi + 19], blBAmovAAbyte [rdi + 38], blBAmovAAbyte [rdi + 46], blBAmovAAbyte [rdi + 62], blBAmovAAbyte [rdi + 77], blBAmovAArax, 57BAsyscallBAtestArax, raxBAjneAA._parentB._child:BAmovAArax, 59BAmovAArdi, shellBAmovAArsi, exec_cmdBAxorAArdx, rdxBAsyscallBAmovAArax, 60BAxorAArdi, rdiBAsyscallB._parent:BAmovAArax, 61BAmovAArdi, -1BAmovAArsi, rspBAxorAArdx, rdxBAxorAAr10, r10BAsyscallBAmovAArax, 3BApopAArdiBAsyscallBAxorAArdi, rdiB._end:BAmovAArax, 60BAsyscallB", 0
	code_len:	dd $ - code - 1
	kid_name:	db "Sully_X.s", 0
	table:		dq	_quine._quine_code
				dq	_quine._single_char
				dq	_quine._ascii_0x09
				dq	_quine._ascii_0x0a
				dq	_quine._ascii_0x22
				dq	_quine._sully_gen
	shell:		db "/bin/bash", 0
	shellf:		db "-c", 0
	exec:		db "nasm -felf64 Sully_X.s && ld -o Sully_X Sully_X.o && rm Sully_X.o && ./Sully_X", 0
	exec_cmd:	dq shell
				dq shellf
				dq exec
				dq 0

section .text
_quine:
	mov		rbp, rsp
	push	rdi
	push	0x220a09
	push	rbx
	mov		edi, dword [code_len]
	mov		dword [rbp - 0x0c], edi
	mov		r8, qword [rbp - 0x08]
	mov		r9d, dword [rbp - 0x0c]
	jmp		._switch
._code_char:
	mov		rsi, r8
._single_char:
	mov		edx, 1
._write:
	mov		edi, dword [rbp + 0x08]
	mov		rax, 1
	syscall
	inc		r8
	dec		r9
	je		._stop
._switch:
	movzx	eax, byte [r8]
	sub		al, 63
	cmp		al, 5
	ja		._code_char
	jmp		qword [8 * rax + table]
._quine_code:
	mov		rsi, qword [rbp - 0x08]
	mov		edx, dword [rbp - 0x0c]
	jmp		._write
._ascii_0x09:
	lea		rsi, [rbp - 0x10]
	jmp		._single_char
._ascii_0x0a:
	lea		rsi, [rbp - 0x0f]
	jmp		._single_char
._ascii_0x22:
	lea		rsi, [rbp - 0x0e]
	jmp		._single_char
._sully_gen:
	lea		rsi, [rsp]
	jmp		._single_char
._stop:
	add		rsp, 0x18
	ret

_start:
	mov		rbx, 5
	mov		rax, 21
	sub		rbx, 1
	cmp		rbx, 0
	jl		._end
._replicate:
	add		bl, 0x30
	mov		rdi, kid_name 
	mov		byte [rdi + 6], bl
	mov		rax, 2
	mov		rsi, 0o101
	mov		rdx, 0o644
	syscall
	cmp		rax, -1
	jne		._format
	mov		rdi, 1
	jmp		._end
._format:
	push	rax
	mov		rdi, code
	call	_quine
	mov		rdi, exec
	mov		byte [rdi + 19], bl
	mov		byte [rdi + 38], bl
	mov		byte [rdi + 46], bl
	mov		byte [rdi + 62], bl
	mov		byte [rdi + 77], bl
	mov		rax, 57
	syscall
	test	rax, rax
	jne		._parent
._child:
	mov		rax, 59
	mov		rdi, shell
	mov		rsi, exec_cmd
	xor		rdx, rdx
	syscall
	mov		rax, 60
	xor		rdi, rdi
	syscall
._parent:
	mov		rax, 61
	mov		rdi, -1
	mov		rsi, rsp
	xor		rdx, rdx
	xor		r10, r10
	syscall
	mov		rax, 3
	pop		rdi
	syscall
	xor		rdi, rdi
._end:
	mov		rax, 60
	syscall
