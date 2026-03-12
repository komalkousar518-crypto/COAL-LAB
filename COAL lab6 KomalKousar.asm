
.model small
.stack 100h

.data
msg1 db ' Name:Komal Kousar$'
msg2 db 10,13,'Sapid:68023$'
msg3 db 10,13,'Batch:2025$'
msg4 db 10,13,'Course:BSSE 3$'

.code
main proc

mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 9
int 21h

mov dx, offset msg2
mov ah, 9
int 21h

mov dx, offset msg3
mov ah, 9
int 21h

mov dx, offset msg4
mov ah, 9
int 21h

mov ah,4ch
int 21h

main endp
end main