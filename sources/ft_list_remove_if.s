section .text
	global _ft_list_remove_if
	extern _malloc
	extern ___error
  extern _free

; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
; (*cmp)(list_ptr->data, data_ref);
; (*free_fct)(list_ptr->data);
; rdi = begin_list
; rsi = data_ref
; rdx = cmp
; rcx = free_fct

_ft_list_remove_if:
  push r9
  push r8
  mov r8, [rdi]
  jmp _loop

_loop:
  cmp r8, 0
  je _end
  push  rdi
  mov rdi, [r8]
  push  r8
  push  rcx
  push  rsi
  call  rdx
  pop rsi
  pop rcx
  pop r8
  pop rdi
  cmp rax, 0
  jmp _remove
  mov rdi, r8
  jmp _start

_remove:
  push r8
  push rdi
  mov rdi, [r8]
  call rcx
  pop rdi
  pop r8
  mov rax, [r8 + 8]
  mov [rdi], rax
  push r8
  push rdi
  call _free
  pop rdi
  pop r8
  mov r8, [rdi]  

_start:
  cmp r8, 0
  je  _end
  push  rdi
  mov   rdi, [r8]
  push  rsi
  push  r8
  push  rcx
  call  rdx
  pop   rcx
  pop   r8
  pop   rsi
  pop   rdi
  cmp   rax, 0
  je    _move
  mov   rdi, r8
  mov   rax, [r8+8]
  mov   r8, rax
  jmp   _start

_move:
  mov   rax, [r8+8]
  mov   [rdi+8], rax
  push  rdi
  push  rdx
  push  r8
  mov   rdi, [r8]
  call  rcx
  pop   r8
  mov   rdi, r8
  call _free
  pop rdx
  pop rdi
  mov r8, [rdi+8]

_end:
  pop r8
  pop r9
  xor rax, rax
  ret
