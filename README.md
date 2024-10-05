# Nasm
Basic 8086 assembly programs using NASM


segment .data                   ;data segment
  msg db "Hello World!",0xa     ;our dear string
  len equ $-msg                 ;length of our dear string
segment.text                    ;code segment
  global _start                 ;must be declared for linker
_start:                         ;tells linker entry point 
  mov eax,4                     ;system call number(sys_write)
  mov ebx,1                     ;file descriptor(stdout)
  mov ecx,msg                   ;message to write
  mov edx,len                   ;message length
  int 0x80                      ;call kernel
exit:                           ;label
  mov eax,1                     ;system call number(sys_exit)
  int 0x80                      ;call kernel
  
