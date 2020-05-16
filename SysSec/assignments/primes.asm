; ---- DO NOT MODIFY THE DATA SECTION ----
section .data

string_choice: db "Choose a number: ", 0
string_success: db "%d is prime.", 0xa, 0
string_failure: db "%d is not prime.", 0xa, 0
string_error: db "Invalid input. Exiting...", 0xa, 0
input_number: db "%d", 0
debug: db "Your input was %d", 0xa, 0

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


    ;-------------------------------

    ;-------------------------------
    ; TODO
    ; Read user input (use input_number)
    push choice
    push input_number
    call scanf
    
    add esp, 8
    push dword[choice]
    push debug
    call printf

    ;-------------------------------

    ;-------------------------------
    ; TODO
    ; Check if user input is within valid range
    push eax
    mov eax, choice
    cmp eax, 1000
    ;Wenn input > 1k
    jg fail
    ;sonst
    cmp eax, 2
    ;wenn input kleiner 2
    jle fail

    pop eax

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



    ; end of function body

    ; epilogue
    mov esp, ebp
    pop ebp
    ret
    ; end of epilogue / end of function
;-------------------------------

