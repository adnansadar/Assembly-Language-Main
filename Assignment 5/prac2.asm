                 
.MODEL SMALL
.DATA

BNO DB 05 DUP (0)
HNO DW 0H

.CODE
MOV AX,@DATA
MOV DS,AX


LEA SI,BNO
MOV CL,05H


I1:
MOV AH,01H
INT 21H  
SUB AL,30H 
MOV [SI],AL

INC SI
DEC CL
JNZ I1


LEA SI,BNO

MOV AL,[SI]
MOV AH,00H
MOV BX,10000

MUL BX
ADD HNO,AX
INC SI    


MOV AL,[SI]
MOV AH,00H
MOV BX,1000

MUL BX
ADD HNO,AX
INC SI 

MOV AL,[SI]
MOV AH,00H
MOV BX,100

MUL BX
ADD HNO,AX
INC SI
          

MOV AL,[SI]
MOV AH,00H
MOV BX,10

MUL BX
ADD HNO,AX
INC SI 


MOV AL,[SI]
MOV AH,00H
MOV BX,1

MUL BX
ADD HNO,AX


LEA SI,HNO
MOV BL,[SI+1]
CALL DISP 

MOV BL,[SI]
CALL DISP 

MOV AH,4CH
INT 21H



DISP PROC
MOV DL,BL
ROL DL,04H
AND DL,0FH

CMP DL,09H
JBE X3
ADD DL,07H
X3:ADD DL,30H

MOV AH,02H
INT 21H   

MOV DL,BL
AND DL,0FH

CMP DL,09H
JBE X4
ADD DL,07H
X4:ADD DL,30H

MOV AH,02H
INT 21H  

RET
ENDP


END