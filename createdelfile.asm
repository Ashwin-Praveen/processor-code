;name"Create delete file, by inputting a file name"

jmp start

msg dw 13,10,"Enter your choice:$"
msg1 dw 13,10,"1. To create a file",13,10,"2. To delete a file",13,10,'$'     
msg2 dw 13,10,"Enter the file name:$"
msg3 dw 13,10,"Error,run the progaram after some time.$"
msg4 dw 13,10,"Done.$"
filename db dup(0)

display macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm

start:
display msg
display msg1
mov ah,01h
int 21h
cmp al,'1'
je create
cmp al,'2'
je delete
jmp error

error:
display msg3
exit:
mov ah,4ch 
int 21h

create:
display msg2
call read
mov cx,00
lea dx,filename
mov ah,3ch
int 21h 
display msg4 
jmp exit

delete:
display msg2
call read
mov ah,41h
lea dx,filename
int 21h

display msg4
jmp exit

read proc
    mov si,offset filename
back:
    mov ah,01h
    int 21h
    mov [si],al
    cmp al,0dh
    je done 
    inc si
    jmp back 
done:
    ret 
    read endp

end 
ret
