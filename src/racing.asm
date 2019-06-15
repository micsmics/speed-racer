INCLUDE  Irvine32.inc
INCLUDE Macros.inc

LENGTH_SCREEN = 168
HEIGHT_SCREEN = 44
NUMBER_OF_CARS = 4


Player STRUCT
  car BYTE ?
  velocity WORD ?
  health WORD ?
  xPosition WORD ?
  yPosition WORD ?
Player ENDS

Object STRUCT
    objectType BYTE ? ; 0 - nitro, 1 - hole, 2 - finish line
    xPosition WORD ?
    yPosition WORD ?
Object ENDS

.DATA
    posY DWORD 0
    contador WORD 0
    limiteContador WORD 0
    linhaImprime DWORD 294

    flags BYTE 00001000b
    lengthScreen WORD 168
    heightScreen WORD 44
    screenMatrix BYTE HEIGHT_SCREEN DUP(LENGTH_SCREEN DUP(" ")), 0, LENGTH_SCREEN DUP(0), LENGTH_SCREEN DUP(0)

    leftPlayer Player <0, 28, 4, 0, 60>
    rightPlayer Player <1, 6, 82, 0, 30>
    roadObjects Object <0, 3, 20>, <1, 5, 40>, <0, 0, 60>, <2, 0, 80>
    healthString BYTE " 10", 0
    velocityString BYTE " 98", 0

    roadDesign BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", "  ",       "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", "  ",       "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 10
               BYTE 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, "                 ", 0B1h, 0B1h, "                 ", 0BAh, 0BAh, 0CCh, 0B9h, 0BAh, 0BAh, 10
               BYTE 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, "                 ", 0B1h, 0B1h, "                 ", 0CCh, 0B9h, 0BAh, 0BAh, 0CCh, 0B9h, 0
    xLeftRoadPosition BYTE 0
    yLeftRoadPosition BYTE 0
    xRightRoadPosition BYTE 120
    yRightRoadPosition BYTE 0

    velocimeterDesign BYTE 0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h, 10
                      BYTE 0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,"          ",0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h, 10
                      BYTE 0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,"                   ",0B0h,0B0h,0B0h,0B0h,0B0h, 10
                      BYTE 0B0h,0B0h,0B0h,0B0h,"                /      ",0B0h,0B0h,0B0h, 10
                      BYTE 0B0h,0B0h,"              km/h/       ",0B0h,0B0h, 10
                      BYTE 0B0h,"                 /          ",0B0h, 10
                      BYTE 0B0h,0B0h,"               /          ",0B0h,0B0h, 10
                      BYTE 0B0h,0B0h,0B0h,0B0h,"           ",0FEh,0FEh,0FEh,"         ",0B0h,0B0h,0B0h, 10
                      BYTE 0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,"  ",0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,"  ",0B0h,0B0h,0B0h,0B0h,0B0h,0B0h, 0
    xLeftVelocimeterPosition BYTE 48
    yLeftVelocimeterPosition BYTE 35
    xRightVelocimeterPosition BYTE 90
    yRightVelocimeterPosition BYtE 35
    xLeftVelocityPosition BYTE 60
    yLeftVelocityPosition BYTE 39
    xRightVelocityPosition BYTE 102
    yRightVelocityPosition BYTE 39

    positionLabelDesign BYTE " ____    ___    _____ ____  ______  ____   ___   ____  ", 10
                        BYTE "|    \  /   \  / ___/|    ||      ||    | /   \ |    \ ", 10
                        BYTE "|  o  )|     |(   \_  |  | |      | |  | |     ||  _  |", 10
                        BYTE "|   _/ |  O  | \__  | |  | |_|  |_| |  | |  O  ||  |  |", 10
                        BYTE "|  |   |     | /  \ | |  |   |  |   |  | |     ||  |  |", 10
                        BYTE "|  |   |     | \    | |  |   |  |   |  | |     ||  |  |", 10
                        BYTE "|__|    \___/   \___||____|  |__|  |____| \___/ |__|__|", 0
    xPositionLabel BYTE 57
    yPositionLabel BYTE 1

    positionMapDesign BYTE 0C9h, 0CDh, 0BBh, "                                                     ", 0C9h, 0CDh, 0BBh, 10
                      BYTE 0BAh, 0B1h, 0C8h, 53 DUP (0CDh), 0BCh, 0B1h, 0BAh, 10
                      BYTE 0BAh, 0B1h, 0C9h, 53 DUP (0CDh), 0BBh, 0B1h, 0BAh, 10
                      BYTE 0C8h, 0CDh, 0BCh, "                                                     ", 0C8h, 0CDh, 0BCh, 0
    xPositionMapPosition BYTE 54
    yPositionMapPosition BYTE 11

    carPositionMapDesign BYTE "   __     ", 10
                         BYTE ".-'--`-._ ", 10
                         BYTE "'-O---O--'", 0
    xLeftCarPositionMapPosition BYTE 52
    yLeftCarPositionMapPosition BYTE 8
    xRightCarPositionMapPosition BYTE 52
    yRightCarPositionMapPosition BYTE 14

    healthLabelDesign BYTE " __ __    ___   ____  _      ______  __ __ ", 10
                      BYTE "|  |  |  /  _] /    || |    |      ||  |  |", 10
                      BYTE "|  |  | /  [_ |  o  || |    |      ||  |  |", 10
                      BYTE "|  _  ||    _]|     || |___ |_|  |_||  _  |", 10
                      BYTE "|  |  ||   [_ |  _  ||     |  |  |  |  |  |", 10
                      BYTE "|  |  ||     ||  |  ||     |  |  |  |  |  |", 10
                      BYTE "|__|__||_____||__|__||_____|  |__|  |__|__|", 0
    xHealthLabelPosition BYTE 63
    yHealthLabelPosition BYTE 19

    healthTableDesign BYTE 0C9h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CBh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BBh,10
                      BYTE 0BAh,"               ",0BAh,"               ",0BAh,10
                      BYTE 0C8h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CAh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,0
    xHealthTablePosition BYTE 68
    yHealthTablePosition BYTE 27
    xLeftCarHealthPosition BYTE 75
    yLeftCarHealthPosition BYTE 28
    xRightCarHealthPosition BYTE 91
    yRightCarHealthPosition BYTE 28


.CODE

main PROC
again:
    call racingScreen
    jmp again
    exit
main ENDP


racingScreen PROC
    call printRacingScreen
    ;call getPressedKeys
    ;call verify

    ret
racingScreen ENDP

printRacingScreen PROC
    call clearMatrix

    mov eax, posY
    call computeRoteStartsM
    ;call computeRoteStartsW

    ; coloca a pista da esquerda na matriz
    mov ebx, OFFSET roadDesign
    add ebx, eax
    movsx ecx, xLeftRoadPosition
    movsx edx, yLeftRoadPosition
    call insertObjectInMatrix

    ; printa objetos da pista da esquerda na matriz



    ; coloca a pista da direita na matriz
    mov ebx, OFFSET roadDesign
    movsx ecx, xRightRoadPosition
    movsx edx, yRightRoadPosition
    call insertObjectInMatrix

    ; printa objetos da pista da direita na matriz



    ; printa meio da pista

    ;printa label Position
    mov ebx, OFFSET positionLabelDesign
    movsx ecx, xPositionLabel
    movsx edx, yPositionLabel
    call insertObjectInMatrix

    ; printa carrinho da barra de posição do leftPlayer
    mov eax, SIZEOF roadObjects
    sub eax, TYPE Object
    movsx ebx, (Object PTR roadObjects[eax]).yPosition
    movsx eax, leftPlayer.yPosition
    call computePositionCarInPositionMap ; seta o ecx
    mov ebx, OFFSET carPositionMapDesign
    movsx edx, yLeftCarPositionMapPosition
    call insertObjectInMatrix

    ; printa carrinho da barra de posição do rightPlayer
    mov eax, SIZEOF roadObjects
    sub eax, TYPE Object
    movsx ebx, (Object PTR roadObjects[eax]).yPosition
    movsx eax, rightPlayer.yPosition
    call computePositionCarInPositionMap ; seta o ecx
    mov ebx, OFFSET carPositionMapDesign
    movsx edx, yRightCarPositionMapPosition
    call insertObjectInMatrix

    ; printa barra de posição
    mov ebx, OFFSET positionMapDesign
    movsx ecx, xPositionMapPosition
    movsx edx, yPositionMapPosition
    call insertObjectInMatrix




    ; printa label Health
    mov ebx, OFFSET healthLabelDesign
    movsx ecx, xHealthLabelPosition
    movsx edx, yHealthLabelPosition
    call insertObjectInMatrix

    ; printa table Health
    mov ebx, OFFSET healthTableDesign
    movsx ecx, xHealthTablePosition
    movsx edx, yHealthTablePosition
    call insertObjectInMatrix

    ; printa saude leftPlayer
    ; transforma de inteiro pra string e printa na matriz
    movsx eax, leftPlayer.health
    call healthInIntegerToString ; converte o numero para uma string e deixa o offset em ebx
    movsx ecx, xLeftCarHealthPosition
    movsx edx, yLeftCarHealthPosition
    call insertObjectInMatrix

    ; printa saude rightPlayer
    movsx eax, rightPlayer.health
    call healthInIntegerToString ; converte o numero para uma string e deixa o offset em ebx
    movsx ecx, xRightCarHealthPosition
    movsx edx, yRightCarHealthPosition
    call insertObjectInMatrix




    ; printa velocimetro esquerda
    mov ebx, OFFSET velocimeterDesign
    movsx ecx, xLeftVelocimeterPosition
    movsx edx, yLeftVelocimeterPosition
    call insertObjectInMatrix


    ; printa velocimetro direita
    mov ebx, OFFSET velocimeterDesign
    movsx ecx, xRightVelocimeterPosition
    movsx edx, yRightVelocimeterPosition
    call insertObjectInMatrix

    ; printa a velocidade da esquerda
    movsx eax, leftPlayer.velocity
    call velocityInIntegerToString
    movsx ecx, xLeftVelocityPosition
    movsx edx, yLeftVelocityPosition
    call insertObjectInMatrix

    ; printa a velocidade da direita
    movsx eax, rightPlayer.velocity
    call velocityInIntegerToString
    movsx ecx, xRightVelocityPosition
    movsx edx, yRightVelocityPosition
    call insertObjectInMatrix

    ; printa
    mov edx, OFFSET screenMatrix
	call WriteString
    ret
printRacingScreen ENDP



; requisitos, colocar a velocidade em eax
computeRoteStartsM PROC USES ebx ecx edx
    ; divide a posição em y do carro por 6 e pega o resto da divisão e coloca em eax
    mov edx, 0
    mov ecx, 6
    div ecx
    mov eax, edx

    mov ebx, 49
    mul ebx ; multiplica pela quantidade de caracteres na linha da pista e armazeda o resultado em eax
    
    ret
computeRoteStartsM ENDP

computePositionCarInPositionMap PROC
    mov ecx, 100
    mul ecx ; multiplica 100 * posCarro e coloca em eax

    mov edx, 0
    div ebx ; divide o eax pela posicao da linha de chegada, pra ter uma porcentagem de pista concluida, resultado em eax

    ; nesse momento eax tem a minha porcentagem de corrida (em inteiro), 50 = 50%

    mov ebx, 56 ; (107-51) - 51 é o inicio do mapa da pista e 107 é o final
    mul ebx ; multiplica eax pela porcentagem em inteiro e dps divide por 100 pra ter um valor em porcentagem

    mov edx, 0
    mov ebx, 100
    div ebx

    add eax, 51 ; 51 é o inicio da pista
    mov ecx, eax
    
    ret
computePositionCarInPositionMap ENDP

computeRoteStartsW PROC
    inc posY
    inc contador
    cmp contador, 25
    jl naoSoma
    sub linhaImprime, 49
    mov contador, 0
naoSoma:

    cmp linhaImprime, 0
    jg naoZera
    mov linhaImprime, 294
naoZera:

    mov eax, linhaImprime

    ret
computeRoteStartsW ENDP

healthInIntegerToString PROC
    mov esi, 0

    ;primeiro digito
    mov edx, 0
    mov ebx, 100
    div ebx

    mov ecx, eax
    cmp eax, 0
    jne firstNotZero
    mov healthString[esi], " "
    jmp endFirst
firstNotZero:
    or al, 00110000b
    mov healthString[esi], al
endFirst:
    inc esi

    ; segundo digito
    mov eax, edx
    mov edx, 0
    mov ebx, 10
    div ebx
    
    cmp eax, 0
    jne secondNotSpace
    cmp ecx, 0
    jne secondNotSpace
    mov healthString[esi+1], 0 ; faço isso pra imprimir centralizado
    jmp endSecond
secondNotSpace:
    or al, 00110000b
    mov healthString[esi], al
    inc esi
endSecond:
    

    ; terceiro digito
    or dl, 00110000b
    mov healthString[esi], dl

    mov ebx, OFFSET healthString

    ret
healthInIntegerToString ENDP

velocityInIntegerToString PROC 
    ; eu apenas copiei essa funcao com a mesma lógica do healthInIntegerToString, 
    ; porque se em algum momento eu decidir alterar a lógica de como o calculo é feito em uma delas,
    ; não afeta a lógica da outra
    mov esi, 0

    ;primeiro digito
    mov edx, 0
    mov ebx, 100
    div ebx

    mov ecx, eax
    cmp eax, 0
    jne firstNotZero
    mov velocityString[esi], " "
    jmp endFirst
firstNotZero:
    or al, 00110000b
    mov velocityString[esi], al
endFirst:
    inc esi

    ; segundo digito
    mov eax, edx
    mov edx, 0
    mov ebx, 10
    div ebx
    
    cmp eax, 0
    jne secondNotSpace
    cmp ecx, 0
    jne secondNotSpace
    mov velocityString[esi+1], 0 ; faço isso pra imprimir centralizado
    jmp endSecond
secondNotSpace:
    or al, 00110000b
    mov velocityString[esi], al
    inc esi
endSecond:
    

    ; terceiro digito
    or dl, 00110000b
    mov velocityString[esi], dl

    mov ebx, OFFSET velocityString

    ret
velocityInIntegerToString ENDP



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
insertObjectInMatrix PROC USES ebx ecx edx
    
    push edx
    
    ; edx = lengthScreen * edx
    movsx eax, lengthScreen
    mul edx
    mov edx, eax
    ; ate aqui edx tem lengthScreen * yObjectPosition

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
