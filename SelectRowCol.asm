;name"Select row and column"

jmp start

msg dw 13,10,"Enter the column number(0x24):$"
msg1 dw 13,10,"Enter the row number(0x79):$"
msg2 dw 13,10,"Press any key to exit$"
col db ?
row db ?

disp macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm

start:
disp msg
call read
mov col,al
disp msg1
call read
mov row,al
mov ah,00h
mov al,03h
int 10h

mov ah,02h
mov bh,00h
mov dh,col
mov dl,row
int 10h
mov ah,0bh
int 21h  
mov dl,'_'
mov ah,02h
int 21h
mov ah,4ch 
int 21h

read proc
    mov ah,01h
    int 21h
    and al,0fh
    mov bl,al
    mov ah,01h
    int 21h
    and al,0fh
    mov ah,bl
    aad
    ret 
    read endp
end 
ret
  