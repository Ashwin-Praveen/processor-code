;name"display time"

jmp start

mgs dw 13,10,"the time right now is:$"
hrs db ?
min db ? 
sec db ?

start:
mov ah,2ch
int 21h
mov hrs,ch
mov min,cl 
mov sec,dh
lea dx,mgs
mov ah,09h
int 21h
mov al,hrs
call dispnum
call colon
mov al,min
call dispnum
call colon
mov al,sec
call dispnum
jmp exit 

exit:
mov ah,4ch 
int 21h

dispnum proc
    aam
    add ax,3030h
    mov bx,ax
    mov dl,bh
    mov ah,02h
    int 21h
    mov dl,al
    mov ah,02h
    int 21h
    ret 
dispnum endp

colon proc
    mov dl,':'
    mov ah,02h
    int 21h
    ret 
colon endp

end 
ret

    