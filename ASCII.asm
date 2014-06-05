;name"ASCII"

jmp start

start:
mov ah,01h
int 21h
mov bl,al
and al,0f0h
mov cl,04h
shr al,cl
cmp al,0ah
jl next1
add al,07h

next1:
add al,30h
mov dl,al
call black
mov ah,02h
int 21h 
mov al,bl
and al,0fh
cmp al,0ah
jl next2
add al,07h

next2:
add al,30h
mov dl,al
mov ah,02h
int 21h
jmp end

end:
mov ah,4ch 
int 21h

black proc
    push dx
    push ax
    mov dh,12h
    mov dl,35h
    mov ah,02h
    int 10h
    pop ax
    pop dx
    ret
black endp

end

ret