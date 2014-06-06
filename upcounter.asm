;name"Deciaml up counter"

jmp start

start:
mov cl,00
mov ah,00h
mov al,03h
int 10h

back:
mov ah,02h
mov bh,00h
mov dh,12h
mov dl,35h
int 10h
mov al,cl 
aam
mov bx,ax
add bx,3030h
mov dl,bh
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
call delay 
xor ax,ax
cmp cl,100
inc cl
jne back
je done

done:
mov ah,4ch 
int 21h

delay proc
    push bx
    push cx
    mov bx,0fh
l:
    mov cx,0fh
    loop $
    dec bx
    jne l
    pop cx
    pop bx
    ret 
delay endp
end

ret