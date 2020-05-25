section .data
    stringprint: db "Result: %d", 0x10, 0

section .bss
    choice: resd 1


section .text
    global main
    extern printf


main:
    push ebp
    mov ebp, esp

    
    mov word[eax], 0x00FF


    ;xor eax, eax
    ;mov ax, word[esp]
    ;add esp, 4

    ;push eax
    ;push stringprint
    ;call printf
    ;add esp, 8


    pop ebp
    ;leave
    ;ret