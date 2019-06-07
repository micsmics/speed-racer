
INCLUDE Irvine32.inc

LENGTH_SCREEN = 168
HEIGHT_SCREEN = 44
NUMBER_OF_CARS = 4


SelectionCarStruct STRUCT
    leftCarSelected BYTE ?
    leftCar BYTE ?
    rightCarSelected BYTE ?
    rightCar BYTE ?
SelectionCarStruct ENDS

CarStruct STRUCT
    id BYTE ?
    maxVelocity WORD ?
    maxVelocityString BYTE 4 DUP(0)
    acceleration WORD ?
    accelerationString BYTE 4 DUP(0)
    health WORD ?
    healthString BYTE 4 DUP(0)
    design BYTE ?
CarStruct ENDS


.DATA
    flags BYTE 01000000b
    lengthScreen WORD 168
    heightScreen WORD 44
    screenMatrix BYTE HEIGHT_SCREEN DUP(LENGTH_SCREEN DUP(" ")), 0

    selectCarLabelDesign BYTE "  _____   ___  _        ___    __ ______         __   ____  ____  ", 10
                         BYTE " / ___/  /  _]| |      /  _]  /  ]      |       /  ] /    ||    \ ", 10
                         BYTE "(   \_  /  [_ | |     /  [_  /  /|      |      /  / |  o  ||  D  )", 10
                         BYTE " \__  ||    _]| |___ |    _]/  / |_|  |_|     /  /  |     ||    / ", 10
                         BYTE " /  \ ||   [_ |     ||   [_/   \_  |  |      /   \_ |  _  ||    \ ", 10
                         BYTE " \    ||     ||     ||     \     | |  |      \     ||  |  ||  .  \", 10
                         BYTE "  \___||_____||_____||_____|\____| |__|       \____||__|__||__|\_|", 0
    xSelectCarLabelPosition BYTE 47
    ySelectCarLabelPosition BYTE 5

    selectionCar SelectionCarStruct <0, 3, 1, NUMBER_OF_CARS-1>
    cars CarStruct <0, 98, "9.8", 80, "8.0", 60, "6.0">, <1, 79, "7.9", 92, "9.2", 63, "6.3">, <2, 57, "5.7", 82, "8.2", 94, "9.4">, <3, 68, "6.8", 72, "7.2", 69, "6.9">
    
    car1Design  BYTE 0C9h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BBh, 10
                BYTE 0BAh, "       _       ", 0BAh, 10
                BYTE 0BAh, "    0=[_]=0    ", 0BAh, 10
                BYTE 0BAh, "      /T\      ", 0BAh, 10
                BYTE 0BAh, "     |(o)|     ", 0BAh, 10
                BYTE 0BAh, "   []=\_/=[]   ", 0BAh, 10
                BYTE 0BAh, "    '-----'    ", 0BAh, 10
                BYTE 0BAh, "               ", 0BAh, 10
                BYTE 0C8h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BCh, 0
    xCar1Position BYTE 37
    yCar1Position BYTE 19

    car2Design  BYTE 0C9h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BBh, 10
                BYTE 0BAh, "       _       ", 0BAh, 10
                BYTE 0BAh, "    0=[_]=0    ", 0BAh, 10
                BYTE 0BAh, "      /T\      ", 0BAh, 10
                BYTE 0BAh, "     |(o)|     ", 0BAh, 10
                BYTE 0BAh, "   []=\_/=[]   ", 0BAh, 10
                BYTE 0BAh, "    '-----'    ", 0BAh, 10
                BYTE 0BAh, "               ", 0BAh, 10
                BYTE 0C8h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BCh, 0
    xCar2Position BYTE 61
    yCar2Position BYTE 19

    car3Design  BYTE 0C9h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BBh, 10
                BYTE 0BAh, "       _       ", 0BAh, 10
                BYTE 0BAh, "    0=[_]=0    ", 0BAh, 10
                BYTE 0BAh, "      /T\      ", 0BAh, 10
                BYTE 0BAh, "     |(o)|     ", 0BAh, 10
                BYTE 0BAh, "   []=\_/=[]   ", 0BAh, 10
                BYTE 0BAh, "    '-----'    ", 0BAh, 10
                BYTE 0BAh, "               ", 0BAh, 10
                BYTE 0C8h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BCh, 0
    xCar3Position BYTE 85
    yCar3Position BYTE 19

    car4Design  BYTE 0C9h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BBh, 10
                BYTE 0BAh, "       _       ", 0BAh, 10
                BYTE 0BAh, "    0=[_]=0    ", 0BAh, 10
                BYTE 0BAh, "      /T\      ", 0BAh, 10
                BYTE 0BAh, "     |(o)|     ", 0BAh, 10
                BYTE 0BAh, "   []=\_/=[]   ", 0BAh, 10
                BYTE 0BAh, "    '-----'    ", 0BAh, 10
                BYTE 0BAh, "               ", 0BAh, 10
                BYTE 0C8h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BCh, 0
    xCar4Position BYTE 109
    yCar4Position BYTE 19

    arrowLeftPlayer BYTE "   __   ", 10
                    BYTE "  |  |  ", 10
                    BYTE "\-|  |-/", 10
                    BYTE " \    / ", 10
                    BYTE "  \  /  ", 10
                    BYTE "   \/   ", 0
    arrowLeftPlayerSelected BYTE "   __   ", 10
                            BYTE "  |--|  ", 10
                            BYTE "\-|--|-/", 10
                            BYTE " \----/ ", 10
                            BYTE "  \--/  ", 10
                            BYTE "   \/   ", 0
    xArrowLeftPlayerPosition BYTE 42
    yArrowLeftPlayerPosition BYTE 13

    arrowRightPlayer BYTE "   /\   ", 10
                     BYTE "  /  \  ", 10
                     BYTE " /    \ ", 10
                     BYTE "/-|  |-\", 10
                     BYTE "  |__|  ", 0
    arrowRightPlayerSelected BYTE "   /\   ", 10
                             BYTE "  /--\  ", 10
                             BYTE " /----\ ", 10
                             BYTE "/-|--|-\", 10
                             BYTE "  |--|  ", 0
    xArrowRightPlayerPosition BYTE 42
    yArrowRightPlayerPosition BYTE 28

    infoTableDesign BYTE 0C9h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CBh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BBh, 10
                    BYTE 0BAh, "   MAX. SPEED  ", 0BAh, "      ---      ", 0BAh, 10
                    BYTE 0CCh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CEh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0B9h, 10
                    BYTE 0BAh, "  ACCELERATION ", 0BAh, "      ---      ", 0BAh, 10
                    BYTE 0CCh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CEh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0B9h, 10
                    BYTE 0BAh, "    HEALTH     ", 0BAh, "      ---      ", 0BAh, 10
                    BYTE 0C8h, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CAh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0CDh, 0BCh, 0
    xPosInfoTableLeftPlayer BYTE 13
    yPosInfoTableLeftPlayer BYTE 35
    xPosInfoTableRightPlayer BYTE 119
    yPosInfoTableRightPlayer BYTE 35
    

.CODE
main PROC
    call verifySelectedItem
    call printCarSelectionScreen
    ;call getPressedKeys
exit
main ENDP


;============================================;
;   verifica quais os itens selecionados
;   coloca o desenho da seta do player da esquerda em eax e a posicao x em bh e pos y em bl
;   coloca o desenho da seta do player da direita em ecx e a posicao x em dh e pos y em dl
;============================================;

verifySelectedItem PROC
    ;-----------------------------------
    ; leftPlayer
    ;-----------------------------------
    movzx eax, selectionCar.leftCarSelected
    cmp eax, 0
    je leftCarNotSelected
    mov eax, OFFSET arrowLeftPlayerSelected
    jmp afterleftCarSelected

leftCarNotSelected:
    mov eax, OFFSET arrowLeftPlayer

afterleftCarSelected:
    movzx ebx, xArrowLeftPlayerPosition
    movzx ecx, selectionCar.leftCar
    cmp ecx, 0
    je byPassLeftPlayerArrowMath

sumXPosLeftCarArrow:
    add ebx, 24
    loop sumXPosLeftCarArrow

byPassLeftPlayerArrowMath:
    shl ebx, 8
    mov bl, yArrowLeftPlayerPosition


    ;-----------------------------------
    ; rightPlayer
    ;-----------------------------------
    movzx ecx, selectionCar.rightCarSelected
    cmp ecx, 0
    je rightCarNotSelected
    mov ecx, OFFSET arrowRightPlayerSelected
    jmp afterRightCarSelected

rightCarNotSelected:
    mov ecx, OFFSET arrowRightPlayer

afterRightCarSelected:
    push ecx

    movzx edx, xArrowRightPlayerPosition
    movzx ecx, selectionCar.rightCar
    cmp ecx, 0
    je byPassRightPlayerArrowMath

sumXPosRightCarArrow:
    add edx, 24
    loop sumXPosRightCarArrow

byPassRightPlayerArrowMath:
    pop ecx

    shl edx, 8
    mov dl, yArrowRightPlayerPosition
    
    ret
verifySelectedItem ENDP


;==============================================================================================;
;                                    carSelectionScreen PROC                                   ;
;                           Atualiza toda a matriz que vai ser printada                        ;
; Recebe:                                                                                      ;
;   eax: desenho da seta da esquerda
;   bh: posX - bl: posY
;   ecx: desenho seta direita                                                                  
;   dh: posX - dl: posY
; Retorna:                                                                                     ;
;   Nada                                                                                       ;
; Requer:                                                                                      ;
;   Nada                                                                                       ;
;==============================================================================================;
printCarSelectionScreen PROC
    push edx
    push ecx
    push ebx
    push eax

    mov eax, OFFSET screenMatrix

    ; coloca 'select car' na matriz
    mov ebx, OFFSET selectCarLabelDesign
    movsx ecx, xSelectCarLabelPosition
    movsx edx, ySelectCarLabelPosition
    call insertObjectInMatrix

    ; coloca 'car1Design' na matriz
    mov ebx, OFFSET car1Design
    movsx ecx, xCar1Position
    movsx edx, yCar1Position
    call insertObjectInMatrix

    ; coloca 'car2Design' na matriz
    mov ebx, OFFSET car2Design
    movsx ecx, xCar2Position
    movsx edx, yCar2Position
    call insertObjectInMatrix

    ; coloca 'car3Design' na matriz
    mov ebx, OFFSET car3Design
    movsx ecx, xCar3Position
    movsx edx, yCar3Position
    call insertObjectInMatrix

    ; coloca 'car4Design' na matriz
    mov ebx, OFFSET car4Design
    movsx ecx, xCar4Position
    movsx edx, yCar4Position
    call insertObjectInMatrix

    mov esi, eax ; coloca a matriz em esi

    pop eax
    pop ebx
    pop ecx
    pop edx

    push edx
    push ecx
    push ebx
    push eax

    
    ; coloca 'arrowLeftPlayer' na matriz
    push eax
    movsx ecx, bh
    movsx edx, bl
    pop ebx
    call insertObjectInMatrix

    pop eax
    pop ebx
    pop ecx
    pop edx

    ; coloca 'arrowRightPlayer' na matriz
    mov ebx, ecx
    movzx ecx, dh
    mov dh, 0
    call insertObjectInMatrix

    ;----------------------------------------------------------
    ; imprime as tabelas de informacoes dos carros
    ;----------------------------------------------------------
    mov ebx, OFFSET infoTableDesign
    movzx ecx, xPosInfoTableLeftPlayer
    movzx edx, yPosInfoTableLeftPlayer
    call insertObjectInMatrix

    mov ebx, OFFSET infoTableDesign
    movzx ecx, xPosInfoTableRightPlayer
    movzx edx, yPosInfoTableRightPlayer
    call insertObjectInMatrix

    ;----------------------------------------------------------
    ; seleciona o carro escolhido pelo left player no array
    ; imprime as informacoes do carro esquerdo
    ;----------------------------------------------------------
    mov edi, 0
    movzx ecx, selectionCar.leftCar ; pega pos carro selecionado
    cmp ecx, 0
    je byPassLeftPlayerSumOfCarsStructs

sumOfCarsStruct:
    add edi, TYPE CarStruct
    loop sumOfCarsStruct

byPassLeftPlayerSumOfCarsStructs:
    ;----------------------------------------------
    ; imprime a velocidade máxima
    ;----------------------------------------------
    mov ebx, OFFSET cars
    add ebx, edi
    add ebx, 3 ; pega a maxima velocidade do carro selecionado
    movzx ecx, xPosInfoTableLeftPlayer
    add ecx, 23
    movzx edx, yPosInfoTableLeftPlayer
    add edx, 1
    push edx
    push ecx
    push ebx
    call insertObjectInMatrix

    ;----------------------------------------------
    ; imprime a aceleração
    ;----------------------------------------------
    pop ebx
    add ebx, 6
    pop ecx
    pop edx
    add edx, 2
    push edx
    push ecx
    push ebx
    call insertObjectInMatrix

    ;----------------------------------------------
    ; imprime a saude
    ;----------------------------------------------
    pop ebx
    add ebx, 6
    pop ecx
    pop edx
    add edx, 2
    call insertObjectInMatrix

    ;----------------------------------------------------------
    ; seleciona o carro escolhido pelo right player no array
    ; imprime as informacoes do carro direito
    ;----------------------------------------------------------
    mov edi, 0
    movzx ecx, selectionCar.rightCar ; pega pos carro selecionado
    cmp ecx, 0
    je byPassRightPlayerSumOfCarsStructs

sumOfCarsStructRightPlayer:
    add edi, TYPE CarStruct
    loop sumOfCarsStructRightPlayer

byPassRightPlayerSumOfCarsStructs:
    ;----------------------------------------------
    ; imprime a velocidade máxima
    ;----------------------------------------------
    mov ebx, OFFSET cars
    add ebx, edi
    add ebx, 3 ; pega a maxima velocidade do carro selecionado
    movzx ecx, xPosInfoTableRightPlayer
    add ecx, 23
    movzx edx, yPosInfoTableRightPlayer
    add edx, 1
    push edx
    push ecx
    push ebx
    call insertObjectInMatrix

    ;----------------------------------------------
    ; imprime a aceleração
    ;----------------------------------------------
    pop ebx
    add ebx, 6
    pop ecx
    pop edx
    add edx, 2
    push edx
    push ecx
    push ebx
    call insertObjectInMatrix

    ;----------------------------------------------
    ; imprime a saude
    ;----------------------------------------------
    pop ebx
    add ebx, 6
    pop ecx
    pop edx
    add edx, 2
    call insertObjectInMatrix


    ; printa
    mov edx, OFFSET screenMatrix
	call WriteString
    ret
printCarSelectionScreen ENDP




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

END main