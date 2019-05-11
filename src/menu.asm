.DATA
position BYTE,0
menuScreem BYTE
playPosition DWORD, OFFSET playPosition + 
exitPosition DWORD, OFFSET playPosition +
.CODE
;----------------------------------
;			menu PROC
;estado inicial do menu do jogo
;Entrada: Nada
;Saida: Nada
;Requer: Nada
;----------------------------------

menu PROC

DRAW:
	call drawMenu

READ_PRESSED_KEY:
;verificar se precisa coloca delay entre as leituras

	call ReadKey
	jz READ_PRESSED_KEY
	
	cmp dx, VK_DOWN
	je ADD_POSITION
	
	cmp dx, VK_ENTER
	jne DRAW
	
	loop CHANGE_SCREEN

;soma 1 no valor da posicao da seta
ADD_POSITION:
	add position,1
	loop DRAW
	
;verifica qual a opção selecionada e passa para proxima tela

CHANGE_SCREEN:
	

menu ENDP

;----------------------------------
;			drawMenu PROC
;desenha tela do menu
;Entrada: Nada
;Saida: Nada
;Requer: position
;----------------------------------

drawMenu PROC
	mov al, position
	cmp al,0
	je PLAY
	
	cmp al, 1
	je EXIT
DRAW2:	
	mov edx, OFFSET menuScreem
	call writestring
	ret
PLAY:
	;colocar seta na posicao de jogar
	mov [playPosition], ">>>"
	mov [exitPosition], "   "
	call DRAW2
EXIT:
	;colocar seta na posicao de sair
	mov [playPosition], "   "
	mov [exitPosition], ">>>"
	call DRAW2

drawMenu ENDP