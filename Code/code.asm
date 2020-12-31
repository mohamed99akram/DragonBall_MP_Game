include drawing.inc
.model huge
.Stack 128
.data
	                  include images.inc
	start1X           equ     50
	startY            equ     195
	start2X           equ     550
	
	GROUND_Y          equ     250

	P2_difference     equ     20

	P1_CUR_X          DW      start1X
	P1_CUR_Y          DW      startY

	P2_CUR_X          DW      start2X
	P2_Calculated_X   DW      ?
	P2_CUR_Y          DW      startY

	startball1X       DW      0
	startball1Y       DW      0
	startball2X       DW      0
	startball2Y       DW      0

	P2_LEFT_ARROW     DB      4BH
	P2_RIGHT_ARROW    DB      4DH
	P2_UP_ARROW       DB      48H
	
	;PLAYER1
	P1_LEFT_ARROW     DB      'a'
	P1_RIGHT_ARROW    DB      'd'
	P1_UP_ARROW       DB      'w'

	P2_BOX            DB      'p'
	P2_KICK           DB      'o'
	P2_FIRE           DB      'i'
	P2_BARRY          DB      'u'

	P1_BOX            DB      'c'
	P1_KICK           DB      'v'
	P1_FIRE           DB      'b'
	P1_BARRY          DB      'n'

	P1_state          db      0
	P2_state          db      0

	State_Standing    equ     0
	State_Kicking     equ     1
	State_Boxing      equ     2
	State_Fire        equ     3
	State_Barry       equ     4
	State_Right       equ     5
	State_Left        equ     6
	State_Jump_Up     equ     7
	State_Jump_Down   equ     8

	State_BallMoving  equ     1
	State_NoBall      equ     0

	Kicking_Counting  equ     100
	Boxing_Counting   equ     100
	Fire_Counting     equ     100
	Barry_Counting    equ     100
	Left_Counting     equ     17
	Right_Counting    equ     17
	JumpUp_Counting   equ     100
	JumpDown_Counting equ     100

	P1_state_count    dw      0
	P2_state_count    dw      0

	Ball1_State       db      0
	Ball2_State       db      0

	GraphBegin        equ     10
	GraphEnd          equ     630

	MovingFactor      db      1

.CODE
MAIN PROC FAR
	                 mov        ax, @data
	                 mov        DS, ax
	                 mov        ax, 4F02h                                                  	;
	                 mov        bx, 0100h                                                  	; 640x400 screen graphics mode
	                 INT        10h                                                        	;execute the configuration

	                 DrawImage  standingW, standingH, standing, P1_CUR_X, P2_CUR_Y
	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	;draw both players
	Forever:         
	

	                 MOV        AH,01H
	                 INT        16H                                                        	;ZF = 1 IF NO INPUT
	                 JZ         END_OF_INPUT
	                 mov        ah,0                                                       	;THERE IS AN INPUT, TAKE IT
	                 int        16h                                                        	;get character

	;if player1 is not standing don't take input

	                 cmp        P1_state, State_Left
	                 je         Check_LeftP1

	                 cmp        P1_state, State_Right
	                 je         Check_RightP1

	                 cmp        P1_state, State_Standing
	                 jne        check_p2_state

	                 cmp        al,P1_KICK
	                 je         kick1

	                 cmp        al,P1_BOX
	                 je         box1

	                 cmp        al,P1_FIRE
	                 je         fireee1

	                 cmp        al,P1_BARRY
	                 je         barrry1

	                 cmp        ah,P1_UP_ARROW
	                 je         p1_jump
	Check_LeftP1:    
	                 cmp        ah, P1_LEFT_ARROW
	                 je         p1_left
	Check_RightP1:   
	                 cmp        P1_state, State_Left
	                 je         check_p2_state
	                 cmp        ah, P1_RIGHT_ARROW
	                 je         p1_right

	;;if player2 is not standing don't take input
	check_p2_state:  
	                 cmp        P2_state, State_Left
	                 je         Check_LeftP2

	                 cmp        P2_state, State_Right
	                 je         Check_RightP2

	                 cmp        P2_state, State_Standing
	                 jne        END_OF_INPUT

	                 cmp        al,P2_KICK
	                 je         kick2

	                 cmp        al,P2_BOX
	                 je         box2

	                 cmp        al,P2_FIRE
	                 je         fireee2

	                 cmp        al,P2_BARRY
	                 je         barrry2

	                 cmp        ah,P2_UP_ARROW
	                 je         p2_jump
	Check_LeftP2:    
	                 cmp        ah, P2_LEFT_ARROW
	                 je         p2_left
	Check_RightP2:   
	                 cmp        P2_state, State_Left
	                 je         END_OF_INPUT
                    
	                 cmp        ah, P2_RIGHT_ARROW
	                 je         p2_right
	                 jmp        END_OF_INPUT

	p1_left:         
	                 jmp        END_OF_INPUT

	p1_right:        
	                 jmp        END_OF_INPUT
	p1_jump:         
	                 jmp        END_OF_INPUT

	p2_left:         
	                 MOV        P2_state, State_Left                                       	;ACTIVATE TASK
	                 MOV        P2_state_count, Left_Counting                              	;VALUE=5, ARBITRARY ACUTALLY, ADD FOR MANY PRESSES
	;MOV_MEM    P2_PREV_IMG_OFST,P2_CUR_IMG_OFST
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  moving2W, moving2H, moving2, P2_CUR_X,P2_CUR_Y
	                 jmp        END_OF_INPUT

	p2_right:        
	                 MOV        P2_state, State_Right                                      	;ACTIVATE TASK
	                 MOV        P2_state_count, Right_Counting
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  back2W, back2H, back2, P2_CUR_X,P2_CUR_Y
	                 jmp        END_OF_INPUT
	p2_jump:         
	                 MOV        P2_state, State_Jump_Up                                    	;ACTIVATE TASK
	                 MOV        P2_state_count, JumpUp_Counting
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                 jmp        END_OF_INPUT

	box1:            
	                 mov        P1_state, State_Boxing
	                 mov        P1_state_count, Boxing_Counting
	                 ClearImage standingW, standingH, P1_CUR_X, P1_CUR_Y
	                 DrawImage  boxingW, boxingH, boxing, P1_CUR_X,P1_CUR_Y
	                 jmp        END_OF_INPUT
		
	box2:            
	                 mov        P2_state, State_Boxing
	                 mov        P2_state_count, Boxing_Counting
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 MOV_MEM    P2_Calculated_X, P2_CUR_X
	                 sub        P2_Calculated_X, P2_difference
	                 DrawImage  boxing2W, boxing2H, boxing2, P2_Calculated_X,P2_CUR_Y
	                 jmp        END_OF_INPUT

	kick1:           
	                 mov        P1_state, State_Kicking
	                 mov        P1_state_count, Kicking_Counting
	                 ClearImage standingW, standingH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  kickingW, kickingH, kicking, P1_CUR_X,P1_CUR_Y
	                 jmp        END_OF_INPUT
		
	kick2:           
	                 mov        P2_state, State_Kicking
	                 mov        P2_state_count, Kicking_Counting
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 MOV_MEM    P2_Calculated_X, P2_CUR_X
	                 sub        P2_Calculated_X, P2_difference
	                 DrawImage  kicking2W, kicking2H, kicking2, P2_Calculated_X,P2_CUR_Y
	                 jmp        END_OF_INPUT



	fireee1:         cmp        Ball1_State, State_BallMoving
	                 je         END_OF_INPUT
	                 mov        P1_state, State_Fire
	                 mov        P1_state_count, Fire_Counting
	                 ClearImage standingW, standingH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  fireW, fireH, fire, P1_CUR_X,P1_CUR_Y

	                 mov        ax,P1_CUR_X
	                 mov        startball1X,ax
	                 add        startball1X, fireW
	                 mov        ax,P1_CUR_Y
	                 mov        startball1Y,ax
	                 add        startball1Y, 11
	                 DrawImage  ballW, ballH, ball, startball1X, startball1Y
	                 mov        Ball1_State, State_BallMoving
	                 jmp        END_OF_INPUT

		
	fireee2:         cmp        Ball2_State, State_BallMoving
	                 je         END_OF_INPUT
	                 mov        P2_state, State_Fire
	                 mov        P2_state_count, Fire_Counting
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 MOV_MEM    P2_Calculated_X, P2_CUR_X
	                 sub        P2_Calculated_X, P2_difference
	                 DrawImage  fire2W, fire2H, fire2, P2_Calculated_X,P2_CUR_Y

	                 mov        ax,P2_Calculated_X
	                 mov        startball2X,ax
	                 sub        startball2X, ball2W
	                 mov        ax,P2_CUR_Y
	                 mov        startball2Y,ax
	                 add        startball2Y, 11
	                 DrawImage  ball2W, ball2H, ball2, startball2X, startball2Y
	                 mov        Ball2_State, State_BallMoving
	                 jmp        END_OF_INPUT


	barrry1:         
	                 mov        P1_state, State_Barry
	                 mov        P1_state_count, Barry_Counting
	                 ClearImage standingW, standingH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  barryW, barryH, barry, P1_CUR_X,P1_CUR_Y
	                 jmp        END_OF_INPUT

		
	barrry2:         
	                 mov        P2_state, State_Barry
	                 mov        P2_state_count, Barry_Counting
	                 ClearImage standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  barry2W, barry2H, barry2, P2_CUR_X,P2_CUR_Y
	                 jmp        END_OF_INPUT

	END_OF_INPUT:    
	                 CALL       CONTINUE_TASKS
	                 JMP        Forever
MAIN ENDP




CONTINUE_TASKS PROC

	                 call       CalculateFactor

	                 cmp        P1_state, State_Kicking
	                 jne        L2
	                 call       UpdateP1Kicking

	L2:              
	                 cmp        P1_state, State_Boxing
	                 jne        L3
	                 call       UpdateP1Boxing

	L3:              
	                 cmp        P1_state, State_Fire
	                 jne        L4
	                 call       UpdateP1Fireing

	L4:              
	                 cmp        P1_state, State_Barry
	                 jne        L5
	                 call       UpdateP1Barry

	L5:              
	                 cmp        P2_state, State_Kicking
	                 jne        L6
	                 call       UpdateP2Kicking

	L6:              
	                 cmp        P2_state, State_Boxing
	                 jne        L7
	                 call       UpdateP2Boxing

	L7:              
	                 cmp        P2_state, State_Fire
	                 jne        L8
	                 call       UpdateP2Fireing

	L8:              
	                 cmp        Ball1_State, State_BallMoving
	                 jne        L9
	                 call       UpdateBall1

	L9:              
	                 cmp        Ball2_State, State_BallMoving
	                 jne        L10
	                 call       UpdateBall2

	L10:             
	                 cmp        P2_state, State_Barry
	                 jne        L11
	                 call       UpdateP2Barry
    
	L11:             cmp        P2_state, State_Left
	                 jne        L12
	                 call       UpdateP2Left

	L12:             cmp        P2_state, State_Right
	                 jne        L13
	                 call       UpdateP2Right

	L13:             cmp        P2_state, State_Jump_Up
	                 jne        L14
	                 call       UpdateP2JumpUp

	L14:             cmp        P2_state, State_Jump_Down
	                 jne        L15
	                 call       UpdateP2JumpDown
	L15:             
	                 call       delay

	                 RET
CONTINUE_TASKS ENDP

UpdateP1Kicking PROC
	                 sub        P1_state_count, 1
	                 cmp        P1_state_count, 0
	                 jne        endfunc
	                 ClearImage kickingW, kickingH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                 mov        P1_state, State_Standing
	endfunc:         
	                 RET
UpdateP1Kicking ENDP

UpdateP1Boxing PROC
	                 sub        P1_state_count, 1
	                 cmp        P1_state_count, 0
	                 jne        endfunc
	                 ClearImage boxingW, boxingH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                 mov        P1_state, State_Standing
	endfunc:         
	                 RET
UpdateP1Boxing ENDP
 
UpdateP1Fireing PROC
	                 sub        P1_state_count, 1
	                 cmp        P1_state_count, 0
	                 jne        endfunc
	                 ClearImage fireW, fireH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                 mov        P1_state, State_Standing
	endfunc:         
	                 RET
UpdateP1Fireing ENDP

UpdateP1Barry PROC
	                 sub        P1_state_count, 1
	                 cmp        P1_state_count, 0
	                 jne        endfunc
	                 ClearImage barryW, barryH, P1_CUR_X,P1_CUR_Y
	                 DrawImage  standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                 mov        P1_state, State_Standing
	endfunc:         
	                 RET
UpdateP1Barry ENDP

UpdateP2Kicking PROC
	                 sub        P2_state_count, 1
	                 cmp        P2_state_count, 0
	                 jne        endfunc
	                 ClearImage kicking2W, kicking2H, P2_Calculated_X,P2_CUR_Y
	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 mov        P2_state, State_Standing
	endfunc:         
	                 RET
UpdateP2Kicking ENDP

UpdateP2Boxing PROC
	                 sub        P2_state_count, 1
	                 cmp        P2_state_count, 0
	                 jne        endfunc
	                 ClearImage boxing2W, boxing2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  standing2W, standing2H, standing2, P2_Calculated_X,P2_CUR_Y
	                 mov        P2_state, State_Standing
	endfunc:         
	                 RET
UpdateP2Boxing ENDP
 
UpdateP2Fireing PROC
	                 sub        P2_state_count, 1
	                 cmp        P2_state_count, 0
	                 jne        endfunc
	                 ClearImage fire2W, fire2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  standing2W, standing2H, standing2, P2_Calculated_X,P2_CUR_Y
	                 mov        P2_state, State_Standing
	endfunc:         
	                 RET
UpdateP2Fireing ENDP

UpdateP2Barry PROC
	                 sub        P2_state_count, 1
	                 cmp        P2_state_count, 0
	                 jne        endfunc
	                 ClearImage barry2W, barry2H, P2_CUR_X,P2_CUR_Y
	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 mov        P2_state, State_Standing
	endfunc:         
	                 RET
UpdateP2Barry ENDP

UpdateBall1 PROC
	                 ClearImage ballW,ballH,startball1X,startball1Y

	                 cmp        Ball2_State,State_BallMoving
	                 jne        Check_for_P2
	                 mov        ax, startball1X
	                 add        ax, ballW
	                 mov        bx, startball2x
	                 sub        bx,ax
	                 cmp        bx,5
	                 jle        ClearBothBalls

	Check_for_P2:    
	                 mov        ax, startball1X
	                 add        ax, ballW
	                 MOV_MEM    P2_Calculated_X, P2_CUR_X
	                 sub        P2_Calculated_X, P2_difference
	                 cmp        ax,P2_Calculated_X
	                 mov        bx, P2_Calculated_X
	                 sub        bx,ax
	                 cmp        bx,3
	                 jle        ClearBall

	                 mov        bx, GraphEnd
	                 sub        bx,ax
	                 cmp        bx,3
	                 jle        ClearBall
					
	                 mov        al,MovingFactor
	                 mov        ah,0
	                 add        startball1X,ax
	                 DrawImage  ballW, ballH, ball, startball1X, startball1Y
	                 RET

	ClearBall:       
	                 mov        Ball1_State,State_NoBall
	                 RET

	ClearBothBalls:  
	                 mov        Ball1_State,State_NoBall
	                 mov        Ball2_State,State_NoBall
	                 ClearImage ball2W,ball2H,startball2X,startball2Y
	                 RET
UpdateBall1 ENDP

UpdateBall2 PROC
	                 ClearImage ball2W,ball2H,startball2X,startball2Y
 
	                 mov        ax, startball2X
	                 mov        Bx, P1_CUR_X
	                 add        Bx, 40
	                 sub        ax,bx
	                 cmp        ax,3
	                 jle        ClearBall

	                 sub        ax, GraphBegin
	                 cmp        ax,3
	                 jle        ClearBall

	                 mov        al,MovingFactor
	                 mov        ah,0
	                 sub        startball2X,ax
	                 DrawImage  ball2W, ball2H, ball2, startball2X, startball2Y
	                 RET

	ClearBall:       
	                 mov        Ball2_State,State_NoBall
	                 RET
UpdateBall2 ENDP


UpdateP2Left PROC
	                 ClearImage moving2W,moving2H,P2_CUR_X,P2_CUR_Y
	                 mov        al,MovingFactor
	                 mov        ah,0
	                 sub        P2_state_count, ax
	                 cmp        P2_state_count, 0
	                 jle        endfunc
	;cmp
	                 mov        ax, P2_CUR_X
	                 mov        Bx, P1_CUR_X
	                 add        Bx, 50
	                 sub        ax,bx
	                 cmp        ax,3
	                 jle        endfunc
					
	                 mov        al,2
	                 mul        MovingFactor
	                 sub        P2_CUR_X,ax
	                 DrawImage  moving2W, moving2H, moving2, P2_CUR_X,P2_CUR_Y
	                 RET

	endfunc:         
	                 mov        P2_state,State_Standing
	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 RET
UpdateP2Left ENDP

UpdateP2Right PROC
	                 ClearImage back2W,back2H,P2_CUR_X,P2_CUR_Y
	                 mov        al,MovingFactor
	                 mov        ah,0
	                 sub        P2_state_count, ax
	                 cmp        P2_state_count, 0
	                 jle        endfunc
	;cmp
	                 mov        bx, GraphEnd
	                 mov        ax,P2_CUR_X
	                 add        ax, back2W
	                 sub        bx,ax
	                 cmp        bx,3
	                 jle        endfunc

	                 mov        al,2
	                 mul        MovingFactor
	                 add        P2_CUR_X,ax
	                 DrawImage  back2W, back2H, back2, P2_CUR_X,P2_CUR_Y
	                 RET

	endfunc:         
	                 mov        P2_state,State_Standing
	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 RET
UpdateP2Right ENDP

UpdateP2JumpUp PROC
	                 ClearImage jump2W,jump2H,P2_CUR_X,P2_CUR_Y
	                 mov        al,MovingFactor
	                 mov        ah,0
	                 sub        P2_state_count, ax
	                 cmp        P2_state_count, 0
	                 jle        endfunc
                     
	                 mov        al,1
	                 mul        MovingFactor
	                 sub        P2_CUR_Y,ax
	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                 RET
	endfunc:         
	                 mov        P2_state,State_Jump_Down
	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                 mov        P2_state_count, JumpDown_Counting
	                 RET
UpdateP2JumpUp ENDP


UpdateP2JumpDown PROC
	                 ClearImage jump2W,jump2H,P2_CUR_X,P2_CUR_Y
	                 mov        al,MovingFactor
	                 mov        ah,0
	                 sub        P2_state_count, ax
	                 cmp        P2_state_count, 0
	                 jle        endfunc
                     
	                 mov        al,1
	                 mul        MovingFactor
	                 add        P2_CUR_Y,ax
	                 DrawImage  Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                 RET
	endfunc:         
	                 mov        P2_state,State_Standing
	                 DrawImage  standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                 RET
UpdateP2JumpDown ENDP


CalculateFactor PROC
					mov MovingFactor,1
	                 cmp        P1_State, State_Jump_Up
	                 jne        L2
	                 add        MovingFactor,4
	                 jmp        L5

	L2:              
	                 cmp        P1_State, State_Jump_Down
	                 jne        L3
	                 add        MovingFactor,4
	                 jmp        L5

	L3:              
	                 cmp        P1_State, State_Right
	                 jne        L4
	                 add        MovingFactor,4
	                 jmp        L5

	L4:              
	                 cmp        P1_State, State_Left
	                 jne        L5
	                 add        MovingFactor,4

	L5:              
	                 cmp        Ball1_State, State_BallMoving
	                 jne        L6
	                 add        MovingFactor,1

	L6:              
	                 cmp        Ball2_State, State_BallMoving
	                 jne        L7
	                 add        MovingFactor,1
					
	L7:              
	                 cmp        P2_State, State_Jump_Up
	                 jne        L8
	                 add        MovingFactor,4
	                 RET

	L8:              
	                 cmp        P2_State, State_Jump_Down
	                 jne        L9
	                 add        MovingFactor,4
	                 RET

	L9:              
	                 cmp        P2_State, State_Right
	                 jne        L10
	                 add        MovingFactor,4
	                 RET

	L10:             
	                 cmp        P2_State, State_Left
	                 jne        L11
	                 add        MovingFactor,4
					
	L11:             
	                 RET
CalculateFactor ENDP


delay PROC
	                 MOV        CX, 0000H
	                 MOV        DX, 05DCH
	                 MOV        AH, 86H
	                 INT        15H
	                 RET
delay ENDP
  
END MAIN