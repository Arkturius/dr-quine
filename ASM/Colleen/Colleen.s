global _start
;
;	Some data.
;
section .data
	code: db "global _startB;B;ASome data.B;Bsection .dataBAcode: db C?C, 0BAcode_len: dd $ - code - 1BAtable:AdqA_quine._quine_codeBAAAdqA_quine._single_charBAAAdqA_quine._ascii_0x09BAAAdqA_quine._ascii_0x0aBAAAdqA_quine._ascii_0x22BBsection .textB_quine:BAmovAArbp, rspBApushArdiBApushA0x220a09BAmovAAedi, dword [code_len]BAmovAAdword [rbp - 0x0c], ediBAmovAAr8, qword [rbp - 0x08]BAmovAAr9d, dword [rbp - 0x0c]BAjmpAA._switchB._code_char:BAmovAArsi, r8B._single_char:BAmovAAedx, 1B._write:BAmovAAedi, 1BAmovAArax, 1BAsyscallBAincAAr8BAdecAAr9BAjeAA._stopB._switch:BAmovzxAeax, byte [r8]BAsubAAal, 63BAcmpAAal, 4BAjaAA._code_charBAjmpAAqword [8 * rax + table]B._quine_code:BAmovAArsi, qword [rbp - 0x08]BAmovAAedx, dword [rbp - 0x0c]BAjmpAA._writeB._ascii_0x09:BAleaAArsi, [rbp - 0x10]BAjmpAA._single_charB._ascii_0x0a:BAleaAArsi, [rbp - 0x0f]BAjmpAA._single_charB._ascii_0x22:BAleaAArsi, [rbp - 0x0e]BAjmpAA._single_charB._stop:BAaddAArsp, 0x10BAretBB_start:B;B;AHere it starts !B;BAmovAArdi, codeBAcallA_quineBAmovAArax, 60BAmovAArdi, 0BAsyscallB", 0
	code_len: dd $ - code - 1
	table:	dq	_quine._quine_code
			dq	_quine._single_char
			dq	_quine._ascii_0x09
			dq	_quine._ascii_0x0a
			dq	_quine._ascii_0x22

section .text
_quine:
	mov		rbp, rsp
	push	rdi
	push	0x220a09
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
	mov		edi, 1
	mov		rax, 1
	syscall
	inc		r8
	dec		r9
	je		._stop
._switch:
	movzx	eax, byte [r8]
	sub		al, 63
	cmp		al, 4
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
._stop:
	add		rsp, 0x10
	ret

_start:
;
;	Here it starts !
;
	mov		rdi, code
	call	_quine
	mov		rax, 60
	mov		rdi, 0
	syscall
