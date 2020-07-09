section .text
global main

main:
    push 0x68732f2f
    push 0x6e69622f
    call nine
    call seven
    call six
    call seven


one:
	pop	esi
	mov	ebx, 0xA
	ret 	


two:	
	lea	eax, [eax]
	ret


three:
	mov	ecx, 0
	ret


four:
	int	0x80
	ret


five:
	inc 	eax
	pop	edx
	jmp 	edx


six:
	mov	ecx, 0
	mov	dword [esp + 0x8], 0x0
	add 	esp, 0xC
	ret


seven:
	xor	eax, ebx
	xor 	ebx, eax
	xor 	eax, ebx
	ret


eight:
	mov 	ecx, 0x42
	inc	ecx
	cdq	
	ret


nine:
	mov	ecx, 0
	lea	esp, [esp]
	pop	ecx
	ret


ten:
	mov	eax, 0xB
	pop	ebx
	push	0x0
	ret

