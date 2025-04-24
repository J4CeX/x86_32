section .text
global remrep

remrep:
    ; prologue
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov edx, [ebp + 8]
    mov ecx, edx
    mov esi, 0

nextchar:
    mov al, [edx]
    inc edx

    test al, al
    jz done

    mov bl, al
    mov [ecx], al
    inc ecx

    jmp remchars

remchars:
    mov al, [edx]
    inc edx

    test al, al
    jz setstring

    cmp al, bl
    jne savechar

    jmp remchars

savechar:
    mov [ecx], al
    inc ecx
    jmp remchars

setstring:
    inc esi
    mov byte [ecx], 0
    mov edx, [ebp+8]
    add edx, esi
    mov ecx, edx
    jmp nextchar

done:

    mov byte [ecx], 0
    mov eax, [ebp+8]

    ; epilogue
    pop esi
    pop ebx
    pop ebp
    ret