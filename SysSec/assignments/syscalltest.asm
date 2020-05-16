section .data
    msg db 'HelloWorld',0

section .text
    global _main


_main:
    mov	edx,11		; message length
    mov	ecx,msg		; message to write
    mov	ebx,1		; file descriptor (stdout)
    mov	eax,4		; system call number (sys_write)
    int	0x80