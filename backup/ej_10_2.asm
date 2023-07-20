.model small
.stack 100h

.data
    NUMEROS_LISTA  DB 01h, 02h, 03h, 06h
    SIZE_LISTA     DB 04h

.code
start:
    mov ax, @data ; Carga la dirección del segmento de datos en el registro AX
    mov ds, ax ; Carga la dirección del segmento de datos en el registro DS
    xor ch, ch        ; Limpio la parte alta
    mov bx, offset SIZE_LISTA
    mov cl, [bx]    ; Guardo la longitud de la lista
    mov si, offset NUMEROS_LISTA      ; Le apunto a la lista
    mov al, [si]      ; Me guardo el primer elemento de la lista
    inc si            ; Paso al siguiente elemento
MENOR:
    cmp al, [si]      ; Comparo el siguiente elemento de la lista con el que tengo
    jae SIGUIENTE     ; Si el número que tengo es mayor o igual que el que apunta SI, salto
    mov al, [si]      ; Sino, me lo quedo
SIGUIENTE:
    inc si            ; Incremento la lista para el próximo elemento
    loop MENOR        ; Vuelvo a comenzar la comparación hasta que CX = 0
    mov bx, 3000h
    mov [bx], al    ; Guardo el número más pequeño en la dirección de memoria 3000
    mov ah, 4Ch       ; Función de terminación del programa
    mov al, 00h       ; Código de salida del programa
    int 21h           ; Interrupción del sistema

end start
