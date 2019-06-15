INCLUDE Irvine32.inc

LENGTH_SCREEN = 168
HEIGHT_SCREEN = 44

.DATA

	lengthScreen WORD 168
    heightScreen WORD 44
    screenMatrix BYTE HEIGHT_SCREEN DUP(LENGTH_SCREEN DUP(" ")), 0

	position BYTE 0

	speedRacerLabel BYTE "**************************************************************",10
	                BYTE "*   _____                     _   _____                      *",10
                    BYTE "*  / ____|                   | | |  __ \                     *",10
                    BYTE "* | (___  _ __   ___  ___  __| | | |__) |__ _  ___ ___ _ __  *",10
                    BYTE "*  \___ \| '_ \ / _ \/ _ \/ _` | |  _  // _` |/ __/ _ \ '__| *",10
                    BYTE "*  ____) | |_) |  __/  __/ (_| | | | \ \ (_| | (_|  __/ |    *",10
                    BYTE "* |_____/| .__/ \___|\___|\__,_| |_|  \_\__,_|\___\___|_|    *",10
                    BYTE "*        | |                                                 *",10
                    BYTE "*        |_|                                                 *",10               
                    BYTE "**************************************************************",0      

	xspeedRacerLabelPosition BYTE 46
	yspeedRacerLabelPosition BYTE 5

	startLabel 	BYTE "  _________________________ _____________________",10
                BYTE " /   _____/\__    ___/  _  \\______   \__    ___/",10
                BYTE " \_____  \   |    | /  /_\  \|       _/ |    |   ",10
                BYTE " /        \  |    |/    |    \    |   \ |    |   ",10
                BYTE "/_______  /  |____|\____|__  /____|_  / |____|   ",10
                BYTE "        \/                 \/       \/           ",0

	xstartLabelPosition BYTE 52
	ystartLabelPosition BYTE 18

	exitLabel 	BYTE "_______________  ___.______________",10
                BYTE "\_   _____/\   \/  /|   \__    ___/",10
                BYTE " |    __)_  \     / |   | |    |   ",10
                BYTE " |        \ /     \ |   | |    |   ",10
                BYTE "/_______  //___/\  \|___| |____|   ",10
                BYTE "        \/       \_/             	 ",0
			
	xexitLabelPosition BYTE 59
	yexitLabelPosition BYTE 26

	setaLabel	BYTE "             __   ",10
                BYTE "             \ \  ",10
                BYTE "  ______ _____\ \ ",10
                BYTE " |______|______> >",10
                BYTE "              / / ",10
                BYTE "             /_/  ",0

	xsetaLabelPosition BYTE 27
	ysetaLabelPosition BYTE 18



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
	shl al, 3
	add al, 18
	mov ysetaLabelPosition, al
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
	call clearMatrix
	mov eax, OFFSET screenMatrix

; Coloca titulo na matriz
    mov ebx, OFFSET speedRacerLabel
    movsx ecx, xspeedRacerLabelPosition
    movsx edx, yspeedRacerLabelPosition
    call insertObjectInMatrix

; Coloca 'Start' na matriz
    mov ebx, OFFSET startLabel
    movsx ecx, xstartLabelPosition
    movsx edx, ystartLabelPosition
    call insertObjectInMatrix
	
; Coloca 'Exit' na matriz
    mov ebx, OFFSET exitLabel
    movsx ecx, xexitLabelPosition
    movsx edx, yexitLabelPosition
    call insertObjectInMatrix

;Coloca a 'Seta' na matriz
	mov ebx, OFFSET setaLabel
    movsx ecx, xsetaLabelPosition
    movsx edx, ysetaLabelPosition
    call insertObjectInMatrix

; printa
    mov edx, OFFSET screenMatrix
	call WriteString
    ret

drawMenu ENDP


;==============================================================================================;
;                                    insertObjectInMatrix PROC                                 ;
;                 Recebe um objeto e uma posicao e desenha o objeto na matriz                  ;
; Recebe:                                                                                      ;
;   EBX - Endereco para o desenho do objeto                                                    ;
;   ECX - Posicao do objeto no eixo x                                                          ;
;   EDX - Posicao  do objeto no eixo y                                                         ;
; Retorna:                                                                                     ;
;    Nada                                                                                      ;
; Requer:                                                                                      ;
;   O final de cada linha do desenho do objeto deve terminar com o caracter referente ao       ;
;   LF (Line feed), equivalente ao numero 10 em decimal.                                       ;
;==============================================================================================;

insertObjectInMatrix PROC
    
    push edx
    push ecx
    mov ecx, edx
    mov edx, 0 

MULT:
    push ecx
    movsx ecx, lengthScreen
    add edx, ecx
    pop ecx
    loop MULT

    ; ate aqui edx tem lengthScreen * yObjectPosition
    pop ecx ; xObjectPosition

    mov esi, 0 ; largura do objeto
COPY_TO_MATRIX:
    ; loop para ir colocando os valores do design do objeto ebx
    mov al, [ebx] 
    mov ah, screenMatrix[edx + ecx]
    inc ebx
    
    cmp al, 10

    JE GO_TO_NEXT_LINE
    JNE VERIFY_IF_ZERO

GO_TO_NEXT_LINE:
    ; pula para proxima linha na matriz e subtrai largura objeto
    movsx eax, lengthScreen 
    sub eax, esi
    mov esi, eax
    add edx, esi 

    mov esi, 0
    JMP COPY_TO_MATRIX    
VERIFY_IF_ZERO:
    cmp al, 0
    JE STOP_COPY
    JNE VERIFY_AH
VERIFY_AH:
    cmp ah, 0

    JE STOP_COPY
        
    ; verifica se eh espaco, se for eu nem substituo
    cmp al, 32 
    
    JE IS_SPACE
    mov screenMatrix[edx + ecx], al

IS_SPACE:
	inc esi
    inc ecx
    
    JMP COPY_TO_MATRIX
    
STOP_COPY:

    pop edx
    ret
insertObjectInMatrix ENDP


clearMatrix PROC USES ecx
    mov ecx, 7391; lengthScreen * heightScreen
again:
    mov screenMatrix[ecx], 32
    loop again

    ret
clearMatrix ENDP

END main