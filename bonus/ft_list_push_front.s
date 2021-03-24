section .text
	global _ft_list_push_front
	extern _malloc
	extern ___error

; rdi:**list , rsi:*data
; sizeof(t_list) = 16
; t_list 의 앞 data 8, 뒤의 next포인터 8을 쓴다.
_ft_list_push_front:
	push r9
	push r8
	jmp _make

_make:
	mov r8, rdi
	mov r9, 16
	mov rdi, r9
	call _malloc
	cmp rax, 0
	je _err
	mov rax, rsi
	mov [rax + 8], r8
	mov rdi, rax
	ret

_err:
	push rax 
	call ___error
	pop	rdx
	mov [rax], rdx
	mov rax, -1
	ret