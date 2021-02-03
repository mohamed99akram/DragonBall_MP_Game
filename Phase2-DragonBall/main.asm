include drawing.inc
.model huge
.Stack 128
.data
	                      include images.inc

	PROGRAM_MODE          DB      ?

	MAINMENU_Message      db      'Program Mode:','$'

	MAIN_MENU             DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '                ___________________________________________________ ',0ah,0dh
	                      DB      '               |                __________________                 |',0ah,0dh
	                      DB      '               |               |                  |                |',0ah,0dh
	                      DB      '               |               |      WelCome     |                |',0ah,0dh
	                      DB      '               |               |__________________|                |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |           To Start Dragon Ball Press F2           |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |           To End The Program Pres ESC             |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |-------------------------------------------------- |',0ah,0dh
	                      DB      '               |      Note: No Input Vaild Except F2 , ESC         |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |___________________________________________________|',0ah,0dh
	                      DB      '$',0ah,0dh

	PLAYER1               db      'Player1 Name:','$'
	player2               db      'Player2 Name:','$'

	PLAYER1_NAMEIN        DB      30,?,30 DUP('$')
	PLAYER2_NAMEIN        DB      30,?,30 DUP('$')
	PLAYER1_NAME          DB      15 DUP(?) ,'$'
	PLAYER2_NAME          DB      15 DUP(?) ,'$'
	PLAYER1_NAME_REVERSED DB      15 DUP(?) ,'$'
	PLAYER2_NAME_REVERSED DB      15 DUP(?) ,'$'
	GameScreen            DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '                ___________________________________________________ ',0ah,0dh
	                      DB      '               |                __________________                 |',0ah,0dh
	                      DB      '               |               |                  |                |',0ah,0dh
	                      DB      '               |               |    Dragon Ball   |                |',0ah,0dh
	                      DB      '               |               |__________________|                |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |   Enter The Name OF The First Player Then Press   |',0ah,0dh
	                      DB      '               |                      Enter                        |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |     Enter The Name OF The Second Player Then	   |',0ah,0dh
	                      DB      '               |        	 Press Enter TO Continue	   |',0ah,0dh
	                      DB      '               |-------------------------------------------------- |',0ah,0dh
	                      DB      '               |      Note: Player Name Must Not be Greater        |',0ah,0dh
	                      DB      '               |            Than 15 Characters                     |',0ah,0dh
	                      DB      '               |___________________________________________________|',0ah,0dh
	                      DB      '$',0ah,0dh

	GAMELEVEL             DB      ?
	LevelMessage          db      'Game Level:','$'

	LevelScreen           DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '                ___________________________________________________ ',0ah,0dh
	                      DB      '               |                __________________                 |',0ah,0dh
	                      DB      '               |               |                  |                |',0ah,0dh
	                      DB      '               |               |    Dragon Ball   |                |',0ah,0dh
	                      DB      '               |               |__________________|                |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |   Select Level OF The Game:                       |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |   To Select Level 1 Press 1                       |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |   To Select Level 2 Press 2                       |',0ah,0dh
	                      DB      '               |-------------------------------------------------- |',0ah,0dh
	                      DB      '               |      Note: No Input Vaild Except 1 , 2            |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |___________________________________________________|',0ah,0dh
	                      DB      '$',0ah,0dh

	
	GameEND               DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '                ___________________________________________________ ',0ah,0dh
	                      DB      '               |                __________________                 |',0ah,0dh
	                      DB      '               |               |                  |                |',0ah,0dh
	                      DB      '               |               | Congratulations  |                |',0ah,0dh
	                      DB      '               |               |__________________|                |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |        Winner:                                    |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |        Loser:                                     |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |___________________________________________________|',0ah,0dh
	                      DB      '$',0ah,0dh


	RED                   EQU     04h
	WHITE                 EQU     0fh
	BLACK                 EQU     00h
	YELLOW                EQU     0Eh
	BLUE                  EQU     01h
	Cyan                  EQU     03h
	BROWN                 EQU     06h
	GREEEN                EQU     02H
	LIGHT_RED             EQU     0CH
	light_green           EQU     0ah
	gray                  EQU     07h
	Dark_Gray             EQU     08h
	LIGHT_cyan            EQU     0bh

	HEALTHWORD            DB      'Health'

	COUNTER_PRINTNAME     DB      ?

	start1X               equ     50
	startY                equ     195
	start2X               equ     550
	
	GROUND_Y              equ     250

	P2_difference         equ     20

	P1_CUR_X              DW      start1X
	P1_CUR_Y              DW      startY

	P1_END_X              DW      ?
	P1_END_Y              DW      ?

	P2_END_X              DW      ?
	P2_END_Y              DW      ?

	P2_CUR_X              DW      start2X
	P2_Calculated_X       DW      ?
	P2_CUR_Y              DW      startY

	startball1X           DW      0
	startball1Y           DW      0
	startball2X           DW      0
	startball2Y           DW      0

	P2_LEFT_ARROW         DB      4BH
	P2_RIGHT_ARROW        DB      4DH
	P2_UP_ARROW           DB      48H
	
	;PLAYER1
	P1_LEFT_ARROW         DB      'a'
	P1_RIGHT_ARROW        DB      'd'
	P1_UP_ARROW           DB      'w'

	P2_BOX                DB      'p'
	P2_KICK               DB      'o'
	P2_FIRE               DB      'i'
	P2_BARRY              DB      'u'

	P1_BOX                DB      'c'
	P1_KICK               DB      'v'
	P1_FIRE               DB      'b'
	P1_BARRY              DB      'n'

	P1_state              db      0
	P2_state              db      0

	State_Standing        equ     0
	State_Kicking         equ     1
	State_Boxing          equ     2
	State_Fire            equ     3
	State_Barry           equ     4
	State_Right           equ     5
	State_Left            equ     6
	State_Jump_Up         equ     7
	State_Jump_Down       equ     8

	State_BallMoving      equ     1
	State_NoBall          equ     0

	Kicking_Counting      equ     100
	Boxing_Counting       equ     100
	Fire_Counting         equ     100
	Barry_Counting        equ     200
	Left_Counting         equ     17
	Right_Counting        equ     17
	JumpUp_Counting       equ     100
	JumpDown_Counting     equ     100

	P1_state_count        dw      0
	P2_state_count        dw      0

	Ball1_State           db      0
	Ball2_State           db      0

	GraphBegin            equ     10
	GraphEnd              equ     630

	MovingFactor          db      1
    
	P1_HEALTH             dw      100
	P2_HEALTH             dw      100


	tempw1                dw      ?
	tempw2                dw      ?

	P1                    EQU     1
	P2                    EQU     2

	powerup_x             dw      75,100,80,400,500,200,300,70,85,10,600
	powerup_y             dw      11 dup(220)                                                                   	;,150,150,150,150,150,150,150,150,150,150
	;calculate ending using the code: x+22, y+22

	;states array
	pow_up_state_array    dw      0,0,0,0,0,0,0,0,0,0,0
	
	powerup_counter       dw      0                                                                             	; AFTER A NUMBER OF LOOPS, A NEW POWERUP SHOULD APPEAR
	powerup_rate          equ     5000
	cur_pow_up_x_OFST     dw      0
	cur_pow_up_y_OFST     dw      0                                                                             	;BOTH INCREASE EVERY UPDATE TO POINT TO ARRAY ELEMENT
	
	POWERUPS_STATES_NUM   EQU     4                                                                             	; NUMBER OF STATES

	State_no_powerup      EQU     0
	State_heart           EQU     1
	State_coin            EQU     2
	State_fire_power      EQU     3
	BOOL_no_powerup       DB      0
	BOOL_heart            DB      0
	BOOL_coin             DB      0
	BOOL_fire_power       DB      0

	CUR_POW_UP_STATE      DB      State_no_powerup                                                              	;CURRENT STATE
	PREV_POW_UP           DB      State_no_powerup                                                              	;PREVIOUS STATE
	POW_UP_TO_MAKE        DB      State_heart
	; State_cola        EQU      4
	; State_cake        EQU      5

	HEART_HEALTH          EQU     10
	COIN_HEALTH           EQU     5
	FIRE_HEALTH           EQU     15                                                                            	; WILL BE CHANGED MAYBE TO NEGATIVE OR MAYBE FIREUP WILL ENABLE HIM FIRE BALL

	COUNTER1              DW      0
	COUNTER2              DW      0

	BOOL_GAME_ENDED       db      0
	
	tempvar               dw      0

.CODE
MAIN PROC FAR
	                    mov                ax, @data
	                    mov                DS, ax



	BEGINNING:

	;Display The Game Screen
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX,OFFSET GameScreen                                        	; OFFset OF The Massage
	                    INT                21H

	; Out Player1 Name
	; Set Cursor To Print Message OF Player1
	                    MOV                DL, 15                                                      	; X Position
	                    MOV                DH, 5                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

	;Print Message OF Player1
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, OFFSET PLAYER1                                          	;OFFset OF The Massage
	                    INT                21H
        
	;Out Player2 Name
	; Set Cursor To Print Message OF Player2
	                    MOV                DL, 50                                                      	; X Position
	                    MOV                DH, 6                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

	;Print Message OF Player2
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX,OFFSET PLAYER2                                           	;OFFset OF The Massage
	                    INT                21H

	;IN Player1 Name
	INPlayer1Name:      
	; Set Cursor To Write Player1 Name
	                    MOV                DL, 29                                                      	; X Position
	                    MOV                DH, 5                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

	; Read Player1 Name
	                    MOV                AH,0AH                                                      	; INT Read From KeyBoard
	                    MOV                DX,offset PLAYER1_NAMEIN                                    	; OFFset OF Player 1
	                    INT                21H


	;IN Player2 Name
	INPlayer2Name:      
	; Set Cursor To Write Player2 Name
	                    MOV                DL, 64                                                      	; X Position
	                    MOV                DH, 6                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

	; Read Player2 Name
	                    MOV                AH,0AH                                                      	; INT Read From KeyBoard
	                    MOV                DX,offset PLAYER2_NAMEIN                                    	; OFFset OF Player 2
	                    INT                21H
             

	; FIX PLAYER1 NAME -> 15 CHARACTERS
	                    MOV                BX,0                                                        	; COUNTER
        
	                    mov                DI, OFFSET [ PLAYER1_NAMEIN + 1 ]                           	; GET SIZE OF PLAYER1 NAME
	                    MOV                CX , [DI]                                                   	; SET CX = SIZE
	                    MOV                CH,0                                                        	;TO AVOID ERROR SIZE
        
	                    MOV                SI , OFFSET PLAYER1_NAMEIN + 2                              	; INPUT PLAYER1_NAME START FROM 3
	                    MOV                DI , OFFSET PLAYER1_NAME                                    	; REAL PLAYER1_NAME (7 CHARACTERS)
        
	                    CMP                CX , 0FH                                                      	; CHECK IF SIZE > 15 SET IT WITH 15
	                    JNC                SETSIZEX                                                    	; JMP TO SET CX = 15
	                    JMP                FIXNAME1                                                    	; ELSE JMP TO DRAW PLAYER1 NAME
	SETSIZEX:           
	                    MOV                CX,0FH                                                       	;SET CX = 15
    
	FIXNAME1:                                                                                          	; LOOP USED TO COPY FIRST 7 CHARACTER FROM SI TO DI
	                    MOV                DL , [BX][SI]
	                    MOV                [BX][DI] , DL
	                    ADD                BX,1
          
	                    LOOP               FIXNAME1

	; FIX PLAYER2 NAME -> 15 CHARACTERS
	                    MOV                BX,0                                                        	; COUNTER
        
	                    mov                DI, OFFSET [ PLAYER2_NAMEIN + 1 ]                           	; GET SIZE OF PLAYER1 NAME
	                    MOV                CX , [DI]                                                   	; SET CX = SIZE
	                    MOV                CH,0                                                        	;TO AVOID ERROR SIZE

	                    MOV                SI , OFFSET PLAYER2_NAMEIN + 2                              	; INPUT PLAYER1_NAME START FROM 3
	                    MOV                DI , OFFSET PLAYER2_NAME                                    	; REAL PLAYER1_NAME (7 CHARACTERS)
        
	                    CMP                CX , 0FH                                                      	; CHECK IF SIZE > 15 SET IT WITH 15
	                    JNC                SETSIZEX2                                                   	; JMP TO SET CX = 15
	                    JMP                FIXNAME2                                                    	; ELSE JMP TO DRAW PLAYER1 NAME
	SETSIZEX2:                                                                                         	; SET CX = 15
	                    MOV                CX,0FH

	FIXNAME2:                                                                                          	; LOOP USED TO COPY FIRST 7 CHARACTER FROM SI TO DI
	                    MOV                DL , [BX][SI]
	                    MOV                [BX][DI] , DL
	                    ADD                BX,1
    
	                    LOOP               FIXNAME2          


	
	SELECT_MODE: 
	;Display The MAIN_MENU Screen
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX,OFFSET MAIN_MENU                                         	; OFFset OF The Massage
	                    INT                21H                                                         	;

	; Out MAIN_MENU MESSAGE
	; Set Cursor To Print LEVEL Message
	                    MOV                DL, 15                                                      	; X Position
	                    MOV                DH, 5                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

	;Print MAINMENU Message
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, OFFSET  MAINMENU_Message                                	;OFFset OF The Massage
	                    INT                21H
                                                                                      	; USED TO SET MODE OF PROGRAM
	                    MOV                AH,0                                                        	; INT Get key pressed & Wait for a key
	                    INT                16H
	                    CMP                AH,3CH                                                      	; Check IF Key = F2
	                    JZ                 GAMEMODE
	                    CMP                Al,1BH                                                      	; Check IF Key = ESC
	                    JZ                 ENDPRO
	                    JMP                SELECT_MODE                                                 	; ELSE NOT F2 | ESC RETURN
	GAMEMODE:           
	                    MOV                PROGRAM_MODE, 1                                             	; PROGRAM_MODE = F2
	                    JMP                TO_DRAGON_BALL
	ENDPRO:             
	                    MOV                PROGRAM_MODE, 2                                             	; PROGRAM_MODE = ESC
	                    MOV                AX, 0600H
	                    MOV                BH, 7
	                    MOV                CX, 0
	                    MOV                DX ,184FH
	                    INT                10H
	                    mov                ah, 4ch
	                    int                21h
	                    int                20h

	TO_DRAGON_BALL:     
       
	;Display The SELECT LEVEL Screen
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX,OFFSET LevelScreen                                       	; OFFset OF The Massage
	                    INT                21H                                                         	;

	; Out LEVEL MESSAGE
	; Set Cursor To Print LEVEL Message
	                    MOV                DL, 15                                                      	; X Position
	                    MOV                DH, 5                                                       	; Y Position
	                    MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                    int                10h

	;Print LEVEL Message
	                    MOV                AH,09                                                       	; INT Display String
	                    MOV                DX, OFFSET LevelMessage                                     	;OFFset OF The Massage
	                    INT                21H
            

	SELECT_LEVEL:                                                                                      	; USED TO GET LEVEL FROM THE PLAYER
	                    MOV                AH,0                                                        	; INT Get key pressed & Wait for a key
	                    INT                16H
	                    CMP                AL,'1'                                                      	; Check IF Key = 1
	                    JZ                 LEVEL1
	                    CMP                AL,'2'                                                      	; Check IF Key = 2
	                    JZ                 LEVEL2
	                    JMP                SELECT_LEVEL                                                	; ELSE NOT 1|2 RETURN
	LEVEL1:             
	                    MOV                GAMELEVEL, 1                                                	; SET LEVEL = 1
	                    JMP                START_DRAGON_BALL
	LEVEL2:             
	                    MOV                GAMELEVEL, 2                                                	; SET LEVEL = 2
	                    JMP                START_DRAGON_BALL

	START_DRAGON_BALL:  
      
	;GRAPHICS MODE
	                    mov                ax, 4F02h                                                   	;
	                    mov                bx, 0100h                                                   	; 640x400 screen graphics mode
	                    INT                10h
    
	;Draw BackGround OF PLAYERS
	                    MOV                BH,0                                                        	; PAGE NUMBER
	                    MOV                CX,640                                                      	; COLUMN
	                    MOV                AH,0Ch                                                      	; INT Draw Pixel
	                    MOV                AL,LIGHT_cyan                                               	; Pixel color
	XBACKGROUNDDRAW:    
	                    MOV                DX,1EH                                                      	; ROW , START ROW
	YBACKGROUNDDRAW:    
	                    INT                10H
	                    INC                DX                                                          	; INCREASE COUNTER
	                    CMP                DX, 400                                                     	; LAST COLUMN , OUT CONDITION
	                    JZ                 OUTYBACKGROUNDDRAW                                          	; IF EQUAL JMP TO  OUTYDRAW
	                    JNZ                YBACKGROUNDDRAW                                             	; IF NOT EQUAL LOOP
	OUTYBACKGROUNDDRAW: 
	                    LOOP               XBACKGROUNDDRAW

	;Draw BackGround OF HEALTH
	                    MOV                BH,0                                                        	; PAGE NUMBER
	                    MOV                CX,640                                                      	; COLUMN
	                    MOV                AH,0Ch                                                      	; INT Draw Pixel
	                    MOV                AL,Dark_Gray                                                	; Pixel color
	XHEALTHDRAW:        
	                    MOV                DX,0                                                        	; ROW , START ROW
	YHEALTHDRAW:        
	                    INT                10H
	                    INC                DX                                                          	; INCREASE COUNTER
	                    CMP                DX, 60                                                      	; LAST ROW , OUT CONDITION
	                    JZ                 OUTYHEALTHDRAW                                              	; IF EQUAL JMP TO  OUTYDRAW
	                    JNZ                YHEALTHDRAW                                                 	; IF NOT EQUAL LOOP
	OUTYHEALTHDRAW:     
	                    LOOP               XHEALTHDRAW
 

	; REVERSE PLAYER1 NAME
	                    MOV                SI , OFFSET PLAYER1_NAME+14                                  	; OFFSET OF LAST CHARACTER
	                    MOV                DI , OFFSET PLAYER1_NAME_REVERSED                           	; OFFSET OF REVERSED NAME
	                    MOV                DX,0                                                        	; COUNTER
    
	REVERSE1:           
	                    MOV                AL , [SI]                                                   	;  SWAP BETWEEN
	                    MOV                [DI] , AL                                                   	;  TWO VARIABLES
	                    DEC                SI                                                          	; DECREASE SI
	                    INC                DX                                                          	; INCREASE COUNTER
	                    INC                DI                                                          	; INCREASE SI
	                    CMP                DX , 0FH                                                    	; CHECK IF COUNTER = 15
	                    JNZ                REVERSE1                                                    	; IF NOT LOOP

	; REVERSE PLAYER2 NAME
	                    MOV                SI , OFFSET PLAYER2_NAME+14                                  	; OFFSET OF LAST CHARACTER
	                    MOV                DI , OFFSET PLAYER2_NAME_REVERSED                           	; OFFSET OF REVERSED NAME
	                    MOV                DX,0                                                        	; COUNTER
    
	REVERSE2:           
	                    MOV                AL , [SI]                                                   	;  SWAP BETWEEN
	                    MOV                [DI] , AL                                                   	;  TWO VARIABLES
	                    DEC                SI                                                          	; DECREASE SI
	                    INC                DX                                                          	; INCREASE COUNTER
	                    INC                DI                                                          	; INCREASE SI
	                    CMP                DX , 0FH                                                      	; CHECK IF COUNTER = 15
	                    JNZ                REVERSE2                                                    	; IF NOT LOOP

	; WRITE PLAYER 1 NAME IN HEALTH BAR
	;moving the cursor
	                    mov                dl,6                                                       	; X POSITION
	                    mov                dh,1                                                        	; Y POSITION
	                    mov                ah,02h                                                      	; INT Move Cursor to X,Y Position
	                    int                10h
        
	; PRINTING PLAYER1 NAME
	                    mov                bl,YELLOW                                                   	; LETTER COLOR
	                    mov                ah,9                                                        	; INT USED TO Display a letter number of times
	                    MOV                BH,0                                                        	; PAGE NUMBER
	                    mov                si,0                                                        	; COUNTER
	                    MOV                CX , 0FH
	                    MOV                CH , 0H
	DrawPLayer1Name:    
	;display the name
	                    mov                al,[PLAYER1_NAME_REVERSED+si]                               	; MOVE NAME LETTER BY LETTER
	                    int                10h
	                    INC                si                                                          	; INCREASE COUNTER
	                    DEC                CX
	                    JNZ                DrawPLayer1Name                                             	; LOOP 15 TIMES
              
	; WRITE PLAYER 2 NAME IN HEALTH BAR
	;moving the cursor
	                    mov                dl,59                                                       	; X POSITION
	                    mov                dh,1                                                        	; Y POSITION
	                    mov                ah,02h                                                      	; INT Move Cursor to X,Y Position
	                    int                10h
        
	; PRINTING PLAYER2 NAME
	                    mov                bl,RED                                                      	; LETTER COLOR
	                    mov                ah,9                                                        	; INT USED TO Display a letter number of times
	                    MOV                BH,0                                                        	; PAGE NUMBER
	                    mov                si,0                                                        	; COUNTER

	                    MOV                CX , 0FH
	                    MOV                CH,0
	DrawPLayer2Name:    
	;display the name
	                    mov                al,[PLAYER2_NAME_REVERSED+si]                               	; MOVE NAME LETTER BY LETTER
	                    int                10h
	                    INC                si                                                          	; INCREASE COUNTER
	                    CMP                SI , 0FH
	                    JZ                 DrawPLayer2NameEXIT
	                    DEC                CX
	                    JNZ                DrawPLayer2Name                                             	; LOOP 15 TIMES
	DrawPLayer2NameEXIT:
        
	; WRITE HEALTH WORD IN HEALTH BAR
	;move cursor
	                    mov                dl,37                                                       	; X POSITION
	                    mov                dh,2H                                                       	; Y POSITION
	                    mov                ah,02h                                                      	; INT Move Cursor to X,Y Position
	                    int                10h

	; PRINTING HEALTH WORD
	                    mov                bl,light_green                                              	; LETTER COLOR
	                    mov                ah,9                                                        	; INT USED TO Display a letter number of times
	                    MOV                BH,0                                                        	; PAGE NUMBER
	                    mov                CX,6                                                        	; 6 TIMES
	                    mov                si,5                                                        	; COUNTER
        
	;display the WORD HEALTH
	WRITEHEALTH:        
	                    mov                al,[HEALTHWORD+si]                                          	; MOVE NAME LETTER BY LETTER
	                    int                10h
	                    DEC                si                                                          	; INCREASE COUNTER
	                    LOOP               WRITEHEALTH                                                 	; LOOP 7 TIMES
        


         


	;---------------------------------------------------------------
	;  mov                ax, 4F02h                                                   	;
	;  mov                bx, 0100h                                                   	; 640x400 screen graphics mode
	;  INT                10h                                                         	;execute the configuration
	;ClearImage 640,400,0,0
	;  CALL               FIRE_ME2
	                    
	                    MOV                BOOL_GAME_ENDED, 0
	                    MOV                P1_HEALTH,100
	                    MOV                P2_HEALTH,100
	                    MOV                P1_CUR_X, start1X
	                    MOV                P2_CUR_X, start2X
	                    MOV                P1_CUR_Y, StartY
	                    MOV                P2_CUR_Y, StartY


	                    mov                tempvar,0
	                    mov                cx,16
	drawground:         
	                    push               cx
	                    DrawImage          groundW,groundH,ground,tempvar,250
	                    add                tempvar,40
	                    pop                cx
	                    loop               drawground


	                    DrawImage          standingW, standingH, standing, P1_CUR_X, P2_CUR_Y
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	;POWER UP INITIALIZATION
	;TODO
	                    MOV_MEM            cur_pow_up_x_OFST,OFFSET powerup_x
	                    MOV_MEM            cur_pow_up_y_OFST,OFFSET powerup_y

	;draw health bar
	                    ClearImage_Colored 102,12,56,34,15                                             	;white
	                    ClearImage_Colored 102,12,479,34,15                                            	;white
	                    ClearImage_Colored 100,10,57,35,light_green
	                    ClearImage_Colored 100,10,480,35,light_green

	;draw both players
	Forever:            

	                    cmp                BOOL_GAME_ENDED,1
	                    je                 SELECT_MODE
						
	                    MOV                AH,01H
	                    INT                16H                                                         	;ZF = 1 IF NO INPUT
	                    JZ                 END_OF_INPUT
	                    mov                ah,0                                                        	;THERE IS AN INPUT, TAKE IT
	                    int                16h                                                         	;get character

	;if player1 is not standing don't take input

	                    cmp                P1_state, State_Left
	                    je                 Check_LeftP1

	                    cmp                P1_state, State_Right
	                    je                 Check_RightP1

	                    cmp                P1_state, State_Standing
	                    jne                check_p2_state

	                    cmp                al,P1_KICK
	                    je                 kick1

	                    cmp                al,P1_BOX
	                    je                 box1

	                    cmp                al,P1_FIRE
	                    je                 fireee1

	                    cmp                al,P1_BARRY
	                    je                 barrry1

	                    cmp                al,P1_UP_ARROW
	                    je                 p1_jump
	Check_LeftP1:       
	                    cmp                al, P1_LEFT_ARROW
	                    je                 p1_left
	Check_RightP1:      
	                    cmp                P1_state, State_Left
	                    je                 check_p2_state
	                    cmp                al, P1_RIGHT_ARROW
	                    je                 p1_right

	;;if player2 is not standing don't take input
	check_p2_state:     
	                    cmp                P2_state, State_Left
	                    je                 Check_LeftP2

	                    cmp                P2_state, State_Right
	                    je                 Check_RightP2

	                    cmp                P2_state, State_Standing
	                    jne                END_OF_INPUT

	                    cmp                al,P2_KICK
	                    je                 kick2

	                    cmp                al,P2_BOX
	                    je                 box2

	                    cmp                al,P2_FIRE
	                    je                 fireee2

	                    cmp                al,P2_BARRY
	                    je                 barrry2

	                    cmp                ah,P2_UP_ARROW
	                    je                 p2_jump
	Check_LeftP2:       
	                    cmp                ah, P2_LEFT_ARROW
	                    je                 p2_left
	Check_RightP2:      
	                    cmp                P2_state, State_Left
	                    je                 END_OF_INPUT
                    
	                    cmp                ah, P2_RIGHT_ARROW
	                    je                 p2_right
	                    jmp                END_OF_INPUT

	p1_left:            
	                    MOV                P1_state, State_Left
	                    MOV                P1_state_count, Left_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          backW, backH, back, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,backW, backH, P1_END_X, P1_END_Y
	                    jmp                END_OF_INPUT

	p1_right:           
	                    MOV                P1_state, State_Right
	                    MOV                P1_state_count, Right_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          movingW, movingH, moving, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,movingW, movingH, P1_END_X, P1_END_Y
	                    jmp                END_OF_INPUT
	p1_jump:            
	                    MOV                P1_state, State_Jump_Up
	                    MOV                P1_state_count, JumpUp_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          JumpW, JumpH, Jump, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,JumpW, JumpH, P1_END_X, P1_END_Y
	                    jmp                END_OF_INPUT

	p2_left:            
	                    MOV                P2_state, State_Left                                        	;ACTIVATE TASK
	                    MOV                P2_state_count, Left_Counting                               	;VALUE=5, ARBITRARY ACUTALLY, ADD FOR MANY PRESSES
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                    DrawImage          moving2W, moving2H, moving2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,moving2W, moving2H, P2_END_X, P2_END_Y
	                    jmp                END_OF_INPUT

	p2_right:           
	                    MOV                P2_state, State_Right                                       	;ACTIVATE TASK
	                    MOV                P2_state_count, Right_Counting
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                    DrawImage          back2W, back2H, back2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,back2W, back2H, P2_END_X, P2_END_Y
	                    jmp                END_OF_INPUT
	p2_jump:            
	                    MOV                P2_state, State_Jump_Up                                     	;ACTIVATE TASK
	                    MOV                P2_state_count, JumpUp_Counting
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                    DrawImage          Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,Jump2W, Jump2H, P2_END_X, P2_END_Y
	                    jmp                END_OF_INPUT

	box1:               
	                    mov                P1_state, State_Boxing
	                    mov                P1_state_count, Boxing_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X, P1_CUR_Y
	                    sub                P1_CUR_Y,2
	                    DrawImage          boxingW, boxingH, boxing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,boxingW, boxingH, P1_END_X, P1_END_Y

	;Check if it hit player1
	                    cmp                P2_State,State_Barry
	                    je                 END_OF_INPUT
	                    mov                ax,P1_END_X
	                    mov                bx,P2_CUR_X
	                    sub                bx,ax
	                    cmp                bx,3
	                    jg                 END_OF_INPUT
	                    mov                ax, P1_CUR_Y
	                    mov                bx, P2_END_Y
	                    sub                ax,bx
	                    cmp                ax,1
	                    jg                 END_OF_INPUT
	;hit happened
	                    sub                P2_HEALTH, 5
	                    CALL               P2_HEALTH_BAR                                               	;white
	                    jmp                END_OF_INPUT
		
	box2:               
	                    mov                P2_state, State_Boxing
	                    mov                P2_state_count, Boxing_Counting
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                    sub                P2_CUR_X,P2_difference
	                    sub                P2_CUR_Y,2
	                    DrawImage          boxing2W, boxing2H, boxing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,boxing2W, boxing2H, P2_END_X, P2_END_Y

	;Check if it hit player2
	                    cmp                P1_State,State_Barry
	                    je                 END_OF_INPUT
	                    mov                ax,P2_CUR_X
	                    mov                bx,P1_END_X
	                    sub                ax,bx
	                    cmp                ax,3
	                    jg                 END_OF_INPUT
	                    mov                ax, P1_END_Y
	                    mov                bx, P2_CUR_Y
	                    sub                bx,ax
	                    cmp                bx,1
	                    jg                 END_OF_INPUT
	;hit happened
	                    sub                P1_HEALTH, 5
	                    CALL               P1_HEALTH_BAR
	                    jmp                END_OF_INPUT

	kick1:              
	                    mov                P1_state, State_Kicking
	                    mov                P1_state_count, Kicking_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                    sub                P1_CUR_Y,5
	                    DrawImage          kickingW, kickingH, kicking, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,kickingW, kickingH, P1_END_X, P1_END_Y
	;Check if it hit player2
	                    cmp                P2_State,State_Barry
	                    je                 END_OF_INPUT
	                    mov                ax,P1_END_X
	                    mov                bx,P2_CUR_X
	                    sub                bx,ax
	                    cmp                bx,3
	                    jg                 END_OF_INPUT
	                    mov                ax, P1_CUR_Y
	                    mov                bx, P2_END_Y
	                    sub                ax,bx
	                    cmp                ax,1
	                    jg                 END_OF_INPUT
	;hit happened
	                    sub                P2_HEALTH, 5
	                    CALL               P2_HEALTH_BAR
	                    jmp                END_OF_INPUT
		
	kick2:              
	                    mov                P2_state, State_Kicking
	                    mov                P2_state_count, Kicking_Counting
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y

	                    sub                P2_CUR_Y,5
	                    sub                P2_CUR_X,P2_difference
	                    DrawImage          kicking2W, kicking2H, kicking2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,kicking2W, kicking2H, P2_END_X, P2_END_Y

	                    cmp                P1_State,State_Barry
	                    je                 END_OF_INPUT
	                    mov                ax,P2_CUR_X
	                    mov                bx,P1_END_X
	                    sub                ax,bx
	                    cmp                ax,3
	                    jg                 END_OF_INPUT
	                    mov                ax, P1_END_Y
	                    mov                bx, P2_CUR_Y
	                    sub                bx,ax
	                    cmp                bx,1
	                    jg                 END_OF_INPUT
	;hit happened
	                    sub                P1_HEALTH, 5

	                    CALL               P1_HEALTH_BAR
            
	                    jmp                END_OF_INPUT



	fireee1:            
	                    mov                ax, P1_END_X
	                    mov                bx, P2_CUR_X
	                    sub                bx,ax
	                    cmp                bx,100
	                    jle                END_OF_INPUT
					 
	                    cmp                Ball1_State, State_BallMoving
	                    je                 END_OF_INPUT
	                    mov                P1_state, State_Fire
	                    mov                P1_state_count, Fire_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          fireW, fireH, fire, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,fireW, fireH, P1_END_X, P1_END_Y
	                    mov                ax,P1_CUR_X
	                    mov                startball1X,ax
	                    add                startball1X, fireW
	                    mov                ax,P1_CUR_Y
	                    mov                startball1Y,ax
	                    add                startball1Y, 11
	                    DrawImage          ballW, ballH, ball, startball1X, startball1Y
	                    mov                Ball1_State, State_BallMoving
	                    jmp                END_OF_INPUT

		
	fireee2:            
	                    mov                ax, P2_CUR_X
	                    mov                bx, P1_END_X
	                    sub                ax,bx
	                    cmp                ax,100
	                    jle                END_OF_INPUT
					 
	                    cmp                Ball2_State, State_BallMoving
	                    je                 END_OF_INPUT
	                    mov                P2_state, State_Fire
	                    mov                P2_state_count, Fire_Counting
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	;  MOV_MEM        P2_Calculated_X, P2_CUR_X
	;  sub            P2_Calculated_X, 10
	                    sub                P2_CUR_X,10
	                    DrawImage          fire2W, fire2H, fire2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,fire2W, fire2H, P2_END_X, P2_END_Y
	                    mov                ax,P2_CUR_X
	                    mov                startball2X,ax
	                    sub                startball2X, ball2W
	                    mov                ax,P2_CUR_Y
	                    mov                startball2Y,ax
	                    add                startball2Y, 11
	                    DrawImage          ball2W, ball2H, ball2, startball2X, startball2Y
	                    mov                Ball2_State, State_BallMoving
	                    jmp                END_OF_INPUT


	barrry1:            
	                    mov                P1_state, State_Barry
	                    mov                P1_state_count, Barry_Counting
	                    ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          barryW, barryH, barry, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,barryW, barryH, P1_END_X, P1_END_Y
	                    jmp                END_OF_INPUT

		
	barrry2:            
	                    mov                P2_state, State_Barry
	                    mov                P2_state_count, Barry_Counting
	                    ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                    DrawImage          barry2W, barry2H, barry2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,barry2W, barry2H, P2_END_X, P2_END_Y
	                    jmp                END_OF_INPUT

	END_OF_INPUT:       
	;draw POWER UPS
	                    INC                powerup_counter
	                    CMP                powerup_counter,powerup_rate
	                    JNZ                TASKS
					
	                    MOV                powerup_counter,0
	                    INC                POW_UP_TO_MAKE
	                    CMP                POW_UP_TO_MAKE,POWERUPS_STATES_NUM
	                    JNZ                LBL1
	                    MOV                POW_UP_TO_MAKE,1
	LBL1:               
	                    ADD                cur_pow_up_x_OFST,2
	                    ADD                cur_pow_up_y_OFST,2
	                    ADD                COUNTER1,2
	                    ADD                COUNTER2,2
	                    MOV                AX,OFFSET powerup_y
	                    CMP                cur_pow_up_x_OFST,AX
	                    JNE                LBL2
	                    MOV_MEM            cur_pow_up_x_OFST,OFFSET powerup_x
	                    MOV_MEM            cur_pow_up_y_OFST,OFFSET powerup_y
	                    MOV                COUNTER1,0
	                    MOV                COUNTER2,0

	LBL2:               
	                    CMP                POW_UP_TO_MAKE,State_heart
	                    JNZ                LBL3
	                    MOV                BX,COUNTER1
	                    MOV_MEM            tempw1,powerup_x[BX]
	                    MOV_MEM            tempw2,powerup_y[BX]

	                    DrawImage          heartW, heartH, heart, tempw1,tempw2
	                    MOV                pow_up_state_array[BX],State_heart
	                    JMP                TASKS
	LBL3:               
	                    CMP                POW_UP_TO_MAKE,State_coin
	                    JNZ                LBL4
	                    MOV                BX,COUNTER1
	                    MOV_MEM            tempw1,powerup_x[BX]
	                    MOV_MEM            tempw2,powerup_y[BX]
	                    DrawImage          coinW, coinH, coin, tempw1,tempw2
	                    MOV                pow_up_state_array[BX],State_coin
	                    JMP                TASKS
	LBL4:               
	                    CMP                POW_UP_TO_MAKE,State_fire_power
	                    JNZ                LBL5
	                    MOV                BX,COUNTER1
	                    MOV_MEM            tempw1,powerup_x[BX]
	                    MOV_MEM            tempw2,powerup_y[BX]
	                    DrawImage          firepowerW, firepowerH, firepower, tempw1,tempw2
	                    MOV                pow_up_state_array[BX],State_fire_power
	                    JMP                TASKS
	LBL5:               
	TASKS:              
	                    Check_power_up     P2
	                    Check_power_up     P1
	                    CALL               CONTINUE_TASKS
	                    JMP                Forever
	ENDPROGRAM:         
	
MAIN ENDP




CONTINUE_TASKS PROC

	                    call               CalculateFactor

	                    cmp                P1_state, State_Kicking
	                    jne                L2
	                    call               UpdateP1Kicking

	L2:                 
	                    cmp                P1_state, State_Boxing
	                    jne                L3
	                    call               UpdateP1Boxing

	L3:                 
	                    cmp                P1_state, State_Fire
	                    jne                L4
	                    call               UpdateP1Fireing

	L4:                 
	                    cmp                P1_state, State_Barry
	                    jne                L5
	                    call               UpdateP1Barry

	L5:                 
	                    cmp                P2_state, State_Kicking
	                    jne                L6
	                    call               UpdateP2Kicking

	L6:                 
	                    cmp                P2_state, State_Boxing
	                    jne                L7
	                    call               UpdateP2Boxing

	L7:                 
	                    cmp                P2_state, State_Fire
	                    jne                L8
	                    call               UpdateP2Fireing

	L8:                 
	                    cmp                Ball1_State, State_BallMoving
	                    jne                L9
	                    call               UpdateBall1

	L9:                 
	                    cmp                Ball2_State, State_BallMoving
	                    jne                L10
	                    call               UpdateBall2

	L10:                
	                    cmp                P2_state, State_Barry
	                    jne                L11
	                    call               UpdateP2Barry
    
	L11:                cmp                P2_state, State_Left
	                    jne                L12
	                    call               UpdateP2Left

	L12:                cmp                P2_state, State_Right
	                    jne                L13
	                    call               UpdateP2Right

	L13:                cmp                P2_state, State_Jump_Up
	                    jne                L14
	                    call               UpdateP2JumpUp

	L14:                cmp                P2_state, State_Jump_Down
	                    jne                L15
	                    call               UpdateP2JumpDown

	L15:                cmp                P1_state, State_Left
	                    jne                L16
	                    call               UpdateP1Left

	L16:                cmp                P1_state, State_Right
	                    jne                L17
	                    call               UpdateP1Right

	L17:                cmp                P1_state, State_Jump_Up
	                    jne                L18
	                    call               UpdateP1JumpUp

	L18:                cmp                P1_state, State_Jump_Down
	                    jne                L19
	                    call               UpdateP1JumpDown

	L19:                
	                    call               delay
	                    RET
CONTINUE_TASKS ENDP

UpdateP1Kicking PROC
	                    sub                P1_state_count, 1
	                    cmp                P1_state_count, 0
	                    jne                endfunc
	                    ClearImage         kickingW, kickingH, P1_CUR_X,P1_CUR_Y
	                    add                P1_CUR_Y,5
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    mov                P1_state, State_Standing
						call P2_REDRAW
	endfunc:            
	                    RET
UpdateP1Kicking ENDP

UpdateP1Boxing PROC
	                    sub                P1_state_count, 1
	                    cmp                P1_state_count, 0
	                    jne                endfunc
	                    ClearImage         boxingW, boxingH, P1_CUR_X,P1_CUR_Y
	                    add                P1_CUR_Y,2
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    mov                P1_state, State_Standing
						call P2_REDRAW
	endfunc:            
	                    RET
UpdateP1Boxing ENDP
 
UpdateP1Fireing PROC
	                    sub                P1_state_count, 1
	                    cmp                P1_state_count, 0
	                    jne                endfunc
	                    ClearImage         fireW, fireH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    mov                P1_state, State_Standing
	endfunc:            
	                    RET
UpdateP1Fireing ENDP

UpdateP1Barry PROC
	                    sub                P1_state_count, 1
	                    cmp                P1_state_count, 0
	                    jne                endfunc
	                    ClearImage         barryW, barryH, P1_CUR_X,P1_CUR_Y
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    mov                P1_state, State_Standing
	endfunc:            
	                    RET
UpdateP1Barry ENDP

UpdateP2Kicking PROC
	                    sub                P2_state_count, 1
	                    cmp                P2_state_count, 0
	                    jne                endfunc
	                    ClearImage         kicking2W, kicking2H, P2_CUR_X,P2_CUR_Y
	                    ADD                P2_CUR_X,P2_difference
	                    add                P2_CUR_Y,5
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    mov                P2_state, State_Standing
						call P1_REDRAW
	endfunc:            
	                    RET
UpdateP2Kicking ENDP

UpdateP2Boxing PROC
	                    sub                P2_state_count, 1
	                    cmp                P2_state_count, 0
	                    jne                endfunc
	                    ClearImage         boxing2W, boxing2H,P2_CUR_X,P2_CUR_Y
	                    ADD                P2_CUR_X,P2_difference
	                    add                P2_CUR_Y,2
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X ,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    mov                P2_state, State_Standing
						call P1_REDRAW
	endfunc:            
	                    RET
UpdateP2Boxing ENDP
 
UpdateP2Fireing PROC
	                    sub                P2_state_count, 1
	                    cmp                P2_state_count, 0
	                    jne                endfunc
	                    ClearImage         fire2W, fire2H, P2_CUR_X,P2_CUR_Y
	                    ADD                P2_CUR_X,10
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    mov                P2_state, State_Standing
	endfunc:            
	                    RET
UpdateP2Fireing ENDP

UpdateP2Barry PROC
	                    sub                P2_state_count, 1
	                    cmp                P2_state_count, 0
	                    jne                endfunc
	                    ClearImage         barry2W, barry2H, P2_CUR_X,P2_CUR_Y
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    mov                P2_state, State_Standing
	endfunc:            
	                    RET
UpdateP2Barry ENDP

UpdateBall1 PROC
	                    ClearImage         ballW,ballH,startball1X,startball1Y

	                    cmp                Ball2_State,State_BallMoving
	                    jne                Check_for_P2_Y
	                    mov                ax, startball1X
	                    add                ax, ballW
	                    mov                bx, startball2x
	                    sub                bx,ax
	                    cmp                bx,5
	                    jle                ClearBothBalls

	Check_for_P2_Y:     
	                    mov                ax, P2_END_Y
	                    mov                bx, startball1Y
	                    sub                bx,ax
	                    cmp                bx,5
	                    jle                Check_for_P2_X
	                    jmp                continue
					
	Check_for_P2_X:     
	                    mov                ax, startball1X
	                    add                ax, ballW
	                    mov                bx, P2_CUR_X
	                    sub                bx,ax
	                    cmp                bx,5
	                    jg                 continue
	                    mov                ax,startball1X
	                    mov                bx,P2_END_X
	                    sub                ax,bx
	                    cmp                ax,5
	                    jg                 continue
	;hit happened
	                    sub                P2_HEALTH, 10

	                    CALL               P2_HEALTH_BAR
             
	                    jmp                ClearBall
	continue:           
	                    mov                bx, GraphEnd
	                    mov                ax, startball1X
	                    add                ax, ballW
	                    sub                bx,ax
	                    cmp                bx,3
	                    jle                ClearBall
					
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    add                startball1X,ax
	                    DrawImage          ballW, ballH, ball, startball1X, startball1Y
	                    RET

	ClearBall:          
	                    mov                Ball1_State,State_NoBall
	                    RET

	ClearBothBalls:     
	                    mov                Ball1_State,State_NoBall
	                    mov                Ball2_State,State_NoBall
	                    ClearImage         ball2W,ball2H,startball2X,startball2Y
	                    RET
UpdateBall1 ENDP

UpdateBall2 PROC
	                    ClearImage         ball2W,ball2H,startball2X,startball2Y
	Check_for_P1_Y:     
	                    mov                ax,P1_END_Y
	                    mov                bx, startball2Y
	                    sub                bx,ax
	                    cmp                bx,5
	                    jle                Check_for_P1_X
	                    jmp                continue

	Check_for_P1_X:     
	                    mov                ax, startball2X
	                    Mov                bx,P1_END_X
	                    sub                ax,bx
	                    cmp                ax,3
	                    jg                 continue
	                    mov                ax,startball2X
	                    add                ax, ball2W
	                    mov                bx, P1_CUR_X
	                    sub                bx, ax
	                    cmp                bx,3
	                    jg                 continue
	;hit happened
	                    sub                P1_HEALTH,10

	                    CALL               P1_HEALTH_BAR
           
	                    jmp                ClearBall

	continue:           
					 
	                    mov                ax, GraphBegin
	                    mov                bx, startball2X
	                    sub                bx,ax
	                    cmp                bx,3
	                    jle                ClearBall

	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                startball2X,ax
	                    DrawImage          ball2W, ball2H, ball2, startball2X, startball2Y
	                    RET

	ClearBall:          
	                    mov                Ball2_State,State_NoBall
	                    RET
UpdateBall2 ENDP


UpdateP2Left PROC
	;  ClearImage moving2W,moving2H,P2_CUR_X,P2_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P2_state_count, ax
	                    cmp                P2_state_count, 0
	                    jle                endfunc
	;cmp
	                    mov                ax, P2_CUR_X
	                    mov                BX,P1_END_X
	                    sub                ax,bx
	                    cmp                ax,3
	                    jle                endfunc
					
	                    mov                al,2
	                    mul                MovingFactor
	                    sub                P2_CUR_X,ax
	;clear some px
	                    MOV_MEM            tempw1,P2_CUR_X
	                    ADD_MEM            tempw1,moving2W
	                    MOV                tempw2,AX
	                    ClearImage         tempw2,moving2H,tempw1,P2_CUR_Y

	                    DrawImage          moving2W, moving2H, moving2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,moving2W, moving2H, P2_END_X, P2_END_Y
	                    RET

	endfunc:            
	                    ClearImage         moving2W,moving2H,P2_CUR_X,P2_CUR_Y
	                    mov                P2_state,State_Standing
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    RET
UpdateP2Left ENDP

UpdateP1Left PROC
	                    ClearImage         backW,backH,P1_CUR_X,P1_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P1_state_count, ax
	                    cmp                P1_state_count, 0
	                    jle                endfunc
		
	                    mov                bx, GraphBegin
	                    mov                ax,P1_CUR_X
	                    sub                ax,bx
	                    cmp                ax,3
	                    jle                endfunc

					
	                    mov                al,2
	                    mul                MovingFactor
	                    sub                P1_CUR_X,ax
	                    DrawImage          backW, backH, back, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,backW, backH, P1_END_X, P1_END_Y

	                    RET

	endfunc:            
	                    mov                P1_state,State_Standing
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    RET
UpdateP1Left ENDP

UpdateP2Right PROC
	                    ClearImage         back2W,back2H,P2_CUR_X,P2_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P2_state_count, ax
	                    cmp                P2_state_count, 0
	                    jle                endfunc
	;cmp
	                    mov                bx, GraphEnd
	                    mov                ax,P2_CUR_X
	                    add                ax, back2W
	                    sub                bx,ax
	                    cmp                bx,3
	                    jle                endfunc

	                    mov                al,2
	                    mul                MovingFactor
	                    add                P2_CUR_X,ax
	                    DrawImage          back2W, back2H, back2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,backW, backH, P2_END_X, P2_END_Y

	                    RET

	endfunc:            
	                    mov                P2_state,State_Standing
					 
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    RET
UpdateP2Right ENDP
UpdateP1Right PROC
	                    ClearImage         movingW,movingH,P1_CUR_X,P1_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P1_state_count, ax
	                    cmp                P1_state_count, 0
	                    jle                endfunc
	;cmp
	                    mov                ax, P2_CUR_X
	                    MOV                bx,P1_END_X
	                    sub                ax,bx
	                    cmp                ax,3
	                    jle                endfunc

	                    mov                al,2
	                    mul                MovingFactor
	                    add                P1_CUR_X,ax
	                    DrawImage          movingW, movingH, moving, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,movingW, movingH, P1_END_X, P1_END_Y
	                    RET

	endfunc:            
	                    mov                P1_state,State_Standing
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    RET
UpdateP1Right ENDP
UpdateP2JumpUp PROC
	                    ClearImage         jump2W,jump2H,P2_CUR_X,P2_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P2_state_count, ax
	                    cmp                P2_state_count, 0
	                    jle                endfunc
                     
	                    mov                al,1
	                    mul                MovingFactor
	                    sub                P2_CUR_Y,ax
	                    DrawImage          Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,Jump2W, Jump2H, P2_END_X, P2_END_Y
	                    RET
	endfunc:            
	                    mov                P2_state,State_Jump_Down
	                    DrawImage          Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,Jump2W, Jump2H, P2_END_X, P2_END_Y
	                    mov                P2_state_count, JumpDown_Counting
	                    RET
UpdateP2JumpUp ENDP
UpdateP1JumpUp PROC
	                    ClearImage         jumpW,jumpH,P1_CUR_X,P1_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P1_state_count, ax
	                    cmp                P1_state_count, 0
	                    jle                endfunc
                     
	                    mov                al,1
	                    mul                MovingFactor
	                    sub                P1_CUR_Y,ax
	                    DrawImage          JumpW, JumpH, Jump, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,JumpW, JumpH, P1_END_X, P1_END_Y
	                    RET
	endfunc:            
	                    mov                P1_state,State_Jump_Down
	                    DrawImage          JumpW, JumpH, Jump, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,JumpW, JumpH, P1_END_X, P1_END_Y
	                    mov                P1_state_count, JumpDown_Counting
	                    RET
UpdateP1JumpUp ENDP

UpdateP2JumpDown PROC
	                    ClearImage         jump2W,jump2H,P2_CUR_X,P2_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P2_state_count, ax
	                    cmp                P2_state_count, 0
	                    jle                endfunc
                     
	                    mov                al,1
	                    mul                MovingFactor
	                    add                P2_CUR_Y,ax
	                    DrawImage          Jump2W, Jump2H, Jump2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,Jump2W, Jump2H, P2_END_X, P2_END_Y
	                    RET
	endfunc:            
	                    mov                P2_state,State_Standing
	                    mov                P2_CUR_Y, startY
	                    DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                    CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	                    RET
UpdateP2JumpDown ENDP

UpdateP1JumpDown PROC
	                    ClearImage         jumpW,jumpH,P1_CUR_X,P1_CUR_Y
	                    mov                al,MovingFactor
	                    mov                ah,0
	                    sub                P1_state_count, ax
	                    cmp                P1_state_count, 0
	                    jle                endfunc
                     
	                    mov                al,1
	                    mul                MovingFactor
	                    add                P1_CUR_Y,ax
	                    DrawImage          JumpW, JumpH, Jump, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,JumpW, JumpH, P1_END_X, P1_END_Y
	                    RET
	endfunc:            
	                    mov                P1_state,State_Standing
	                    mov                P1_CUR_Y, startY
	                    DrawImage          standingW, standingH, standing, P1_CUR_X,P1_CUR_Y
	                    CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                    RET
UpdateP1JumpDown ENDP

CalculateFactor PROC
	                    mov                MovingFactor,1
	                    cmp                P1_State, State_Jump_Up
	                    jne                L2
	                    add                MovingFactor,4
	                    jmp                L5

	L2:                 
	                    cmp                P1_State, State_Jump_Down
	                    jne                L3
	                    add                MovingFactor,4
	                    jmp                L5

	L3:                 
	                    cmp                P1_State, State_Right
	                    jne                L4
	                    add                MovingFactor,4
	                    jmp                L5

	L4:                 
	                    cmp                P1_State, State_Left
	                    jne                L5
	                    add                MovingFactor,4

	L5:                 
	                    cmp                Ball1_State, State_BallMoving
	                    jne                L6
	                    add                MovingFactor,1

	L6:                 
	                    cmp                Ball2_State, State_BallMoving
	                    jne                L7
	                    add                MovingFactor,1
					
	L7:                 
	                    cmp                P2_State, State_Jump_Up
	                    jne                L8
	                    add                MovingFactor,4
	                    RET

	L8:                 
	                    cmp                P2_State, State_Jump_Down
	                    jne                L9
	                    add                MovingFactor,4
	                    RET

	L9:                 
	                    cmp                P2_State, State_Right
	                    jne                L10
	                    add                MovingFactor,4
	                    RET

	L10:                
	                    cmp                P2_State, State_Left
	                    jne                L11
	                    add                MovingFactor,4
					
	L11:                
	                    RET
CalculateFactor ENDP
FIRE_ME2 PROC
	                    MOV_MEM            tempw1,P2_CUR_Y
	                    sub                tempw1,15
	                    DrawImage          powerup2W,powerup2H,powerup2,P2_CUR_X,tempw1
	                    CALL               big_delay
	                    ClearImage         powerup2W,powerup2H,P2_CUR_X,tempw1
						DrawImage          standing2W, standing2H,standing2,P2_CUR_X,P2_CUR_Y
						Mov                P2_State,State_Standing
	                    RET
FIRE_ME2 ENDP
FIRE_ME1 PROC
	                    MOV_MEM            tempw1,P1_CUR_Y
	                    sub                tempw1,15
	                    DrawImage          powerupW,powerupH,powerup,P1_CUR_X,tempw1
	                    CALL               big_delay
	                    ClearImage         powerupW,powerupH,P1_CUR_X,tempw1
						DrawImage          standingW, standingH,standing,P1_CUR_X,P1_CUR_Y
						Mov                P1_State,State_Standing

	                    RET
FIRE_ME1 ENDP
P1_HEALTH_BAR PROC
	                    mov                ax,P1_HEALTH
	                    cmp                ax,100
	                    jle                checkdead
	                    mov                P1_HEALTH,100

	checkdead:          
	                    cmp                ax,0
	                    jg                 drawhealth1
	                    DeclareWinner
						

	drawhealth1:        
	                    ClearImage_Colored 100,10,57,35,RED
	                    ClearImage_Colored P1_HEALTH,10,57,35,light_green
	                    RET
P1_HEALTH_BAR ENDP
P2_HEALTH_BAR PROC

	                    mov                ax,P2_HEALTH
	                    cmp                ax,100
	                    jle                checkdead
	                    mov                P2_HEALTH,100

	checkdead:          
	                    cmp                ax,0
	                    jg                 drawhealth2
	                    DeclareWinner

	drawhealth2:        
	                    ClearImage_Colored 100,10,480,35,RED
	                    ClearImage_Colored P2_HEALTH,10,480,35,light_green
	                    RET
P2_HEALTH_BAR ENDP

P1_REDRAW PROC
	cmp P1_State,State_Standing
	jne L2
	DrawImage standingW,standingH,standing,P1_CUR_X,P1_CUR_Y
	RET 

	L2:
	cmp P1_State,State_Barry
	jne L3
	DrawImage barryW,barryH,barry,P1_CUR_X,P1_CUR_Y
	RET 

	L3:
	cmp P1_State,State_Kicking
	jne L4
	DrawImage kickingW,kickingH,kicking,P1_CUR_X,P1_CUR_Y
	RET

	L4: 
	cmp P1_State,State_Boxing
	jne L5
	DrawImage boxingW,boxingH,boxing,P1_CUR_X,P1_CUR_Y
	RET

	L5:
	cmp P1_State,State_Fire
	jne L6
	DrawImage fireW,fireH,fire,P1_CUR_X,P1_CUR_Y

	L6:
	RET 
	                 
P1_REDRAW ENDP

P2_REDRAW PROC


	cmp P2_State,State_Standing
	jne L2
	DrawImage standing2W,standing2H,standing2,P2_CUR_X,P2_CUR_Y
	RET 

	L2:
	cmp P2_State,State_Barry
	jne L3
	DrawImage barry2W,barry2H,barry2,P2_CUR_X,P2_CUR_Y
	RET 

	L3:
	cmp P2_State,State_Kicking
	jne L4
	DrawImage kicking2W,kicking2H,kicking2,P2_CUR_X,P2_CUR_Y
	RET

	L4: 
	cmp P2_State,State_Boxing
	jne L5
	DrawImage boxing2W,boxing2H,boxing2,P2_CUR_X,P2_CUR_Y
	RET

	L5:
	cmp P2_State,State_Fire
	jne L6
	DrawImage fire2W,fire2H,fire2,P2_CUR_X,P2_CUR_Y

	L6:
	RET 
P2_REDRAW ENDP






delay PROC
	                    MOV                CX, 0000H
	                    MOV                DX, 05DCH
	                    MOV                AH, 86H
	                    INT                15H
	                    RET
delay ENDP
big_delay proc
	                    MOV                CX, 000fH
	                    MOV                DX, 0ffDCH
	                    MOV                AH, 86H
	                    INT                15H
	                    RET
big_delay endp

END MAIN

