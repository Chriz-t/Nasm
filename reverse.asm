section .data
	msg db "Enter the string:",0xa
	len equ $-msg
section .bss
	str1 resb 100
	rev resb 100
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
	
	mov ecx,eax
	mov ebx,ecx
	mov esi,str1
	add esi,ecx
	mov edi,rev
	
reverse:
	dec esi
	mov al,[esi]
	mov [edi],al
	inc edi
	loop reverse
	
	mov edx,ebx
	mov eax,4
	mov ebx,1
	mov ecx,rev
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80
