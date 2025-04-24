section .text
global leaverng

leaverng:
    ; prologue
    push ebp
    mov ebp, esp
    push ebx

    mov edx, [ebp+8]
    mov ecx, edx
    mov bl, [ebp+12]
    mov bh, [ebp+16]

nextchar:
    mov al, [edx]
    inc edx

    test al, al
    jz done

    cmp al, bl
    jl skipchar

    cmp al, bh
    jg skipchar

    mov [ecx], al
    inc ecx

    jmp nextchar

skipchar:
    jmp nextchar

done:
    mov byte [ecx], 0
    ; epilogue
    mov eax, [ebp+8]
    pop ebx
    pop ebp
    ret