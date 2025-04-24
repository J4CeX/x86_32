section .text
global removerng

removerng:
    ; prologue
    push ebp
    mov ebp, esp

    mov edx, [ebp + 8]
    mov ecx, edx

nextchar:
    mov al, [edx]
    inc edx

    test al, al
    jz done

    cmp al, [ebp + 12]
    jl savechar

    cmp al, [ebp + 16]
    jg savechar


    jmp nextchar

savechar:
    mov [ecx], al
    inc ecx
    jmp nextchar

done:
    mov byte [ecx], 0
    mov eax, [ebp + 8]
    pop ebp
    ret
