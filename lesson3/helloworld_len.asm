;========================================================================================
; A Program get length for a string to print by using subroutine, and print the string  @
; for execute this program, enter 'make' and './hellworld_len' into command line.		@
;========================================================================================

		section .data
msg		db		'Hello, brave new world!', 0AH, 0

		global	_start
		section .text

_start: 
		mov		rax, msg		; move the address of our message string into RAX
		call	strlen			; call our function to calculate the length of the string

		mov		rdx, rax		; our function leaves the result in RAX
		mov		rsi, msg
		mov		rdi, 1
		mov		rax, 0x02000004
		syscall

		mov	 rdi, 0
		mov	 rax, 0x02000001
		syscall

strlen:						; this is our first function declaration(subroutine)
		push	rbx			; push the value in RBX onto the stack to preserve it while we use EBX in this function
		mov		rbx, rax	; move the address in RAX into RBX (Both point to the same segment in memory)

.loop:						; local label
		cmp		byte [rax], 0
		jz		finished
		inc		rax
		jmp		.loop

finished:
		sub	 rax, rbx
		pop	 rbx			 ; pop the value on the stack back into EBX
		ret					 ; return to where the function was called
