EESchema Schematic File Version 4
LIBS:PressControl_202108-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Allarme per pompa cisterna"
Date "dec. 2019"
Rev ""
Comp ""
Comment1 ""
Comment2 "Esaurito un determinato tempo Arduino provvede direttamente a spegnere la pompa"
Comment3 "Il tutto prosegue fino a che la pompa si spegne"
Comment4 "Quando la pompa si accende Arduino provvede ad emettere dei suoni "
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5DEB7096
P 9700 2150
F 0 "A?" H 9700 1064 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" V 9700 2000 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 9850 1200 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 9700 1150 50  0001 C CNN
	1    9700 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DEB74D1
P 8400 3050
F 0 "R?" H 8468 3096 50  0001 L CNN
F 1 "470" H 8468 3005 50  0000 L CNN
F 2 "" V 8440 3040 50  0001 C CNN
F 3 "~" H 8400 3050 50  0001 C CNN
	1    8400 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DEB73CD
P 8400 3400
F 0 "D?" V 8438 3282 50  0001 R CNN
F 1 "BlinkingLED" V 8347 3282 50  0000 R CNN
F 2 "" H 8400 3400 50  0001 C CNN
F 3 "~" H 8400 3400 50  0001 C CNN
	1    8400 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:Buzzer BZ?
U 1 1 5DEBAA3F
P 8000 3050
F 0 "BZ?" H 8050 3050 50  0001 C CNN
F 1 "Passive Buzzer" H 8000 2800 50  0000 C CNN
F 2 "" V 7975 3150 50  0001 C CNN
F 3 "~" V 7975 3150 50  0001 C CNN
	1    8000 3050
	-1   0    0    -1  
$EndComp
$Comp
L LnConnectors:CONN_02 J?
U 1 1 5DEBCAE0
P 11700 700
F 0 "J?" V 11703 1028 60  0001 L CNN
F 1 "220V" V 11600 800 60  0000 L CNN
F 2 "" H 11700 700 60  0000 C CNN
F 3 "" H 11700 700 60  0000 C CNN
	1    11700 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3200 8400 3250
Wire Notes Line
	14650 2700 14650 3000
Wire Notes Line
	14650 3000 15550 3000
Wire Notes Line
	15550 3000 15550 2700
Wire Notes Line
	15550 2700 14650 2700
Text Notes 14850 2900 0    50   ~ 0
PressControl
Wire Notes Line
	14650 3800 14650 4100
Wire Notes Line
	14650 4100 15550 4100
Wire Notes Line
	15550 4100 15550 3800
Wire Notes Line
	15550 3800 14650 3800
Text Notes 14850 4000 0    50   ~ 0
Pump
Wire Wire Line
	8100 3150 8100 3600
Wire Wire Line
	8400 3550 8400 3600
Text Label 8750 2750 0    50   ~ 0
Buzzer
Text Label 8750 2850 0    50   ~ 0
BlinkingLED
Wire Wire Line
	8100 2950 8100 2750
$Comp
L power:GND #PWR0101
U 1 1 5DF1F5E5
P 1950 1450
F 0 "#PWR0101" H 1950 1200 50  0001 C CNN
F 1 "GND" H 1955 1277 50  0000 C CNN
F 2 "" H 1950 1450 50  0001 C CNN
F 3 "" H 1950 1450 50  0001 C CNN
	1    1950 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1250 1950 1250
Wire Wire Line
	9700 3150 9700 3200
Wire Wire Line
	9700 3200 9800 3200
Wire Wire Line
	9800 3200 9800 3150
Connection ~ 9700 3200
Wire Wire Line
	9700 3200 9700 3600
$Comp
L LnConnectors:CONN_02 J?
U 1 1 5DF28262
P 950 1300
F 0 "J?" H 1006 1787 60  0001 C CNN
F 1 "220V" V 800 1500 60  0000 C CNN
F 2 "" H 950 1300 60  0000 C CNN
F 3 "" H 950 1300 60  0000 C CNN
	1    950  1300
	1    0    0    -1  
$EndComp
Text Notes 11800 6150 0    50   ~ 0
Celeste
Text Notes 11800 6250 0    50   ~ 0
Bianco/Celeste
Text Notes 11800 5950 0    50   ~ 0
Marrone
Text Notes 11800 6050 0    50   ~ 0
Bianco/Marrone
Text Notes 11800 5550 0    50   ~ 0
Arancio
Text Notes 11800 5650 0    50   ~ 0
Bianco/Arancio
Text Notes 11800 5750 0    50   ~ 0
Verde
Wire Wire Line
	15300 450  14550 450 
$Comp
L power:GNDA #PWR0104
U 1 1 5DF0F3FB
P 15050 4900
F 0 "#PWR0104" H 15050 4650 50  0001 C CNN
F 1 "GNDA" H 15055 4727 50  0000 C CNN
F 2 "" H 15050 4900 50  0001 C CNN
F 3 "" H 15050 4900 50  0001 C CNN
	1    15050 4900
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:sOnOff_Basic K?
U 1 1 5DEED482
P 7550 4450
F 0 "K?" H 7550 4892 50  0000 C CNN
F 1 "sOnOff_Basic" H 7550 4801 50  0000 C CNN
F 2 "sOnOff" H 7650 4225 25  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 7575 4275 50  0001 C CNN
	1    7550 4450
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09a MM3
U 1 1 5DF28D2C
P 12550 5950
F 0 "MM3" H 12500 6450 40  0000 L CNN
F 1 "Mammuth_09a" H 12678 5950 40  0001 L CNN
F 2 "" H 12575 6200 60  0000 C CNN
F 3 "" H 12575 6200 60  0000 C CNN
	1    12550 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:Speaker LS?
U 1 1 5DF4E72D
P 15250 4450
F 0 "LS?" H 15419 4446 50  0001 L CNN
F 1 "Horn" H 15419 4400 50  0000 L CNN
F 2 "" H 15250 4250 50  0001 C CNN
F 3 "~" H 15240 4400 50  0001 C CNN
	1    15250 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3600 8400 3600
Wire Wire Line
	8400 2900 8400 2850
Text Label 7850 1850 0    50   ~ 0
pressControlButton
Text Label 7850 1950 0    50   ~ 0
Horn
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F74E
P 8950 1700
F 0 "#SYM?" H 8950 1760 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 8960 1650 50  0001 C CNN
F 2 "" H 8950 1700 50  0001 C CNN
F 3 "~" H 8950 1700 50  0001 C CNN
	1    8950 1700
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F78F
P 9050 1800
F 0 "#SYM?" H 9050 1860 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 9060 1750 50  0001 C CNN
F 2 "" H 9050 1800 50  0001 C CNN
F 3 "~" H 9050 1800 50  0001 C CNN
	1    9050 1800
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F7A2
P 9050 1900
F 0 "#SYM?" H 9050 1960 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 9060 1850 50  0001 C CNN
F 2 "" H 9050 1900 50  0001 C CNN
F 3 "~" H 9050 1900 50  0001 C CNN
	1    9050 1900
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F801
P 8600 2700
F 0 "#SYM?" H 8600 2760 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 8610 2650 50  0001 C CNN
F 2 "" H 8600 2700 50  0001 C CNN
F 3 "~" H 8600 2700 50  0001 C CNN
	1    8600 2700
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F814
P 8600 2800
F 0 "#SYM?" H 8600 2860 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 8610 2750 50  0001 C CNN
F 2 "" H 8600 2800 50  0001 C CNN
F 3 "~" H 8600 2800 50  0001 C CNN
	1    8600 2800
	-1   0    0    -1  
$EndComp
Text Notes 700  4900 0    50   ~ 0
Il filo Arancio porta i 5Volt provenienti dalla cisterna. \nL'ho messo in questo modo per rendere indipendente\nil frutto del press control dala presenza di Arduino.
Text Notes 11800 5850 0    50   ~ 0
Bianco/Verde
$Comp
L LnDevice:PulsanteNO SW?
U 1 1 5DFEEB6E
P 1950 6250
F 0 "SW?" V 1800 6300 50  0001 C CNN
F 1 "PCButton" V 2050 6100 40  0000 C CNN
F 2 "" H 1950 6250 60  0000 C CNN
F 3 "" H 1950 6250 60  0000 C CNN
	1    1950 6250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFEEBE6
P 1000 5700
F 0 "D?" V 1038 5582 50  0001 R CNN
F 1 "PCState" V 1100 5800 50  0000 R CNN
F 2 "" H 1000 5700 50  0001 C CNN
F 3 "~" H 1000 5700 50  0001 C CNN
	1    1000 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1000 5450 1000 5550
Text Label 13200 2200 0    50   ~ 0
pc_button
Wire Wire Line
	15300 450  15300 2450
Wire Wire Line
	15100 550  15100 2250
Wire Wire Line
	15000 2250 15100 2250
Connection ~ 15100 2250
Wire Wire Line
	15100 2250 15100 2700
Wire Wire Line
	15000 2450 15300 2450
Connection ~ 15300 2450
Wire Wire Line
	15300 2450 15300 2700
Wire Wire Line
	1000 5100 1000 5150
Wire Wire Line
	1950 6400 1950 6300
Wire Wire Line
	1100 1050 1250 1050
Wire Wire Line
	1100 1150 1150 1150
Wire Wire Line
	1150 1150 1150 1250
Wire Wire Line
	1150 1250 1250 1250
$Comp
L Device:Buzzer BZ?
U 1 1 5E1B1006
P 1500 5500
F 0 "BZ?" H 1550 5500 50  0001 C CNN
F 1 "Active Buzzer" H 1450 5700 50  0000 C CNN
F 2 "" V 1475 5600 50  0001 C CNN
F 3 "~" V 1475 5600 50  0001 C CNN
	1    1500 5500
	-1   0    0    -1  
$EndComp
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5E20E831
P 1550 1150
F 0 "Al_5Vcc?" H 1700 950 40  0001 R CNN
F 1 "Alimentatore" H 1650 850 40  0001 R CNN
F 2 "5V Arduino" H 1550 1150 30  0000 C CNN
F 3 "" H 1550 1125 60  0000 C CNN
	1    1550 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5100 1600 5100
Text Notes 800  7250 0    50   ~ 0
Active Buzzer è messo come emergenza nel caso si dovesse rimuovere Arduino.\nSuona in modo continuo quando la pompa è accesa.\nIl jumper si trova dietro il frutto.
Wire Wire Line
	1600 5900 1600 5600
Connection ~ 1600 5100
Wire Wire Line
	1600 5100 1950 5100
Wire Wire Line
	2450 5100 2450 5800
Text Notes 11800 6350 0    50   ~ 0
Calza
$Comp
L LnDevice:Edge SW?
U 1 1 5E2F36EA
P 8750 1750
F 0 "SW?" H 8600 1850 70  0001 C CNN
F 1 "Edge" H 8750 1650 70  0001 C CNN
F 2 "" H 8750 1750 60  0000 C CNN
F 3 "" H 8750 1750 60  0000 C CNN
	1    8750 1750
	1    0    0    -1  
$EndComp
Wire Notes Line
	2900 5050 2900 6950
Wire Notes Line
	2900 6950 800  6950
Wire Notes Line
	800  6950 800  5050
Text Notes 1050 6900 0    50   ~ 0
Frutto del PressControl nel Quadro elettrico \ndel Salone
Wire Wire Line
	8100 2750 9200 2750
Wire Wire Line
	8400 2850 9200 2850
Connection ~ 8400 3600
Wire Wire Line
	14100 1000 14100 1600
Wire Wire Line
	14100 1600 13900 1600
Wire Wire Line
	15100 550  14550 550 
Wire Wire Line
	14300 1700 13900 1700
Wire Wire Line
	15050 4800 14950 4800
Wire Wire Line
	15050 4550 15050 4700
Wire Wire Line
	15050 4700 14950 4700
$Comp
L power:+5VA #PWR0105
U 1 1 5E0633D3
P 15050 4350
F 0 "#PWR0105" H 15050 4200 50  0001 C CNN
F 1 "+5VA" H 15065 4523 50  0000 C CNN
F 2 "" H 15050 4350 50  0001 C CNN
F 3 "" H 15050 4350 50  0001 C CNN
	1    15050 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	15100 3000 15100 3150
Wire Wire Line
	15300 3000 15300 3350
Wire Wire Line
	15050 3150 15100 3150
Connection ~ 15100 3150
Wire Wire Line
	15100 3150 15100 3800
Wire Wire Line
	15050 3350 15300 3350
Connection ~ 15300 3350
Wire Wire Line
	15300 3350 15300 3800
$Comp
L power:GNDA #PWR0106
U 1 1 5E0B7431
P 14300 3450
F 0 "#PWR0106" H 14300 3200 50  0001 C CNN
F 1 "GNDA" H 14305 3277 50  0000 C CNN
F 2 "" H 14300 3450 50  0001 C CNN
F 3 "" H 14300 3450 50  0001 C CNN
	1    14300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14650 3350 14300 3350
Wire Wire Line
	7250 1850 8600 1850
Wire Wire Line
	7150 1750 9200 1750
Text Label 7850 2050 0    50   ~ 0
ElettroValvola
Text Label 7850 1750 0    50   ~ 0
pump_ON
Text Label 12750 6150 0    50   ~ 0
pump_ON
Text Label 12750 6250 0    50   ~ 0
pressControl_ON
Text Label 12750 5850 0    50   ~ 0
pressControlButton
Text Label 12750 5750 0    50   ~ 0
Horn
Text Label 12750 5650 0    50   ~ 0
ElettroValvola
Wire Wire Line
	14300 3250 14650 3250
Wire Wire Line
	13500 4950 14250 4950
$Comp
L LnDevice:RELAY_1RT K?
U 1 1 5E252A8F
P 14800 2400
F 0 "K?" H 14800 2939 70  0001 C CNN
F 1 "RELAY_2RT" H 14800 2939 70  0001 C CNN
F 2 "" H 14800 2420 60  0000 C CNN
F 3 "" H 14800 2420 60  0000 C CNN
	1    14800 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	14300 1000 14300 1700
$Comp
L power:+5VA #PWR0109
U 1 1 5DFBEA28
P 13050 800
F 0 "#PWR0109" H 13050 650 50  0001 C CNN
F 1 "+5VA" H 13065 973 50  0000 C CNN
F 2 "" H 13050 800 50  0001 C CNN
F 3 "" H 13050 800 50  0001 C CNN
	1    13050 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0110
U 1 1 5DFBEA35
P 13050 1100
F 0 "#PWR0110" H 13050 850 50  0001 C CNN
F 1 "GNDA" H 13055 927 50  0000 C CNN
F 2 "" H 13050 1100 50  0001 C CNN
F 3 "" H 13050 1100 50  0001 C CNN
	1    13050 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 1050 13050 1050
Wire Wire Line
	13050 1050 13050 1100
Wire Wire Line
	13050 850  13050 800 
$Comp
L LnDevice:Relay_5V_LL_Dual RL?
U 1 1 5DFDEB51
P 13550 1700
F 0 "RL?" H 13550 2025 50  0001 C CNN
F 1 "Relay_5V_LL_Doppio" H 13550 2026 50  0001 C CNN
F 2 "" H 13550 1700 50  0001 C CNN
F 3 "" H 13550 1700 50  0001 C CNN
	1    13550 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	15050 4350 15050 4450
Wire Wire Line
	15050 4800 15050 4900
$Comp
L LnDevice:Relay_5V_LL_Dual RL?
U 2 1 5DFF5FF9
P 14600 4800
F 0 "RL?" H 14600 5217 50  0000 C CNN
F 1 "Relay_5V_LL_Doppio" H 14600 5126 50  0000 C CNN
F 2 "" H 14600 4800 50  0001 C CNN
F 3 "" H 14600 4800 50  0001 C CNN
	2    14600 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 6350 12750 6350
Wire Wire Line
	12750 6350 12750 6500
$Comp
L power:GNDA #PWR0111
U 1 1 5DFFBDDA
P 12750 6500
F 0 "#PWR0111" H 12750 6250 50  0001 C CNN
F 1 "GNDA" H 12755 6327 50  0000 C CNN
F 2 "" H 12750 6500 50  0001 C CNN
F 3 "" H 12750 6500 50  0001 C CNN
	1    12750 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0112
U 1 1 5E0110BE
P 14200 2350
F 0 "#PWR0112" H 14200 2100 50  0001 C CNN
F 1 "GNDA" H 14205 2177 50  0000 C CNN
F 2 "" H 14200 2350 50  0001 C CNN
F 3 "" H 14200 2350 50  0001 C CNN
	1    14200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 2350 14600 2350
Wire Wire Line
	14600 2450 14500 2450
Wire Wire Line
	1000 5850 1000 6000
Wire Wire Line
	1950 6100 1950 6200
Wire Wire Line
	1950 6400 2600 6400
Wire Wire Line
	14300 3350 14300 3450
Wire Wire Line
	1600 5900 1700 5900
Text Label 14300 3350 0    50   ~ 0
GNDA_1
Text Label 14200 2350 0    50   ~ 0
GNDA_2
Text Label 15050 4900 0    50   ~ 0
GNDA_3
Text Notes 2650 5800 0    50   ~ 0
Red
Text Notes 2650 5900 0    50   ~ 0
Yellow
Text Notes 2650 6000 0    50   ~ 0
White
Text Notes 2650 6100 0    50   ~ 0
Grey
Text Notes 2650 6200 0    50   ~ 0
Black
$Comp
L LnDevice:RELAY_1RT K?
U 1 1 5DFE2D63
P 14850 3300
F 0 "K?" H 14850 3839 70  0001 C CNN
F 1 "RELAY_2RT" H 14850 3839 70  0001 C CNN
F 2 "" H 14850 3320 60  0000 C CNN
F 3 "" H 14850 3320 60  0000 C CNN
	1    14850 3300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	11850 450  12150 450 
Wire Wire Line
	12250 550  11850 550 
$Comp
L Device:R R?
U 1 1 5DFF217C
P 8750 1850
F 0 "R?" V 8543 1850 50  0001 C CNN
F 1 "1K" V 8750 1850 50  0000 C CNN
F 2 "" V 8680 1850 50  0001 C CNN
F 3 "~" H 8750 1850 50  0001 C CNN
	1    8750 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DFF2270
P 1000 5300
F 0 "R?" V 793 5300 50  0001 C CNN
F 1 "470" V 1000 5300 50  0000 C CNN
F 2 "" V 930 5300 50  0001 C CNN
F 3 "~" H 1000 5300 50  0001 C CNN
	1    1000 5300
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5E00178D
P 1950 5700
F 0 "D?" V 1988 5582 50  0001 R CNN
F 1 "PumpState" V 2050 5800 50  0000 R CNN
F 2 "" H 1950 5700 50  0001 C CNN
F 3 "~" H 1950 5700 50  0001 C CNN
	1    1950 5700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E001794
P 1950 5300
F 0 "R?" V 1743 5300 50  0001 C CNN
F 1 "470" V 1950 5300 50  0000 C CNN
F 2 "" V 1880 5300 50  0001 C CNN
F 3 "~" H 1950 5300 50  0001 C CNN
	1    1950 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1600 5400 1600 5100
Wire Wire Line
	1950 5850 1950 5900
Wire Wire Line
	1950 5450 1950 5550
Wire Wire Line
	1950 5100 1950 5150
Connection ~ 1950 5100
Wire Wire Line
	1950 5100 2450 5100
$Comp
L LnConnectors:JUMPER JP?
U 1 1 5E0960EC
P 1750 5900
F 0 "JP?" H 1600 5925 60  0001 C CNN
F 1 "JUMPER" H 1650 5800 40  0001 C CNN
F 2 "" H 1750 5925 60  0000 C CNN
F 3 "" H 1750 5925 60  0000 C CNN
	1    1750 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5900 1950 5900
Wire Wire Line
	9900 1050 9900 1150
$Comp
L power:+5V #PWR?
U 1 1 5E0C7A38
P 1950 1000
F 0 "#PWR?" H 1950 850 50  0001 C CNN
F 1 "+5V" H 1965 1173 50  0000 C CNN
F 2 "" H 1950 1000 50  0001 C CNN
F 3 "" H 1950 1000 50  0001 C CNN
	1    1950 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1050 1950 1050
Wire Wire Line
	2600 6400 2600 6200
Text Notes 4600 6800 0    50   ~ 0
Il mammuth MM2x va posizionato in parallelo ad MM1\ne porta tutti i fili doppi
$Comp
L power:+5VA #PWR?
U 1 1 5E0916E7
P 12750 5400
F 0 "#PWR?" H 12750 5250 50  0001 C CNN
F 1 "+5VA" H 12765 5573 50  0000 C CNN
F 2 "" H 12750 5400 50  0001 C CNN
F 3 "" H 12750 5400 50  0001 C CNN
	1    12750 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 5550 12750 5550
Wire Wire Line
	12750 5550 12750 5400
Wire Wire Line
	8400 3600 9700 3600
Wire Notes Line
	800  5050 2900 5050
Wire Notes Line
	6700 850  6700 3650
Wire Notes Line
	6700 3650 10400 3650
Wire Notes Line
	10400 3650 10400 850 
Wire Notes Line
	10400 850  6700 850 
Text Notes 6900 1050 0    50   ~ 0
Frutto contenente Arduino nel Quadro elettrico \ndel Salone
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5E236824
P 2450 1200
F 0 "J?" H 2478 1180 50  0001 L CNN
F 1 "Conn_01x05_Female" H 2477 1135 50  0001 L CNN
F 2 "" H 2450 1200 50  0001 C CNN
F 3 "~" H 2450 1200 50  0001 C CNN
	1    2450 1200
	1    0    0    1   
$EndComp
Wire Wire Line
	8900 1850 9200 1850
Wire Wire Line
	1950 1050 1950 1100
Connection ~ 1950 1050
Wire Wire Line
	1950 1250 1950 1200
Connection ~ 1950 1250
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5E268A05
P 6400 1400
F 0 "J?" H 6428 1380 50  0001 L CNN
F 1 "Conn_01x05_Female" H 6427 1335 50  0001 L CNN
F 2 "" H 6400 1400 50  0001 C CNN
F 3 "~" H 6400 1400 50  0001 C CNN
	1    6400 1400
	1    0    0    1   
$EndComp
Wire Wire Line
	9700 3600 10350 3600
Wire Wire Line
	10350 3600 10350 950 
Connection ~ 9700 3600
Wire Wire Line
	1950 1250 1950 1450
Wire Wire Line
	1950 1050 1950 1000
Wire Wire Line
	1950 1200 2250 1200
Wire Wire Line
	1950 1100 2250 1100
Wire Wire Line
	8100 3600 7550 3600
Connection ~ 8100 3600
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5DF2F833
P 12650 950
F 0 "Al_5Vcc?" H 12800 750 40  0001 R CNN
F 1 "Alimentatore" H 12750 650 40  0001 R CNN
F 2 "5V pressControl" H 12650 900 30  0000 C CNN
F 3 "" H 12650 925 60  0000 C CNN
	1    12650 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1950 9200 1950
Wire Wire Line
	7450 2050 9200 2050
$EndSCHEMATC
