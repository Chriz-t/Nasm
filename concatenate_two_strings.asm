section .data
	msg db "Enter a String:",0xa
	len equ $-msg
section .bss
	str1 resb 100
	str2 resb 100
	str3 resb 200
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
	dec ecx
	
	mov esi,str1
	mov edi,str3
copy:
	mov al,[esi]
	mov [edi],al
	inc esi
	inc edi
	loop copy
	
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str2
	mov edx,100
	int 0x80

	mov byte[ecx+eax-1],0
	mov ecx,eax
	dec ecx
	mov esi,str2
append:
	mov al,[esi]
	mov [edi],al
	inc esi
	inc edi
	loop append

	inc edi
	mov byte[edi],0
	
	mov eax,4
	mov ebx,1
	mov ecx,str3
	mov edx,200
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80
