DrawImage MACRO imgW,imgH,img,startpositionX,startpositionY
LOCAL Drawit
Local Start 
Local ENDDRAWING
	MOV AH,0Bh   	;set the configuration
	       MOV CX, imgW  	;set the width (X)
	       MOV DX, imgH 	;set the hieght (Y)
		   mov DI, offset img  ; to iterate over the pixels
	       jmp Start    	;Avoid drawing before the calculations
	Drawit:
			add CX,startpositionX
			add DX,startpositionY
	       MOV AH,0Ch   	;set the configuration to writing a pixel
           mov al, [DI]     ; color of the current coordinates
	       MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
		   sub CX,startpositionX
			sub DX,startpositionY
	Start: 
		   inc DI
	       DEC Cx       	;  loop iteration in x direction
	       JNZ Drawit      	;  check if we can draw c urrent x and y and excape the y iteration
	       mov Cx, imgW 	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	       DEC DX       	;  loop iteration in y direction
	       JZ  ENDDRAWING   	;  both x and y reached 00 so end program
		   Jmp Drawit
	ENDDRAWING:
ENDM DrawImage

ClearImage MACRO imgW,imgH,startpositionX,startpositionY
LOCAL Drawitt
Local Startt 
Local ENDCLEARING
	MOV AH,0Bh   	;set the configuration
	       MOV CX, imgW  	;set the width (X)
	       MOV DX, imgH 	;set the hieght (Y)
	       jmp Startt    	;Avoid drawing before the calculations
	Drawitt:
			add CX,startpositionX
			add DX,startpositionY
	       MOV AH,0Ch   	;set the configuration to writing a pixel
           mov al, 0     ; color of the current coordinates
	       MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
		   sub CX,startpositionX
			sub DX,startpositionY
	Startt: 
	       DEC Cx       	;  loop iteration in x direction
	       JNZ Drawitt      	;  check if we can draw c urrent x and y and excape the y iteration
	       mov Cx, imgW 	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	       DEC DX       	;  loop iteration in y direction
	       JZ  ENDCLEARING   	;  both x and y reached 00 so end program
		   Jmp Drawitt
	ENDCLEARING:
ENDM DrawImage