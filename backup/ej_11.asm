.model small
.stack 100h

.data
    COMBINACIONES_BINARIAS DB 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh ; Lista de combinaciones binarias
    SIZE_COMBINACIONES DB 06h ; Longitud de la lista de combinaciones binarias
    CARACTERES_ASCII DB ?, ?, ?, ?, ?, ? ; Lista de caracteres ASCII

.code
start:
    mov ax, @data ; Carga la dirección del segmento de datos en el registro AX
    mov ds, ax ; Carga la dirección del segmento de datos en el registro DS
    xor cx, cx              ; Limpio el registro
    mov bx, OFFSET SIZE_COMBINACIONES
    mov cl, [bx]          ; Guardo la longitud de la lista de combinaciones binarias
    mov si, OFFSET COMBINACIONES_BINARIAS            ; Le apunto a la lista de combinaciones binarias
    mov di, OFFSET CARACTERES_ASCII ; Le apunto a la lista de caracteres ASCII
REPEAT:
    mov al, [si]            ; Obtengo el dígito hexadecimal de la lista de combinaciones binarias
    cmp al, 0Ah              ; Comparo si es menor que 10 (0-9)
    jl CONVERTIR            ; Si es menor que 10, salto a la conversión directa a ASCII
    add al, 07h               ; Si es mayor o igual que 10, ajusto el valor para las letras A-F
CONVERTIR:
    add al, 1Eh             ; Convierto el dígito a su correspondiente carácter ASCII + 30
    mov [di], al            ; Guardo el carácter ASCII en la lista correspondiente
    inc si                  ; Incremento el puntero de la lista de combinaciones binarias
    inc di                  ; Incremento el puntero de la lista de caracteres ASCII
    loop REPEAT             ; Vuelvo a comenzar hasta que CX = 0
    mov ah, 4Ch             ; Función de terminación del programa
    mov al, 00h             ; Código de salida del programa
    int 21h                 ; Interrupción del sistema

end start
