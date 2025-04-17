global _start
;
;	Grace-fully...
;
section .data
	code: db "global _startB;B;AGrace-fully...B;Bsection .dataBAcode: db C?C, 0BAcode_len: dd $ - code - 1BAkid_name: db CGrace_kid.sC, 0BAtable:AdqA_start._quine_codeBAAAdqA_start._single_charBAAAdqA_start._ascii_0x09BAAAdqA_start._ascii_0x0aBAAAdqA_start._ascii_0x22BBsection .textBB%macro _quine 1BAmovAArbp, rspBApushA%1BApushA0x220a09BAmovAAedi, dword [code_len]BAmovAAdword [rbp - 0x0c], ediBAmovAAr8, qword [rbp - 0x08]BAmovAAr9d, dword [rbp - 0x0c]BAjmpAA._switchB._code_char:BAmovAArsi, r8B._single_char:BAmovAAedx, 1B._write:BAmovAAedi, dword [rbp]BAmovAArax, 1BAsyscallBAincAAr8BAdecAAr9BAjeAA._stopB._switch:BAmovzxAeax, byte [r8]BAsubAAal, 63BAcmpAAal, 4BAjaAA._code_charBAjmpAAqword [8 * rax + table]B._quine_code:BAmovAArsi, qword [rbp - 0x08]BAmovAAedx, dword [rbp - 0x0c]BAjmpAA._writeB._ascii_0x09:BAleaAArsi, [rbp - 0x10]BAjmpAA._single_charB._ascii_0x0a:BAleaAArsi, [rbp - 0x0f]BAjmpAA._single_charB._ascii_0x22:BAleaAArsi, [rbp - 0x0e]BAjmpAA._single_charB._stop:BAaddAArsp, 0x10B%endmacroBB%macro _exit 1BAmovAArax, 60BAmovAArdi, %1BAsyscallB%endmacroBB%macro _start 0B_start:BAmovAArax, 2BAmovAArdi, kid_nameBAmovAArsi, 0o101BAmovAArdx, 0o644BAsyscallBAcmpAArax, -1BAjneAA._displayBA_exitA1B._display:BApushAraxBA_quineAcodeBAmovAArax, 3BApopAArdiBAsyscallBA_exitA0B%endmacroBB_startB", 0
	code_len: dd $ - code - 1
	kid_name: db "Grace_kid.s", 0
	table:	dq	_start._quine_code
			dq	_start._single_char
			dq	_start._ascii_0x09
			dq	_start._ascii_0x0a
			dq	_start._ascii_0x22

section .text

%macro _quine 1
	mov		rbp, rsp
	push	%1
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
	mov		edi, dword [rbp]
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
%endmacro

%macro _exit 1
	mov		rax, 60
	mov		rdi, %1
	syscall
%endmacro

%macro _start 0
_start:
	mov		rax, 2
	mov		rdi, kid_name
	mov		rsi, 0o101
	mov		rdx, 0o644
	syscall
	cmp		rax, -1
	jne		._display
	_exit	1
._display:
	push	rax
	_quine	code
	mov		rax, 3
	pop		rdi
	syscall
	_exit	0
%endmacro

_start
