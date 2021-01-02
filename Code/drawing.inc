DrawImage MACRO imgW,imgH,img,startpositionX,startpositionY
	                 LOCAL          Drawit
	                 Local          Start
	                 Local          ENDDRAWING
					 ;  local 		nodelay
	                 MOV            AH,0Bh                                                      	;set the configuration
	                 MOV            CX, imgW                                                    	;set the width (X)
	                 MOV            DX, imgH                                                    	;set the hieght (Y)
	                 mov            DI, offset img                                              	; to iterate over the pixels
	                 jmp            Start                                                       	;Avoid drawing before the calculations
	Drawit:          
	                 add            CX,startpositionX
	                 add            DX,startpositionY
	                 MOV            AH,0Ch                                                      	;set the configuration to writing a pixel
	                 mov            al, [DI]                                                    	; color of the current coordinates
	                 MOV            BH,00h                                                      	;set the page number
	                 INT            10h                                                         	;execute the configuration
	                 sub            CX,startpositionX
	                 sub            DX,startpositionY
	Start:           
	                 inc            DI
	                 DEC            Cx                                                          	;  loop iteration in x direction
	                 JNZ            Drawit                                                      	;  check if we can draw c urrent x and y and excape the y iteration
	                 mov            Cx, imgW                                                    	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                 DEC            DX                                                          	;  loop iteration in y direction
	                 JZ             ENDDRAWING                                                  	;  both x and y reached 00 so end program
	                 Jmp            Drawit
	ENDDRAWING:      
					;  cmp        P1_state, State_Jump_Up
					;  jz nodelay
					;  cmp        P2_state, State_Jump_Up
					;  jz nodelay
					;  cmp        P1_state, State_Jump_Down
					;  jz nodelay
					;  cmp        P2_state, State_Jump_Down
					;  jz nodelay
					;  cmp        Ball1_State,State_BallMoving
					;  jz nodelay
					;  cmp        Ball2_State,State_BallMoving
					;  jz nodelay
					 
					;  call big_delay
					;  nodelay:
ENDM           DrawImage

ClearImage MACRO imgW,imgH,startpositionX,startpositionY
	                 LOCAL          Drawitt
	                 Local          Startt
	                 Local          ENDCLEARING
	                 MOV            AH,0Bh                                                      	;set the configuration
	                 MOV            CX, imgW                                                    	;set the width (X)
	                 MOV            DX, imgH                                                    	;set the hieght (Y)
	                 jmp            Startt                                                      	;Avoid drawing before the calculations
	Drawitt:         
	                 add            CX,startpositionX
	                 add            DX,startpositionY
	                 MOV            AH,0Ch                                                      	;set the configuration to writing a pixel
	                 mov            al, 11                                                       	; color of the current coordinates
	                 MOV            BH,00h                                                      	;set the page number
	                 INT            10h                                                         	;execute the configuration
	                 sub            CX,startpositionX
	                 sub            DX,startpositionY
	Startt:          
	                 DEC            Cx                                                          	;  loop iteration in x direction
	                 JNZ            Drawitt                                                     	;  check if we can draw c urrent x and y and excape the y iteration
	                 mov            Cx, imgW                                                    	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                 DEC            DX                                                          	;  loop iteration in y direction
	                 JZ             ENDCLEARING                                                 	;  both x and y reached 00 so end program
	                 Jmp            Drawitt
	ENDCLEARING:     
ENDM           ClearImage

CalcDimensions MACRO StartX,StartY,Width,Height,EndX,EndY
	                 MOV_MEM        EndX, StartX
	                 ADD_MEM        EndX, Width

	                 MOV_MEM        EndY, StartY
	                 ADD_MEM        EndY, Height
ENDM           CalcDimensions

MOV_MEM MACRO MEMORY1,MEMORY2
	                 PUSH           AX
	                 MOV            AX,MEMORY2
	                 MOV            MEMORY1,AX
	                 POP            AX
	                 ENDM           MOV_MEM

ADD_MEM MACRO MEMORY1,MEMORY2
	                 PUSH           AX
	                 MOV            AX,MEMORY2
	                 ADD            MEMORY1,AX
	                 POP            AX
	                 ENDM           ADD_MEM
ClearImage_Colored MACRO imgW,imgH,startpositionX,startpositionY,color
	                 LOCAL          Drawitt
	                 Local          Startt
	                 Local          ENDCLEARING
	                 MOV            AH,0Bh                                                      	;set the configuration
	                 MOV            CX, imgW                                                    	;set the width (X)
	                 MOV            DX, imgH                                                    	;set the hieght (Y)
	                 jmp            Startt                                                      	;Avoid drawing before the calculations
	Drawitt:         
	                 add            CX,startpositionX
	                 add            DX,startpositionY
	                 MOV            AH,0Ch                                                      	;set the configuration to writing a pixel
	                 mov            al, color                                                       	; color of the current coordinates
	                 MOV            BH,00h                                                      	;set the page number
	                 INT            10h                                                         	;execute the configuration
	                 sub            CX,startpositionX
	                 sub            DX,startpositionY
	Startt:          
	                 DEC            Cx                                                          	;  loop iteration in x direction
	                 JNZ            Drawitt                                                     	;  check if we can draw c urrent x and y and excape the y iteration
	                 mov            Cx, imgW                                                    	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                 DEC            DX                                                          	;  loop iteration in y direction
	                 JZ             ENDCLEARING                                                 	;  both x and y reached 00 so end program
	                 Jmp            Drawitt
	ENDCLEARING:     
ENDM           ClearImage_Colored


DeclareWinner MACRO
	local Player1Wins
	local printwinner
	                    mov                ah,0
	                    mov                al,3
	                    int                10h
                        
						MOV BH,0

					

	                    MOV                AH,09                                                       	; INT Display String
	                    LEA               DX, GameEND                                           	; OFFset OF The Massage
	                    INT                21H                                                         	;

	                    

	                    mov                ax,P1_HEALTH
	                    mov                bx,P2_HEALTH

	                    cmp                ax,bx
	                    jg                 Player1Wins
	; player2 wins
	                    ; mov                SI, offset PLAYER1_NAME
	                    ; mov                DI, offset PLAYER2_NAME
						MOV                DL, 35                                                      	; X Position
	                    MOV                DH, 15                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, offset PLAYER2_NAME                                 	;OFFset OF The Massage
	                    INT                21H

						MOV                DL, 35                                                      	; X Position
	                    MOV                DH, 20                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

						MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, offset PLAYER1_NAME                              	;OFFset OF The Massage
	                    INT                21H
	                    jmp                printwinner


	Player1Wins:        
	                                                    	;player1 wins
						MOV                DL, 35                                                      	; X Position
	                    MOV                DH, 15                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, offset PLAYER1_NAME                                 	;OFFset OF The Massage
	                    INT                21H

						MOV                DL, 35                                                      	; X Position
	                    MOV                DH, 20                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

						MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, offset PLAYER2_NAME                              	;OFFset OF The Massage
	                    INT                21H
  
	printwinner:        
	                    

						call big_delay

						mov BOOL_GAME_ENDED,1

ENDM DeclareWinner 