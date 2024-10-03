section .data
	msg db "Enter the String:",0xa
	len equ $-msg
	str1 times 100 db 0
section .bss
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
	
	mov ecx,str1
	xor ebx,ebx
lenght:
	cmp byte [ecx],0
	je end
	inc ebx
	inc ecx
	jmp lenght

end:	
	mov edx,ebx
	
	mov esi,str1
	add esi,edx
	mov edi,rev
	
reverse:
	dec esi
	mov al,[esi]
	mov [edi],al
	inc edi
	cmp esi,str1
	jne reverse
	
	mov edx,ebx
	mov eax,4
	mov ebx,1
	mov ecx,rev
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80
