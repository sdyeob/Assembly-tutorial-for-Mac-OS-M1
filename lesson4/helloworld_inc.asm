;========================================================================================
; A Program get length for a string to print by using external file include,			@
; 	and print the string																@
; for execute this program, enter 'make' and './hellworld_len' into command line.		@
;========================================================================================

		%include	'functions.asm'							 		; include our external file

		SECTION	.data
		msg1	db		'Hello, brave new world!', 0Ah, 0			; our first message string
		msg2	db		'This is how we recycle in NASM.', 0Ah, 0	; our second message string

		global	_start

		SECTION	.text
		
_start :
		mov		rax, msg1		 ; move the address of our first message string into RAX
		call	sprint			; call our string printing function
		
		mov		rax, msg2		 ; move the address of our second message string into RAX
		call	sprint			; call our string printing function
		
		call	quit			; call our quit function
