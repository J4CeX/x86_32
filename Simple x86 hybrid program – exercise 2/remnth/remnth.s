section .text
global remnth

remnth:
    ; prologue
    push ebp
    mov ebp, esp
    push ebx

    mov edx, [ebp + 8]
    mov ecx, edx
    mov ebx, 1

nextchar:
    mov al, [edx]
    inc edx

    test al, al
    jz done

    cmp ebx, 3
    je skip

    inc ebx

    mov [ecx], al
    inc ecx
    jmp nextchar

skip:
    mov ebx, 1
    jmp nextchar

done:
    ;epilogue
    mov byte [ecx], 0
    mov eax, [ebp+8]
    pop ebx
    pop ebp
    ret
