;==============================================================================
; A Program to Print Hello world.											  @
; for execute this program, enter 'make' and './hellworld' into command line. @
;==============================================================================

		SECTION	.data 					; A Section for initialized data
msg		db		'Hello World!', 0Ah		; assign msg variable with your message string
										; All addresses are consecutive from address 'H' to '0Ah'.

		global	_start					; Entry Point for linker ld.
		SECTION	.text					; A Section for Code.

_start: 
		mov		rdx, 13				; number of bytes to write - one for each letter plus 0Ah (line feed character)
		mov		rdi, 1				; write to the STDOUT file
		mov		rsi, msg			; move the memory address of our message string into rsi
		mov		rax, 0x02000004		; invoke SYS_WRITE (kernel opcode 0x02000004)
		syscall

		mov		rax, 0x02000001		; invoke SYS_EXIT (kernel opcode 0x02000001)
		mov		rdi, 0				; return 0 status on exit - 'No Errors'
		syscall
