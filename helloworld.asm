;name"hello"
;Program to say hello 

jmp start

msg db 13,10,"Hello$"

start:
lea dx,msg
mov ah,09h
int 21h
mov ah,4ch 
int 21h

end 
ret
