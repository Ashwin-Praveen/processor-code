;name"check if two strings are equal"

jmp start

str db 80 dup(0)
str1 db 80 dup(0)
msg dw 13,10,"Enter the first string:$"
msg1 dw 13,10,"Enter the second string:$"
msg2 dw 13,10,"The length of the first string is:$"
msg3 dw 13,10,"The length of the second string is:$"
msg4 dw 13,10,"They are equal$"
msg5 dw 13,10,"They are not equal$"
length equ ?
length1 equ ?

display macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm
   
read macro 
    mov ah,01h
    int 21h
endm

start:
display msg
lea si,str
mov cx,00h
back:
read
mov [si],al
inc si
inc cx
cmp al,0dh
jne back
mov bx,cx

display msg1
lea di,str
mov cx,00h

back1:
read
mov [di],al
inc di
inc cx
cmp al,0dh
jne back1

cmp bx,cx
jz equ
nequ:
display msg5
jmp exit

equ:
   
lea si,str 
lea di,str1
lo:  
mov bl,[di]
cmp [si],bl
jnz nequ
inc si
inc di
loop lo
jmp equal

equal:
display msg4
jmp exit
exit:
mov ah,4ch 
int 21h 

end
ret
