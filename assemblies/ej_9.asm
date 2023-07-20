.model small
.stack 100h

.data
    NUMEROS_LISTA  DB 01h, 02h, 03h, 06h
    SIZE_LISTA     DB 04h

.code
start:
    mov ax, @data ;Carga la dirección del segmento de datos en el registro AX
    mov ds, ax ;Carga la dirección del segmento de datos en el registro DS
    xor ch, ch        ; Limpio la parte alta
    mov bx, offset SIZE_LISTA
    mov cl, [bx]    ; Guardo la longitud de la lista
    mov si, offset NUMEROS_LISTA      ; Le apunto a la lista
    mov ax, [si]      ; Me guardo el primer elemento de la lista
    dec cl            ; Como ya tomé el primero, decremento

salto:
    cmp ax, [si + 2]  ; Comparo el siguiente elemento de la lista con el que tengo
    jg MENOR          ; Si el número que tengo es mayor que el que apunta SI, salto
    mov al, [si + 2]  ; Sino, me lo quedo

MENOR:
    add si, 2         ; Incremento la lista para el próximo elemento
    loop salto        ; Vuelvo a comenzar la comparación hasta que CX = 0

    mov bx, 3000
    mov [bx], ax    ; Guardo el número en la dirección de memoria 3000 y 3001

    mov ah, 4Ch       ; Función de terminación del programa
    mov al, 00h       ; Código de salida del programa
    int 21h           ; Interrupción del sistema

end start
