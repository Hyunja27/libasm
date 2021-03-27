section .text
	global _ft_list_sort
; void	ft_list_sort(t_list **begin_list, int (*cmp)());
; begin_list == rdi, cmp == rsi
_ft_list_sort:
	push r8
	push r9
	push rbx
	mov rbx, rsi
	mov r8, [rdi]
	mov r9, [r8 + 8]

_cmp:
	push rdi
	mov	 rdi, [r8]
	push rsi
	mov  rsi, [r9]
	push r8
	push r9
	call rbx
	pop	 r9
	pop  r8
	cmp  rax, 0
	jle  _nothing

_swap:
	mov rsi, [r8]
	mov rdi, [r9]
	mov [r9], rsi
	mov [r8], rdi

_nothing:
	pop rsi
	pop rdi
	mov r9, [r9 + 8]
	cmp r9, 0
	je _a_check
	jmp _cmp

_a_check:
	mov r8, [r8 + 8]
	cmp r8, 0
	je _end
	mov r9, [r8 + 8]
	cmp r9, 0
	je _end
	jmp _cmp

_end:
	pop rbx
	pop r9
	pop r8
	xor rax, rax
	ret
