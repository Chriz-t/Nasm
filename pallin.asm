 section .data
	msg db "Enter the String:",0xa
	len equ $-msg
	msg1 db "Its a Pallindrome!",0xa
	len1 equ $-msg1
	msg2 db "Its not a Pallindrome",0xa 
	len2 equ $-msg2
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
	
	mov ecx,eax 
	dec ecx
	mov esi,str1
	mov edi,str1
	add edi,ecx
	dec edi
compare:
	mov al,[esi]
	mov bl,[edi]
	inc esi
	dec edi
	cmp al,bl
	jne not_pal
	test al,al
	jz is_pal 
	loop compare
is_pal:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 0x80
	jmp exit
not_pal:
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
