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

Check_power_up MACRO PL
	                 local NEXT_POW_UP2
	                 local NXT0_2
	                 local NXT1_2
	                 local NXT2_2
	                 local LL2
	                 local LOUT2
					 LOCAL P2_UPDATE0
					 LOCAL END_UPDATE0
					 LOCAL P2_UPDATE1
					 LOCAL END_UPDATE1
					 LOCAL P2_UPDATE2
					 LOCAL END_UPDATE2
					 LOCAL P2_MID
					 LOCAL PMID_END
						MOV				   SI,PL
						;CALCULATE THE MIDDLE X OF THE PLAYER
						CMP				   SI,1
						JNZ				   P2_MID
						MOV				   AX,P1_END_X
						SUB				   AX,P1_CUR_X
						MOV_MEM		   	   tempw2,P1_CUR_X
						JMP				   PMID_END
	P2_MID:
						MOV				   AX,P2_END_X
						SUB				   AX,P2_CUR_X
						MOV_MEM		   	   tempw2,P2_CUR_X
	PMID_END:
						MOV				   DX,0
						MOV				   CX,2
						DIV				   CX
						ADD				   AX,tempw2 ;NOW AX HAS THE MIDDLE OF THE PLAYER
						MOV				   tempw2,AX
	                    MOV                BX,0
	                    MOV                DI,OFFSET powerup_x
	NEXT_POW_UP2:       
	                    MOV                CX,powerup_x[BX]                                            	;START
	                    MOV                DX,CX
	                    ADD                DX,coinW                                                    	;END
	                    CMP                tempw2,DX
	                    JA                 LL2
	                    CMP                tempw2,CX
	                    JL                 LL2
	;P2_x LESS THAN START AND GREATER THAN END -> ADD POWERUP VALUE TO HIS HEALTH
	                    mov                ax,pow_up_state_array[BX]
	                    CMP                ax,State_heart
	                    JNZ                NXT0_2
						CMP                SI,1
						JNZ                P2_UPDATE0
						ADD                P1_HEALTH,HEART_HEALTH
	                    call               P1_HEALTH_BAR
	                    CALL               FIRE_ME1
						JMP                END_UPDATE0
	P2_UPDATE0:
	                    ADD                P2_HEALTH,HEART_HEALTH
	                    call               P2_HEALTH_BAR
	                    CALL               FIRE_ME2
	END_UPDATE0:
	                    mov                pow_up_state_array[BX],State_no_powerup
	                    JMP                LOUT2
	NXT0_2:             
	                    CMP                ax,State_coin
	                    JNZ                NXT1_2
						CMP                SI,1
						JNZ                P2_UPDATE1
						ADD                P1_HEALTH,HEART_HEALTH
	                    call               P1_HEALTH_BAR
	                    CALL               FIRE_ME1
						JMP                END_UPDATE1
	P2_UPDATE1:
	                    ADD                P2_HEALTH,HEART_HEALTH
	                    call               P2_HEALTH_BAR
	                    CALL               FIRE_ME2
	END_UPDATE1:
	                    mov                pow_up_state_array[BX],State_no_powerup
	                    JMP                LOUT2
	NXT1_2:             
	                    CMP                ax,State_fire_power
	                    JNZ                NXT2_2
						CMP                SI,1
						JNZ                P2_UPDATE2
						ADD                P1_HEALTH,HEART_HEALTH
	                    call               P1_HEALTH_BAR
	                    CALL               FIRE_ME1
						JMP                END_UPDATE2
	P2_UPDATE2:
	                    ADD                P2_HEALTH,HEART_HEALTH
	                    call               P2_HEALTH_BAR
	                    CALL               FIRE_ME2
	END_UPDATE2:
	                    mov                pow_up_state_array[BX],State_no_powerup
	                    JMP                LOUT2

	NXT2_2:             
	                    jmp                LOUT2
	LL2:                
	                    ADD                BX,2
	                    ADD                tempw1,2
	                    ADD                DI,2
	                    CMP                DI,offset powerup_y
	                    JZ                 LOUT2
	                    JMP                NEXT_POW_UP2
	LOUT2:              
ENDM Check_power_up

PORTS MACRO 
	;;;PORTS INITALIZATION
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
ENDM PORTS