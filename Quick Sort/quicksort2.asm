print macro msg
   lea dx,msg
   mov ah,09h
   int 21h
endm


read macro n,j1,j2
j1:mov ah,01h
    int 21h                     
    cmp al,0dh
    je j2
    sub al,30h
    mov bl,al
    mov ax,n
    mov dx,0ah
    mul dx
    xor bh,bh
    add ax,bx
    mov n,ax
    jmp j1
j2 :nop
endm

printmul macro n1,l2,l3
    
    mov bx,000ah
    mov ax,n1
    xor cx,cx
    
    ;push into stack
l2:xor dx,dx
    div bx
    push dx
    inc cx
    cmp ax,0000h
    jne l2

    ;pop from stack
l3:pop dx
    add dl,30h
    mov ah,02h
    int 21h
    loop l3
endm

.model small
.stack 100h

.data
    msg1 db 10,13,'Enter a number: $'
    msg2 db 10,13,'     Sorted Array $'
    msg3 db 10,13,'          $'
    msg4 db 10,13,'Enter the size of array: $'
    msg5 db 10,13,'     Orginal Array $'
    n dw 0
    num dw 50 dup(0)
    sml dw 0
        
.code
main proc

    mov ax,@data
    mov ds,ax
    
    print msg4
    read n,jump1,jump2
    
    ;read n elements
    mov cx,n
    mov si,00h
loop1:print msg1
    ;read a multidigit number
    read num[si],jump3,jump4
    add si,02
    loop loop1
    
  ;printing unsorted array
  print msg5
  call display
    
    
    mov ax,n
    mov ah,2
    mul ah
    mov si,ax
    sub si,02
    lea di,num[si]
    lea si,num
    call quicksort
    ;printing sorted array
    print msg2
    call display
        
    mov ah,4ch
    int 21h

main endp
quicksort proc
  cmp si,di
  jnc j1
      push si
      push di
      call part
      mov dx,si
      pop di
      pop si
      
      push di
      mov di,dx
      push di
      sub di,02
      call quicksort
      pop si
      add si,02
      pop di
      call quicksort
    
j1:ret
quicksort endp
part proc
  mov ax,[di]
  mov cx,di
  mov di,si
  sub si,02
j21:cmp ax,[di]
  jc j11
  add si,02
  mov bx,[si]
  mov dx,[di]
  mov [si],dx
  mov [di],bx
j11:add di,02
  cmp di,cx
  jnz j21
  add si,2
  mov bx,[si]
  mov di,cx
  mov [di],bx
  mov [si],ax
  ret
part endp

display proc
    mov cx,n
    mov si,00h
l4: push cx
    print msg3
    printmul num[si],l5,l6
    add si,02h
    pop cx
    loop l4
    ret
display endp

end