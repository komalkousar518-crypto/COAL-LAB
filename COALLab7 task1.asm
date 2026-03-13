; Program: Area of rectangle 
.model small
.stack 100h
.data
msg db "Area = $"
area db ?
tens db ?
ones db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Set length and width
    mov al,5       ; length
    mov bl,4       ; width
    mov ah,0       ; clear AH before multiply
    mul bl         ; AL*BL ? AX

    mov area,al    ; store result in area

    ; Separate digits for display
    mov al,area
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