.model small
.stack 1000h
.code
start:
    org 0100h
    mov si, 04000h
    mov di, 02000h
    mov al, 0FFh
swap:
    mov [si], al
    inc si
    cmp si, 05001h
    jnz swap
    mov si, 04000h
second_loop:
    mov al, [si]
    cmp al, 0FFh
    jz next_iteration
    mov [di], si
    add di, 2
next_iteration:
    inc si
    cmp si, 05001h
    jnz second_loop
    mov ah, 4Ch
    mov al, 00h
    int 21h

end start
