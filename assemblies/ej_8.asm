.model small ; Define el modelo de memoria como "small"
.stack 200 ; Reserva 200 bytes para la pila
.data ; Sección de datos

    NUMEROS_LISTA  DB 01h, 02h, 03h, 06h ; Define una lista de números
    SIZE_LISTA     DB 04h ; Define el tamaño de la lista

.code ; Sección de código

start:
    mov ax, @data ; Carga la dirección del segmento de datos en el registro AX
    mov ds, ax ; Carga la dirección del segmento de datos en el registro DS
    xor ax, ax ; Limpia el registro AX
    xor cx, cx ; Limpia el registro CX

    mov bx, OFFSET SIZE_LISTA ; Carga la dirección de SIZE_LISTA en el registro BX
    mov cl, [bx] ; Carga el valor del tamaño de la lista en el registro CL

    mov si, OFFSET NUMEROS_LISTA ; Carga la dirección de NUMEROS_LISTA en el registro SI
    mov al, [si] ; Carga el primer número de la lista en el registro AL
    inc si ; Incrementa la dirección para avanzar al siguiente número

salto:
    cmp al, [si] ; Compara el número actual con el siguiente número de la lista
    jbe menor ; Salta a la etiqueta "menor" si el número es menor o igual
    mov al, [si] ; Si no es menor o igual, mueve el siguiente número a AL

menor:
    inc si ; Incrementa la dirección para avanzar al siguiente número
    loop salto ; Repite el bucle hasta que se haya recorrido toda la lista

    mov bx, 3000h ; Carga la dirección de memoria destino en el registro BX
    mov [bx], al ; Mueve el valor final (el menor número) a la memoria destino

    mov ah, 4Ch ; Función de terminación del programa
    mov al, 00h ; Código de salida del programa
    int 21h ; Invoca la interrupción 21h para terminar el programa

end start ; Fin del programa
