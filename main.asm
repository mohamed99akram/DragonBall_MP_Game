INCLUDE DRAWING.INC
.MODEL HUGE
.STACK 128
.DATA
	                             INCLUDE myImages.INC
	;######INPUT KEYS#########
	;PLAYER2
	;Scan Code
	P2_LEFT_ARROW                DB      4BH
	P2_RIGHT_ARROW               DB      4DH
	P2_UP_ARROW                  DB      48H
	;ASCII - HIT
	P2_BOX                       DB      'p'
	P2_KICK                      DB      'o'
	P2_FIRE                      DB      'i'
	P2_BARRIER                   DB      'u'

	;PLAYER1
	P1_LEFT_ARROW                DB      'a'
	P1_RIGHT_ARROW               DB      'd'
	P1_UP_ARROW                  DB      'w'
	;HIT
	P1_BOX                       DB      'c'
	P1_KICK                      DB      'v'
	P1_FIRE                      DB      'b'
	P1_BARRIER                   DB      'n'

	;#####IMAGE HANDLING#######
	P1_CUR_IMG_OFST              DW      ?
	P1_CUR_X                     DW      ?
	P1_CUR_Y                     DW      ?

	P2_CUR_IMG_OFST              DW      ?
	P2_CUR_X                     DW      ?
	P2_CUR_Y                     DW      ?

	IMG_TO_DRAW_OFST             DW      ?
	IMG_X                        DW      ?
	IMG_Y                        DW      ?

	P1_PREV_IMG_OFST             DW      ?              	;PREVIOUS
	P2_PREV_IMG_OFST             DW      ?

	GROUND_Y                     DW      200
	;########FUNCTIONS EASIER######
	RETURN_VALUE_W               DW      ?
	RETURN_VALUE_B               DB      ?

	;########SCORE##########
	PL1_SCORE                    DB      100
	PL2_SCORE                    DB      100

	;########POWER UPS##########
	POWER_UPS_COUNTER            DB      0
	POWER_UPS_X_POSITIONS        DB      10,20,30
	POWER_UPS_Y_POSITIONS        DB      200,200,200

	POWER_UPS_INDEX              DB      0
	POWER_UPS_CURRENT_IMG_OFST   DB      0
	CUR_POWER_UP_X               DB      0
	CUR_POWER_UP_Y               DB      0

	;########TASKS MEMORY HANDLING######

	;LEFT PRESS TASK
	P2_LEFT_TASK_BOOL            DB      0              	;0 If doesn't have to go left, 1 else
	P2_LEFT_TASK_VALUE           DB      0              	;VALUE TO GO LEFT

	P2_RIGHT_TASK_BOOL           DB      0
	P2_RIGHT_TASK_VALUE          DB      0

	P2_UP_TASK_BOOL              DB      0
	P2_UP_TASK_VALUE             DB      0

	P2_JUMPED_ALREADY_TASK_BOOL  DB      0
	P2_JUMPED_ALREADY_TASK_VALUE DB      0


	TEMPW                        DW      ?

;Any changes to positioin should update players positions and their current picture
.CODE
MAIN PROC FAR
	                             mov          ax, @data
	                             mov          DS, ax
	                             mov          ax, 4F02h                        	;
	                             mov          bx, 0100h                        	; 640x400 screen graphics mode
	                             INT          10h                              	;execute the configuration
	    
	;INITIALIZATIONS
	                             DRAW_IMG_AT  standing,50,GROUND_Y             	;Player1 on the ground TODO: GROUND IS WRONG
	                             MOV          P1_CUR_X,50
	                             MOV          AX,GROUND_Y
	                             MOV          P1_CUR_Y,AX
	                             MOV          AX,IMG_TO_DRAW_OFST              	;Player1's img variable update
	                             MOV          P1_CUR_IMG_OFST,AX

	                             DRAW_IMG_AT  standing2,550,GROUND_Y           	;Player2 on the ground
	                             MOV          P2_CUR_X,550
	                             MOV          AX,GROUND_Y
	                             MOV          P2_CUR_Y,AX
	                             MOV          AX,IMG_TO_DRAW_OFST              	;Player2's img variable update
	                             MOV          P2_CUR_IMG_OFST,AX
        
	INFINITE_LOOP:               
	;get character

	                             MOV          AH,01H
	                             INT          16H                              	;ZF = 1 IF NO INPUT
	                             JZ           END_OF_INPUT
	                             mov          ah,0                             	;THERE IS AN INPUT, TAKE IT
	                             int          16h
        

	P2_LA_CHECK:                 
	                             CMP          AH,P2_LEFT_ARROW                 	; LEFT ARROW PRESSED?
	                             JNZ          P2_RA_CHECK
	; CMP P2_LEFT_TASK_BOOL,1
	; JZ P2_RA_CHECK
	;HERE LEFT ARROW IS PRESSED
	                             MOV          P2_LEFT_TASK_BOOL,1              	;ACTIVATE TASK
	                             ADD          P2_LEFT_TASK_VALUE,5             	;VALUE=5, ARBITRARY ACUTALLY, ADD FOR MANY PRESSES
	                             MOV_MEM      P2_PREV_IMG_OFST,P2_CUR_IMG_OFST
	                             MOV          P2_RIGHT_TASK_BOOL,0             	;STOP HIM IF HE WAS GOING RIGHT
	                             MOV          P2_RIGHT_TASK_VALUE,0
	                             JMP          END_OF_INPUT
       
	P2_RA_CHECK:                 
	                             CMP          AH,P2_RIGHT_ARROW
	                             JNZ          P2_UP_CHECK
	; CMP P2_RIGHT_TASK_BOOL,1
	; JZ P2_UP_CHECK
	                             MOV          P2_RIGHT_TASK_BOOL,1
	                             ADD          P2_RIGHT_TASK_VALUE,5
	                             MOV_MEM      P2_PREV_IMG_OFST,P2_CUR_IMG_OFST
	                             MOV          P2_LEFT_TASK_BOOL,0              	;STOP HIM IF HE WAS GOING LEFT
	                             MOV          P2_LEFT_TASK_VALUE,0
	                             JMP          END_OF_INPUT
	P2_UP_CHECK:                 
	                             CMP          AH,P2_UP_ARROW
	                             JNZ          P2_BARRIER_CHECK
	                             CMP          P2_UP_TASK_BOOL,1
	                             JZ           P2_BARRIER_CHECK
	                             CMP          P2_JUMPED_ALREADY_TASK_BOOL,1
	                             JZ           P2_BARRIER_CHECK
	                             MOV          P2_UP_TASK_BOOL,1
	                             ADD          P2_UP_TASK_VALUE,5
	                             MOV_MEM      P2_PREV_IMG_OFST,P2_CUR_IMG_OFST
	                             JMP          END_OF_INPUT
                
	P2_BARRIER_CHECK:            
	END_OF_INPUT:                
	                             CALL         CONTINUE_TASKS
	                             JMP          INFINITE_LOOP
        
MAIN ENDP
	;###########################CONTINUE TASKS#######################
CONTINUE_TASKS PROC

	P2_LA_TASK_CHECK:                                                          	;~~~~~~~~~~~LEFT_P2~~~~~~~~~~
	                             CMP          P2_LEFT_TASK_BOOL,1              	; LEFT ARROW P2 ACTIVATED?
	                             JNZ          P2_RA_TASK_CHECK
	                             CMP          P2_LEFT_TASK_VALUE,0
	                             JLE          STOP_P2_LEFT
	HIT_P1:                                                                    	;?
	; COMPARE TWO PLAYERS POSITIONS NOT TO HIT EACH OTHER
	                             MOV          BX, P1_CUR_IMG_OFST
	                             SUB          BX,4
	                             MOV          AX,P1_CUR_X
	                             ADD          AX,[BX]                          	;NOW AX HAS RIGHT END OF P1
	                             MOV          BX,P2_CUR_X
	                             SUB          BX,1                             	;FUTURE POSITION
	                             CMP          AX,BX
	                             JGE          STOP_P2_LEFT
	;CLEAR,DRAW----> P2_CUR_IMG_OFST: OFFSET & P2_CUR_X: NEW POS ---- clear,change,update,draw,updateTask
	;THIS PART SHOULD BE CONVERTED INTO A MACRO
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             SUB          P2_CUR_X,7                       	;(STEP) - MAY CHANGE <--------------- CHANGE SPEED
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET moving2
	                             DRAW_IMG_AT  moving2,P2_CUR_X,P2_CUR_Y
	                             DEC          P2_LEFT_TASK_VALUE
	                             JMP          P2_RA_TASK_CHECK
	;RETURN TO PREVIOUS STATE
	STOP_P2_LEFT:                
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET standing2
	                             DRAW_IMG_AT  standing2,P2_CUR_X,P2_CUR_Y
	                             MOV          P2_LEFT_TASK_BOOL,0
	                             MOV          P2_LEFT_TASK_VALUE,0
        
	P2_RA_TASK_CHECK:                                                          	;~~~~~~~~~~~RIGHT_P2~~~~~~~~~~
	                             CMP          P2_RIGHT_TASK_BOOL,1
	                             JNZ          P2_UP_TASK_CHECK
	                             CMP          P2_RIGHT_TASK_VALUE,0
	                             JLE          STOP_P2_RIGHT
	HIT_SREEN_P2:                                                              	;?
	;COMPARE PLAYER'S END WITH SCREEN
	                             MOV          BX,P2_CUR_IMG_OFST
	                             SUB          BX,4                             	;GET WIDTH
	                             MOV          AX,P2_CUR_X
	                             ADD          AX,[BX]                          	;RIGHT END OF THE PLAYER
	                             ADD          AX,1
	                             CMP          AX,620
	                             JGE          STOP_P2_RIGHT
	;CLEAR,DRAW----> P2_CUR_IMG_OFST: OFFSET & P2_CUR_X: NEW POS ---- clear,change,update,draw,updateTask
	;THIS PART SHOULD BE CONVERTED INTO A MACRO
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             ADD          P2_CUR_X,7                       	;(STEP) - MAY CHANGE <--------------- CHANGE SPEED
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET back2
	                             DRAW_IMG_AT  back2,P2_CUR_X,P2_CUR_Y
	                             DEC          P2_RIGHT_TASK_VALUE
	                             JMP          P2_UP_TASK_CHECK
	;RETURN TO PREVIOUS STATE
	STOP_P2_RIGHT:               
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET standing2
	                             DRAW_IMG_AT  standing2,P2_CUR_X,P2_CUR_Y
	                             MOV          P2_RIGHT_TASK_BOOL,0
	                             MOV          P2_RIGHT_TASK_VALUE,0
	P2_UP_TASK_CHECK:                                                          	;~~~~~~~~~~~UP_P2~~~~~~~~~~
	                             CMP          P2_UP_TASK_BOOL,1
	                             JNZ          P2_JUMPED_ALREADY_TASK_CHECK
	                             CMP          P2_UP_TASK_VALUE,0
	                             JLE          STOP_P2_UP
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             SUB          P2_CUR_Y,15                      	;<--------------- CHANGE SPEED
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET jump2
	                             DRAW_IMG_AT  jump2,P2_CUR_X,P2_CUR_Y
	                             DEC          P2_UP_TASK_VALUE
	                             JMP          P2_JUMPED_ALREADY_TASK_CHECK
	STOP_P2_UP:                  
	                             MOV          P2_UP_TASK_BOOL,0
	                             MOV          P2_UP_TASK_VALUE,0
	                             MOV          P2_JUMPED_ALREADY_TASK_BOOL,1
	                             MOV          P2_JUMPED_ALREADY_TASK_VALUE,5
	P2_JUMPED_ALREADY_TASK_CHECK:                                              	;~~~~~~~~~~~P2_GOING DOWN AFTER JUMPING~~~~~~~~~
	                             CMP          P2_JUMPED_ALREADY_TASK_BOOL,1
	                             JNZ          P2_BARRIER_TASK_CHECK
	                             CMP          P2_JUMPED_ALREADY_TASK_VALUE,0
	                             JLE          STOP_P2_JUMPED_ALREADY
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             ADD          P2_CUR_Y,15                      	;<--------------- CHANGE SPEED
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET jump2
	                             DRAW_IMG_AT  jump2,P2_CUR_X,P2_CUR_Y
	                             DEC          P2_JUMPED_ALREADY_TASK_VALUE
	                             JMP          P2_BARRIER_TASK_CHECK
	STOP_P2_JUMPED_ALREADY:      
	                             MOV          P2_JUMPED_ALREADY_TASK_BOOL,0
	                             MOV          P2_JUMPED_ALREADY_TASK_VALUE,0
	                             CLEAR_IMG_AT P2_CUR_IMG_OFST,P2_CUR_X,P2_CUR_Y
	                             MOV_MEM      P2_CUR_IMG_OFST,OFFSET standing2
	                             DRAW_IMG_AT  standing2,P2_CUR_X,P2_CUR_Y
	P2_BARRIER_TASK_CHECK:       
	SMALLEST_DELAY:                                                            	; MAYBE NO NEED FOR IT
	;CALL SMALL_DELAY
	                             RET
CONTINUE_TASKS ENDP

DRAW_IMG PROC
	                             MOV          AH,0Bh                           	;set the configuration
	                             mov          DI, IMG_TO_DRAW_OFST
	                             MOV          CX, [DI-4]                       	;width is current-4
	                             MOV          DX, [DI-2]                       	;height is current-2
	                             jmp          Start                            	;Avoid drawing before the calculations
	Drawit:                      
	                             add          CX,IMG_X
	                             add          DX,IMG_Y
	                             MOV          AH,0Ch                           	;set the configuration to writing a pixel
	                             mov          al,[DI]                          	; color of the current coordinates
	                             MOV          BH,00h                           	;set the page number
	                             INT          10h                              	;execute the configuration
	                             sub          CX,IMG_X
	                             sub          DX,IMG_Y
	Start:                       
	                             inc          DI
	                             DEC          Cx                               	;  loop iteration in x direction
	                             JNZ          Drawit                           	;  check if we can draw c urrent x and y and excape the y iteration
	                             MOV          BX, IMG_TO_DRAW_OFST
	                             mov          Cx, [BX - 4]                     	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                             DEC          DX                               	;  loop iteration in y direction
	                             JZ           ENDDRAWING                       	;  both x and y reached 00 so end program
	                             Jmp          Drawit
	ENDDRAWING:                  
	                             RET
DRAW_IMG ENDP

CLEAR_IMG PROC
	                             MOV          AH,0Bh                           	;set the configuration
	                             MOV          DI,IMG_TO_DRAW_OFST
	                             MOV          CX, [DI-4]                       	;set the width (X)
	                             MOV          DX, [DI-2]                       	;set the hieght (Y)
	                             jmp          Startt                           	;Avoid drawing before the calculations
	Drawitt:                     
	                             add          CX,IMG_X
	                             add          DX,IMG_Y
	                             MOV          AH,0Ch                           	;set the configuration to writing a pixel
	                             mov          al, 0                            	; color of the current coordinates
	                             MOV          BH,00h                           	;set the page number
	                             INT          10h                              	;execute the configuration
	                             sub          CX,IMG_X
	                             sub          DX,IMG_Y
	Startt:                      
	                             DEC          Cx                               	;  loop iteration in x direction
	                             JNZ          Drawitt                          	;  check if we can draw c urrent x and y and excape the y iteration
	                             mov          Cx, [DI-4]                       	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                             DEC          DX                               	;  loop iteration in y direction
	                             JZ           ENDCLEARING                      	;  both x and y reached 00 so end program
	                             Jmp          Drawitt
	ENDCLEARING:                 
CLEAR_IMG ENDP
SMALL_DELAY PROC
	                             MOV          CX, 0000H
	                             MOV          DX, 0D40H
	                             MOV          AH, 86H
	                             INT          15H
	                             RET
SMALL_DELAY ENDP
delay PROC
	                             MOV          CX, 0003H
	                             MOV          DX, 0D40H
	                             MOV          AH, 86H
	                             INT          15H
	                             RET
delay ENDP

PRINT_AN_INPUT PROC
	;SET CURSRO
	                             PUSH         AX
	                             PUSH         BX
	                             PUSH         CX
	                             PUSH         DX

	                             PUSH         AX
	                             MOV          AH,2
	                             MOV          DH,10
	                             MOV          DL,20
	                             MOV          BH,0
	                             INT          10H
	                             POP          AX
	                             MOV          CX,1
	                             MOV          BH,0
	                             MOV          DL,AL
	                             MOV          DH,AH
	                             MOV          AH,0AH
	                             MOV          AL,DL
	                             INT          10H
	                             PUSH         DX
	                             CALL         delay
	                             POP          DX
	                             MOV          BH,0
	                             MOV          CX,1
	                             MOV          DL,DH
	                             MOV          AH,0AH
	                             MOV          AL,DH
	                             INT          10H

	                             POP          AX
	                             POP          BX
	                             POP          CX
	                             POP          DX
	                             RET
PRINT_AN_INPUT ENDP
END MAIN

