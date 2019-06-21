
INCLUDE Irvine32.inc
INCLUDE win32.inc

LENGTH_SCREEN = 168
HEIGHT_SCREEN = 44

;macro para inserir dados dos objetos desenhos na pilha pra inserir na matrz
pushObjectStack MACRO pDraw, xDraw, yDraw, colorDraw

	mov eax, offset pDraw
	push eax
	movzx eax, xDraw
	push eax
	movzx eax, yDraw
	push eax
	movzx eax, colorDraw
	push eax
ENDM

.DATA

	lengthScreen WORD 168
    heightScreen WORD 44

	position BYTE 0

		speedRacerLabel BYTE 88 DUP ("_"),10
						BYTE 88 DUP ("_"),10
						BYTE "__",4 DUP(0DBh),"___",5 DUP(0DBh),"___",6 DUP(0DBh),"__",6 DUP(0DBh),"__",5 DUP(0DBh),"___________",5 DUP(0DBh),"____",4 DUP(0DBh),"____",4 DUP(0DBh),"___",4 DUP(0DBh),0DBh,0DBh,"__",4 DUP(0DBh),0DBh,"__",10
						BYTE "_",0DBh,0DBh,"______",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"______",0DBh,0DBh,"______",0DBh,0DBh,"__",0DBh,0DBh
						BYTE "__________",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"______",0DBh,0DBh,"__",0DBh,0DBh,"_",10
						BYTE "__",4 DUP(0DBh),"___",4 DUP(0DBh),0DBh,"___",4 DUP(0DBh),"____",4 DUP(0DBh),"____",0DBh,0DBh,"__",0DBh,0DBh,"__________",4 DUP(0DBh),0DBh,"___",4 DUP(0DBh),0DBh,0DBh,"__",0DBh,0DBh,"______",4 DUP(0DBh),"____",4 DUP(0DBh),0DBh,"__",10
						BYTE "_____",0DBh,0DBh,"__",0DBh,0DBh,"______",0DBh,0DBh,"______",0DBh,0DBh,"______",0DBh,0DBh,"__",0DBh,0DBh,"__________",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"______",0DBh,0DBh,"__",0DBh,0DBh,"_",10
						BYTE "__",4 DUP(0DBh),"___",0DBh,0DBh,"______",6 DUP(0DBh),"__",6 DUP(0DBh),"__",5 DUP(0DBh),"___________",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"___",4 DUP(0DBh),"___",4 DUP(0DBh),0DBh,0DBh,"__",0DBh,0DBh,"__",0DBh,0DBh,"_",10
						BYTE 88 DUP ("_"),0
	
	xspeedRacerLabelPosition BYTE 40
	yspeedRacerLabelPosition BYTE 5
	speedRacerLabelColor BYTE 0Ch
	
	startLabel	byte 65 DUP(" "), " ",0dbh,0dbh,0dbh,0dbh,"   ",0dbh,0dbh,0dbh,0dbh,0dbh,0dbh,"   ",0dbh,0dbh,0dbh,0dbh,"   ",0dbh,0dbh,0dbh,0dbh,0dbh,"   ",0dbh,0dbh,0dbh,0dbh,0dbh,0dbh,65 DUP(" ")
				byte 65 DUP(" "),0dbh,0dbh,"        ",0dbh,0dbh,"    ",0dbh,0dbh,"  ",0dbh,0dbh,"  ",0dbh,0dbh,"  ",0dbh,0dbh,"    ",0dbh,0dbh,"  ",65 DUP(" ")
				byte 65 DUP(" ")," ",0dbh,0dbh,0dbh,0dbh,"     ",0dbh,0dbh,"    ",0dbh,0dbh,0dbh,0dbh,0dbh,0dbh,"  ",0dbh,0dbh,0dbh,0dbh,0dbh,"     ",0dbh,0dbh,"  ",65 DUP(" ")
				byte 65 DUP(" "),"    ",0dbh,0dbh,"    ",0dbh,0dbh,"    ",0dbh,0dbh,"  ",0dbh,0dbh,"  ",0dbh,0dbh,"  ",0dbh,0dbh,"    ",0dbh,0dbh,"  ",65 DUP(" ")
				byte 65 DUP(" ")," ",0dbh,0dbh,0dbh,0dbh,"     ",0dbh,0dbh,"    ",0dbh,0dbh,"  ",0dbh,0dbh,"  ",0dbh,0dbh,"  ",0dbh,0dbh,"    ",0dbh,0dbh,"  ",65 DUP(" "),0

	xstartLabelPosition BYTE 0
	ystartLabelPosition BYTE 18
	startLabelColor BYTE 2Fh

	exitLabel	byte 69 DUP(" "),0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh,"  ", 0dbh, 0dbh,"  ", 0dbh, 0dbh,"  " ,0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh,"  ", 0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh,69 DUP(" ") 
				byte 69 DUP(" "),0dbh, 0dbh,"       " ,0dbh, 0dbh, 0dbh, 0dbh,"     " ,0dbh, 0dbh,"      ", 0dbh, 0dbh,"  ",69 DUP(" ")
				byte 69 DUP(" "),0dbh, 0dbh, 0dbh, 0dbh,"      " ,0dbh, 0dbh,"      ", 0dbh, 0dbh,"      ", 0dbh, 0dbh,"  ",69 DUP(" ") 
				byte 69 DUP(" "),0dbh, 0dbh,"       " ,0dbh, 0dbh, 0dbh, 0dbh,"     ", 0dbh, 0dbh,"      " ,0dbh, 0dbh,"  ",69 DUP(" ") 
				byte 69 DUP(" "),0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh,"  ", 0dbh, 0dbh,"  ", 0dbh, 0dbh,"  ", 0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh,"    ", 0dbh, 0dbh,"  ",69 DUP(" "),0
			
	xexitLabelPosition BYTE 0
	yexitLabelPosition BYTE 26
	exitLabelColor BYTE 0Fh


console HANDLE 0
beforeBuffer CHAR_INFO 9 DUP(LENGTH_SCREEN DUP(<<" ">,0Fh>))
buffer CHAR_INFO LENGTH_SCREEN * HEIGHT_SCREEN DUP (<<'-'>, 0Fh>)
afterBuffer CHAR_INFO  2 DUP(LENGTH_SCREEN DUP(<<0>,0Fh>))
bufferSize COORD <LENGTH_SCREEN, HEIGHT_SCREEN>
bufferCoord COORD <0, 0>
region SMALL_RECT <0, 0, LENGTH_SCREEN-1, HEIGHT_SCREEN-1>

.CODE

main PROC
    call menu
exit
main ENDP

;-----------------------------------
;			menu PROC
;estado inicial do menu do jogo
;Entrada: Nada
;Saida: Nada
;Requer: Nada
;-----------------------------------

menu PROC

	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
    mov console, eax    ; save console handle

DRAW:
	call drawMenu

READ_PRESSED_KEY:
;verificar se precisa coloca delay entre as leituras
	
	mov  eax, 10; delay 1 sec
	call Delay

	call ReadKey
	jz READ_PRESSED_KEY
	
	cmp dx, VK_DOWN
	je ADD_POSITION
	
	cmp dx, VK_UP
	je ADD_POSITION
	
	cmp dx, VK_SPACE
	jne DRAW
	
	jmp CHANGE_SCREEN

;soma 1 no valor da posicao da seta
ADD_POSITION:
	add position,1
	AND position, 00000001b
	mov al, position
	cmp al, 0
	je start
	mov startLabelColor, 0fh
	mov exitLabelColor, 2fh	
	
	jmp DRAW
start:
	mov startLabelColor, 2fh
	mov exitLabelColor, 0Fh	
	
	jmp DRAW

;verifica qual a opção selecionada e passa para proxima tela

CHANGE_SCREEN:
	cmp position, 0
	;call proximatela ;************************ CHAMA SELECTCAR AQUI***********************************
	ret
menu ENDP

;----------------------------------
;			drawMenu PROC
;desenha tela do menu
;Entrada: Nada
;Saida: Nada
;Requer: position
;----------------------------------

drawMenu PROC
	call ClearBuffer

; Coloca titulo na matriz

	pushObjectStack speedRacerLabel,xspeedRacerLabelPosition,yspeedRacerLabelPosition,speedRacerLabelColor
	call insetMatrix
	

; Coloca 'Start' na matriz
	pushObjectStack startLabel,xstartLabelPosition, ystartLabelPosition, startLabelColor
    call insetMatrix
	
; Coloca 'Exit' na matriz
	pushObjectStack exitLabel, xexitLabelPosition, yexitLabelPosition, exitLabelColor
    call insetMatrix

; printa
    invoke WriteConsoleOutput, console, 
           ADDR buffer, bufferSize, bufferCoord, ADDR region
    ret

drawMenu ENDP




;---------------------------------------------------------------------------------------------
;	insertMatrix PROC
;insere objetos na matriz de desenho
;Entrada: empilhar os elementos: ponteiro para o objeto, posição x, posição y e cor do desenho
;Saida: nada
;Requer: nada
;----------------------------------------------------------------------------------------------
   
insetMatrix proc
	push ebp
	mov ebp, esp
	mov ecx,1

	movsx eax, byte ptr[ebp + 12] 	;eax = ydesenho
	dec eax				;eax = ydesenho -1
	imul lengthScreen		;ax = (ydesenho - 1) * lengthScreen
	mov ebx, dword ptr[ebp + 16] 	;ebx = xdesenho
	add eax, ebx			
	mov esi, eax			;esi contém o índice para onde o objeto será inserido na matriz
	
	mov ebx, dword ptr [ebp + 20] ;ebx = endereço do inicio do desenho
	
	mov edx, dword ptr [ebp +8]  		  ;edx contem a cor do caracter e do fundo

VERIFY_BYTE:
	movzx ax, byte ptr[ebx]	  			  ;al = contem o byte do desenho apontado por ebx
	cmp ax, 0					  ;verifica se chegou no fim do desenho
	je EXIT_ADD
	
	cmp ax, 0Ah					  ;verifica se chegou no final da linha do desenho
	je NEXT_LINE				  ; se chegou no final da linha pula pra proxima linha da matriz
	
	cmp ax, 32h					  ;verifica se é espaço, se for não substitui
	je ADD_INDEX

COPY_TO_MATRIX:
	
	mov buffer[esi*CHAR_INFO].Char, ax
	mov buffer[esi*CHAR_INFO].Attributes, dx
	jmp ADD_INDEX
NEXT_LINE:
	movsx edi, lengthScreen 
	sub edi, ecx
	add esi, edi		;adiciona indice da proxima linha na matriz		
	mov ecx,0
ADD_INDEX:	
	inc esi
	inc ebx
	inc ecx
	jmp VERIFY_BYTE
EXIT_ADD:
	pop ebp
	ret 16
insetMatrix endp

;-------------------------------------------------------------
;	ClearBuffer PROC
;insere espaço em todos os elementos da matriz de desenho
;Entrada: nada
;Saida: nada
;Requer: nada
;-------------------------------------------------------------
ClearBuffer PROC USES eax 
    xor eax, eax

BLANKS:  
    mov buffer[eax * CHAR_INFO].Char, ' '
    inc eax
    cmp eax, HEIGHT_SCREEN * LENGTH_SCREEN
    jl BLANKS

    ret       
ClearBuffer ENDP


END main
