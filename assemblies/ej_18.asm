.model small
.stack 200h
.data 
    org 02000h
    longitud DB 05h
.code
start:
    org 0100h
    mov ax, @data
    mov ds, ax
    mov bx, OFFSET longitud ; Dirección de memoria donde se encuentra la longitud del número
    mov cl, [bx]            ; Cargar la longitud del número en CL
    mov si, 02001h          ; Iniciar el puntero en la primera posición del número
    mov al, 02Eh            ; Valor ASCII del punto
    mov bl, 020h            ; Valor ASCII del espacio

REPLACE_DECIMAL:
    cmp al, [si]            ; Comparar el valor actual con el punto
    jnz NO_DECIMAL          ; Saltar si no es un punto
    dec cl                  ; Decrementar la longitud del número
    inc si                  ; Incrementar el puntero
    mov [si], bl            ; Reemplazar el dígito decimal con un espacio
NO_DECIMAL:
    inc si                  ; Incrementar el puntero
    dec cl                  ; Decrementar la longitud del número
    jnz REPLACE_DECIMAL     ; Repetir si quedan más dígitos en el número

    mov ah, 4Ch             ; Función de terminación del programa
    mov al, 00h             ; Código de salida del programa
    int 21h                 ; Interrupción del sistema

end start
