include drawing.inc
.model huge
.Stack 128
.data
	     include pictures.inc
;back - back2 - ball - ball2 - barry - barry2 - boxing - boxing2 - coin - fire - fire2 - firepower - heart 
; jump - jump2 - kicking - kicking2 - moving - moving2 - powerup - powerup2 - standing - standing2 
.CODE
MAIN PROC FAR
	     mov       ax, @data
	     mov       DS, ax
	;    mov ax, 4F02h    ;
	;    mov bx, 0100h    ; 640x400 screen graphics mode
	;    INT 10h      	;execute the configuration
    
	     MOV       AH, 0
	     MOV       AL, 13h
	     INT       10h
   
	     DrawImage fireW,fireH,fire,0,0
	     DrawImage fire2W,fire2H,fire2,fireW,0
         DrawImage 
	l1:  
	     mov       cx,2
	     loop      l1
	MAIN ENDP
END MAIN