.MODEL SMALL
  .DATA
     ABC DB 10,13,"VALUE IN DL:$"
     
     .CODE
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AH,09H
     LEA DX,ABC
     INT 21H  
     
     MOV AH,02H 
     MOV DL,35H
     INT 21H
     
     MOV AH,4CH
     INT 21H
     END
