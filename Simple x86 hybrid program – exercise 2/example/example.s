    section .text
    global rmspc

rmspc:
    push ebp
    mov ebp, esp

    ; here will be function
; edx - source pointer
; ecx - destination pointer
    mov edx, [ebp + 8]
    mov ecx, edx

loop:
    mov al, [edx]
    inc edx

    ; compare to whitespace
    cmp al, ' '
    jz loop

    mov [ecx], al
    inc ecx

    test al, al
    jnz loop

    mov eax, [ebp + 8]

    pop ebp
    ret
