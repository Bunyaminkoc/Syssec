section .data
    filename db 'greetings', 0x0
    content db 'himum!', 0x0

section .text
    global _start

_start:

    mov ecx, 0777   ; set all permission
    mov ebx, filename   ;the filename we will create
    mov eax, 8      ; opcode of SYS_CREATE
    int 0x80        ; interrupt

    mov edx, 6       ; bytes to write
    mov ecx, content     ; adress of input
    mov ebx, eax    ; move the file descriptor of the file we created into ebx
    mov eax, 4      ; opcode of SYS_Write
    int 0x80        ; interrupt


    mov     ebx, 0      ; return 0 status on exit - 'No Errors'
    mov     eax, 1      ; invoke SYS_EXIT (kernel opcode 1)
    int     80h
    ret