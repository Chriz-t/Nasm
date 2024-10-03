section .data
	msg db "Enter a String:",0xa
	len equ $-msg
	
section .bss
	str1 resb 100
section .text
	global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	mov byte[ecx+eax-1],0
	mov esi,str1
toggle:
	mov al,[esi]
	test al,al
	jz print
	cmp al,'a'
	jl check_upper
	cmp al,'z'
	jg check_upper
	sub al,32
	jmp store
check_upper:
	cmp al,'A'
	jl store
	cmp al,'Z'
	jg store
	add al,32
store:
	mov [esi],al
	inc esi
	jmp toggle
print:
	mov eax,4
	mov ebx,1
	mov ecx,str1
	mov edx,esi
	sub edx,str1
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80
