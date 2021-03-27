section .text
	global _ft_list_size
	extern _malloc

; rdi:**list , rsi:*data
; sizeof(t_list) = 16
; t_list 의 앞 data 8, 뒤의 next포인터 8을 쓴다.
_ft_list_size:
	push rdi
	push r8
	push r9
	xor r8, r8
	mov r8, 0
	jmp	_loop

_loop:
	cmp rdi, 0
	je _end
	mov r9, [rdi + 8]
	mov rdi, r9
	inc r8
	jmp _loop

_end:
	mov rax, r8
	pop r9
	pop r8
	pop rdi
	ret
