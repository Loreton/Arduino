EESchema Schematic File Version 4
LIBS:Allarme_Pompa-cache
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
P 5750 1950
F 0 "A?" H 5750 864 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" V 5750 1800 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5900 1000 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5750 950 50  0001 C CNN
	1    5750 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DEB74D1
P 4450 2850
F 0 "R?" H 4518 2896 50  0001 L CNN
F 1 "470" H 4518 2805 50  0000 L CNN
F 2 "" V 4490 2840 50  0001 C CNN
F 3 "~" H 4450 2850 50  0001 C CNN
	1    4450 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DEB73CD
P 4450 3200
F 0 "D?" V 4488 3082 50  0001 R CNN
F 1 "BlinkingLED" V 4397 3082 50  0000 R CNN
F 2 "" H 4450 3200 50  0001 C CNN
F 3 "~" H 4450 3200 50  0001 C CNN
	1    4450 3200
	0    -1   -1   0   
$EndComp
$Comp
L Device:Buzzer BZ?
U 1 1 5DEBAA3F
P 4050 2850
F 0 "BZ?" H 4100 2850 50  0001 C CNN
F 1 "Passive Buzzer" H 4050 2600 50  0000 C CNN
F 2 "" V 4025 2950 50  0001 C CNN
F 3 "~" V 4025 2950 50  0001 C CNN
	1    4050 2850
	-1   0    0    -1  
$EndComp
$Comp
L LnConnectors:CONN_02 J?
U 1 1 5DEBCAE0
P 7100 1300
F 0 "J?" V 7103 1628 60  0001 L CNN
F 1 "220V" V 7000 1400 60  0000 L CNN
F 2 "" H 7100 1300 60  0000 C CNN
F 3 "" H 7100 1300 60  0000 C CNN
	1    7100 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3000 4450 3050
Wire Notes Line
	10050 3300 10050 3600
Wire Notes Line
	10050 3600 10950 3600
Wire Notes Line
	10950 3600 10950 3300
Wire Notes Line
	10950 3300 10050 3300
Text Notes 10250 3500 0    50   ~ 0
PressControl
Wire Notes Line
	10050 4400 10050 4700
Wire Notes Line
	10050 4700 10950 4700
Wire Notes Line
	10950 4700 10950 4400
Wire Notes Line
	10950 4400 10050 4400
Text Notes 10250 4600 0    50   ~ 0
Pump
Wire Wire Line
	4150 2950 4150 3400
Wire Wire Line
	4450 3350 4450 3400
Text Label 4800 2550 0    50   ~ 0
Buzzer
Text Label 4800 2650 0    50   ~ 0
BlinkingLED
Wire Wire Line
	4150 2750 4150 2550
$Comp
L power:GND #PWR0101
U 1 1 5DF1F5E5
P 1950 3900
F 0 "#PWR0101" H 1950 3650 50  0001 C CNN
F 1 "GND" H 1955 3727 50  0000 C CNN
F 2 "" H 1950 3900 50  0001 C CNN
F 3 "" H 1950 3900 50  0001 C CNN
	1    1950 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3700 1950 3700
Wire Wire Line
	1950 3700 1950 3900
$Comp
L power:GND #PWR0103
U 1 1 5DF22BEF
P 3600 4000
F 0 "#PWR0103" H 3600 3750 50  0001 C CNN
F 1 "GND" H 3750 3950 50  0000 C CNN
F 2 "" H 3600 4000 50  0001 C CNN
F 3 "" H 3600 4000 50  0001 C CNN
	1    3600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2950 5750 3000
Wire Wire Line
	5750 3000 5850 3000
Wire Wire Line
	5850 3000 5850 2950
Connection ~ 5750 3000
Wire Wire Line
	5750 3000 5750 3400
$Comp
L LnConnectors:CONN_02 J?
U 1 1 5DF28262
P 950 3750
F 0 "J?" H 1006 4237 60  0001 C CNN
F 1 "220V" V 800 3950 60  0000 C CNN
F 2 "" H 950 3750 60  0000 C CNN
F 3 "" H 950 3750 60  0000 C CNN
	1    950  3750
	1    0    0    -1  
$EndComp
Text Notes 6750 3600 0    50   ~ 0
Celeste
Text Notes 6750 3700 0    50   ~ 0
Bianco/Celeste
Text Notes 6750 3400 0    50   ~ 0
Marrone
Text Notes 6750 3500 0    50   ~ 0
Bianco/Marrone
Text Notes 6750 3000 0    50   ~ 0
Arancio
Text Notes 6750 3100 0    50   ~ 0
Bianco/Arancio
Text Notes 6750 3200 0    50   ~ 0
Verde
Wire Wire Line
	10700 1050 9950 1050
$Comp
L power:GNDA #PWR0104
U 1 1 5DF0F3FB
P 10450 5500
F 0 "#PWR0104" H 10450 5250 50  0001 C CNN
F 1 "GNDA" H 10455 5327 50  0000 C CNN
F 2 "" H 10450 5500 50  0001 C CNN
F 3 "" H 10450 5500 50  0001 C CNN
	1    10450 5500
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:sOnOff_Basic K?
U 1 1 5DEED482
P 9600 1250
F 0 "K?" H 9600 1692 50  0000 C CNN
F 1 "sOnOff_Basic" H 9600 1601 50  0000 C CNN
F 2 "sOnOff" H 9700 1025 25  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 9625 1075 50  0001 C CNN
	1    9600 1250
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09a MM3
U 1 1 5DF28D2C
P 7500 3400
F 0 "MM3" H 7450 3900 40  0000 L CNN
F 1 "Mammuth_09a" H 7628 3400 40  0001 L CNN
F 2 "" H 7525 3650 60  0000 C CNN
F 3 "" H 7525 3650 60  0000 C CNN
	1    7500 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:Speaker LS?
U 1 1 5DF4E72D
P 10650 5050
F 0 "LS?" H 10819 5046 50  0001 L CNN
F 1 "Horn" H 10819 5000 50  0000 L CNN
F 2 "" H 10650 4850 50  0001 C CNN
F 3 "~" H 10640 5000 50  0001 C CNN
	1    10650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3400 4450 3400
Wire Wire Line
	4450 2700 4450 2650
Text Label 3900 1650 0    50   ~ 0
pressControlButton
Text Label 3900 1750 0    50   ~ 0
Horn
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F74E
P 5000 1500
F 0 "#SYM?" H 5000 1560 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5010 1450 50  0001 C CNN
F 2 "" H 5000 1500 50  0001 C CNN
F 3 "~" H 5000 1500 50  0001 C CNN
	1    5000 1500
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F78F
P 5100 1600
F 0 "#SYM?" H 5100 1660 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5110 1550 50  0001 C CNN
F 2 "" H 5100 1600 50  0001 C CNN
F 3 "~" H 5100 1600 50  0001 C CNN
	1    5100 1600
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F7A2
P 5100 1700
F 0 "#SYM?" H 5100 1760 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5110 1650 50  0001 C CNN
F 2 "" H 5100 1700 50  0001 C CNN
F 3 "~" H 5100 1700 50  0001 C CNN
	1    5100 1700
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F801
P 4650 2500
F 0 "#SYM?" H 4650 2560 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4660 2450 50  0001 C CNN
F 2 "" H 4650 2500 50  0001 C CNN
F 3 "~" H 4650 2500 50  0001 C CNN
	1    4650 2500
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F814
P 4650 2600
F 0 "#SYM?" H 4650 2660 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4660 2550 50  0001 C CNN
F 2 "" H 4650 2600 50  0001 C CNN
F 3 "~" H 4650 2600 50  0001 C CNN
	1    4650 2600
	-1   0    0    -1  
$EndComp
Entry Wire Line
	6600 3100 6700 3000
Entry Wire Line
	6600 3200 6700 3100
Entry Wire Line
	6600 3400 6700 3300
Entry Wire Line
	6600 3800 6700 3700
Entry Wire Line
	6600 3600 6700 3500
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5DF2F833
P 8050 1550
F 0 "Al_5Vcc?" H 8200 1350 40  0001 R CNN
F 1 "Alimentatore" H 8150 1250 40  0001 R CNN
F 2 "5V pressControl" H 8050 1500 30  0000 C CNN
F 3 "" H 8050 1525 60  0000 C CNN
	1    8050 1550
	1    0    0    -1  
$EndComp
Text Notes 700  4900 0    50   ~ 0
Il filo Arancio porta i 5Volt provenienti dalla cisterna. \nL'ho messo in questo modo per rendere indipendente\nil frutto del press control dala presenza di Arduino.
Text Notes 6750 3300 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	6700 3700 7500 3700
Entry Wire Line
	6500 5800 6600 5900
Entry Wire Line
	6500 5500 6600 5600
Entry Wire Line
	6500 5200 6600 5300
Entry Wire Line
	6500 5000 6600 5100
Entry Wire Line
	6500 4900 6600 5000
Entry Wire Line
	6500 5100 6600 5200
Entry Wire Line
	6500 5400 6600 5500
Entry Wire Line
	6500 5600 6600 5700
Entry Wire Line
	6600 3700 6700 3600
Entry Wire Line
	6600 3500 6700 3400
Entry Wire Line
	6600 3300 6700 3200
Wire Wire Line
	6700 3400 7500 3400
Wire Wire Line
	6700 3600 7500 3600
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
Text Label 8600 2800 0    50   ~ 0
pc_button
Wire Wire Line
	10700 1050 10700 3050
Wire Wire Line
	10500 1150 10500 2850
Wire Wire Line
	10400 2850 10500 2850
Connection ~ 10500 2850
Wire Wire Line
	10500 2850 10500 3300
Wire Wire Line
	10400 3050 10700 3050
Connection ~ 10700 3050
Wire Wire Line
	10700 3050 10700 3300
Wire Wire Line
	1000 5100 1000 5150
Wire Wire Line
	1950 6400 1950 6300
Wire Wire Line
	1100 3500 1250 3500
Wire Wire Line
	1100 3600 1150 3600
Wire Wire Line
	1150 3600 1150 3700
Wire Wire Line
	1150 3700 1250 3700
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
P 1550 3600
F 0 "Al_5Vcc?" H 1700 3400 40  0001 R CNN
F 1 "Alimentatore" H 1650 3300 40  0001 R CNN
F 2 "5V Arduino" H 1550 3600 30  0000 C CNN
F 3 "" H 1550 3575 60  0000 C CNN
	1    1550 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1000 5100 1600 5100
Text Notes 800  7250 0    50   ~ 0
Active Buzzer è messo come emergenza nel caso si dovesse rimuovere Arduino.\nSuona in modo continuo quando la pompa è accesa.\nIl jumper si trova dietro il frutto.
Wire Wire Line
	7500 3500 6700 3500
Wire Wire Line
	1600 5900 1600 5600
Connection ~ 1600 5100
Wire Wire Line
	1600 5100 1950 5100
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5DF8639E
P 3150 6000
F 0 "J?" H 3122 5977 50  0001 R CNN
F 1 "Conn_01x05_Male" H 3123 5932 50  0001 R CNN
F 2 "" H 3150 6000 50  0001 C CNN
F 3 "~" H 3150 6000 50  0001 C CNN
	1    3150 6000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x05_Female J?
U 1 1 5DF863AD
P 3150 6000
F 0 "J?" H 3178 5980 50  0001 L CNN
F 1 "Conn_01x05_Female" H 3177 5935 50  0001 L CNN
F 2 "" H 3150 6000 50  0001 C CNN
F 3 "~" H 3150 6000 50  0001 C CNN
	1    3150 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 5100 2450 5800
Wire Wire Line
	2450 5800 2950 5800
Entry Wire Line
	6600 3900 6700 3800
Entry Wire Line
	6500 5900 6600 6000
Text Notes 6750 3800 0    50   ~ 0
Calza
Text Label 4450 5700 0    50   ~ 0
pump_ON
Text Label 4400 5800 0    50   ~ 0
pressControl_ON
$Comp
L LnDevice:Edge SW?
U 1 1 5E2F36EA
P 4800 1550
F 0 "SW?" H 4650 1650 70  0001 C CNN
F 1 "Edge" H 4800 1450 70  0001 C CNN
F 2 "" H 4800 1550 60  0000 C CNN
F 3 "" H 4800 1550 60  0000 C CNN
	1    4800 1550
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
	4150 2550 5250 2550
Wire Wire Line
	4450 2650 5250 2650
Connection ~ 4450 3400
Wire Wire Line
	9500 1600 9500 2200
Wire Wire Line
	9500 2200 9300 2200
Wire Wire Line
	10500 1150 9950 1150
Wire Wire Line
	9700 2300 9300 2300
Wire Wire Line
	10450 5400 10350 5400
Wire Wire Line
	10450 5150 10450 5300
Wire Wire Line
	10450 5300 10350 5300
$Comp
L power:+5VA #PWR0105
U 1 1 5E0633D3
P 10450 4950
F 0 "#PWR0105" H 10450 4800 50  0001 C CNN
F 1 "+5VA" H 10465 5123 50  0000 C CNN
F 2 "" H 10450 4950 50  0001 C CNN
F 3 "" H 10450 4950 50  0001 C CNN
	1    10450 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 3600 10500 3750
Wire Wire Line
	10700 3600 10700 3950
Wire Wire Line
	10450 3750 10500 3750
Connection ~ 10500 3750
Wire Wire Line
	10500 3750 10500 4400
Wire Wire Line
	10450 3950 10700 3950
Connection ~ 10700 3950
Wire Wire Line
	10700 3950 10700 4400
$Comp
L power:GNDA #PWR0106
U 1 1 5E0B7431
P 9700 4050
F 0 "#PWR0106" H 9700 3800 50  0001 C CNN
F 1 "GNDA" H 9705 3877 50  0000 C CNN
F 2 "" H 9700 4050 50  0001 C CNN
F 3 "" H 9700 4050 50  0001 C CNN
	1    9700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3950 9700 3950
Text Label 4450 5200 0    50   ~ 0
pressControlButton
Wire Wire Line
	3500 1850 5250 1850
Wire Wire Line
	3400 1750 5250 1750
Wire Wire Line
	3300 1650 4650 1650
Wire Wire Line
	3200 1550 5250 1550
Text Label 3900 1850 0    50   ~ 0
ElettroValvola
Wire Wire Line
	7500 3300 6700 3300
Wire Wire Line
	6700 3200 7500 3200
Wire Wire Line
	6700 3100 7500 3100
Wire Wire Line
	6700 3000 7500 3000
Text Notes 5750 5600 0    50   ~ 0
Celeste
Text Notes 5750 5800 0    50   ~ 0
Bianco/Celeste
Text Notes 5750 5400 0    50   ~ 0
Marrone
Text Notes 5750 5500 0    50   ~ 0
Bianco/Marrone
Text Notes 5750 4900 0    50   ~ 0
Arancio
Text Notes 5750 5000 0    50   ~ 0
Bianco/Arancio
Text Notes 5750 5100 0    50   ~ 0
Verde
Text Notes 5750 5200 0    50   ~ 0
Bianco/Verde
Text Notes 5750 5900 0    50   ~ 0
Calza
Text Label 4450 5100 0    50   ~ 0
Horn
Text Label 4450 5000 0    50   ~ 0
ElettroValvola
Text Label 3900 1550 0    50   ~ 0
pump_ON
Text Label 7700 3600 0    50   ~ 0
pump_ON
Text Label 7700 3700 0    50   ~ 0
pressControl_ON
Text Label 7700 3300 0    50   ~ 0
pressControlButton
Text Label 7700 3200 0    50   ~ 0
Horn
Text Label 7700 3100 0    50   ~ 0
ElettroValvola
Wire Wire Line
	9700 3850 10050 3850
Wire Wire Line
	8900 5550 9650 5550
$Comp
L LnDevice:RELAY_1RT K?
U 1 1 5E252A8F
P 10200 3000
F 0 "K?" H 10200 3539 70  0001 C CNN
F 1 "RELAY_2RT" H 10200 3539 70  0001 C CNN
F 2 "" H 10200 3020 60  0000 C CNN
F 3 "" H 10200 3020 60  0000 C CNN
	1    10200 3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9700 1600 9700 2300
$Comp
L power:+5VA #PWR0109
U 1 1 5DFBEA28
P 8450 1400
F 0 "#PWR0109" H 8450 1250 50  0001 C CNN
F 1 "+5VA" H 8465 1573 50  0000 C CNN
F 2 "" H 8450 1400 50  0001 C CNN
F 3 "" H 8450 1400 50  0001 C CNN
	1    8450 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0110
U 1 1 5DFBEA35
P 8450 1700
F 0 "#PWR0110" H 8450 1450 50  0001 C CNN
F 1 "GNDA" H 8455 1527 50  0000 C CNN
F 2 "" H 8450 1700 50  0001 C CNN
F 3 "" H 8450 1700 50  0001 C CNN
	1    8450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1650 8450 1650
Wire Wire Line
	8450 1650 8450 1700
Wire Wire Line
	8350 1450 8450 1450
Wire Wire Line
	8450 1450 8450 1400
$Comp
L LnDevice:Relay_5V_LL_Dual RL?
U 1 1 5DFDEB51
P 8950 2300
F 0 "RL?" H 8950 2625 50  0001 C CNN
F 1 "Relay_5V_LL_Doppio" H 8950 2626 50  0001 C CNN
F 2 "" H 8950 2300 50  0001 C CNN
F 3 "" H 8950 2300 50  0001 C CNN
	1    8950 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4950 10450 5050
Wire Wire Line
	10450 5400 10450 5500
$Comp
L LnDevice:Relay_5V_LL_Dual RL?
U 2 1 5DFF5FF9
P 10000 5400
F 0 "RL?" H 10000 5817 50  0000 C CNN
F 1 "Relay_5V_LL_Doppio" H 10000 5726 50  0000 C CNN
F 2 "" H 10000 5400 50  0001 C CNN
F 3 "" H 10000 5400 50  0001 C CNN
	2    10000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3800 7700 3800
Wire Wire Line
	7700 3800 7700 3950
Connection ~ 7500 3800
Wire Wire Line
	6700 3800 7500 3800
$Comp
L power:GNDA #PWR0111
U 1 1 5DFFBDDA
P 7700 3950
F 0 "#PWR0111" H 7700 3700 50  0001 C CNN
F 1 "GNDA" H 7705 3777 50  0000 C CNN
F 2 "" H 7700 3950 50  0001 C CNN
F 3 "" H 7700 3950 50  0001 C CNN
	1    7700 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0112
U 1 1 5E0110BE
P 9600 2950
F 0 "#PWR0112" H 9600 2700 50  0001 C CNN
F 1 "GNDA" H 9605 2777 50  0000 C CNN
F 2 "" H 9600 2950 50  0001 C CNN
F 3 "" H 9600 2950 50  0001 C CNN
	1    9600 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 2950 10000 2950
Wire Wire Line
	10000 3050 9900 3050
Wire Wire Line
	1000 5850 1000 6000
Wire Wire Line
	1950 6100 1950 6200
Wire Wire Line
	1950 6400 2600 6400
Wire Wire Line
	4150 6000 3350 6000
Wire Wire Line
	8600 2450 8600 3300
Wire Wire Line
	8600 3300 7500 3300
Connection ~ 7500 3300
Wire Wire Line
	7500 3200 8900 3200
Wire Wire Line
	8900 3200 8900 5550
Connection ~ 7500 3200
Wire Wire Line
	9700 3950 9700 4050
Wire Wire Line
	1600 5900 1700 5900
Wire Wire Line
	7500 3700 9900 3700
Wire Wire Line
	9900 3050 9900 3700
Connection ~ 7500 3700
Wire Wire Line
	7500 3600 9700 3600
Wire Wire Line
	9700 3600 9700 3850
Connection ~ 7500 3600
Text Label 9700 3950 0    50   ~ 0
GNDA_1
Text Label 9600 2950 0    50   ~ 0
GNDA_2
Text Label 10450 5500 0    50   ~ 0
GNDA_3
Wire Wire Line
	3300 1650 3300 3550
Wire Wire Line
	3400 1750 3400 3550
Wire Wire Line
	3500 1850 3500 3550
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
Text Notes 3700 5800 0    50   ~ 0
Red
Text Notes 3750 6000 0    50   ~ 0
White
Text Notes 3750 6100 0    50   ~ 0
Grey
$Comp
L LnDevice:RELAY_1RT K?
U 1 1 5DFE2D63
P 10250 3900
F 0 "K?" H 10250 4439 70  0001 C CNN
F 1 "RELAY_2RT" H 10250 4439 70  0001 C CNN
F 2 "" H 10250 3920 60  0000 C CNN
F 3 "" H 10250 3920 60  0000 C CNN
	1    10250 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7250 1050 7550 1050
Wire Wire Line
	9250 1150 7650 1150
Wire Wire Line
	7750 1450 7650 1450
Wire Wire Line
	7650 1450 7650 1150
Connection ~ 7650 1150
Wire Wire Line
	7650 1150 7250 1150
Wire Wire Line
	7750 1650 7550 1650
Wire Wire Line
	7550 1650 7550 1050
Connection ~ 7550 1050
Wire Wire Line
	7550 1050 9250 1050
Wire Wire Line
	1950 6100 2950 6100
$Comp
L Device:R R?
U 1 1 5DFF217C
P 4800 1650
F 0 "R?" V 4593 1650 50  0001 C CNN
F 1 "1K" V 4800 1650 50  0000 C CNN
F 2 "" V 4730 1650 50  0001 C CNN
F 3 "~" H 4800 1650 50  0001 C CNN
	1    4800 1650
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
Connection ~ 1950 5900
Wire Wire Line
	1950 5900 2950 5900
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
	1000 6000 2950 6000
Wire Wire Line
	5950 850  5950 950 
$Comp
L power:+5V #PWR?
U 1 1 5E0C7A38
P 1950 3450
F 0 "#PWR?" H 1950 3300 50  0001 C CNN
F 1 "+5V" H 1965 3623 50  0000 C CNN
F 2 "" H 1950 3450 50  0001 C CNN
F 3 "" H 1950 3450 50  0001 C CNN
	1    1950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3500 1950 3500
Wire Wire Line
	1950 3500 1950 3450
$Comp
L power:+5V #PWR?
U 1 1 5E0CE8D4
P 5600 3950
F 0 "#PWR?" H 5600 3800 50  0001 C CNN
F 1 "+5V" H 5615 4123 50  0000 C CNN
F 2 "" H 5600 3950 50  0001 C CNN
F 3 "" H 5600 3950 50  0001 C CNN
	1    5600 3950
	1    0    0    -1  
$EndComp
Text Label 3600 3400 0    50   ~ 0
GND_Arduino
Text Label 4950 850  0    50   ~ 0
+5Vcc_Arduino
Text Label 4700 4150 0    50   ~ 0
+5Vcc_Arduino
Wire Wire Line
	2600 6400 2600 6200
Wire Wire Line
	2600 6200 2950 6200
Wire Wire Line
	5600 3950 5600 4150
Wire Wire Line
	5600 4150 5600 4250
Connection ~ 5600 4150
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 2 1 5E19A9F8
P 5400 4250
F 0 "MM?" H 5450 4400 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 4350 40  0001 C CNN
F 2 "" H 5425 4100 60  0000 C CNN
F 3 "" H 5425 4100 60  0000 C CNN
	2    5400 4250
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09_sep MM2
U 1 1 5E19AA28
P 5400 4150
F 0 "MM2" H 5300 4250 40  0000 L CNN
F 1 "Mammuth_09_sep" H 5450 4250 40  0001 C CNN
F 2 "" H 5425 4000 60  0000 C CNN
F 3 "" H 5425 4000 60  0000 C CNN
	1    5400 4150
	1    0    0    -1  
$EndComp
Connection ~ 5400 4150
Wire Wire Line
	5400 4150 5600 4150
Wire Wire Line
	5400 4250 5600 4250
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 3 1 5E19AB9A
P 5400 4350
F 0 "MM?" H 5450 4500 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 4450 40  0001 C CNN
F 2 "" H 5425 4200 60  0000 C CNN
F 3 "" H 5425 4200 60  0000 C CNN
	3    5400 4350
	1    0    0    -1  
$EndComp
Text Notes 4600 6800 0    50   ~ 0
Il mammuth MM2x va posizionato in parallelo ad MM1\ne porta tutti i fili doppi
$Comp
L power:+5VA #PWR?
U 1 1 5E0916E7
P 7700 2850
F 0 "#PWR?" H 7700 2700 50  0001 C CNN
F 1 "+5VA" H 7715 3023 50  0000 C CNN
F 2 "" H 7700 2850 50  0001 C CNN
F 3 "" H 7700 2850 50  0001 C CNN
	1    7700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3000 7700 3000
Wire Wire Line
	7700 3000 7700 2850
Connection ~ 7500 3000
Wire Wire Line
	3350 5900 3950 5900
Text Label 4450 4900 0    50   ~ 0
(+5Vcc)
Wire Wire Line
	3350 5800 3850 5800
Text Notes 3650 5900 0    50   ~ 0
Yellow
Text Notes 3750 6200 0    50   ~ 0
Black
Wire Wire Line
	3200 1550 3200 3550
Text Label 4450 5600 0    50   ~ 0
pump_ON
Text Label 4450 5300 0    50   ~ 0
pressControlButton
Wire Wire Line
	3350 6100 4050 6100
Wire Wire Line
	3350 6200 4150 6200
$Comp
L LnDevice:Pulse SW?
U 1 1 5E1869F0
P 5000 5600
F 0 "SW?" H 4850 5700 70  0001 C CNN
F 1 "Pulse" H 5000 5500 70  0001 C CNN
F 2 "" H 5000 5600 60  0000 C CNN
F 3 "" H 5000 5600 60  0000 C CNN
	1    5000 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3400 5750 3400
Wire Wire Line
	5400 4350 5600 4350
Wire Wire Line
	5600 4350 5600 4250
Connection ~ 5600 4250
Wire Notes Line
	800  5050 2900 5050
Wire Notes Line
	2750 650  2750 3450
Wire Notes Line
	2750 3450 6450 3450
Wire Notes Line
	6450 3450 6450 650 
Wire Notes Line
	6450 650  2750 650 
Text Notes 2950 850  0    50   ~ 0
Frutto contenente Arduino nel Quadro elettrico \ndel Salone
Wire Wire Line
	4150 3400 3600 3400
Wire Wire Line
	3600 3400 3600 3550
Connection ~ 4150 3400
Wire Wire Line
	5950 850  3100 850 
Text Label 3100 3350 1    50   ~ 0
+5Vcc_Arduino
Wire Wire Line
	3100 4150 5400 4150
Wire Wire Line
	3100 850  3100 3550
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5E23680F
P 3300 3750
F 0 "J?" H 3272 3727 50  0001 R CNN
F 1 "Conn_01x05_Male" H 3273 3682 50  0001 R CNN
F 2 "" H 3300 3750 50  0001 C CNN
F 3 "~" H 3300 3750 50  0001 C CNN
	1    3300 3750
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5E236824
P 2150 3650
F 0 "J?" H 2178 3630 50  0001 L CNN
F 1 "Conn_01x05_Female" H 2177 3585 50  0001 L CNN
F 2 "" H 2150 3650 50  0001 C CNN
F 3 "~" H 2150 3650 50  0001 C CNN
	1    2150 3650
	1    0    0    1   
$EndComp
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5E2368F5
P 3300 3750
F 0 "J?" H 3272 3727 50  0001 R CNN
F 1 "Conn_01x05_Male" H 3273 3682 50  0001 R CNN
F 2 "" H 3300 3750 50  0001 C CNN
F 3 "~" H 3300 3750 50  0001 C CNN
	1    3300 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 3950 3100 4150
Wire Wire Line
	3200 3950 3200 5600
Wire Wire Line
	3300 3950 3300 5200
Wire Wire Line
	3400 3950 3400 5100
Wire Wire Line
	3500 3950 3500 5000
Wire Wire Line
	3600 3950 3600 4000
Wire Wire Line
	4950 1650 5250 1650
Wire Wire Line
	1950 3500 1950 3550
Connection ~ 1950 3500
Wire Wire Line
	1950 3700 1950 3650
Connection ~ 1950 3700
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5E268A05
P 2150 3650
F 0 "J?" H 2178 3630 50  0001 L CNN
F 1 "Conn_01x05_Female" H 2177 3585 50  0001 L CNN
F 2 "" H 2150 3650 50  0001 C CNN
F 3 "~" H 2150 3650 50  0001 C CNN
	1    2150 3650
	1    0    0    1   
$EndComp
Text Label 4800 6150 0    50   ~ 0
GND_Arduino
$Comp
L power:GND #PWR0107
U 1 1 5E144718
P 5250 5900
F 0 "#PWR0107" H 5250 5650 50  0001 C CNN
F 1 "GND" H 5100 5800 50  0000 C CNN
F 2 "" H 5250 5900 50  0001 C CNN
F 3 "" H 5250 5900 50  0001 C CNN
	1    5250 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6250 4150 6200
Wire Wire Line
	4150 5800 4150 6000
Wire Wire Line
	3950 5900 3950 5700
Wire Wire Line
	3850 5800 3850 4900
Wire Wire Line
	4050 6100 4050 5300
Wire Wire Line
	5750 5900 6500 5900
Wire Wire Line
	6500 5600 5700 5600
Wire Wire Line
	5700 5200 6500 5200
Wire Wire Line
	5750 6150 5750 5900
Wire Wire Line
	5700 5700 5700 5600
Wire Wire Line
	5700 5300 5700 5200
Connection ~ 5750 5900
Connection ~ 5700 5600
Connection ~ 5700 5200
Wire Wire Line
	4800 6150 5400 6150
Connection ~ 5400 6150
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 6 1 5E1BA5CB
P 5400 6150
F 0 "MM?" H 5450 6300 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 6250 40  0001 C CNN
F 2 "" H 5425 6000 60  0000 C CNN
F 3 "" H 5425 6000 60  0000 C CNN
	6    5400 6150
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09_sep MM2
U 4 1 5E1B1C08
P 5400 5300
F 0 "MM2" H 5450 5450 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 5400 40  0001 C CNN
F 2 "" H 5425 5150 60  0000 C CNN
F 3 "" H 5425 5150 60  0000 C CNN
	4    5400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5400 6500 5400
Wire Wire Line
	5400 5300 5700 5300
Wire Wire Line
	5550 5500 6500 5500
Wire Wire Line
	5250 5900 5550 5900
Wire Wire Line
	5550 5900 5750 5900
Connection ~ 5550 5900
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 9 1 5E0B5BFD
P 5550 5900
F 0 "MM?" H 5600 6050 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 6000 40  0001 C CNN
F 2 "" H 5575 5750 60  0000 C CNN
F 3 "" H 5575 5750 60  0000 C CNN
	9    5550 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5800 4150 5800
Wire Wire Line
	5550 5800 6500 5800
Connection ~ 5550 5800
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 8 1 5E0B5BCC
P 5550 5800
F 0 "MM?" H 5600 5950 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5900 40  0001 C CNN
F 2 "" H 5575 5650 60  0000 C CNN
F 3 "" H 5575 5650 60  0000 C CNN
	8    5550 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5600 3200 5600
Wire Wire Line
	5700 5600 5550 5600
Connection ~ 5550 5600
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 7 1 5E0B5B9B
P 5550 5600
F 0 "MM?" H 5600 5750 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5700 40  0001 C CNN
F 2 "" H 5575 5450 60  0000 C CNN
F 3 "" H 5575 5450 60  0000 C CNN
	7    5550 5600
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 6 1 5E0B5B6A
P 5550 5500
F 0 "MM?" H 5600 5650 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5600 40  0001 C CNN
F 2 "" H 5575 5350 60  0000 C CNN
F 3 "" H 5575 5350 60  0000 C CNN
	6    5550 5500
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 5 1 5E0B5B39
P 5550 5400
F 0 "MM?" H 5600 5550 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5500 40  0001 C CNN
F 2 "" H 5575 5250 60  0000 C CNN
F 3 "" H 5575 5250 60  0000 C CNN
	5    5550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6150 5600 6150
Wire Wire Line
	5600 6150 5750 6150
Connection ~ 5600 6150
Wire Wire Line
	5600 6150 5600 6250
Wire Wire Line
	5550 5200 5700 5200
Connection ~ 5550 5200
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 4 1 5E0A6032
P 5550 5200
F 0 "MM?" H 5600 5350 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5300 40  0001 C CNN
F 2 "" H 5575 5050 60  0000 C CNN
F 3 "" H 5575 5050 60  0000 C CNN
	4    5550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5100 6500 5100
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 3 1 5E0A5FFF
P 5550 5100
F 0 "MM?" H 5600 5250 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5200 40  0001 C CNN
F 2 "" H 5575 4950 60  0000 C CNN
F 3 "" H 5575 4950 60  0000 C CNN
	3    5550 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5000 6500 5000
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 2 1 5E0A5FCC
P 5550 5000
F 0 "MM?" H 5600 5150 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5600 5100 40  0001 C CNN
F 2 "" H 5575 4850 60  0000 C CNN
F 3 "" H 5575 4850 60  0000 C CNN
	2    5550 5000
	1    0    0    -1  
$EndComp
Connection ~ 5550 5100
Wire Wire Line
	3400 5100 5550 5100
Connection ~ 5550 5000
Wire Wire Line
	3500 5000 5550 5000
Wire Wire Line
	5400 6350 5600 6350
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 8 1 5E19AC5A
P 5400 6350
F 0 "MM?" H 5450 6500 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 6450 40  0001 C CNN
F 2 "" H 5425 6200 60  0000 C CNN
F 3 "" H 5425 6200 60  0000 C CNN
	8    5400 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6250 4150 6250
Wire Wire Line
	5400 6250 5600 6250
Connection ~ 5400 6250
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 7 1 5E19AC2D
P 5400 6250
F 0 "MM?" H 5450 6400 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 6350 40  0001 C CNN
F 2 "" H 5425 6100 60  0000 C CNN
F 3 "" H 5425 6100 60  0000 C CNN
	7    5400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5700 5400 5700
Wire Wire Line
	5400 5700 5700 5700
Connection ~ 5400 5700
$Comp
L LnConnectors:Mammuth_09_sep MM?
U 5 1 5E19ABC9
P 5400 5700
F 0 "MM?" H 5450 5850 40  0001 C CNN
F 1 "Mammuth_09_sep" H 5450 5800 40  0001 C CNN
F 2 "" H 5425 5550 60  0000 C CNN
F 3 "" H 5425 5550 60  0000 C CNN
	5    5400 5700
	1    0    0    -1  
$EndComp
Connection ~ 5400 5300
Wire Wire Line
	4050 5300 5400 5300
Connection ~ 5600 6250
Wire Wire Line
	5600 6250 5600 6350
Wire Wire Line
	3300 5200 5550 5200
Wire Wire Line
	5550 4900 6500 4900
Wire Wire Line
	3850 4900 5550 4900
Connection ~ 5550 4900
$Comp
L LnConnectors:Mammuth_09_sep MM1
U 1 1 5E0A5F91
P 5550 4900
F 0 "MM1" H 5500 5000 40  0000 L CNN
F 1 "Mammuth_09_sep" H 5600 5000 40  0001 C CNN
F 2 "" H 5575 4750 60  0000 C CNN
F 3 "" H 5575 4750 60  0000 C CNN
	1    5550 4900
	1    0    0    -1  
$EndComp
Wire Bus Line
	6600 2950 6600 6200
$EndSCHEMATC
