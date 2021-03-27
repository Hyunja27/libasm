section .text
	global _ft_list_push_front
	extern _malloc
	extern ___error

_ft_list_push_front:
	push rcx
	push rdi
	push rsi
	jmp _make

_make:
	mov rdi, 16
	call _malloc
	cmp rax, 0
	je end
	pop rsi
	pop rdi
	mov [rax], rsi
	mov rcx, [rdi]
	mov [rax + 8], rcx
	mov [rdi], rax
	pop rcx

end:
	ret