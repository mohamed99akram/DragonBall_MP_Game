.MODEL SMALL
.STACK 64
.DATA
	SENDER   DB 'SENDER','$'
	RECIEVER DB 'RECIEVER','$'
	CURSOR1  DW 0000H         	;SENDER
	CURSOR2  DW 0C00H         	;RECEIVER
VALUE DB ?
.CODE
MAIN PROC FAR
	      MOV  AX,@DATA
	      MOV  DS,AX

	;Set Divisor Latch Access Bit
	      mov  dx,3fbh       	; Line Control Register
	      mov  al,10000000b  	;Set Divisor Latch Access Bit
	      out  dx,al         	;Out it

	;Set LSB byte of the Baud Rate Divisor Latch register.
	      mov  dx,3f8h
	      mov  al,0ch
	      out  dx,al

	;Set MSB byte of the Baud Rate Divisor Latch register.
	      mov  dx,3f9h
	      mov  al,00h
	      out  dx,al

	;Set port configuration
	      mov  dx,3fbh
	      mov  al,00011011b
	      out  dx,al

	      mov  ah,0h
	      mov  al,13h
	      int  10h

	;COLOR HALVES
	      mov  ah,6          	; function 6
	      mov  al,0          	; scroll by 1 line   (al=0 change color)
	      mov  bh,46h        	; normal video attribute
	      mov  ch,0          	; upper left Y
	      mov  cl,0          	; upper left X
	      mov  dh,12         	; lower right Y
	      mov  dl,79         	; lower right X
	      int  10h
     
	      mov  ah,6          	; function 6
	      mov  al,0          	; scroll by 1 line   (al=0 change color)
	      mov  bh,07         	; normal video attribute
	      mov  ch,12         	; upper left Y
	      mov  cl,0          	; upper left X
	      mov  dh,24         	; lower right Y
	      mov  dl,79         	; lower right X
	      int  10h
	;#########


	;Check that Transmitter Holding Register is Empty
	AGAIN:
	;######TRANSMIT DATA#####
	;SET CURSOR
	      MOV  DX,CURSOR1
	      MOV  AH,2
	      MOV  BH,0
	      INT  10H

	;READ DATA
	      MOV  AH,1
	      INT  16H
	      JZ   CHK
	      MOV  VALUE,al
	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	      mov  dx , 3FDH     	; Line Status Register
	      In   al , dx       	;Read Line Status
	      test al , 00100000b
	      JZ   CHK
	;$$
	; CONSUME
	      MOV  AH,0
	      INT  16H

	; WRITE
	      MOV  AH,2
	      MOV  DL,VALUE
	      INT  21H
	      INC  CURSOR1

	;If empty put the VALUE in Transmit data register
	      mov  dx , 3F8H     	; Transmit data register
	      mov  al,VALUE
	      out  dx , al

	;Receiving a value

	;Check that Data is Ready
	CHK:  
	      mov  dx , 3FDH     	; Line Status Register
	      in   al , dx
	      test al , 1
	      JZ   AGAIN         	;Not Ready (This line may need to change)
	;If Ready read the VALUE in Receive data register
	      mov  dx , 03F8H
	      in   al , dx
	      mov  VALUE , al

	;Set Cursor2
	      MOV  DX,CURSOR2
	      MOV  AH,2
	      MOV  BH,0
	      INT  10H
	;Write it
		  MOV  AH,2
	      MOV  DL,VALUE
	      INT  21H

	      INC  CURSOR2

	      JMP  AGAIN


	; ;###########
	; ;SET CURSOR
	;       MOV  DX,0C00H
	;       MOV  AH,2
	;       MOV  BH,0
	;       INT  10H

	; ; DISPLAY message
	;       MOV  AH,9
	;       LEA  DX,SENDER
	;       INT  21H

	; ;READ CHARACTER INT 16H
	; CHECK:
	;       MOV  AH,1
	;       INT  16H
	;       JZ   CHECK
	; ;WRITE WHAT YOU READ
	;       MOV  AH,0          	; CONSUME
	;       INT  16H

	;       MOV  AH,2
	;       MOV  DL,AL
	;       INT  21H

	;       JMP  CHECK
	      HLT

MAIN ENDP
END MAIN

;MOV CX,1
;MOV BH,0
;MOV AH,9H
;MOV BL,00Fh
;MOV AL,'H'
;INT 10H
