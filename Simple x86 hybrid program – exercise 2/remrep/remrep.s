section .text
global remrep

remrep:
    ; prologue
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov edx, [ebp + 8]  ; edx - reading pointer
    mov ecx, edx        ; ecx - saving pointer
    mov esi, 0          ; esi - byte shifter

nextchar:
    mov al, [edx]
    inc edx

    test al, al
    jz done

    mov bl, al          ; bl - current character to ignore its duplicates
    mov [ecx], al       ; saving one copy of current character
    inc ecx

    jmp remchars

remchars:
    mov al, [edx]
    inc edx

    test al, al
    jz setstring        ; if removing duplicates is done, set new edited string

    cmp al, bl
    jne savechar        ; if current character is not a duplicate of given character to remove, save it

    jmp remchars

savechar:
    mov [ecx], al
    inc ecx
    jmp remchars

setstring:
    inc esi             ; increase byte shift
    mov byte [ecx], 0   ; add NULL character to the end of the modified string
    mov edx, [ebp+8]    ; set edx on the begining of the modified string
    add edx, esi        ; add the esi to the edx, it will prevent program from removing already set in right place characters
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