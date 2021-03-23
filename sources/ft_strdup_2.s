section .text
	global _ft_strdup
	extern _malloc

_ft_strdup:
	push r8
	push r9
	mov r8, 0
	mov r9, 0
	jmp _loop

_loop:
	cmp byte [rdi + r8], 0
	je _dup1
	mov dl, byte [rdi + r8]
	mov byte [r9 + r8], dl
	inc r8
	jmp _loop

_dup1:
	cmp r8, 0
	je _end
	mov rdi, r8
	call _malloc
	mov r8, 0
	jmp _dup2

_dup2:
	mov dl, byte [r9 + r8]
	mov byte [rax + r8], dl
	cmp byte [rax + r8], 0
	je _jjin_end 
	inc r8
	jmp _dup2

_end:
	pop r9
	mov r8, 1 
	mov rdi, r8
	call _malloc
	mov byte [rax], 0
	pop r8
	ret

_jjin_end:
	pop r9
	pop r8
	ret