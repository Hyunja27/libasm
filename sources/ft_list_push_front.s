section .text
	global _ft_list_push_front
	extern _malloc
	extern ___error

; rdi:**list , rsi:*data
; sizeof(t_list) = 16
; t_list 의 앞 data 8, 뒤의 next포인터 8을 쓴다.
_ft_list_push_front:
	push rcx
	push rdi
	push rsi
	jmp _make

_make:
	mov rdi, 16
	call _malloc
	cmp rax, 0
	je _err
	pop rsi
	pop rdi
	mov [rax], rsi
	mov rcx, [rdi]
	mov [rax + 8], rcx
	mov [rdi], rax
	pop rcx

_err:
	push rax 
	call ___error
	pop	rdx
	mov [rax], rdx
	mov rax, -1
	ret