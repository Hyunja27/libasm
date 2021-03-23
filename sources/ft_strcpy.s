section .text
	global _ft_strcpy

_ft_strcpy:
	push r8
	push rdi
	push rsi
	mov r8, 0
	mov rax, rdi
	jmp _loop

_loop:
	mov dl, byte [rsi + r8]
	mov byte [rdi + r8], dl
	cmp byte [rsi + r8], 0
	je _end
	inc r8
	jmp _loop

_end:
	pop rsi
	pop rdi
	pop r8
	ret

