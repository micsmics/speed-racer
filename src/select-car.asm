
INCLUDE Irvine32.inc

LENGTH_SCREEN = 168
HEIGHT_SCREEN = 44

.DATA
    lengthScreen WORD 168
    heightScreen WORD 44
    screenMatrix BYTE HEIGHT_SCREEN DUP(LENGTH_SCREEN DUP("-")), 0
    carDesign BYTE "    _    ", 10 
              BYTE " 0=[_]=0 ", 10
              BYTE "   /T\   ", 10
              BYTE "  |(o)|  ", 10
              BYTE "[]=\_/=[]", 10
              BYTE " '-----' ", 0
    xCarPosition BYTE 79
    yCarPosition BYTE 19
    positionLabelDesign BYTE " ____    ___    _____ ____  ______  ____   ___   ____  ", 10
                        BYTE "|    \  /   \  / ___/|    ||      ||    | /   \ |    \ ", 10
                        BYTE "|  o  )|     |(   \_  |  | |      | |  | |     ||  _  |", 10
                        BYTE "|   _/ |  O  | \__  | |  | |_|  |_| |  | |  O  ||  |  |", 10
                        BYTE "|  |   |     | /  \ | |  |   |  |   |  | |     ||  |  |", 10
                        BYTE "|  |   |     | \    | |  |   |  |   |  | |     ||  |  |", 10
                        BYTE "|__|    \___/   \___||____|  |__|  |____| \___/ |__|__|", 0
    xPositionLabelPosition BYTE 57
    yPositionLabelPosition BYTE 2
    var2 DWORD 89ABCDEFh

.CODE
main PROC
    mov eax, OFFSET screenMatrix
    mov ebx, OFFSET carDesign
    movsx ecx, xCarPosition
    movsx edx, yCarPosition
    call insertObjectInMatrix

    mov ebx, OFFSET positionLabelDesign
    movsx ecx, xPositionLabelPosition
    movsx edx, yPositionLabelPosition
    call insertObjectInMatrix

    mov edx, OFFSET screenMatrix
	call WriteString

exit
main ENDP



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
