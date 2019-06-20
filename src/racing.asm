INCLUDE  Irvine32.inc
INCLUDE Macros.inc

LENGTH_SCREEN = 168
HEIGHT_SCREEN = 44
NUMBER_OF_CARS = 4
NITRO_RUNNING_TIME = 3000 ; milliseconds
HOLE_DAMAGE = 25
CAR_JUMP_TO_SIDE = 4 ; quanto o carro vai saltar pro lado a cada vez que o botão for pressionado
BEGIN_LEFT_ROAD_IN_X = 6
BEGIN_RIGHT_ROAD_IN_X = 126
LENGTH_ROAD = 35
LENGTH_CAR = 10
HEIGHT_CAR = 6
CAR_ACCELERATION = 5 ; o quanto de velocidade vai aumentar quando acelerado
DELAY_SCREEN_FRAMERATE = 40 ; um contador pra atualizar menos vezes a tela e o ciclo ficar mais rápido

; constantes para calculo da velocidade
DELAY_COMPUTE_VELOCITY = 5

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

CarStruct STRUCT
    id BYTE ?
    maxVelocity WORD ?
    maxVelocityString BYTE 4 DUP(0)
    limitAccelerationDelay DWORD ?
    accelerationString BYTE 4 DUP(0)
    health WORD ?
    healthString BYTE 4 DUP(0)
    design DWORD 0
CarStruct ENDS


.DATA
    carDesign0 BYTE "    _    ", 10
               BYTE " 0=[_]=0 ", 10
               BYTE "   /T\   ", 10
               BYTE "  |(o)|  ", 10
               BYTE "[]=\_/=[]", 10
               BYTE " '-----' ", 0
    carDesign1 BYTE "    _    ", 10
               BYTE " 0=[_]=0 ", 10
               BYTE "   /T\   ", 10
               BYTE "  |(o)|  ", 10
               BYTE "[]=\_/=[]", 10
               BYTE " '-----' ", 0
    carDesign2 BYTE "    _    ", 10
               BYTE " 0=[_]=0 ", 10
               BYTE "   /T\   ", 10
               BYTE "  |(o)|  ", 10
               BYTE "[]=\_/=[]", 10
               BYTE " '-----' ", 0
    carDesign3 BYTE "    _    ", 10
               BYTE " 0=[_]=0 ", 10
               BYTE "   /T\   ", 10
               BYTE "  |(o)|  ", 10
               BYTE "[]=\_/=[]", 10
               BYTE " '-----' ", 0



    posY DWORD 0
    contador WORD 0
    limiteContador WORD 0
    linhaImprime DWORD 294

	pPlayer Player <>

    flags BYTE 00001000b
    lengthScreen WORD 168
    heightScreen WORD 44
    beforeScreenMatrix BYTE 9 DUP(LENGTH_SCREEN DUP(" "))
    screenMatrix BYTE HEIGHT_SCREEN DUP(LENGTH_SCREEN DUP(" ")), 0, LENGTH_SCREEN DUP(0), LENGTH_SCREEN DUP(0)
    ; tirar o array de carros depois, pois já está no select-car.asm
    cars CarStruct <0, 98, "9.8", 600, "8.0", 10, "6.0", carDesign0>, <1, 79, "7.9", 60, "9.2", 63, "6.3", carDesign1>, <2, 57, "5.7", 8, "8.2", 94, "9.4", carDesign2>, <3, 68, "6.8", 7, "7.2", 69, "6.9", carDesign3>

    leftPlayer Player <0, 0, 4, 0, 0>
    rightPlayer Player <1, 6, 82, 0, 0>
    roadObjects Object <0, 0, 20>, <1, 0, 40>, <0, 5, 60>, <0, 5, 80>, <1, 5, 100>, <0, 5, 120>, <0, 5, 140>, <1, 5, 160>, <0, 5, 180>, <2, 5, 200>
                Object <2, 7, 220>
                Object <0, 0, 240>
                Object <0, 10, 260>
                Object <1, 6, 280>
                Object <1, 12, 300>
                Object <1, 1, 320>
                Object <2, 4, 340>
                Object <0, 14, 360>
                Object <2, 7, 380>
                Object <0, 4, 400>
                Object <1, 10, 420>
                Object <2, 4, 440>
                Object <0, 7, 460>
                Object <1, 7, 480>
                Object <2, 6, 500>
                Object <2, 11, 520>
                Object <1, 14, 540>
                Object <0, 12, 560>
                Object <0, 2, 580>
                Object <2, 13, 600>
                Object <0, 2, 620>
                Object <2, 3, 640>
                Object <1, 4, 660>
                Object <2, 1, 685>
                Object <0, 7, 696>
                Object <1, 4, 718>
                Object <2, 10, 730>
                Object <0, 8, 747>
                Object <2, 6, 763>
                Object <2, 8, 787>
                Object <1, 8, 800>
                Object <0, 14, 812>
                Object <2, 8, 831>
                Object <1, 6, 850>
                Object <1, 1, 871>
                Object <2, 8, 890>
                Object <1, 2, 917>
                Object <0, 3, 942>
                Object <0, 9, 949>
                Object <0, 8, 961>
                Object <2, 2, 978>
                Object <1, 4, 987>
                Object <2, 11, 1008>
                Object <1, 13, 1033>
                Object <2, 0, 1047>
                Object <2, 12, 1073>
                Object <2, 0, 1089>
                Object <2, 4, 1099>
                Object <0, 8, 1112>
                Object <2, 7, 1131>
                Object <0, 6, 1151>
                Object <0, 1, 1162>
                Object <1, 6, 1179>
                Object <1, 7, 1200>
                Object <2, 13, 1205>
                Object <0, 7, 1234>
                Object <1, 1, 1242>
                Object <2, 4, 1268>
                Object <0, 6, 1277>
                Object <0, 14, 1303>
                Object <2, 13, 1323>
                Object <0, 0, 1336>
                Object <0, 8, 1351>
                Object <2, 2, 1369>
                Object <1, 8, 1374>
                Object <0, 9, 1393>
                Object <0, 6, 1420>
                Object <0, 0, 1435>
                Object <0, 0, 1454>
                Object <0, 6, 1463>
                Object <0, 12, 1473>
                Object <0, 7, 1488>
                Object <1, 9, 1506>
                Object <1, 1, 1518>
                Object <2, 6, 1538>
                Object <2, 12, 1561>
                Object <2, 12, 1589>
                Object <2, 12, 1615>
                Object <2, 8, 1624>
                Object <1, 9, 1643>
                Object <1, 3, 1667>
                Object <1, 11, 1695>
                Object <0, 2, 1716>
                Object <2, 10, 1735>
                Object <0, 9, 1752>
                Object <0, 7, 1761>
                Object <1, 4, 1786>
                Object <2, 10, 1815>
                Object <0, 10, 1843>
                Object <1, 7, 1853>
                Object <2, 0, 1858>
                Object <2, 10, 1866>
                Object <0, 8, 1876>
                Object <2, 7, 1904>
                Object <0, 11, 1920>
                Object <2, 4, 1928>
                Object <0, 13, 1957>
                Object <1, 0, 1964>
                Object <1, 14, 1979>
                Object <0, 6, 2008>
                Object <0, 14, 2021>
                Object <2, 9, 2031>
                Object <2, 2, 2059>
                Object <1, 11, 2066>
                Object <0, 13, 2081>
                Object <1, 13, 2087>
                Object <2, 14, 2116>
                Object <1, 13, 2123>
                Object <2, 11, 2136>
                Object <1, 7, 2155>
                Object <2, 3, 2167>
                Object <2, 6, 2194>
                Object <2, 3, 2200>
                Object <2, 13, 2219>
                Object <0, 9, 2242>
                Object <0, 11, 2247>
                Object <2, 7, 2254>
                Object <0, 10, 2265>
                Object <1, 7, 2288>
                Object <2, 2, 2297>
                Object <1, 7, 2307>
                Object <2, 9, 2321>
                Object <2, 11, 2350>
                Object <1, 9, 2372>
                Object <1, 1, 2400>
                Object <2, 8, 2419>
                Object <1, 8, 2427>
                Object <0, 12, 2447>
                Object <0, 2, 2457>
                Object <2, 5, 2481>
                Object <1, 14, 2504>
                Object <0, 1, 2524>
                Object <1, 9, 2547>
                Object <1, 8, 2566>
                Object <0, 8, 2581>
                Object <2, 0, 2609>
                Object <2, 4, 2631>
                Object <0, 0, 2636>
                Object <0, 13, 2653>
                Object <1, 3, 2666>
                Object <1, 1, 2682>
                Object <2, 6, 2709>
                Object <2, 7, 2727>
                Object <0, 13, 2742>
                Object <1, 3, 2767>
                Object <1, 13, 2773>
                Object <2, 8, 2796>
                Object <1, 6, 2818>
                Object <1, 9, 2831>
                Object <1, 8, 2847>
                Object <0, 12, 2868>
                Object <0, 0, 2879>
                Object <0, 6, 2900>
                Object <0, 8, 2908>
                Object <2, 1, 2930>
                Object <0, 9, 2941>
                Object <0, 1, 2952>
                Object <1, 8, 2980>
                Object <0, 3, 3000>
                Object <0, 11, 3007>
                Object <2, 4, 3028>
                Object <0, 11, 3036>
                Object <2, 2, 3055>
                Object <1, 12, 3076>
                Object <1, 12, 3105>
                Object <1, 13, 3127>
                Object <2, 1, 3145>
                Object <0, 1, 3174>
                Object <1, 6, 3179>
                Object <1, 13, 3198>
                Object <2, 9, 3224>
                Object <2, 8, 3233>
                Object <1, 12, 3242>
                Object <1, 5, 3249>
                Object <0, 9, 3255>
                Object <0, 7, 3261>
                Object <1, 5, 3270>
                Object <0, 0, 3290>
                Object <0, 7, 3297>
                Object <1, 2, 3302>
                Object <0, 6, 3326>
                Object <0, 10, 3349>
                Object <1, 11, 3361>
                Object <0, 10, 3381>
                Object <1, 1, 3389>
                Object <2, 3, 3417>
                Object <2, 8, 3437>
                Object <1, 6, 3455>
                Object <1, 7, 3460>
                Object <2, 7, 3481>
                Object <0, 12, 3497>
                Object <0, 10, 3511>
                Object <1, 0, 3521>
                Object <1, 10, 3539>
                Object <2, 2, 3565>
                Object <1, 1, 3591>
                Object <2, 9, 3604>
                Object <2, 2, 3609>
                Object <1, 4, 3617>
                Object <2, 14, 3629>
                Object <1, 5, 3644>
                Object <0, 14, 3665>
                Object <2, 3, 3676>
                Object <2, 12, 3682>
                Object <2, 13, 3700>
                Object <0, 0, 3709>
                Object <0, 7, 3734>
                Object <1, 4, 3739>
                Object <2, 0, 3767>
                Object <2, 8, 3781>
                Object <1, 14, 3793>
                Object <0, 13, 3816>
                Object <1, 5, 3842>
                Object <0, 5, 3862>
                Object <2, 13, 3875>
                Object <0, 4, 3901>
                Object <1, 9, 3913>
                Object <1, 9, 3933>
                Object <1, 2, 3944>
                Object <0, 9, 3958>
                Object <0, 2, 3978>
                Object <2, 6, 3986>
                Object <2, 9, 4013>
                Object <2, 13, 4039>
                Object <0, 6, 4045>
                Object <0, 5, 4070>
                Object <2, 7, 4084>
                Object <0, 1, 4096>
                Object <1, 13, 4115>
                Object <2, 8, 4143>
                Object <1, 10, 4166>
                Object <2, 9, 4184>
                Object <2, 0, 4200>
                Object <2, 1, 4219>
                Object <0, 14, 4238>
                Object <2, 2, 4245>
                Object <1, 13, 4257>
                Object <2, 14, 4272>
                Object <1, 11, 4283>
                Object <0, 12, 4303>
                Object <0, 5, 4326>
                Object <2, 14, 4351>
                Object <1, 7, 4367>
                Object <2, 9, 4393>
                Object <2, 3, 4410>
                Object <2, 10, 4427>
                Object <0, 9, 4443>
                Object <0, 5, 4471>
                Object <2, 1, 4493>
                Object <0, 8, 4514>
                Object <2, 13, 4531>
                Object <0, 8, 4537>
                Object <2, 12, 4555>
                Object <2, 2, 4584>
                Object <1, 6, 4606>
                Object <1, 9, 4612>
                Object <1, 4, 4617>
                Object <2, 10, 4627>
                Object <0, 1, 4641>
                Object <1, 13, 4652>
                Object <2, 7, 4675>
                Object <0, 7, 4690>
                Object <1, 8, 4715>
                Object <0, 8, 4742>
                Object <2, 7, 4757>
                Object <0, 11, 4773>
                Object <2, 1, 4798>
                Object <0, 14, 4817>
                Object <2, 12, 4828>
                Object <2, 3, 4838>
                Object <2, 10, 4850>
                Object <0, 13, 4875>
                Object <1, 11, 4896>
                Object <0, 13, 4907>
                Object <1, 5, 4926>
                Object <0, 14, 4936>
                Object <2, 9, 4950>
                Object <2, 8, 4960>
                Object <1, 9, 4979>
                Object <1, 1, 4991>
                Object <2, 2, 5018>
    endOfRoadObjects BYTE 0
    roadObjectsLeftPlayerPointer DWORD roadObjects
    roadObjectsRightPlayerPointer DWORD roadObjects
    healthString BYTE " 00", 0
    velocityString BYTE " 00", 0

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


    car4Design  BYTE 0BAh, "    0=[_]=0    ", 0BAh, 0
	limitSide word ?
    
    nitroDesign BYTE "  /\  ", 10
                BYTE " /  \ ", 10
                BYTE "/_/\_\", 10
                BYTE "  /\  ", 10
                BYTE " /  \ ", 10
                BYTE "/_/\_\", 10
                BYTE "  /\  ", 10
                BYTE " /  \ ", 10
                BYTE "/_/\_\", 0

    holeDesign BYTE "  ",0DCh,0DBh,0DBh,0DBh,0DBh,0DCh,"  ",10
               BYTE 0DCh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DCh,10
               BYTE 0DFh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DBh,0DFh,10
               BYTE "  ",0DFh,0DBh,0DBh,0DBh,0DBh,0DFh,"  ",0

    finishLineDesign BYTE "===============================", 0

    delayAccelerationLeftCar DWORD 0
    delayBreakLeftCar DWORD 0
    delayAccelerationRightCar DWORD 0
    delayBreakRightCar DWORD 0

    delayComputeVelocityLeftCar DWORD 0
    delayScreenFrameRate WORD 0
.CODE

main PROC
again:
    call racingScreen
    jmp again
    exit
main ENDP


racingScreen PROC
    cmp delayScreenFrameRate, DELAY_SCREEN_FRAMERATE
    jl dontPrint
    call printRacingScreen
    mov delayScreenFrameRate, 0
dontPrint:
    inc delayScreenFrameRate

    call getPressedKeys
    call computeCarPosition3
    ;call computeCarPositionWithConstant
    ;call verify

    ret
racingScreen ENDP

printRacingScreen PROC
    
	call clearMatrix

    movsx eax, leftPlayer.yPosition
    call computeRoteStartsM
    ;call computeRoteStartsW

    ; coloca a pista da esquerda na matriz
    mov ebx, OFFSET roadDesign
    add ebx, eax
    movsx ecx, xLeftRoadPosition
    movsx edx, yLeftRoadPosition
    call insertObjectInMatrix

    ; printa objetos da pista da esquerda na matriz
    mov edi, OFFSET roadObjectsLeftPlayerPointer
    mov esi, OFFSET leftPlayer
    mov ebp, 0 ; left Player
    call printRoadObjects
	
	; printa carro da esquerda
    movsx eax, leftPlayer.car
    mov ebx, TYPE CarStruct
    mul ebx
    mov ebx, OFFSET cars

    add eax, ebx
    add eax, 21 ; deslocamento para o design

	mov ebx, (DWORD PTR [eax])
	movsx ecx, leftPlayer.xPosition
    add ecx, BEGIN_LEFT_ROAD_IN_X
	mov edx, (HEIGHT_SCREEN - HEIGHT_CAR)
	call insertObjectInMatrix
	
	
    ; coloca a pista da direita na matriz
    mov ebx, OFFSET roadDesign
    movsx ecx, xRightRoadPosition
    movsx edx, yRightRoadPosition
    call insertObjectInMatrix

    ; printa objetos da pista da direita na matriz
    mov edi, OFFSET roadObjectsRightPlayerPointer
    mov esi, OFFSET rightPlayer
    mov ebp, 1 ; right Player
    call printRoadObjects
	
	;printa carro da direita
	movsx eax, rightPlayer.car
    mov ebx, TYPE CarStruct
    mul ebx
    mov ebx, OFFSET cars

    add eax, ebx
    add eax, 21 ; deslocamento para o design

	mov ebx, (DWORD PTR [eax])
	movsx ecx, rightPlayer.xPosition
    add ecx, BEGIN_RIGHT_ROAD_IN_X
	mov edx, (HEIGHT_SCREEN - HEIGHT_CAR)
	call insertObjectInMatrix


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
    ;mov eax, edx
    mov eax, 5
    sub eax, edx
    

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




; edi = contem o endereço da variavel roadObjectsLeftPlayerPointer ou o Right (que é o apontador de onde começa os objetos da pista a cada momento da execução)
; esi = deve conter o endereço do player (ex: OFFSET leftPlayer)
; ebp = constante que indica se é o jogador da esquerda (0) ou da direita (1)
printRoadObjects PROC
    ; printa objetos da pista da esquerda na matriz
    mov eax, (DWORD PTR [edi])
nextObject:    
    ; verifica se o carrinho tá na tela
    ; (posObjeto - posCarro)
    movsx ebx, (Object PTR [eax]).yPosition
    movsx ecx, (Player PTR [esi]).yPosition
    sub ebx, ecx ; ebx = posObjeto - posCarro
    mov ecx, HEIGHT_SCREEN - 1
	sub ecx, ebx; ecx = posição do objeto na tela : height_screen - (posObj - posCarro) *************************************

    cmp ecx, -9 ; verifica se o objeto já tá no range da pista
    jge nextVerification
    jmp endOfRoadPrinting ; chegou no primeiro objeto fora da pista (que não chegou ainda)
nextVerification: 
    cmp ecx, HEIGHT_SCREEN ; ***************************************
    jg refreshPointer
    ;================================
    ; printa objeto
    ;================================
    ; verifica qual objeto que é
    movsx edx, (Object PTR [eax]).objectType
    cmp edx, 1
    jae holeOrFinishLine
    ; objectType = 0 (nitro)
    mov ebx, OFFSET nitroDesign
    jmp endOfVerificationOfObjectType
holeOrFinishLine:
    cmp edx, 1
    ja finishLine
    ; objectType = 1 (hole)
    mov ebx, OFFSET holeDesign
    jmp endOfVerificationOfObjectType
finishLine:
    ; objectType = 2 (finishLine)
    mov ebx, OFFSET finishLineDesign
endOfVerificationOfObjectType:
    mov edx, ecx
    movsx ecx, (Object PTR [eax]).xPosition
    cmp ebp, 0
    ja rightPlayerXPosition
    add ecx, BEGIN_LEFT_ROAD_IN_X
    jmp endXPosition
rightPlayerXPosition:
    add ecx, BEGIN_RIGHT_ROAD_IN_X
endXPosition:


    call insertObjectInMatrix

    jmp incrementEAX
refreshPointer:
    add (DWORD PTR [edi]), TYPE Object
    
incrementEAX: 
    add eax, TYPE Object
    cmp eax, OFFSET endOfRoadObjects
    jge endOfRoadPrinting
    jmp nextObject
endOfRoadPrinting:
    ret
printRoadObjects ENDP







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
;                                    getPressedKeys PROC                                       ;
;                 Lê as teclas pressionadas do teclado e altera os dados de cada comando       ;
; Recebe:                                                                                      ;
; 	  Nada                                                                                     ;
; Retorna:                                                                                     ;
;  	  Nada                                                                                     ;
; Requer:                                                                                      ;
;	  Nada                                                                                     ;
;==============================================================================================;
 getPressedKeys PROC
	call ReadKey
    
    ; verifica se apertou a
    cmp al, 61h
    jne notA
    sub leftPlayer.xPosition, CAR_JUMP_TO_SIDE
    cmp leftPlayer.xPosition, 0
    jge notA
    mov leftPlayer.xPosition, 0
notA:
    ; verifica se apertou d
    cmp al, 64h
    jne notB
    add leftPlayer.xPosition, CAR_JUMP_TO_SIDE
    cmp leftPlayer.xPosition, LENGTH_ROAD - LENGTH_CAR + 2
    jl notB
    mov leftPlayer.xPosition, LENGTH_ROAD - LENGTH_CAR + 2
notB:
    ; verifica se apertou s
    cmp al, 73h
    jne notS
    sub leftPlayer.velocity, CAR_ACCELERATION
    ; verifica zero
    movsx ebx, leftPlayer.velocity
    cmp ebx, 0
    jge leftPlayerVelocityGreaterThenZero
    mov leftPlayer.velocity, 0
leftPlayerVelocityGreaterThenZero:
    jmp dontIncreaseVelocityLeftPlayer
notS:
    mov ecx, delayAccelerationLeftCar
    push eax
    movsx eax, leftPlayer.car
    mov ebx, TYPE CarStruct
    mul ebx
    mov ebx, OFFSET cars

    add eax, ebx
    mov ebx, (CarStruct PTR [eax]).limitAccelerationDelay
    pop eax
    cmp ecx, ebx
    jle incrementDelayLeftCar
    add leftPlayer.velocity, CAR_ACCELERATION
    ; verificar velocidade maxima
    mov delayAccelerationLeftCar, 0
incrementDelayLeftCar:
    inc delayAccelerationLeftCar
dontIncreaseVelocityLeftPlayer:

    ; verifica se apertou seta esq
    cmp ah, 4bh
    jne notLeftArrow
    sub rightPlayer.xPosition, CAR_JUMP_TO_SIDE
    cmp rightPlayer.xPosition, 0
    jge notLeftArrow
    mov rightPlayer.xPosition, 0
notLeftArrow:
    ; verifica se apertou seta direita
    cmp ah, 4dh
    jne notRightArrow
    add rightPlayer.xPosition, CAR_JUMP_TO_SIDE
    cmp rightPlayer.xPosition, LENGTH_ROAD - LENGTH_CAR + 2
    jl notRightArrow
    mov rightPlayer.xPosition, LENGTH_ROAD - LENGTH_CAR + 2
notRightArrow:
    ; verifica se apertou seta pra baixo
    cmp ah, 50h
    jne notDownArrow
    sub rightPlayer.velocity, CAR_ACCELERATION
    ; verifica zero
    movsx ebx, rightPlayer.velocity
    cmp ebx, 0
    jge rightPlayerVelocityGreaterThenZero
    mov rightPlayer.velocity, 0
rightPlayerVelocityGreaterThenZero:
    jmp dontIncreaseVelocityRightPlayer
decrementDelayRightCar:
    dec delayAccelerationRightCar
notDownArrow:
    mov ecx, delayAccelerationRightCar
    push eax
    movsx eax, rightPlayer.car
    mov ebx, TYPE CarStruct
    mul ebx
    mov ebx, OFFSET cars

    add eax, ebx
    mov ebx, (CarStruct PTR [eax]).limitAccelerationDelay
    pop eax
    cmp ecx, ebx
    jle incrementDelayRightCar
    add rightPlayer.velocity, CAR_ACCELERATION
    ; verificar velocidade maxima
    mov delayAccelerationRightCar, 0
incrementDelayRightCar:
    inc delayAccelerationRightCar
dontIncreaseVelocityRightPlayer:

; 	; player da esquerda
;     add leftPlayer.yPosition, 1
	
	
; 	mov ax, 4
; 	mov limitSide, 2
; 	cmp dx, 'A'
; 	je moveCarLeftP1
	
	
; 	mov limitSide, 30
; 	cmp dx, 'D'
; 	je moveCarRightP1
	
; 	;player da direita
; 	mov limitSide, 100
; 	cmp dx, VK_LEFT
; 	je moveCarLeftP2
	
; 	mov limitSide, 150
; 	cmp dx, VK_RIGHT
; 	je moveCarRightP2
	
; 	jmp BREAK
; moveCarLeftP1:
; 	mov cx, limitSide
; 	cmp leftPlayer.xPosition, cx
; 	jbe BREAK
; 	sub leftPlayer.xPosition, ax
; 	jmp BREAK
; moveCarRightP1:
; 	mov cx, limitSide
; 	cmp leftPlayer.xPosition, cx
; 	jae BREAK
; 	add leftPlayer.xPosition, ax
; 	jmp BREAK

; moveCarLeftP2:
; 	mov cx, limitSide
; 	cmp rightPlayer.xPosition, cx
; 	jbe BREAK
; 	sub rightPlayer.xPosition, ax
; 	jmp BREAK

; moveCarRightP2:
; 	mov cx, limitSide
; 	cmp rightPlayer.xPosition, cx
; 	jae BREAK
; 	add rightPlayer.xPosition, ax
; 	jmp BREAK


; verificar esq pra alterar a pauseflag

BREAK:
    ; verifica aceleração
    ; atualiza velocidade
    ; leftPlayer
     
    


	ret
getPressedKeys ENDP


computeCarPosition PROC
    ;S = So + V.T
    ; calcula a posição do carro da esquerda

    ; calculo o tamanho do pulo
    movsx eax, leftPlayer.velocity
    mov ebx, 10
    mul ebx

    mov edx, 0
    mov ebx, 36
    div ebx
    
    ; eax agora tem a velocidade em metros por segundo
    mov edx, 0
    mov ebx, 250 ; uma constante para ajudar no calculo da velocidade...baseado no processador
    div ebx

    mov ebx, eax ; armazena o tamanho do pulo em y que ele vai dar, pra eu usar no calculo da constante depois
    movsx eax, leftPlayer.velocity
    cmp eax, 0
    je dontAdd
    inc ebx
dontAdd:
    add leftPlayer.yPosition, bx
    
    ret
computeCarPosition ENDP

computeCarPosition2 PROC
    ;S = So + V.T
    ; calcula a posição do carro da esquerda

    mov ecx, delayComputeVelocityLeftCar
    mov ebx, 90
    movsx eax, leftPlayer.velocity
    mov edx, 0
	mov esi, 5
    div esi

    sub ebx, eax
    cmp ecx, ebx; velocidade maxima
    jl addDelay
    inc leftPlayer.yPosition
    mov delayComputeVelocityLeftCar, 1
addDelay:
    inc delayComputeVelocityLeftCar
break:
    ret
computeCarPosition2 ENDP



computeCarPosition3 PROC
    ;S = So + V.T
    ; calcula a posição do carro da esquerda
    
    movsx eax, leftPlayer.velocity
    cmp eax, 0
    jle break
    cmp eax, 60
    jge greaterThan60
    ; entre 1 - 60 km/h => -17/10*x + 302
    mov ebx, -17
    imul ebx

    mov ebx, 10
    cdq
    idiv ebx

    add eax, 320
    
    jmp compareWithDelay
greaterThan60:
    cmp eax, 100
    jge greaterThan100
    ; entre 60 - 100 km/h => -5/2*x + 350
    mov ebx, -5
    imul ebx

    mov ebx, 2
    cdq
    idiv ebx

    add eax, 350

    jmp compareWithDelay
greaterThan100:
    cmp eax, 180
    jge greaterThan180
    ; entre 100 - 180 km/h => -5/8*x + 163
    mov ebx, -5
    imul ebx

    mov ebx, 8
    cdq
    idiv ebx

    add eax, 163

    jmp compareWithDelay
greaterThan180:
    cmp eax, 260
    jge greaterThan260
    ; entre 180 - 260 km/h => -5/16*x + 106
    mov ebx, -5
    imul ebx

    mov ebx, 16
    cdq
    idiv ebx

    add eax, 106

    jmp compareWithDelay
greaterThan260:
    ; entre 260 - 280 km/h => -1/4*x + 90
    mov ebx, -1 ; não estou usando neg pra deixar todos os ifs com o mesmo processamento, e ficar o mais linear possivel
    imul ebx

    mov ebx, 4
    cdq
    idiv ebx

    add eax, 90
    

    ;cmp eax, 100
    ;jl lessThan100

    ;cmp eax, 150
    ;jae greaterThan150
    ; calcula x/-5+60
;     cdq
;     mov ebx, -5
;     idiv ebx

;     add eax, 20
;     mov eax, 20
;     cmp delayComputeVelocityLeftCar, eax
;     jl break
;     inc leftPlayer.yPosition
;     mov delayComputeVelocityLeftCar, 0
;     jmp break
; ; greaterThan150:


; lessThan100:
;     ; calcula x/-5+60
;     mov ebx, -3
;     imul ebx

;     add eax, 100
;     cmp delayComputeVelocityLeftCar, eax
;     jl break
;     inc leftPlayer.yPosition
;     mov delayComputeVelocityLeftCar, 0

compareWithDelay:
    cmp delayComputeVelocityLeftCar, eax
    jl break
    inc leftPlayer.yPosition
    mov delayComputeVelocityLeftCar, 0
break:
	inc delayComputeVelocityLeftCar
    ret
computeCarPosition3 ENDP


computeCarPositionWithConstant PROC
    ;S = So + V.T
    ; calcula a posição do carro da esquerda

    ; y = ax + b : DELAY_COMPUTE_VELOCITY é o b

    ; agora vamos calcular o a
    mov eax, 1
    mov edx, DELAY_COMPUTE_VELOCITY
    sub eax, edx ; eax é um número negativo

    cdq
    mov ecx, 29 ; velocidade máxima do melhor carrinho / 10
    idiv ecx

    ; eax = constante a, da formula y = ax+b    

    ; agora eu calculo o valor máximo da constante para que eu faça o calculo da velocidade
    movsx ebx, leftPlayer.velocity
    imul ebx ; eax é um numero negativo nesse momento

    cdq
    mov ebx, 10
    idiv ebx

    add eax, DELAY_COMPUTE_VELOCITY ; eax = a.x + b = que é o valor da constante
    ; agora eu multiplico pelo tamanho do pulo
    push eax

    ; calculo o tamanho do pulo
    movsx eax, leftPlayer.velocity
    ; mov ebx, 10
    ; mul ebx

    ; mov edx, 0
    ; mov ebx, 36
    ; div ebx
    
    ; eax agora tem a velocidade em metros por segundo
    mov edx, 0
    mov ebx, 90 ; uma constante para ajudar no calculo da velocidade...baseado no processador
    div ebx

    mov ebx, eax ; armazena o tamanho do pulo em y que ele vai dar, pra eu usar no calculo da constante depois
    movsx eax, leftPlayer.velocity
    cmp eax, 0
    je dontAdd
    inc ebx
dontAdd:

    ; calcula o valor final da constante = cte * pulo
    pop eax ; eax = valor da constante
    mul ebx ; ebx = valor do pulo

    mov ecx, delayComputeVelocityLeftCar
    cmp ecx, eax
    jl dontRefreshVelocity
    ; atualiza o valor da posição
    add leftPlayer.yPosition, bx
    mov delayComputeVelocityLeftCar, 0
dontRefreshVelocity:
    inc delayComputeVelocityLeftCar
    
    ret
computeCarPositionWithConstant ENDP





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
insertObjectInMatrix PROC USES eax ebx ecx edx esi
    
    push edx
    
    ; edx = lengthScreen * edx
    movsx eax, lengthScreen
    imul edx
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
