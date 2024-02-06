
		SECTION	.text
;------------------------------------------
; int slen(String message)
; String length calculation function

slen :
		push	rbx
		mov		rbx, rax

.loop :
		cmp		byte [rax], 0
		jz		finished
		inc		rax
		jmp		.loop
		
finished:
		sub		rax, rbx
		pop		rbx
		ret

;------------------------------------------
; void sprint(String message)
; String printing function
; rax(syscall num), rdx(length of string), rsi(start source index for string), rdi(stream to print)

sprint :
	push	rsi
	push	rdi
	push	rdx
	mov		rsi, rax
	call	slen

	mov		rdx, rax

	mov		rdi, 1
	mov		rax, 0x02000004
	syscall
		
	pop		rdx
	pop		rdi
	pop		rsi
	ret

;------------------------------------------
; void exit()
; Exit program and restore resources
; rax(syscall num), rdi(exit num)
quit:
	mov		rdi, 0
	mov		rax, 0x02000001
	syscall
	ret 						; not necessary
