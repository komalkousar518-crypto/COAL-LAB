 ; Cube of a number 
.model small
.stack 100h
.data
msg db "Cube = $"
cube db ?
tens db ?
ones db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Set number
    mov al,3       ; number to cube
    mov ah,0       ; clear AH before multiply
    mov bl,al
    mul bl         ; AL*BL ? AX = 3*3 = 9
    mov al,al
    mov ah,0
    mul bl         ; multiply result by 3 again ? 3*3*3 = 27
    mov cube,al    ; store result

    ; split digits
    mov al,cube
    mov ah,0
    mov bl,10
    div bl         ; AL = tens, AH = ones
    mov tens,al
    mov ones,ah

    ; print message
    mov dx,offset msg
    mov ah,9
    int 21h

    ; print tens
    mov dl,tens
    add dl,48
    mov ah,2
    int 21h

    ; print ones
    mov dl,ones
    add dl,48
    mov ah,2
    int 21h

    ; terminate program
    mov ah,4ch
    int 21h

main endp
end main