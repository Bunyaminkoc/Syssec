;---- DO NOT MODIFY THE DATA SECTION ----
;
;   https://stackoverflow.com/questions/10973650/how-to-use-scanf-in-nasm 
;
;
; -----------------------------------------

section .data

string_choice: db   "Choose a number: ", 0
string_success: db  "%d is prime.", 0xa, 0
string_failure: db  "%d is not prime.", 0xa, 0
string_error: db    "Invalid input. Exiting...", 0xa, 0
input_number: db    "%d", 0

; debug variables
dbg_in: db 	    "[DBG] Input was %d", 0xa, 0
dbg_loop: db 	"[DBG] Loop: %d, prime %d", 0xa, 0
dbg_enter: db	"[DBG] Entered primes with esi = %d", 0xa, 0x0
dbg_while: db   "[DBG] i = %d, i*i = %d, remainder = %d", 0xa, 0x0
dbg_square: db  "[DBG] i^2 = %d", 0xa, 0x0
; ---- DO NOT MODIFY THE BSS SECTION ----
section .bss
choice: resd 1      

section .text
global main
extern scanf, printf

main:
    ; Ask user for input of a number            ; write syscall uses ecx as message register

    push    string_choice
    call    printf
    add esp, 4

    ; Read user input (use input_number)
             ; make old params invalid by moving esp to old position
    push    choice          ; push %d foramt on stack
    push    input_number    ; push format string
    call    scanf           


    ; Check if user input is within valid range
    
    mov esi, [choice]
    cmp esi, 1000
    ;Wenn input > 1k
    jg error
    ;sonst
    cmp esi, 2
    ;wenn input < 2
    jl error

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
error:
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
;-------------------------------

; https://en.wikipedia.org/wiki/Primality_test
is_prime:
    ; prologue
    push    ebp
    mov     ebp, esp
    ; end of prologue

    ; function body
    cmp esi, 2      ; 2 ist prim
    je isprim
         ;Counter for loop
    cmp esi, 3    ; 3 ist auch prim
    je isprim
	
    xor     edx, edx        	; clearing edx before using it for devision
    mov     eax, esi        	; divisor = esi = [choice]
    mov     ecx, 0x2        

    div     ecx
    cmp     edx, 0x0        	; checking whether choice is div by 2		    ; return 0
    je      notprim

    mov     ecx, 0x3        	; checking whetehr choice is div by 3
    div     ecx
    cmp     edx, 0x0	
    je      notprim

    mov     ecx, 0x5        	; starting with 5 as next possible prime

    m_while:
        

        ; squaring ecx = i * i
        mov     eax, ecx        ; eax = ecx
        mul     ecx             ; eax = eax * ecx
        ;mov     eax, edx


        cmp     eax, esi         
        jg	    isprim	
        mov     ebx, eax        ;needed leter to jump back
        	                    
	    ; if n mod i == 0 or n mod (i + 2) == 0
        mov 	eax, esi
        ;mov 	ecx, ecx	; unneccesary, because ecx is counter and divident
        div	    ecx	
        cmp	    edx, 0x0	; n mod i == 0
        je      notprim

        mov 	eax, esi	
        add	    ecx, 0x2	; ecx = ecx + 2 --------|
        div 	ecx					                ;
        cmp	    edx, 0x0				            ;
        ;mov	    eax, 0x0	; return 0		        |
        je	    notprim					                ;            
        sub 	ecx, 0x2	; ecx = ecx - 2 --------|
        

        ; else
        add	    ecx, 6
        cmp     eax, esi         
        jg	    isprim         
        jmp     m_while
    ; end of function body
    isprim:
    mov eax, 1
    jmp end

    notprim:
    mov eax, 0

    end:
    ; epilogue
    ;mov     esp, ebp
    leave
    ret
    ; end of epilogue / end of function