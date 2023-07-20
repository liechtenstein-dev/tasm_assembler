.model small
.stack 100h

.data
    CARACTERES_ASCII DB '0123456789ABCDEF' ; Lista de caracteres ASCII
    SIZE_CARACTERES DB 16 ; Longitud de la lista de caracteres ASCII
    NUMEROS_BINARIOS DB ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ; Lista de números hexadecimales en binario
.code
start:
    mov ax, @data ; Carga la dirección del segmento de datos en el registro AX
    mov ds, ax ; Carga la dirección del segmento de datos en el registro DS
    xor ch, ch              ; Limpio la parte alta
    mov bx, OFFSET SIZE_CARACTERES
    mov cx, [bx]          ; Guardo la longitud de la lista de caracteres ASCII
    mov si, OFFSET CARACTERES_ASCII            ; Le apunto a la lista de caracteres ASCII
    mov di, OFFSET NUMEROS_BINARIOS ; Le apunto a la lista de números hexadecimales en binario
REPEAT:
    mov al, [si]            ; Obtengo el carácter ASCII de la lista
    cmp al, '0'             ; Comparo si es menor que '0'
    jbe CONVERTIR           ; Si es menor o igual que '0', salto a la conversión directa a hexadecimal
    cmp al, '9'             ; Comparo si es menor que '9'
    jbe CONVERTIR           ; Si es menor o igual que '9', salto a la conversión directa a hexadecimal
    sub al, 7               ; Resto 7 para ajustar el valor del carácter ASCII a las letras A-F
CONVERTIR:
    sub al, 30h             ; Convierto el carácter ASCII a su correspondiente número hexadecimal
    mov [di], al            ; Guardar el número hexadecimal en la lista correspondiente
    inc si                  ; Incremento el puntero de la lista de caracteres ASCII
    inc di                  ; Incremento el puntero de la lista de números hexadecimales en binario
    loop REPEAT             ; Vuelvo a comenzar hasta que CX = 0
    mov ah, 4Ch             ; Función de terminación del programa
    mov al, 00h             ; Código de salida del programa
    int 21h                 ; Interrupción del sistema

end start
