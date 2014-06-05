;name"string palindrome"

jmp start

msg db 13,10,"Enter the string to be checked:$" 
str db 80 dup(0)
rev db 80 dup(0)
msg1 db 13,10,"The string is a palindrome$"
msg2 db 13,10,"The string is not a plindrome$"

start:
    
lea dx,msg
mov ah,09h
int 21h
mov cx,00h
mov si,offset str
mov di,offset rev

next:
mov ah,01h
int 21h
mov [si],al
inc si
inc cx
cmp al,0dh
jne next
mov bx,cx
mov di,cx
mov dx,cx
dec di
lea si,str 

next2:
mov al,[si]
mov [di],al
inc si
dec di
loop next2
moc cx,dx
lea si,str
lea di,rev
repe cmpsb
cmp cx,00h
jne notequal
lea dx,msg1
mov ah,09h
int 21h
jmp exit

notequal:
lea dx,msg2
mov ah,09h
int 21h 
exit:
mov ah,4ch 
int 21h
end

ret