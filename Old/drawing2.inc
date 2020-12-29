DrawImage MACRO 
	local Drawit
	local Start
	local Ending
	MOV AH,0Bh   	;set the configuration
	       MOV CX, imgW  	;set the width (X) up to 64 (based on image resolution)
	       MOV DX, imgH 	;set the hieght (Y) up to 64 (based on image resolution)
		   mov DI,  img  ; to iterate over the pixels
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
	       JZ  ENDING   	;  both x and y reached 00 so end program
		   Jmp Drawit
	
	ENDING:
ENDM DrawImage

ClearImage MACRO 
	local Drawit
	local Start
	local Ending
	MOV AH,0Bh   	;set the configuration
	       MOV CX, imgW  	;set the width (X) up to 64 (based on image resolution)
	       MOV DX, imgH 	;set the hieght (Y) up to 64 (based on image resolution)
	       jmp Start    	;Avoid drawing before the calculations
	Drawit:
			add CX,startpositionX
			add DX,startpositionY
	       MOV AH,0Ch   	;set the configuration to writing a pixel
           mov al, 0     ; color of the current coordinates
	       MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
		   sub CX,startpositionX
			sub DX,startpositionY
	Start: 
	       DEC Cx       	;  loop iteration in x direction
	       JNZ Drawit      	;  check if we can draw c urrent x and y and excape the y iteration
	       mov Cx, imgW 	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	       DEC DX       	;  loop iteration in y direction
	       JZ  ENDING   	;  both x and y reached 00 so end program
		   Jmp Drawit
	
	ENDING:
ENDM DrawImage