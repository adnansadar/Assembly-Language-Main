.MODEL SMALL
.STACK 100H
.DATA
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
MSG1 DB 10,13, "ENTER FIRST NUMBER : $"
MSG2 DB 10,13, "ENTER SECOND NUMBER : $"
MSG3 DB 10,13, "RESULT : $"

.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV AH,9
LEA DX,MSG1
INT 21H

MOV AH,1
INT 21H
SUB AL,30H
MOV NUM1,AL

MOV AH,9
LEA DX,MSG2
INT 21H

MOV AH,1
INT 21H
SUB AL,30H
MOV NUM2,AL

ADD AL,NUM1
MOV RESULT,AL

MOV AH,0
AAA

ADD AH,30H
ADD AL,30H

MOV BX,AX

MOV AH,9
LEA DX,MSG3
INT 21H

MOV AH,2
MOV DL,BH
INT 21H

MOV AH,2
MOV AL,BL
INT 21H

MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
