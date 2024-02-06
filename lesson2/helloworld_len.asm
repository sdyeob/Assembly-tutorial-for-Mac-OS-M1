;==================================================================================
; A Program get length for a string to print, and print the string				  @
; for execute this program, enter 'make' and './hellworld_len' into command line. @
;==================================================================================

		SECTION .data
msg		db		'Hello, brave new world!', 0Ah, 0 ; we can modify this now without having to update anywhere else in the program

		global  _start
		SECTION .text

_start:
		mov	rbx, msg		; move the address of our message string into RBX
		mov	rax, rbx		; move the address in RBX into RAX as well (Both now point to the same segment in memory)

nextchar:
		cmp	 byte [rax], 0  ; compare the byte pointed to by RAX at this address against zero (Zero is an end of string delimiter)
		;cmp dword [rax], 0 ; if use like this, is compare the dword(=4byte) pointed to by RAX to zero(integer value)
		jz	  finished		; jump (if the zero flagged has been set) to the point in the code labeled 'finished'
		inc	 rax			; increment the address in RAX by one byte (if the zero flagged has NOT been set)
		jmp	 nextchar		; jump to the point in the code 'nextchar'
		
finished:
		sub	 rax, rbx		; subtract the address in RBX from the address in RAX
							; remember both registers started pointing to the same address (see line 15)
							; but RAX has been incremented one byte for each character in the message string
							; when you subtract one memory address from another of the same type
							; the result is number of segments between them - in this case the number of bytes(= 13)

		mov	 rdx, rax
		mov	 rsi, msg
		mov	 rdi, 1
		mov	 rax, 0x02000004
		syscall

		mov	 rdi, 0
		mov	 rax, 0x02000001
		syscall
