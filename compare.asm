section .data
	msg1 db "Enter the first string",0xa
	len1 equ $-msg1
	msg2 db "Enter the second string",0xa
	len2 equ $-msg2
	msge db "Strings are Equal",0xa
	lene equ $-msge
	msgne db "Strings are not Equal",0xa
	lenne equ $-msgne
section .bss
	str1 resb 100
	str2 resb 100
section .text
 	global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str2
	mov edx,100
	int 0x80
	
	mov esi,str1
	mov edi,str2
compare:
	mov al,[esi]
	mov dl,[edi]
	cmp al,dl
	jne strne
	test al,dl
	jz stre
	inc esi
	inc edi
	jmp compare
strne:
	mov eax,4
	mov ebx,1
	mov ecx,msgne
	mov edx,lenne
	int 0x80
	jmp exit
stre:
	mov eax,4
	mov ebx,1
	mov ecx,msge
	mov edx,lene
	int 0x80
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
		

