.MODEL SMALL
.DATA
MSG1 DB 10,13,"ENTER A 2 DIGIT NUMBER:$"
MSG2 DB 10,13,"THE 2 DIGIT NUMBER IS:$"

.CODE
MOV AX,@DATA
MOV DS,AX

MOV AH,09H
LEA DX,MSG1
INT 21H

MOV AH,01H
INT 21H

CMP AL,39H
JBE X1
SUB AL,07H
X1:SUB AL,30H

MOV BL,AL
ROL BL,04H

MOV AH,01H
INT 21H

CMP AL,39H
JBE X2
SUB AL,07H
X2:SUB AL,30H

ADD BL,AL

MOV AH,09H
LEA DX,MSG2
INT 21H  

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

MOV AH,4CH
INT 21H

END