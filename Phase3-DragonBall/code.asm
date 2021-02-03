include drawing.inc
.model huge
.Stack 128
.data
	                      include images.inc

	
	SENDER                DB      'SENDER','$'
	RECIEVER              DB      'RECIEVER','$'
	CURSOR_ROW            DB      25
	CURSOR_COLUMN         DB      19
	
	PROGRAM_SCREEN        DB      '  ',0ah,0dh
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
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |   Please Enter Your Name Then Press Enter To      |',0ah,0dh
	                      DB      '               |                     Continue                      |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |    Name:                                          |',0ah,0dh
	                      DB      '               |-------------------------------------------------- |',0ah,0dh
	                      DB      '               |      Note: Player Name Must Not be Greater        |',0ah,0dh
	                      DB      '               |            Than 15 Characters                     |',0ah,0dh
	                      DB      '               |___________________________________________________|',0ah,0dh
	                      DB      '$',0ah,0dh


	MY_NAME_IN            DB      15 DUP(' ') ,'$'
	BUFFER1               DB      100 DUP(' '), '$'
	OTHER_NAME_IN         DB      15 DUP(' ') ,'$'
	BUFFER2               DB      100 DUP(' '), '$'

	MY_NAME               DB      15 DUP(' '),'$'
	OTHER_NAME            DB      15 DUP(' '),'$'

	PLAYER1_NAME          DB      15 DUP(' '), '$'
	BUFFER3               DB      100 DUP(' '), '$'
	PLAYER2_NAME          DB      15 DUP(' '), '$'

	PROGRAM_MODE          DB      ?

	MAINMENU_Message      db      'Program Mode:','$'

	MAIN_MENU             DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '        Program Mode:                                               ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '                ___________________________________________________ ',0ah,0dh
	                      DB      '               |                __________________                 |',0ah,0dh
	                      DB      '               |               |                  |                |',0ah,0dh
	                      DB      '               |               |    Dragon Ball   |                |',0ah,0dh
	                      DB      '               |               |__________________|                |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |           To Start Chatting Press F1              |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |           To Start Dragon Ball Press F2           |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |           To End The Program Pres ESC             |',0ah,0dh
	                      DB      '               |-------------------------------------------------- |',0ah,0dh
	                      DB      '               |      Note: No Input Vaild Except F1 , F2 , ESC    |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |___________________________________________________|',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      ' ------------------------------------------------------------------------------',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '$',0ah,0dh

	GAMELEVEL             DB      ?

	LevelScreen           DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '         Game Level:                                                ',0ah,0dh
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

	
	LevelScreen2           DB      '  ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      db      '         Game Level:                                                ',0ah,0dh
	                      db      '                                                                    ',0ah,0dh
	                      DB      '                ___________________________________________________ ',0ah,0dh
	                      DB      '               |                __________________                 |',0ah,0dh
	                      DB      '               |               |                  |                |',0ah,0dh
	                      DB      '               |               |    Dragon Ball   |                |',0ah,0dh
	                      DB      '               |               |__________________|                |',0ah,0dh
	                      DB      '               |---------------------------------------------------|',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |       Player 1 is currently selecting Level       |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |                                                   |',0ah,0dh
	                      DB      '               |-------------------------------------------------- |',0ah,0dh
	                      DB      '               |                    Please Wait                    |',0ah,0dh
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

	MY_CHAT_MESSAGE       DB      '- You Sent a Chat Invitaion To ','$'
	MY_Game_MESSAGE       DB      '- You Sent a Game Invitaion To ','$'
	
	OTHER_CHAT_MESSAGE1   DB      '- You Receive a Chat Invitaion From ','$'
	OTHER_CHAT_MESSAGE2   DB      '  TO Accept Press F1 ','$'

	OTHER_Game_MESSAGE1   DB      '- You Receive a Game Invitaion From ','$'
	OTHER_Game_MESSAGE2   DB      '  TO Accept Press F2 ','$'

	OTHER_CHAT_REFUSED    DB      '- Your Chat Invitation Refused By ','$'
	OTHER_GAME_REFUSED    DB      '- Your Game Invitation Refused By ','$'

	MY_CHAT_REFUSED       DB      '- You Refused Chat Invitation From ','$'
	MY_GAME_REFUSED       DB      '- You Refused Game Invitation From ','$'
	CLEAR_MASSAGE         DB      '                                   ','$'

	CURSOR1_ROW           DB      2H
	CURSOR1_COLUMN        DB      02H
	                                                                              	
	CURSOR2_ROW           DB      0FH
	CURSOR2_COLUMN        DB      02H
	
	SCAN_CHAT_CHK         DB      ?
	
	CHAT_EXIT             DB      '- To End Chatting Press F3','$'
	CHAT_BAR              DB      '--------------------------------------------------------------------------------','$'
    
	PLAYER1_NAME_REVERSED db      15 dup(' ')
	PLAYER2_NAME_REVERSED db      15 dup(' ')

	SCROLL_VALUE11        DB      06H
	SCROLL_VALUE12        DB      0AH
	SCROLL_VALUE21        DB      19
	SCROLL_VALUE22        DB      23

	PLAYER2_NAME_OFFSET   DW      ?
	

	PLAYER_CONT           DB      ?

	VALUE                 DB      ?


	COUNTER_PRINTNAME     DB      ?

	start1X               equ     50
	startY                equ     195
	start2X               equ     550
	
	GROUND_Y              equ     250

	P2_difference         equ     20

	P1_CUR_X              DW      start1X
	P1_CUR_Y              DW      startY
	P2_CUR_X              DW      start2X
	P2_CUR_Y              DW      startY
	P1_state              db      0
	P2_state              db      0
	P1_HEALTH             db      100
	P2_HEALTH             db      100

	P2_Calculated_X       DW      ?
		
	P1_END_X              DW      ?
	P1_END_Y              DW      ?

	P2_END_X              DW      ?
	P2_END_Y              DW      ?

	
	startball1X           DW      0
	startball1Y           DW      0
	startball2X           DW      0
	startball2Y           DW      0

	P2_LEFT_ARROW         equ     4BH
	P2_RIGHT_ARROW        equ     4DH
	P2_UP_ARROW           equ     48H
	
	;PLAYER1
	P1_LEFT_ARROW         equ     4BH
	P1_RIGHT_ARROW        equ     4DH
	P1_UP_ARROW           equ     48H

	P2_BOX                equ     'z'
	P2_KICK               equ     'x'
	P2_FIRE               equ     'c'
	P2_BARRY              equ     'v'

	P1_BOX                equ     'z'
	P1_KICK               equ     'x'
	P1_FIRE               equ     'c'
	P1_BARRY              equ     'v'

	

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


	tempw1                dw      ?
	tempw2                dw      ?

	P1                    EQU     1
	P2                    EQU     2

	powerup_x             dw      75,100,80,400,500,200,300,70,85,10,600
	powerup_y             dw      11 dup(220)                                                                              	;,150,150,150,150,150,150,150,150,150,150
	;calculate ending using the code: x+22, y+22

	;states array
	pow_up_state_array    dw      0,0,0,0,0,0,0,0,0,0,0
	
	powerup_counter       dw      0                                                                                        	; AFTER A NUMBER OF LOOPS, A NEW POWERUP SHOULD APPEAR
	powerup_rate          equ     5000
	cur_pow_up_x_OFST     dw      0
	cur_pow_up_y_OFST     dw      0                                                                                        	;BOTH INCREASE EVERY UPDATE TO POINT TO ARRAY ELEMENT
	
	POWERUPS_STATES_NUM   db      4                                                                                        	; NUMBER OF STATES

	State_no_powerup      EQU     0
	State_heart           EQU     1
	State_coin            EQU     2
	State_fire_power      EQU     3
	BOOL_no_powerup       DB      0
	BOOL_heart            DB      0
	BOOL_coin             DB      0
	BOOL_fire_power       DB      0

	CUR_POW_UP_STATE      DB      State_no_powerup                                                                         	;CURRENT STATE
	PREV_POW_UP           DB      State_no_powerup                                                                         	;PREVIOUS STATE
	POW_UP_TO_MAKE        DB      State_heart
	; State_cola        EQU      4
	; State_cake        EQU      5

	HEART_HEALTH          EQU     20
	COIN_HEALTH           EQU     10
	                                                                            
	COUNTER1              DW      0
	COUNTER2              DW      0

	BOOL_GAME_ENDED       db      0
	
	tempvar               dw      0

	CurPlayerNum          db      P2
	OtherPlayerNum        db      P1

	P2Input               db      ?

	P1Input               db      ?
	
	BOOL_P1FirePower      db      0
	BOOL_P2FirePower      db      0
	;#in game chatting#
	CURSOR1               dw      1400h
	CURSOR2               dw      1427h
	VAL                   db      0


.CODE
MAIN PROC FAR
	                      mov                ax, @data
	                      mov                DS, ax

	;;;PORTS INITALIZATION
	                      PORTS

	BEGINNING:            
	;Display The Game Screen
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX,OFFSET PROGRAM_SCREEN                                    	; OFFset OF The Massage
	                      INT                21H

	                      MOV                SI , OFFSET MY_NAME_IN                                      	; PLAYER1_NAME OFFSET
	                      MOV                DI , OFFSET OTHER_NAME_IN                                   	; PLAYER2_NAME OFFSET

	;Check that Transmitter Holding Register is Empty
	AGAIN:                

	; Out Player_NAME Name
	; Set Cursor To Print Message OF Player_NAME
	                      MOV                DL, CURSOR_ROW                                              	; X Position
	                      MOV                DH, CURSOR_COLUMN                                           	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	;READ DATA
	                      MOV                AH,1                                                        	; INT READ CHAR IN NON WAIT MODE
	                      INT                16H

	                      JZ                 CHK                                                         	; IF NOT JMP TO CHK
	                      MOV                VALUE,al                                                    	; ELSE MOV ASCII OF CHAR TO VALUE

	;CHECK IF PRESS ENTER
	                      CMP                AH,28
	                      JZ                 Receiving_ONLY                                              	;IF TRUE JMP TO Receiving_ONLY

	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 CHK                                                         	;IF FALSE JMP TO CHK
	;$$
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	; WRITE
	                      MOV                AH,2                                                        	;INT DISPLAY CHAR
	                      MOV                DL,VALUE                                                    	; MOV CHAR
	                      INT                21H
	                      INC                CURSOR_ROW                                                  	; INCREASE POSITION

	; SAVING PLAYER NAME
	                      MOV                DL , VALUE                                                  	;
	                      MOV                [SI],DL                                                     	; SAVING MY NAME
	                      INC                SI

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA



	;Receiving a value
	;Check that Data is Ready
	CHK:                  
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1                                                      	; CHECK IF DATA IS READY
	                      JZ                 AGAIN                                                       	;Not Ready (This line may need to change)

	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                VALUE , al


	;CHECK IF PRESS ENTER
	                      CMP                VALUE,28
	                      JZ                 SENDING_ONLY                                                	;IF TRUE JMP TO Receiving_ONLY


	; SAVING OTHER PLAYER NAME
	                      MOV                DL ,VALUE
	                      MOV                [DI],DL
	                      INC                DI

	                      JMP                AGAIN


	SENDING_ONLY:         
	                      JMP                AGAIN_SENDING_ONLY
	Receiving_ONLY:       
    
	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      MOV                VALUE , AH

	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 Receiving_ONLY                                              	;IF FALSE JMP TO CHK
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA
 
	                      JMP                CHK_Receiving_ONLY


	AGAIN_SENDING_ONLY:   
	;######TRANSMIT DATA#####
	;SET CURSOR
	                      MOV                DL,CURSOR_ROW                                               	; ROW
	                      MOV                DH,CURSOR_COLUMN                                            	; COULMN
	                      MOV                AH,2                                                        	; INT SET CURSOR
	                      MOV                BH,0                                                        	;PAGE 0
	                      INT                10H

	;READ DATA
	                      MOV                AH,1                                                        	; INT READ CHAR IN NON WAIT MODE
	                      INT                16H

	                      JZ                 AGAIN_SENDING_ONLY                                          	; IF NOT JMP TO CHK
	                      MOV                VALUE,al                                                    	; ELSE MOV ASCII OF CHAR TO VALUE

	;CHECK IF PRESS ENTER
	                      CMP                AH,28
	                      JZ                 BEFORE_MAIN_MENU                                            	;IF TRUE JMP TO Receiving_ONLY

	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 AGAIN_SENDING_ONLY                                          	;IF FALSE JMP TO CHK
	;$$
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	; WRITE
	                      MOV                AH,2                                                        	;INT DISPLAY CHAR
	                      MOV                DL,VALUE                                                    	; MOV CHAR
	                      INT                21H
	                      INC                CURSOR_ROW                                                  	; INCREASE POSITION

	; SAVING PLAYER NAME
	                      MOV                DL , VALUE                                                  	;
	                      MOV                [SI],DL                                                     	; SAVING MY NAME
	                      INC                SI

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA

	                      JMP                AGAIN_SENDING_ONLY


	;Receiving a value
	;Check that Data is Ready
	CHK_Receiving_ONLY:   
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1                                                      	; CHECK IF DATA IS READY
	                      JZ                 CHK_Receiving_ONLY                                          	;Not Ready (This line may need to change)

	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                VALUE , al


	;CHECK IF PRESS ENTER
	                      CMP                VALUE,28
	                      JZ                 TO_MAIN_MENU                                                	;IF TRUE JMP TO Receiving_ONLY


	; SAVING OTHER PLAYER NAME
	                      MOV                DL ,VALUE
	                      MOV                [DI],DL
	                      INC                DI

	                      JMP                CHK_Receiving_ONLY
	

	BEFORE_MAIN_MENU:     

	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      MOV                VALUE , AH

	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 BEFORE_MAIN_MENU                                            	;IF FALSE JMP TO CHK
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA

	                      JMP                TO_MAIN_MENU



	;======================== MAIN MENU OF THE PROGRAM =============================

	TO_MAIN_MENU:         

	;CLEAR SCREEN
	                      MOV                AX, 0600H
	                      MOV                BH, 7
	                      MOV                CX, 0
	                      MOV                DX ,184FH
	                      INT                10H

	        
	                                         
	;FIX MY_NAME_IN
	                      MOV                CX,14
	                      MOV                SI,OFFSET MY_NAME_IN
	                      MOV                DI,OFFSET MY_NAME

	FIX_MY_NAME:          
	                      MOV                AX , [SI]
	                      MOV                [DI], AX
	                      INC                SI
	                      INC                DI
	                      LOOP               FIX_MY_NAME

	;FIX MY_NAME_IN
	                      MOV                CX,14
	                      MOV                SI,OFFSET OTHER_NAME_IN
	                      MOV                DI,OFFSET OTHER_NAME

	FIX_OTHER_NAME:       
	                      MOV                AX , [SI]
	                      MOV                [DI], AX
	                      INC                SI
	                      INC                DI
	                      LOOP               FIX_OTHER_NAME

	;Display The MAIN_MENU Screen
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                BH,0
	                      MOV                DX,OFFSET MAIN_MENU                                         	; OFFset OF The Massage
	                      INT                21H                                                         	;

	; Out MAIN_MENU MESSAGE
	
	SELECT_MODE:          

    
	AGAIN_MODE:           
	
	;READ DATA
	                      MOV                AH,1                                                        	; INT READ CHAR IN NON WAIT MODE
	                      INT                16H

	                      JZ                 CHK_MODE                                                    	; IF NOT JMP TO CHK
	                      MOV                VALUE,AH                                                    	; ELSE MOV SCAN OF CHAR TO VALUE

	; CHECK IF KEY = F1 , F2 , ESC

	                      CMP                AH,3BH                                                      	;Check IF Key = F1
	                      JZ                 MY_CHATMODE
	                      CMP                AH,3CH                                                      	; Check IF Key = F2
	                      JZ                 MY_GAMEMODE_TEMP1
	                      CMP                Al,1BH                                                      	; Check IF Key = ESC
	                      JZ                 MY_ENDPRO
	                      JMP                CHK_MODE                                                    	; ELSE NOT F1 | F2 | ESC RETURN

	
	;Receiving a value
	;Check that Data is Ready
	CHK_MODE:             
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1                                                      	; CHECK IF DATA IS READY
	                      JZ                 AGAIN_MODE                                                  	;Not Ready (This line may need to change)

	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                VALUE , al

	; CHECK IF KEY = F1 , F2 , ESC

	                      CMP                VALUE,3BH                                                   	;Check IF Key = F1
	                      JZ                 OTHER_CHATMODE1
	                      CMP                VALUE,3CH                                                   	; Check IF Key = F2
	                      JZ                 OTHER_GAMEMODE_TEMP1
						  

	; ELSE NOT F1 | F2 RETURN

	                      JMP                AGAIN_MODE


	;======================== END PROGRAM =============================
	MY_ENDPRO:            
	                      MOV                PROGRAM_MODE, 2                                             	; PROGRAM_MODE = ESC
	                      MOV                AX, 0600H
	                      MOV                BH, 7
	                      MOV                CX, 0
	                      MOV                DX ,184FH
	                      INT                10H
	                      mov                ah, 4ch
	                      int                21h
	                      int                20h


	MY_GAMEMODE_TEMP1:                                                                                   	; TEMP JMP
	                      JMP                MY_GAMEMODE_TEMP
	OTHER_CHATMODE1:                                                                                     	; TEMP JMP
	                      JMP                OTHER_CHATMODE
	OTHER_GAMEMODE_TEMP1:                                                                                	; TEMP JMP
	                      JMP                OTHER_GAMEMODE_TEMP
	;======================== IF WANNA CHAT MODE =============================
	MY_CHATMODE:          

	;SEND F1 TO OTHER PLAYER
	CHK_MY_CHATMODE:      
	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	

	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 CHK_MY_CHATMODE                                             	;IF FALSE JMP TO CHK_MY_CHATMODE
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA

	; Set Cursor To Print MY_CHAT_MESSAGE
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 21                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h

	;Print MY_CHAT_MESSAGE Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  MY_CHAT_MESSAGE                                 	;OFFset OF The Massage
	                      INT                21H

	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H


	;   RECEIVING
	CHK_MY_CHATMODE2:     
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1                                                      	; CHECK IF DATA IS READY
	                      JZ                 CHK_MY_CHATMODE2                                            	;Not Ready (This line may need to change)

	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                VALUE , al
	                      CMP                VALUE,3BH                                                   	;Check IF Key = F1
	                      JZ                 CHATMODE_TEMP11

	; Set Cursor To Print OHTER_CHAT_REFUSED
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 23                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h

	;Print OHTER_CHAT_REFUSED Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET   OTHER_CHAT_REFUSED                             	;OFFset OF The Massage
	                      INT                21H

	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H

	; Set Cursor To Print CLEAR_MASSAGE Message
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 24                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	

	;Print CLEAR_MASSAGE Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  CLEAR_MASSAGE                                   	;OFFset OF The Massage
	                      INT                21H
				
						  
	                      JMP                AGAIN_MODE

	MY_GAMEMODE_TEMP:     
	                      JMP                MY_GAMEMODE                                                 	; TEMP JMP
	OTHER_GAMEMODE_TEMP:  
	                      JMP                OTHER_GAMEMODE                                              	; TEMP JMP

	OTHER_CHATMODE:       
	; Set Cursor To Print OTHER_CHAT_MESSAGE1 Message
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 23                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	;Print OTHER_CHAT_MESSAGE1 Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_CHAT_MESSAGE1                             	;OFFset OF The Massage
	                      INT                21H


	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H

	; Set Cursor To Print OTHER_CHAT_MESSAGE1 Message
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 24                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	

	;Print OTHER_CHAT_MESSAGE2 Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_CHAT_MESSAGE2                             	;OFFset OF The Massage
	                      INT                21H

	                      JMP                AGAIN_OTHER_CHAT_MODE


	CHATMODE_TEMP11:      
	                      JMP                CHATMODE_TEMP1

	AGAIN_OTHER_CHAT_MODE:

	;READ DATA
	                      MOV                AH,1                                                        	; INT READ CHAR IN NON WAIT MODE
	                      INT                16H

	                      JZ                 AGAIN_OTHER_CHAT_MODE                                       	; IF NOT JMP TO CHK
	                      MOV                VALUE,aH                                                    	; ELSE MOV ASCII OF CHAR TO VALUE

	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 AGAIN_OTHER_CHAT_MODE                                       	;IF FALSE JMP TO CHK
	;$$
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA

	                      CMP                VALUE,3BH
	                      JZ                 CHATMODE_TEMP1
						  
	; Set Cursor To Print CHAT_REFUSED
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 21                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h

	;Print CHAT_REFUSED Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  MY_CHAT_REFUSED                                 	;OFFset OF The Massage
	                      INT                21H

	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H

	;   CMP  VALUE,3CH
	;   JZ   MY_GAMEMODE

	                      JMP                AGAIN_MODE
	
	CHATMODE_TEMP1:       
	                      jmp                CHATMODE_TEMP                                               	;TEMP JMP
	;======================== IF WANNA GAME MODE =============================


	MY_GAMEMODE:          

	;SEND F1 TO OTHER PLAYER
	CHK_MY_GAMEMODE:      
	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	

	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 CHK_MY_GAMEMODE                                             	;IF FALSE JMP TO CHK_MY_GAMEMODE
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA

	; Set Cursor To Print MY_GAME_MESSAGE
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 21                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h

	;Print MY_GAME_MESSAGE Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  MY_GAME_MESSAGE                                 	;OFFset OF The Massage
	                      INT                21H

	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H


	;   RECEIVING
	CHK_MY_GAMEMODE2:     
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1                                                      	; CHECK IF DATA IS READY
	                      JZ                 CHK_MY_GAMEMODE2                                            	;Not Ready (This line may need to change)

	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                VALUE , al
	                      CMP                VALUE,3CH                                                   	;Check IF Key = F2
	                      JZ                 GAMEMODE_TEMP_A


	; Set Cursor To Print OHTER_GAME_REFUSED
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 23                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h

	;Print OHTER_GAME_REFUSED Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET OTHER_GAME_REFUSED                               	;OFFset OF The Massage
	                      INT                21H

	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H
					
	; Set Cursor To Print CLEAR_MASSAGE Message
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 24                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	

	;Print CLEAR_MASSAGE Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  CLEAR_MASSAGE                                   	;OFFset OF The Massage
	                      INT                21H


	                      JMP                AGAIN_MODE

	CHATMODE_TEMP:        
	                      JMP                CHATMODE                                                    	; TEMP JMP

	OTHER_GAMEMODE:       
	; Set Cursor To Print OTHER_GAME_MESSAGE1 Message
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 23                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	;Print OTHER_GAME_MESSAGE1 Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_GAME_MESSAGE1                             	;OFFset OF The Massage
	                      INT                21H


	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H

	; Set Cursor To Print OTHER_CHAT_MESSAGE1 Message
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 24                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h
	

	;Print OTHER_GAME_MESSAGE2 Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_GAME_MESSAGE2                             	;OFFset OF The Massage
	                      INT                21H
	
	                      JMP                AGAIN_OTHER_GAME_MODE
	GAMEMODE_TEMP_A:                                                                                     	;TEMP JMP
	                      JMP                MY_GAMEMODE_A

	AGAIN_OTHER_GAME_MODE:

	;READ DATA
	                      MOV                AH,1                                                        	; INT READ CHAR IN NON WAIT MODE
	                      INT                16H

	                      JZ                 AGAIN_OTHER_GAME_MODE                                       	; IF NOT JMP TO CHK
	                      MOV                VALUE,aH                                                    	; ELSE MOV ASCII OF CHAR TO VALUE

	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b                                              	;CHECK IF TRANSMITTER HOLDING REGISTER IS EMPTY
	                      JZ                 AGAIN_OTHER_GAME_MODE                                       	;IF FALSE JMP TO CHK
	;$$
	; CONSUME
	                      MOV                AH,0                                                        	; INT READ CHAR IN WAIT MODE
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al                                                     	;SEND DATA

	                      CMP                VALUE,3CH
	                      JZ                 GAMEMODE_TEMP1_B1

	; Set Cursor To Print MY_GAME_REFUSED
	                      MOV                DL, 0                                                       	; X Position
	                      MOV                DH, 21                                                      	; Y Position
	                      MOV                AH, 02h                                                     	; INT Set Cursor In Given Position
	                      int                10h

	;Print MY_GAME_REFUSED Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET   MY_GAME_REFUSED                                	;OFFset OF The Massage
	                      INT                21H

	;Print OTHER_NAME Message
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX, OFFSET  OTHER_NAME                                      	;OFFset OF The Massage
	                      INT                21H
					


				
						  
	;   CMP  VALUE,3BH
	;   JZ   MY_CHATMODE

	                      JMP                AGAIN_MODE

	GAMEMODE_TEMP1_B1:    
	                      JMP                GAMEMODE_TEMP1_B
	;======================== CHAT MODE =============================

	CHATMODE:             

	                      MOV                PROGRAM_MODE,0                                              	;SET PROGRAM MODE
	                      MOV                CURSOR1_ROW,02H                                             	;SET CURSOR1_ROW
	                      MOV                CURSOR1_COLUMN,02H                                          	;SET CURSOR1_COLUMN
	                                                                              	
	                      MOV                CURSOR2_ROW, 0FH                                            	;SET CURSOR2_ROW
	                      MOV                CURSOR2_COLUMN ,02H                                         	;SET CURSOR2_COLUMN

	;CLEAR SCREEN
	                      MOV                AX, 0600H                                                   	;INT CLEAR SCREEN
	                      MOV                BH, 7
	                      MOV                CX, 0
	                      MOV                DX ,184FH
	                      INT                10H

	
	;SET CURSOR TO WRITE NAME IN CHAT
	                      MOV                DH,0
	                      MOV                DL,0
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H
	
	                      mov                ah, 9
	                      mov                dx, offset MY_NAME                                          	;PRINT MY_NAME IN CHAT
	                      int                21h

	;SET CURSOR TO WRITE NAME IN CHAT
	                      MOV                DH,0CH
	                      MOV                DL,0
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H

	                      mov                ah, 9
	                      mov                dx, offset CHAT_BAR                                         	; PRINT CHAT_BAR
	                      int                21h

	                      mov                ah, 9
	                      mov                dx, offset OTHER_NAME                                       	; PRINT OTHER_NAME IN CHAT SCREEN
	                      int                21h

	;SET CURSOR TO WRITE EXIT IN CHAT
	                      MOV                DH,23
	                      MOV                DL,0
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H


	                      mov                ah, 9
	                      mov                dx, offset CHAT_BAR                                         	;PRINT CHAT BAR
	                      int                21h

	                      mov                ah, 9
	                      mov                dx, offset CHAT_EXIT                                        	; PRINT EXIT MESSAGE
	                      int                21h


	;#########
	                      JMP                AGAIN_C

	GAMEMODE_TEMP1_B:                                                                                    	;TEMP JMP
	                      JMP                OTHER_GAEMEMODE_B


	TO_MAIN_MENU_TEMP:                                                                                   	;TEMP JMP

	                      JMP                TO_MAIN_MENU


	;Check that Transmitter Holding Register is Empty
	AGAIN_C:              
	;######TRANSMIT DATA#####
	;SET CURSOR
	                      MOV                DH,CURSOR1_ROW
	                      MOV                DL,CURSOR1_COLUMN
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H

	;READ DATA
	                      MOV                AH,1
	                      INT                16H
	                      JZ                 CHK_C_TEMP
	                      MOV                VALUE,al
	                      MOV                SCAN_CHAT_CHK,AH
	;WRITE WHAT YOU READ
	;$$
	;CHECK TRANSMITION
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b
	                      JZ                 CHK_C_TEMP
	;$$
	; CONSUME
	                      MOV                AH,0
	                      INT                16H

	; CHECK IF F3
	                      CMP                SCAN_CHAT_CHK,3DH                                           	; IF PRESS F3
	                      JZ                 SEND_SCAN

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,VALUE
	                      out                dx , al
	                      JMP                SCAN_SEND
	CHK_C_TEMP:                                                                                          	; TEMP JMP
	                      JMP                CHK_C
						  
	SEND_SCAN:            

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,SCAN_CHAT_CHK
	                      out                dx , al
	SCAN_SEND:            
	; CHECK IF F3
	                      CMP                SCAN_CHAT_CHK,3DH                                           	; IF PRESS F3
	                      JZ                 TO_MAIN_MENU_TEMP                                           	; OUT TO MAIN MENU

	; WRITE
	                      MOV                AH,2
	                      MOV                DL,VALUE
	                      INT                21H
	                      INC                CURSOR1_COLUMN

	; COMPARE TO ORGANIZE CHAT
	                      CMP                CURSOR1_COLUMN,45H                                          	; IF PAGE END
	                      JZ                 INCREASE_ROW1                                               	; JMP TO NEXT ROW
	                      JMP                CONTINUE1                                                   	; IF NOT CONTINUE
	
	TO_MAIN_MENU_TEMP1:                                                                                  	; TEMP JMP
	                      JMP                TO_MAIN_MENU_TEMP
	AGAIN_C_TEMP:                                                                                        	; TEMP JMP
	                      JMP                AGAIN_C
						  
	INCREASE_ROW1:                                                                                       	;INCREASE ROW
	                      MOV                CURSOR1_COLUMN,02H                                          	;SET START COLUMN

	                      INC                CURSOR1_ROW                                                 	; INCREASE ROW
	                      INC                CURSOR1_ROW                                                 	; INCREASE ROW

	                      MOV                BH,SCROLL_VALUE11
	                      MOV                BL,SCROLL_VALUE12
	                      
	                      CMP                CURSOR1_ROW,BH                                              	;CHECK IF ROW IS MID OF PAGE
	                      JZ                 SCROLL11                                                    	;CHECK IF ROW IS MOD OF PAGE
	                      CMP                CURSOR1_ROW,BL                                              	;CHECK IF ROW IS END OF PAGE
	                      JZ                 SCROLL12                                                    	;CHECK IF ROW IS END OF PAGE
						 						  
	                      JMP                CONTINUE1                                                   	; AFTER INCREASING ROW , CONTINUE
	
	SCROLL11:                                                                                            	;=============================================================================================================
	                      mov                ax,0700h                                                    	;INT SCROLL DOWN
	                      mov                bh,07
	                      mov                cx,0600H                                                    	;FROM ROW 6 & COLUMN 0
	                      mov                dx,0A45H                                                    	;TO ROW 10 & COLUMN 45
	                      int                10h
	                      JMP                CONTINUE1                                                   	; JMP TO CONTINUE
						  
	SCROLL12:                                                                                            	;=============================================================================================================
	                      mov                ax,0700h                                                    	;INT SCROLL DOWN
	                      mov                bh,07
	                      mov                cx,0H                                                       	;FROM ROW 0 & COLUMN 0
	                      mov                dx,0445H                                                    	;TO ROW 4 & COLUMN 45
	                      int                10h
						  
	;SET CURSOR TO WRITE NAME IN CHAT
	                      MOV                DH,0                                                        	; X POSITION
	                      MOV                DL,0                                                        	; Y POSITION
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H
	
	                      mov                ah, 9
	                      mov                dx, offset MY_NAME                                          	; PRINT MY_NAME
	                      int                21h
	                      MOV                CURSOR1_ROW,02H                                             	; SET CUROSR_ROW
	                      MOV                CURSOR1_COLUMN,02H                                          	;SET CUROSR_COLUMN
						  
	                      
	CONTINUE1:            


	;Receiving a value

	;Check that Data is Ready
	CHK_C:                
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1
	                      JZ                 AGAIN_C_TEMP                                                	;Not Ready (This line may need to change)
	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                VALUE , al

	; CHECK IF F3
	                      CMP                VALUE,3DH                                                   	; IF PRESS F3
	                      JZ                 TO_MAIN_MENU_TEMP1                                          	; OUT TO MAIN MENU


	;SET CURSOR
	                      MOV                DH,CURSOR2_ROW
	                      MOV                DL,CURSOR2_COLUMN
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H
	;Write it
	                      MOV                AH,2
	                      MOV                DL,VALUE
	                      INT                21H

	                      INC                CURSOR2_COLUMN

	; COMPARE TO ORGANIZE CHAT
	                      CMP                CURSOR2_COLUMN,45H                                          	; IF PAGE END
	                      JZ                 INCREASE_ROW2                                               	; JMP TO NEXT ROW
	                      JMP                CONTINUE2                                                   	; IF NOT CONTINUE
	 
	INCREASE_ROW2:                                                                                       	;INCREASE ROW
	                      MOV                CURSOR2_COLUMN,02H                                          	;SET START COLUMN

	                      INC                CURSOR2_ROW                                                 	; INCREASE ROW
	                      INC                CURSOR2_ROW                                                 	; INCREASE ROW

	                      MOV                BH,SCROLL_VALUE21
	                      MOV                BL,SCROLL_VALUE22
	                      
	                      CMP                CURSOR2_ROW,BH                                              	;CHECK IF ROW IS MID OF PAGE
	                      JZ                 SCROLL21                                                    	;CHECK IF ROW IS MOD OF PAGE
	                      CMP                CURSOR2_ROW,BL                                              	;CHECK IF ROW IS END OF PAGE
	                      JZ                 SCROLL22                                                    	;CHECK IF ROW IS END OF PAGE
						 						  
	                      JMP                CONTINUE2                                                   	; AFTER INCREASING ROW , CONTINUE
	
	SCROLL21:                                                                                            	;=============================================================================================================
	                      mov                ax,0700h
	                      mov                bh,07
	                      mov                cx,1300H
	                      mov                dx,1545H
	                      int                10h
	                      JMP                CONTINUE2
						  
	SCROLL22:                                                                                            	;=============================================================================================================
	                      mov                ax,0700h                                                    	;INT SCROLL DOWN
	                      mov                bh,07
	                      mov                cx,0F00H                                                    	;FROM F & 0
	                      mov                dx,1145H                                                    	;TO 17 & 45
	                      int                10h
						  
	;SET CURSOR TO WRITE NAME IN CHAT
	                      MOV                DH,0CH                                                      	;ROW
	                      MOV                DL,0                                                        	;COLUMN
	                      MOV                AH,2
	                      MOV                BH,0
	                      INT                10H

	                      mov                ah, 9
	                      mov                dx, offset CHAT_BAR                                         	;PRINT CHAT_BAR
	                      int                21h

	                      mov                ah, 9
	                      mov                dx, offset OTHER_NAME                                       	;PRINT OTHER_NAME
	                      int                21h
	                      MOV                CURSOR2_ROW,0FH                                             	; SET CURSOR_ROW AT 15
	                      MOV                CURSOR2_COLUMN,02H                                          	; SET CURSOR_COLUMN AT 2
	CONTINUE2:            

	                      JMP                AGAIN_C

	;======================== GAME MODE =============================
	MY_GAMEMODE_A:        
	                      MOV                CurPlayerNum, P1
	                      MOV                PLAYER_CONT,1
	                      MOV                SI , OFFSET MY_NAME                                         	; SET ME AS CONT_PLAYER
	                      MOV                PLAYER2_NAME_OFFSET , OFFSET OTHER_NAME                     	;SET OTHER AS SECOND_PLAYER
	                      JMP                GAMEMODE
	OTHER_GAEMEMODE_B:    
	                      MOV                CurPlayerNum, P2
	                      MOV                PLAYER_CONT,2
	                      MOV                SI , OFFSET OTHER_NAME                                      	;SET OTHER AS CONT_PLAYER
	                      MOV                PLAYER2_NAME_OFFSET , OFFSET MY_NAME                        	;SET ME AS SECOND_PLAYER
	GAMEMODE:             

	                      MOV                PROGRAM_MODE,1                                              	;SET PROGRAM MODE

	;CLEAR SCREEN
	                      MOV                AX, 0600H
	                      MOV                BH, 7
	                      MOV                CX, 0
	                      MOV                DX ,184FH
	                      INT                10H

	                      MOV                CX ,15
	                      MOV                DI , OFFSET PLAYER1_NAME
	SET_PLAYER1_NAME:                                                                                    	; SAVING PLAYER1_NAME
	                      MOV                BX , [SI]
	                      MOV                [DI] , BX
	                      INC                SI
	                      INC                DI
	                      LOOP               SET_PLAYER1_NAME

	                      MOV                CX ,15
	                      MOV                SI ,AX
	                      MOV                DI , OFFSET PLAYER2_NAME
	                      MOV                SI , PLAYER2_NAME_OFFSET
	SET_PLAYER2_NAME:                                                                                    	; SAVING PLAYER2_NAME
	                      MOV                BX , [SI]
	                      MOV                [DI] , BX
	                      INC                SI
	                      INC                DI
	                      LOOP               SET_PLAYER2_NAME

	                      CMP                PLAYER_CONT,2                                               	; CHECK IF NO PLAYER_CONT
	                      JZ                 RecLevel                                                    	; JMP TO START_DRAGON_BALL
	SELECT_LEVEL:         
	;Display The SELECT LEVEL Screen
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX,OFFSET LevelScreen                                       	; OFFset OF The Massage
	                      INT                21H                                                         	;
            
	; USED TO GET LEVEL FROM THE PLAYER
	                      MOV                AH,0H                                                      	; INT Get key pressed & Wait for a key
	                      INT                16H
	                      CMP                AL,'1'                                                      	; Check IF Key = 1
	                      JZ                 LEVEL1
	                      CMP                AL,'2'                                                      	; Check IF Key = 2
	                      JZ                 LEVEL2
	                      JMP                SELECT_LEVEL                                                	; ELSE NOT 1|2 RETURN
	LEVEL1:               
	                      MOV                GAMELEVEL, 1                                                	; SET LEVEL = 1
	                      JMP                SendLevel
	LEVEL2:               
	                      MOV                GAMELEVEL, 2                                                	; SET LEVEL = 2
	                      JZ                 SendLevel

	SendLevel:            
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b
	                      JZ                 SendLevel
	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,GAMELEVEL
	                      out                dx , al
	                      JMP                START_DRAGON_BALL
	
	RecLevel:
						  ;Display The SELECT LEVEL Screen
	                      MOV                AH,09                                                       	; INT Display String
	                      MOV                DX,OFFSET LevelScreen2                                       	; OFFset OF The Massage
	                      INT                21H   

	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1
	                      JZ                 RecLevel
	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                GAMELEVEL,al



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
	                      MOV                SI , OFFSET PLAYER1_NAME+14                                 	; OFFSET OF LAST CHARACTER
	                      MOV                DI , OFFSET PLAYER1_NAME_REVERSED                           	; OFFSET OF REVERSED NAME
	                      MOV                DX,0                                                        	; COUNTER
    
	REVERSE1:             
	                      MOV                AL , [SI]                                                   	;  SWAP BETWEEN
	                      MOV                [DI] , AL                                                   	;  TWO VARIABLES
	                      DEC                SI                                                          	; DECREASE SI
	                      INC                DX                                                          	; INCREASE COUNTER
	                      INC                DI                                                          	; INCREASE SI
	                      CMP                DX , 15                                                     	; CHECK IF COUNTER = 7
	                      JNZ                REVERSE1                                                    	; IF NOT LOOP

	; REVERSE PLAYER2 NAME
	                      MOV                SI , OFFSET PLAYER2_NAME+14                                 	; OFFSET OF LAST CHARACTER
	                      MOV                DI , OFFSET PLAYER2_NAME_REVERSED                           	; OFFSET OF REVERSED NAME
	                      MOV                DX,0                                                        	; COUNTER
    
	REVERSE2:             
	                      MOV                AL , [SI]                                                   	;  SWAP BETWEEN
	                      MOV                [DI] , AL                                                   	;  TWO VARIABLES
	                      DEC                SI                                                          	; DECREASE SI
	                      INC                DX                                                          	; INCREASE COUNTER
	                      INC                DI                                                          	; INCREASE SI
	                      CMP                DX , 15                                                     	; CHECK IF COUNTER = 7
	                      JNZ                REVERSE2                                                    	; IF NOT LOOP

	; WRITE PLAYER 1 NAME IN HEALTH BAR
	;moving the cursor
	                      mov                dl,6                                                        	; X POSITION
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
	                      JNZ                DrawPLayer1Name                                             	; LOOP 7 TIMES
              
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
	                      CMP                SI , 15
	                      JZ                 DrawPLayer2NameEXIT
	                      DEC                CX
	                      JNZ                DrawPLayer2Name                                             	; LOOP 7 TIMES
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

	;draw both player
	                      DrawImage          standingW, standingH, standing, P1_CUR_X, P2_CUR_Y
	                      DrawImage          standing2W, standing2H, standing2, P2_CUR_X,P2_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,standingW, standingH, P1_END_X, P1_END_Y
	                      CalcDimensions     P2_CUR_X,P2_CUR_Y,standing2W, standing2H, P2_END_X, P2_END_Y
	;POWER UP INITIALIZATION
	                      cmp                GAMELEVEL,2
	                      jne                other
	                      mov                POWERUPS_STATES_NUM,4
	                      jmp                init
	other:                
	                      mov                POWERUPS_STATES_NUM,3

	init:                 
	                      MOV_MEM            cur_pow_up_x_OFST,OFFSET powerup_x
	                      MOV_MEM            cur_pow_up_y_OFST,OFFSET powerup_y

	;draw health bar
	                      ClearImage_Colored 102,12,56,34,15                                             	;white
	                      ClearImage_Colored 102,12,479,34,15                                            	;white
	                      ClearImage_Colored 100,10,57,35,light_green
	                      ClearImage_Colored 100,10,480,35,light_green

	;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;
	;;;Check Player 1 or 2 Loop;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Forever:              



	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	                      cmp                BOOL_GAME_ENDED,1
	                      je                 TO_MAIN_MENU
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;; Get movement from Player 1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	                      cmp                CurPlayerNum,1
	                      jne                otherp1input

	curp1input:           
	;take my input from keyboard
	                      MOV                AH,01H
	                      INT                16H                                                         	;ZF = 1 IF NO INPUT
	                      JZ                 getP2Input

	;;;; check button pressed is scan;;;;
	                      CMP                ah,P1_LEFT_ARROW
	                      jne                c2
	                      MOV                P1Input,ah
	                      jmp                trans

	c2:                   
	                      CMP                ah,P1_RIGHT_ARROW
	                      jne                c3
	                      MOV                P1Input,ah
	                      jmp                trans

	c3:                   
	                      CMP                ah,P1_UP_ARROW
	                      jne                c4
	                      MOV                P1Input,ah
	                      jmp                trans
					
	c4:                   
	                      CMP                AH,3BH
	                      JNZ                C5
	                      MOV                P1Input,'$'
	                      JMP                trans


	c5:                                                                                                  	;the button pressed is ascii
	                      MOV                P1Input,al
	trans:                
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b
	                      JZ                 getP2Input
	; CONSUME
	                      MOV                AH,0
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,P1Input
	                      out                dx , al

	                      CMP                P1Input,'$'
	                      JNZ                checkp1state
	                      in_game_chat
	                      jmp                Forever
    
	otherp1input:         
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1
	                      JZ                 getP2Input
	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                P1Input,al

	                      CMP                P1Input,'$'
	                      JNZ                checkp1state
	                      in_game_chat
	                      JMP                Forever

	;if player1 is not standing don't take input
	checkp1state:         

	                      cmp                P1_state, State_Left
	                      je                 Check_LeftP1

	                      cmp                P1_state, State_Right
	                      je                 Check_RightP1

	                      cmp                P1_state, State_Standing
	                      jne                getP2Input

	                      cmp                P1Input,P1_KICK
	                      je                 kick1

	                      cmp                P1Input,P1_BOX
	                      je                 box1

	                      cmp                P1Input,P1_FIRE
	                      je                 fireee1

	                      cmp                P1Input,P1_BARRY
	                      je                 barrry1

	                      cmp                P1Input,P1_UP_ARROW
	                      je                 p1_jump
	Check_LeftP1:         
	                      cmp                P1Input, P1_LEFT_ARROW
	                      je                 p1_left
	Check_RightP1:        
	                      cmp                P1_state, State_Left
	                      je                 getP2Input
	                      cmp                P1Input, P1_RIGHT_ARROW
	                      je                 p1_right

	                      jmp                getP2Input
	;;;;;;;;;;;;;;;;;;;PLAYER 1 ACTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;

	p1_left:              
	                      MOV                P1_state, State_Left
	                      MOV                P1_state_count, Left_Counting
	                      ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                      DrawImage          backW, backH, back, P1_CUR_X,P1_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,backW, backH, P1_END_X, P1_END_Y
	                      jmp                getP2Input

	p1_right:             
	                      MOV                P1_state, State_Right
	                      MOV                P1_state_count, Right_Counting
	                      ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                      DrawImage          movingW, movingH, moving, P1_CUR_X,P1_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,movingW, movingH, P1_END_X, P1_END_Y
	                      jmp                getp2input
	p1_jump:              
	                      MOV                P1_state, State_Jump_Up
	                      MOV                P1_state_count, JumpUp_Counting
	                      ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                      DrawImage          JumpW, JumpH, Jump, P1_CUR_X,P1_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,JumpW, JumpH, P1_END_X, P1_END_Y
	                      jmp                getp2input

	box1:                 
	                      mov                P1_state, State_Boxing
	                      mov                P1_state_count, Boxing_Counting
	                      ClearImage         standingW, standingH, P1_CUR_X, P1_CUR_Y
	                      sub                P1_CUR_Y,2
	                      DrawImage          boxingW, boxingH, boxing, P1_CUR_X,P1_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,boxingW, boxingH, P1_END_X, P1_END_Y

	;Check if it hit player1
	                      cmp                P2_State,State_Barry
	                      je                 getp2input
	                      mov                ax,P1_END_X
	                      mov                bx,P2_CUR_X
	                      sub                bx,ax
	                      cmp                bx,3
	                      jg                 getp2input
	                      mov                ax, P1_CUR_Y
	                      mov                bx, P2_END_Y
	                      sub                ax,bx
	                      cmp                ax,1
	                      jg                 getp2input
	;hit happened
	                      sub                P2_HEALTH, 5
	                      CALL               P2_HEALTH_BAR                                               	;white
	                      jmp                getp2input
		
	kick1:                
	                      mov                P1_state, State_Kicking
	                      mov                P1_state_count, Kicking_Counting
	                      ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                      sub                P1_CUR_Y,5
	                      DrawImage          kickingW, kickingH, kicking, P1_CUR_X,P1_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,kickingW, kickingH, P1_END_X, P1_END_Y
	;Check if it hit player2
	                      cmp                P2_State,State_Barry
	                      je                 getp2input
	                      mov                ax,P1_END_X
	                      mov                bx,P2_CUR_X
	                      sub                bx,ax
	                      cmp                bx,3
	                      jg                 getp2input
	                      mov                ax, P1_CUR_Y
	                      mov                bx, P2_END_Y
	                      sub                ax,bx
	                      cmp                ax,1
	                      jg                 getp2input
	;hit happened
	                      sub                P2_HEALTH, 5
	                      CALL               P2_HEALTH_BAR
	                      jmp                getp2input

	fireee1:              
	                      cmp                GAMELEVEL,2
	                      jne                getP2Input
	                      mov                ax, P1_END_X
	                      mov                bx, P2_CUR_X
	                      sub                bx,ax
	                      cmp                bx,100
	                      jle                getp2input
					 
	                      cmp                Ball1_State, State_BallMoving
	                      je                 getp2input
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
	                      jmp                getp2input
	barrry1:              
	                      mov                P1_state, State_Barry
	                      mov                P1_state_count, Barry_Counting
	                      ClearImage         standingW, standingH, P1_CUR_X,P1_CUR_Y
	                      DrawImage          barryW, barryH, barry, P1_CUR_X,P1_CUR_Y
	                      CalcDimensions     P1_CUR_X,P1_CUR_Y,barryW, barryH, P1_END_X, P1_END_Y
	                      jmp                getp2input

	getP2Input:           
	                      cmp                CurPlayerNum,2
	                      jne                otherp2input

	curp2input:           
	;take my input from keyboard
	                      MOV                AH,01H
	                      INT                16H                                                         	;ZF = 1 IF NO INPUT
	                      JZ                 END_OF_INPUT

	;;;; check button pressed is scan;;;;
	                      CMP                ah,P2_LEFT_ARROW
	                      jne                d2
	                      MOV                P2Input,ah
	                      jmp                trans2

	d2:                   
	                      CMP                ah,P2_RIGHT_ARROW
	                      jne                d3
	                      MOV                P2Input,ah
	                      jmp                trans2

	d3:                   
	                      CMP                ah,P2_UP_ARROW
	                      jne                d4
	                      MOV                P2Input,ah
	                      jmp                trans2

	d4:                   
	                      CMP                AH,3BH
	                      JNZ                d5
	                      MOV                P2Input,'$'
	                      JMP                trans2

	d5:                                                                                                  	;the button pressed is ascii
	                      MOV                P2Input,al
	trans2:               
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      In                 al , dx                                                     	;Read Line Status
	                      test               al , 00100000b
	                      JZ                 END_OF_INPUT
	; CONSUME
	                      MOV                AH,0
	                      INT                16H

	;If empty put the VALUE in Transmit data register
	                      mov                dx , 3F8H                                                   	; Transmit data register
	                      mov                al,P2Input
	                      out                dx , al

	                      CMP                P2Input,'$'
	                      JNZ                check_p2_state
	                      in_game_chat
	                      jmp                Forever
    
	otherp2input:         
	                      mov                dx , 3FDH                                                   	; Line Status Register
	                      in                 al , dx
	                      test               al , 1
	                      JZ                 END_OF_INPUT
	;If Ready read the VALUE in Receive data register
	                      mov                dx , 03F8H
	                      in                 al , dx
	                      mov                P2Input,al

	                      CMP                P2Input,'$'
	                      JNZ                check_p2_state
	                      in_game_chat
	                      JMP                Forever

	check_p2_state:       
	;;if player2 is not standing don't take input
	                      cmp                P2_state, State_Left
	                      je                 Check_LeftP2

	                      cmp                P2_state, State_Right
	                      je                 Check_RightP2

	                      cmp                P2_state, State_Standing
	                      jne                END_OF_INPUT

	                      cmp                P2Input,P2_KICK
	                      je                 kick2

	                      cmp                P2Input,P2_BOX
	                      je                 box2

	                      cmp                P2Input,P2_FIRE
	                      je                 fireee2

	                      cmp                P2Input,P2_BARRY
	                      je                 barrry2

	                      cmp                P2Input,P2_UP_ARROW
	                      je                 p2_jump
	Check_LeftP2:         
	                      cmp                P2Input, P2_LEFT_ARROW
	                      je                 p2_left
	Check_RightP2:        
	                      cmp                P2_state, State_Left
	                      je                 END_OF_INPUT
                    
	                      cmp                P2Input, P2_RIGHT_ARROW
	                      je                 p2_right
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



	

		
	fireee2:              
	                      cmp                GAMELEVEL,2
	                      jne                getP2Input
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

		
	barrry2:              
	                      mov                P2_state, State_Barry
	                      mov                P2_state_count, Barry_Counting
	                      ClearImage         standing2W, standing2H, P2_CUR_X,P2_CUR_Y
	                      DrawImage          barry2W, barry2H, barry2, P2_CUR_X,P2_CUR_Y
	                      CalcDimensions     P2_CUR_X,P2_CUR_Y,barry2W, barry2H, P2_END_X, P2_END_Y
	                      jmp                END_OF_INPUT

	
	
	
	
	END_OF_INPUT:                                                                                        	;;;;;;;;;;;PERFORM ACTIONS
	;draw POWER UPS
	                      INC                powerup_counter
	                      CMP                powerup_counter,powerup_rate
	                      JNZ                TASKS
					
	                      MOV                powerup_counter,0
	                      INC                POW_UP_TO_MAKE
	                      mov                al,POWERUPS_STATES_NUM
	                      CMP                POW_UP_TO_MAKE,al
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
    
	L11:                  cmp                P2_state, State_Left
	                      jne                L12
	                      call               UpdateP2Left

	L12:                  cmp                P2_state, State_Right
	                      jne                L13
	                      call               UpdateP2Right

	L13:                  cmp                P2_state, State_Jump_Up
	                      jne                L14
	                      call               UpdateP2JumpUp

	L14:                  cmp                P2_state, State_Jump_Down
	                      jne                L15
	                      call               UpdateP2JumpDown

	L15:                  cmp                P1_state, State_Left
	                      jne                L16
	                      call               UpdateP1Left

	L16:                  cmp                P1_state, State_Right
	                      jne                L17
	                      call               UpdateP1Right

	L17:                  cmp                P1_state, State_Jump_Up
	                      jne                L18
	                      call               UpdateP1JumpUp

	L18:                  cmp                P1_state, State_Jump_Down
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
	                      call               P2_REDRAW
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
	                      call               P2_REDRAW
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
	                      call               P1_REDRAW
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
	                      call               P1_REDRAW
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
	                      cmp                BOOL_P1FirePower,1
	                      jne                nofire
	                      sub                P2_HEALTH,30
	                      jmp                hithim

	nofire:               
	                      sub                P2_HEALTH,10

	hithim:               
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
	                      mov                BOOL_P1FirePower,0
	                      mov                Ball1_State,State_NoBall
	                      RET

	ClearBothBalls:       
	                      mov                BOOL_P1FirePower,0
	                      mov                BOOL_P2FirePower,0
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

	                      cmp                BOOL_P2FirePower,1
	                      jne                nofire
	                      sub                P1_HEALTH,30
	                      jmp                hithim

	nofire:               
	                      sub                P1_HEALTH,10

	hithim:               
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
	                      mov                BOOL_P2FirePower,0
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
	                      mov                al,P1_HEALTH
	                      cmp                al,100
	                      jle                checkdead
	                      mov                P1_HEALTH,100

	checkdead:            
	                      cmp                al,0
	                      jg                 drawhealth1
	                      DeclareWinner
						

	drawhealth1:          
	                      mov                cl,P1_HEALTH
	                      mov                ch,0
	                      mov                tempvar,cx
	                      ClearImage_Colored 100,10,57,35,RED
	                      ClearImage_Colored tempvar,10,57,35,light_green
	                      RET
P1_HEALTH_BAR ENDP
P2_HEALTH_BAR PROC

	                      mov                al,P2_HEALTH
	                      cmp                al,100
	                      jle                checkdead
	                      mov                P2_HEALTH,100

	checkdead:            
	                      cmp                al,0
	                      jg                 drawhealth2
	                      DeclareWinner

	drawhealth2:          
	                      mov                cl,P2_HEALTH
	                      mov                ch,0
	                      mov                tempvar,cx
	                      ClearImage_Colored 100,10,480,35,RED
	                      ClearImage_Colored tempvar,10,480,35,light_green
	                      RET
P2_HEALTH_BAR ENDP

P1_REDRAW PROC
	                      cmp                P1_State,State_Standing
	                      jne                L2
	                      DrawImage          standingW,standingH,standing,P1_CUR_X,P1_CUR_Y
	                      RET

	L2:                   
	                      cmp                P1_State,State_Barry
	                      jne                L3
	                      DrawImage          barryW,barryH,barry,P1_CUR_X,P1_CUR_Y
	                      RET

	L3:                   
	                      cmp                P1_State,State_Kicking
	                      jne                L4
	                      DrawImage          kickingW,kickingH,kicking,P1_CUR_X,P1_CUR_Y
	                      RET

	L4:                   
	                      cmp                P1_State,State_Boxing
	                      jne                L5
	                      DrawImage          boxingW,boxingH,boxing,P1_CUR_X,P1_CUR_Y
	                      RET

	L5:                   
	                      cmp                P1_State,State_Fire
	                      jne                L6
	                      DrawImage          fireW,fireH,fire,P1_CUR_X,P1_CUR_Y

	L6:                   
	                      RET
	                 
P1_REDRAW ENDP

P2_REDRAW PROC


	                      cmp                P2_State,State_Standing
	                      jne                L2
	                      DrawImage          standing2W,standing2H,standing2,P2_CUR_X,P2_CUR_Y
	                      RET

	L2:                   
	                      cmp                P2_State,State_Barry
	                      jne                L3
	                      DrawImage          barry2W,barry2H,barry2,P2_CUR_X,P2_CUR_Y
	                      RET

	L3:                   
	                      cmp                P2_State,State_Kicking
	                      jne                L4
	                      DrawImage          kicking2W,kicking2H,kicking2,P2_CUR_X,P2_CUR_Y
	                      RET

	L4:                   
	                      cmp                P2_State,State_Boxing
	                      jne                L5
	                      DrawImage          boxing2W,boxing2H,boxing2,P2_CUR_X,P2_CUR_Y
	                      RET

	L5:                   
	                      cmp                P2_State,State_Fire
	                      jne                L6
	                      DrawImage          fire2W,fire2H,fire2,P2_CUR_X,P2_CUR_Y

	L6:                   
	                      RET
P2_REDRAW ENDP



smalldelay PROC
	                      MOV                CX, 0000H
	                      MOV                DX, 03DCH
	                      MOV                AH, 86H
	                      INT                15H
	                      RET
smalldelay ENDP


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

