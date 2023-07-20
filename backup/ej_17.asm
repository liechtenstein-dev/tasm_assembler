.model small
.stack 200h
.data
    org 02000h
    primera_lista DB 01h, 04h, 03h, 06h  ; Primera lista de números
    org 03000h
    segunda_lista DB 0Ah, 00h, 08h, 02h  ; Segunda lista de números
    org 01500h
    size_lista DB 04h  ; Longitud de las listas
.code
start:
    mov ax, @data  ; Mover el segmento de datos a AX
    mov ds, ax  ; Cargar el segmento de datos en DS
    xor ax, ax  ; Limpiar AX
    org 0100h  ; Dirección de origen del programa
    mov bx, OFFSET size_lista  ; Cargar la dirección de la longitud de la lista en BX
    mov cl, [bx]  ; Cargar la longitud de la lista en CL
    xor bx, bx ; Limpio a BX
    mov si, OFFSET primera_lista  ; Cargar la dirección de la primera lista en SI
    mov di, OFFSET segunda_lista ; Cargar la dirección de la segunda lista en DI
RECORRER:
    mov ax, [si]  ; Cargar el número de la primera lista en AX
    mov bx, [di]  ; Cargar el número de la segunda lista en BX
    cmp ax, bx  ; Comparar los números
    jl SIGUIENTE  ; Saltar si AX es menor que BX
    mov [di], ax  ; Guardar el número mayor en la segunda lista
    mov [si], bx  ; Guardar el número menor en la primera lista
SIGUIENTE:
    add di, 2  ; Avanzar a la siguiente posición de la segunda lista
    add si, 2  ; Avanzar a la siguiente posición de la primera lista
    dec cl  ; Decrementar el contador de la longitud de la lista
    jnz RECORRER  ; Saltar si no se ha recorrido toda la lista

    mov ah, 4Ch             ; Función de terminación del programa
    mov al, 00h             ; Código de salida del programa
    int 21h  ; Interrupción del sistema para finalizar el programa
end start
