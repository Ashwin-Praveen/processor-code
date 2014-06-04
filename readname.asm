;name"What's your name?"\

jmp start

msg dw 13,10,"Enter your name:$"
msg1 dw 13,10,"Your name:$"
arr db 80 dup(0)

read macro loc
    mov ah,01h
    int 21h
    mov loc,al
    endm

start:
mov si,0
lea dx,msg
mov ah,09h
int 21h

back:
read arr[si]
inc si
cmp al,0dh
jne back

mov arr[si],'$'
lea dx,msg1
mov ah,09h
int 21h  

mov dh,12h
mov dl,35h
mov ah,02h
int 10h


lea dx,arr
mov ah,09h
int 21h
jmp exit 

exit:
mov ah,4ch 
int 21h
end
ret