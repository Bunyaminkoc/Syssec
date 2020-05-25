; ---- DO NOT MODIFY THE DATA SECTION ----
section .data

string_choice: db "Choose a number: ", 0
string_success: db "%d is prime.", 0xa, 0
string_failure: db "%d is not prime.", 0xa, 0
string_error: db "Invalid input. Exiting...", 0xa, 0
input_number: db "%d", 0

; ---- DO NOT MODIFY THE BSS SECTION ----
section .bss
choice: resd 1

section .text

global main
;; tell NASM that printf and scanf are symbols
;; defined in another module
extern scanf, printf

; ---- Your code goes into the TODO snippets ----

main:
    ;-------------------------------
    ; TODO
    ; Ask user for input of a number (use string_choice)
    push string_choice
    call printf
    add esp, 4

    ;-------------------------------

    ;-------------------------------
    ; TODO
    ; Read user input (use input_number)
    push choice
    push input_number
    call scanf
    add esp, 8

    ;-------------------------------

    ;-------------------------------
    ; TODO
    ; Check if user input is within valid range
    
    ;push eax
    ;mov eax, [choice]
    mov esi, [choice]
    cmp esi, 1000
    ;Wenn input > 1k
    jg fail
    ;sonst
    cmp esi, 2
    ;wenn input < 2
    jl fail
    

    ;-------------------------------

    ;-------------------------------
    ; DO NOT MODIFY THIS
    ; Call is_prime subroutine
    mov eax, [choice]  ; Load user input
    push eax           ; Pass user's input via the stack
    call is_prime      ; Call subroutine
    add esp, 4         ; Cleanup stack

    ; Check result (which is in eax)
    cmp eax, 1
    je success

    ; If number is not prime, print failure message

    push esi
    push string_failure
    call printf
    add esp, 8
    ret

    ; If number is prime, print success message
success:
    push esi
    push string_success
    call printf
    add esp, 8
    ret
    ;-------------------------------

    ;-------------------------------
    ; TODO
    ; Print error message (use string_error)
fail:
    push string_error
    call printf
    add esp, 4
    ret

    ;-------------------------------

;-------------------------------
; TODO
; The function is_prime should contain your primality test.
; Return 1 if the argument (passed via the stack) is prime, else 0.
; Mark instructions belonging to the prologue and epilogue.
is_prime:
    ; prologue
    push ebp
    mov ebp, esp
    ; end of prologue

    ; function body
    
    xor ecx, ecx
    xor ebx, ebx
    xor edx, edx

    mov eax, dword[choice]
    mov ebx, dword[choice]
    mov esi, dword[choice]

    cmp ebx, 2
    je isprime

    mov ecx, 2          ;Counter for loop
    cmp ecx, ebx
    je isprime


L1: 
    mov edx, 0
    mov eax, ebx
    div ecx

    cmp edx, 0      ;Ist Input% counter == 0?
    jne L2
    ;je fail
    mov eax, 0
    leave
    ret
L2:                 ; Wenn == 0 dann nicht prim
    inc ecx
    cmp ecx, ebx
    jl L1
    
    
isprime:
    mov eax, 1
    
    ; end of function body

    ; epilogue

    
    
    leave
    ret
    ; end of epilogue / end of function
;-------------------------------

