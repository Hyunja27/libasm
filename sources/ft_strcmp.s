section .text
	global _ft_strcmp

_ft_strcmp:
	mov rax, 0
	mov r8, 0
	jmp	_loop

_loop:
	cmp byte [rdi + r8], 0
	je	_end
	mov dl, byte [rdi + r8]
	cmp dl, byte [rsi + r8]
	ja	_1big
	jb	_2big
	inc r8
	jmp _loop

_1big:
	mov rax, 1
	ret

_2big:
	mov rax, -1
	ret
	
_end:
	ret