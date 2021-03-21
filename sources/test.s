section	.text
	global _hello

_hello:
	mov	rax, 0x2000004
	mov	rdi, 1
	mov	rsi, spark
	mov rdx, 11
	syscall
	mov rax, 0x2000001
	mov rdi, 0
	syscall

spark db "Hello World"
	