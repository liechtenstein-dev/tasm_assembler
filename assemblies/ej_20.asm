.model small
.stack 200
.data
    org 01500h
    SIZE_LISTA DB 04h ; Tamaño de la lista de números originales
    org 02000h
    NUMEROS_ORIGINALES DB 01h, 80h, 55h, 7Fh ; Ejemplo de lista de números originales
    org 03000h
    NUMEROS_CONVERTIDOS DW ?, ?, ?, ?, ? ; Lista de números convertidos
.code
start:
    mov ax, @data ; Carga la dirección del segmento de datos en el registro AX
    mov ds, ax ; Carga la dirección del segmento de datos en el registro DS
    xor ax, ax              ; Limpio AX
    xor cx, cx              ; Limpio CX
    mov bx, OFFSET SIZE_LISTA
    mov cl, [bx]          ; Guardo la longitud de la lista de números originales
    mov si, OFFSET NUMEROS_ORIGINALES            ; Le apunto a la lista de números originales
    mov di, OFFSET NUMEROS_CONVERTIDOS ; Le apunto a la lista de números convertidos
COMPARAR:    
    mov al, [si]
    cmp al, 0
    jge MAYOR
    jl MENOR
SIGUIENTE:
    inc si
    add di, 2
    dec cl
    jnz COMPARAR
    mov ah, 4Ch             
    mov al, 00h             
    int 21h                 ; Interrupción del sistema
MAYOR:
    mov ah, 00
    mov [di], ax
    jmp SIGUIENTE
MENOR:
    mov ah, 0FFh
    mov [di], ax
    jmp SIGUIENTE
end start