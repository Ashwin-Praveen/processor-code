;name"bubble sort"

jmp start

list db 12h,78h,90h,80h
count equ 4

start:

mov dx,count-1

next:
mov cx,dx
mov  si,offset list
mov ax,[si]
cmp ax,[si+1]
jl next2
xchg [si+1],ax
xchg [si],ax

next2:
add si,01h
loop next 
dec dx
jnz start  
mov si,offset list 
mov cx,count
lq:
mov dl,[si]
inc si
mov ah,02h
int 21h
loop lq
mov ah,4ch    
int 21h
end 
ret