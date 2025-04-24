section .text
global leavelastndig

leavelastndig:
    ;prologue
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov edx, [ebp+8]
    mov ecx, edx
    mov ebx, [ebp+12]
    mov esi, 0

remchars:
    mov al, [edx]
    inc edx

    test al, al
    jz resetregisters

    cmp al, '0'
    jl  remchars

    cmp al, '9'
    jg  remchars

    mov [ecx], al
    inc ecx
    inc esi
    jmp remchars

resetregisters:
    cmp esi, ebx
    jl output
    sub esi, ebx
    mov byte [ecx], 0
    mov edx, [ebp+8]
    mov ecx, edx
    jmp remdigits

remdigits:
    mov al, [edx]
    inc edx

    test al, al
    jz output

    cmp esi, 0
    je output

    dec esi
    jmp remdigits

output:
    mov [ecx], al
    inc ecx

    mov al, [edx]
    inc edx

    test al, al
    jz done

    jmp output

done:
    ;epilogue
    mov byte [ecx], 0
    mov eax, [ebp + 8]
    pop esi
    pop ebx
    pop ebp
    ret


