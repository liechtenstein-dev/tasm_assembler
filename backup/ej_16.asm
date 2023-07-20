.model small
.stack 200h
.data
    org 01500h
    longitud db 04h
    org 02000h
    lista_numeros db 10h, 11h, 12h, 14h
    org 03000h
    lista_negativos db ?, ?, ?, ?
    org 04000h
    lista_positivos db ?, ?, ?, ?
.code
start:
    mov ax, @data  ; Mover el segmento de datos a AX
    mov ds, ax  ; Cargar el segmento de datos en DS
    mov bx, OFFSET longitud ; Longitud de lista
    mov cl, [bx]  ; Cargar la longitud de la lista en CL
    mov si, OFFSET lista_numeros  ; Dirección de inicio de la lista
    mov di, OFFSET lista_negativos  ; Dirección para números negativos
    mov bx, OFFSET lista_positivos  ; Dirección para números positivos
    xor dx, dx  ; Inicializar los contadores DL y DH en cero
RECORRER:
    mov ax, [si]  ; Cargar el número de la lista en AX
    cmp ax, 0  ; Comparar el número con cero
    jl NEGATIVO  ; Saltar si el número es negativo
    jg POSITIVO  ; Saltar si el número es positivo
NEGATIVO:
    inc dl  ; Incrementar el contador de números negativos (DL)
    mov [di], ax  ; Guardar el número en la dirección de números negativos
    add di, 2  ; Avanzar a la siguiente posición de números negativos
    jmp SIGUIENTE  ; Saltar a la siguiente iteración del bucle
POSITIVO:
    inc dh  ; Incrementar el contador de números positivos (DH)
    mov [bx], ax  ; Guardar el número en la dirección de números positivos
    add bx, 2  ; Avanzar a la siguiente posición de números positivos
    jmp SIGUIENTE  ; Saltar a la siguiente iteración del bucle
SIGUIENTE:
    add si, 2  ; Avanzar a la siguiente posición de la lista
    dec cl  ; Decrementar el contador de la longitud de la lista
    jnz RECORRER  ; Saltar si no se ha recorrido toda la lista
    mov bx, 01600h
    mov [bx], DL  ; Guardar el valor del contador DL en la dirección 1600
    mov [bx+0100h], DH  ; Guardar el valor del contador DH en la dirección 1700
    mov ah, 4Ch  ; Función de terminación del programa
    mov al, 00h  ; Código de salida del programa
    int 21h  ; Interrupción del sistema para finalizar el programa

end start
