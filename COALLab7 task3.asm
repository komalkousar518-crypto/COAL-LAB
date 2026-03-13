; Program: Divide a number by 10 
.model small
.stack 100h
.data
msgQ db "Quotient = $"
msgR db "Remainder = $"
quot db ?
rem db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    mov al,27      ; number to divide
    mov ah,0       ; clear AH 
    mov bl,10

    div bl         ; AL = quotient, AH = remainder
    mov quot,al
    mov rem,ah

    ; print quotient
    mov dx,offset msgQ
    mov ah,9
    int 21h

    mov dl,quot
    add dl,48
    mov ah,2
    int 21h

    ; new line
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    int 21h

    ; print remainder
    mov dx,offset msgR
    mov ah,9
    int 21h

    mov dl,rem
    add dl,48
    mov ah,2
    int 21h

    ; terminate program
    mov ah,4ch
    int 21h

main endp
end main 