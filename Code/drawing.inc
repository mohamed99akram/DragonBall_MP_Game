DrawImage MACRO imgW,imgH,img,startpositionX,startpositionY
	                 LOCAL      Drawit
	                 Local      Start
	                 Local      ENDDRAWING
					;  local 		nodelay
	                 MOV        AH,0Bh                                                     	;set the configuration
	                 MOV        CX, imgW                                                   	;set the width (X)
	                 MOV        DX, imgH                                                   	;set the hieght (Y)
	                 mov        DI, offset img                                             	; to iterate over the pixels
	                 jmp        Start                                                      	;Avoid drawing before the calculations
	Drawit:          
	                 add        CX,startpositionX
	                 add        DX,startpositionY
	                 MOV        AH,0Ch                                                     	;set the configuration to writing a pixel
	                 mov        al, [DI]                                                   	; color of the current coordinates
	                 MOV        BH,00h                                                     	;set the page number
	                 INT        10h                                                        	;execute the configuration
	                 sub        CX,startpositionX
	                 sub        DX,startpositionY
	Start:           
	                 inc        DI
	                 DEC        Cx                                                         	;  loop iteration in x direction
	                 JNZ        Drawit                                                     	;  check if we can draw c urrent x and y and excape the y iteration
	                 mov        Cx, imgW                                                   	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                 DEC        DX                                                         	;  loop iteration in y direction
	                 JZ         ENDDRAWING                                                 	;  both x and y reached 00 so end program
	                 Jmp        Drawit
	ENDDRAWING:    	  

					;  cmp        P1_state, State_Jump_Up
					;  jz nodelay
					;  cmp        P2_state, State_Jump_Up
					;  jz nodelay
					;  cmp        P1_state, State_Jump_Down
					;  jz nodelay
					;  cmp        P2_state, State_Jump_Down
					;  jz nodelay
					;  call big_delay
					;  nodelay:
ENDM       DrawImage

ClearImage MACRO imgW,imgH,startpositionX,startpositionY
	                 LOCAL      Drawitt
	                 Local      Startt
	                 Local      ENDCLEARING
	                 MOV        AH,0Bh                                                     	;set the configuration
	                 MOV        CX, imgW                                                   	;set the width (X)
	                 MOV        DX, imgH                                                   	;set the hieght (Y)
	                 jmp        Startt                                                     	;Avoid drawing before the calculations
	Drawitt:         
	                 add        CX,startpositionX
	                 add        DX,startpositionY
	                 MOV        AH,0Ch                                                     	;set the configuration to writing a pixel
	                 mov        al,0; 77h                                                    	; color of the current coordinates
	                 MOV        BH,00h                                                     	;set the page number
	                 INT        10h                                                        	;execute the configuration
	                 sub        CX,startpositionX
	                 sub        DX,startpositionY
	Startt:          
	                 DEC        Cx                                                         	;  loop iteration in x direction
	                 JNZ        Drawitt                                                    	;  check if we can draw c urrent x and y and excape the y iteration
	                 mov        Cx, imgW                                                   	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	                 DEC        DX                                                         	;  loop iteration in y direction
	                 JZ         ENDCLEARING                                                	;  both x and y reached 00 so end program
	                 Jmp        Drawitt
	ENDCLEARING:     
ENDM       DrawImage


MOV_MEM MACRO MEMORY1,MEMORY2
	                 PUSH       AX
	                 MOV        AX,MEMORY2
	                 MOV        MEMORY1,AX
	                 POP        AX
ENDM       MOV_MEM
ADD_MEM MACRO MEMORY1,MEMORY2
	                 PUSH       AX
	                 MOV        AX,MEMORY2
	                 ADD        MEMORY1,AX
	                 POP        AX
ENDM       ADD_MEM

	; CONTINUE_TASKS MACRO

	; 	local L2
	; 	Local L3
	; 	Local L4
	; 	local L5
	; 	Local L6
	; 	Local L7
	; 	local L8
	; 	Local L9
	; 	Local L10
	; 	local L11
	; 	Local L12
	; 	Local L13
	; 	local L14
	; 	Local L15


	; 	                 cmp        P1_state, State_Kicking
	; 	                 jne        L2
	; 	                 UpdateP1Kicking

	; 	L2:
	; 	                 cmp        P1_state, State_Boxing
	; 	                 jne        L3
	; 	                 UpdateP1Boxing

	; 	L3:
	; 	                 cmp        P1_state, State_Fire
	; 	                 jne        L4
	; 	                 UpdateP1Fireing

	; 	L4:
	; 	                 cmp        P1_state, State_Barry
	; 	                 jne        L5
	; 	                        UpdateP1Barry

	; 	L5:
	; 	                 cmp        P2_state, State_Kicking
	; 	                 jne        L6
	; 	                        UpdateP2Kicking

	; 	L6:
	; 	                 cmp        P2_state, State_Boxing
	; 	                 jne        L7
	; 	                        UpdateP2Boxing

	; 	L7:
	; 	                 cmp        P2_state, State_Fire
	; 	                 jne        L8
	; 	                        UpdateP2Fireing

	; 	L8:
	; 	                 cmp        Ball1_State, State_BallMoving
	; 	                 jne        L9
	; 	                        UpdateBall1

	; 	L9:
	; 	                 cmp        Ball2_State, State_BallMoving
	; 	                 jne        L10
	; 	                        UpdateBall2

	; 	L10:
	; 	                 cmp        P2_state, State_Barry
	; 	                 jne        L11
	; 	                        UpdateP2Barry
    
	; 	L11:             cmp        P2_state, State_Left
	; 	                 jne        L12
	; 	                        UpdateP2Left

	; 	L12:             cmp        P2_state, State_Right
	; 	                 jne        L13
	; 	                        UpdateP2Right

	; 	L13:             cmp        P2_state, State_Jump_Up
	; 	                 jne        L14
	; 	                        UpdateP2JumpUp

	; 	L14:             cmp        P2_state, State_Jump_Down
	; 	                 jne        L15
	; 	                        UpdateP2JumpDown
	; 	L15:
	; 	                 ;       delay

	; ENDM		CONTINUE_TASKS

	; UpdateP1Kicking MACRO
	; 	local endfunc
	; 	                 sub        P1_state_count, 1
	; 	                 cmp        P1_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage kickingW, kickingH, P1_CUR_X,P1_CUR_Y
	; 	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	; 	                 mov        P1_state, State_Standing
	; 	endfunc:
	                
	; ENDM 	UpdateP1Kicking

	; UpdateP1Boxing MACRO
	; 	local endfunc
	; 	                 sub        P1_state_count, 1
	; 	                 cmp        P1_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage boxingW, boxingH, P1_CUR_X,P1_CUR_Y
	; 	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	; 	                 mov        P1_state, State_Standing
	; 	endfunc:
	                
	; ENDM  		UpdateP1Boxing
 
	; UpdateP1Fireing MACRO
	; 	local endfunc
	; 	                 sub        P1_state_count, 1
	; 	                 cmp        P1_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage fireW, fireH, P1_CUR_X,P1_CUR_Y
	; 	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	; 	                 mov        P1_state, State_Standing
	; 	endfunc:
	; ENDM	UpdateP1Fireing

	; UpdateP1Barry MACRO

	; 	local endfunc
	; 	                 sub        P1_state_count, 1
	; 	                 cmp        P1_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage barryW, barryH, P1_CUR_X,P1_CUR_Y
	; 	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	; 	                 mov        P1_state, State_Standing
	; 	endfunc:
	; ENDM	UpdateP1Barry

	; UpdateP2Kicking MACRO
	; 	local endfunc
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage kicking2W, kicking2H, P2_Calculated_X,P2_CUR_Y
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	; 	                 mov        P2_state, State_Standing
	; 	endfunc:

	; ENDM	UpdateP2Kicking

	; UpdateP2Boxing MACRO
	; 	local endfunc
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage boxing2W, boxing2H, P2_CUR_X,P2_CUR_Y
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_Calculated_X,P2_CUR_Y
	; 	                 mov        P2_state, State_Standing
	; 	endfunc:
	
	; ENDM	UpdateP2Boxing
 
	; UpdateP2Fireing MACRO
	; 	local endfunc
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage fire2W, fire2H, P2_CUR_X,P2_CUR_Y
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_Calculated_X,P2_CUR_Y
	; 	                 mov        P2_state, State_Standing
	; 	endfunc:
	    
	; ENDM	UpdateP2Fireing

	; UpdateP2Barry MACRO
	; 	local endfunc
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 jne        endfunc
	; 	                 ClearImage barry2W, barry2H, P2_CUR_X,P2_CUR_Y
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	; 	                 mov        P2_state, State_Standing
	; 	endfunc:
	       
	; ENDM	UpdateP2Barry

	; UpdateBall1 MACRO
	; 	local Check_for_P2
	; 	local ClearBall
	; 	local ClearBothBalls
	; 	local end
	; 	                 ClearImage ballW,ballH,startball1X,startball1Y

	; 	                 cmp        Ball2_State,State_BallMoving
	; 	                 jne        Check_for_P2
	; 	                 mov        ax, startball1X
	; 	                 add        ax, ballW
	; 	                 mov        bx, startball2x
	; 	                 sub        bx,ax
	; 	                 cmp        bx,5
	; 	                 jle        ClearBothBalls

	; 	Check_for_P2:
	; 	                 mov        ax, startball1X
	; 	                 add        ax, ballW
	; 	                 MOV_MEM    P2_Calculated_X, P2_CUR_X
	; 	                 sub        P2_Calculated_X, P2_difference
	; 	                 cmp        ax,P2_Calculated_X
	; 	                 mov        bx, P2_Calculated_X
	; 	                 sub        bx,ax
	; 	                 cmp        bx,3
	; 	                 jle        ClearBall

	; 	                 mov        bx, GraphEnd
	; 	                 sub        bx,ax
	; 	                 cmp        bx,3
	; 	                 jle        ClearBall

	; 	                 add        startball1X,1
	; 	                 DrawImage  ballW, ballH, ball, startball1X, startball1Y
	; 	                 jmp end

	; 	ClearBall:
	; 	                 mov        Ball1_State,State_NoBall
	; 	                 jmp end

	; 	ClearBothBalls:
	; 	                 mov        Ball1_State,State_NoBall
	; 	                 mov        Ball2_State,State_NoBall
	; 	                 ClearImage ball2W,ball2H,startball2X,startball2Y
	; 	end:
	; ENDM	UpdateBall1

	; UpdateBall2 MACRO
	; 	local ClearBall
	; 	local end
	; 	                 ClearImage ball2W,ball2H,startball2X,startball2Y
 
	; 	                 mov        ax, startball2X
	; 	                 mov        Bx, P1_CUR_X
	; 	                 add        Bx, 40
	; 	                 sub        ax,bx
	; 	                 cmp        ax,3
	; 	                 jle        ClearBall

	; 	                 sub        ax, GraphBegin
	; 	                 cmp        ax,3
	; 	                 jle        ClearBall

	; 	                 sub        startball2X,1
	; 	                 DrawImage  ball2W, ball2H, ball2, startball2X, startball2Y
	; 	                 jmp end

	; 	ClearBall:
	; 	                 mov        Ball2_State,State_NoBall
	                
	; 	end:
	; ENDM	UpdateBall2


	; UpdateP2Left MACRO
	; 	local endfunc
	; 	local end
	; 	                 ClearImage moving2W,moving2H,P2_CUR_X,P2_CUR_Y
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 je         endfunc
	; 	;cmp
	; 	                 mov        ax, P2_CUR_X
	; 	                 mov        Bx, P1_CUR_X
	; 	                 add        Bx, 50
	; 	                 sub        ax,bx
	; 	                 cmp        ax,3
	; 	                 jle        endfunc

	; 	                 sub        P2_CUR_X,5
	; 	                 DrawImage  moving2W, moving2H, moving2, P2_CUR_X,P2_CUR_Y
	; 	                 jmp end

	; 	endfunc:
	; 	                 mov        P2_state,State_Standing
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 
	; 	end:
	; ENDM	UpdateP2Left

	; UpdateP2Right MACRO
	; 	local endfunc
	; 	local end
	; 	                 ClearImage back2W,back2H,P2_CUR_X,P2_CUR_Y
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 je         endfunc
	; 	;cmp
	; 	                 mov        bx, GraphEnd
	; 	                 mov        ax,P2_CUR_X
	; 	                 add        ax, back2W
	; 	                 sub        bx,ax
	; 	                 cmp        bx,3
	; 	                 jle        endfunc

	; 	                 add        P2_CUR_X,5
	; 	                 DrawImage  back2W, back2H, back2, P2_CUR_X,P2_CUR_Y
	; 	                 jmp end

	; 	endfunc:
	; 	                 mov        P2_state,State_Standing
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 
	; 	end:
	; ENDM	UpdateP2Right

	; UpdateP2JumpUp MACRO
	; 	local endfunc
	; 	local end
	; 	                 ClearImage jump2W,jump2H,P2_CUR_X,P2_CUR_Y
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 je         endfunc
                     
	; 	                 sub        P2_CUR_Y,5
	; 	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	; 	                 jmp end
	; 	endfunc:
	; 	                 mov        P2_state,State_Jump_Down
	; 	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	; 	                 mov        P2_state_count, JumpDown_Counting
	                 
	; 	end:
	; ENDM	UpdateP2JumpUp


	; UpdateP2JumpDown MACRO
	; 	local endfunc
	; 	local end
	; 	                 ClearImage jump2W,jump2H,P2_CUR_X,P2_CUR_Y
	; 	                 sub        P2_state_count, 1
	; 	                 cmp        P2_state_count, 0
	; 	                 je         endfunc
                     
	; 	                 add        P2_CUR_Y,5
	; 	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	; 	                 jmp end
	; 	endfunc:
	; 	                 mov        P2_state,State_Standing
	; 	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                
	; 	end:
	; ENDM	UpdateP2JumpDown


	; delay MACRO
	; 	                 MOV        CX, 0000H
	; 	                 MOV        DX, 05DCH
	; 	                 MOV        AH, 86H
	; 	                 INT        15H
	; 	                 RET
	; ENDM delay
  
