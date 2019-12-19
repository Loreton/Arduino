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
F 1 "100" H 4518 2805 50  0000 L CNN
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
F 1 "LED" V 4397 3082 50  0000 R CNN
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
P 7050 1000
F 0 "J?" V 7053 1328 60  0001 L CNN
F 1 "220V" V 6950 1100 60  0000 L CNN
F 2 "" H 7050 1000 60  0000 C CNN
F 3 "" H 7050 1000 60  0000 C CNN
	1    7050 1000
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
P 2800 1400
F 0 "#PWR0101" H 2800 1150 50  0001 C CNN
F 1 "GND" H 2805 1227 50  0000 C CNN
F 2 "" H 2800 1400 50  0001 C CNN
F 3 "" H 2800 1400 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1200 2800 1200
Wire Wire Line
	2800 1200 2800 1400
$Comp
L power:+5V #PWR0102
U 1 1 5DF218E3
P 5950 850
F 0 "#PWR0102" H 5950 700 50  0001 C CNN
F 1 "+5V" H 5965 1023 50  0000 C CNN
F 2 "" H 5950 850 50  0001 C CNN
F 3 "" H 5950 850 50  0001 C CNN
	1    5950 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DF22BEF
P 5750 3100
F 0 "#PWR0103" H 5750 2850 50  0001 C CNN
F 1 "GND" H 5755 2927 50  0000 C CNN
F 2 "" H 5750 3100 50  0001 C CNN
F 3 "" H 5750 3100 50  0001 C CNN
	1    5750 3100
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
	5750 3000 5750 3100
$Comp
L LnConnectors:CONN_02 J?
U 1 1 5DF28262
P 1800 1250
F 0 "J?" H 1856 1737 60  0001 C CNN
F 1 "220V" V 1650 1450 60  0000 C CNN
F 2 "" H 1800 1250 60  0000 C CNN
F 3 "" H 1800 1250 60  0000 C CNN
	1    1800 1250
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
P 9600 1200
F 0 "K?" H 9600 1642 50  0000 C CNN
F 1 "sOnOff_Basic" H 9600 1551 50  0000 C CNN
F 2 "sOnOff" H 9700 975 25  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 9625 1025 50  0001 C CNN
	1    9600 1200
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09a MM?
U 1 1 5DF28D2C
P 7500 3400
F 0 "MM?" H 7628 3438 40  0001 L CNN
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
$Comp
L power:GND #PWR0108
U 1 1 5DFBEF66
P 4450 3450
F 0 "#PWR0108" H 4450 3200 50  0001 C CNN
F 1 "GND" H 4455 3277 50  0000 C CNN
F 2 "" H 4450 3450 50  0001 C CNN
F 3 "" H 4450 3450 50  0001 C CNN
	1    4450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3400 4450 3400
Wire Wire Line
	4450 2700 4450 2650
Text Label 4000 1650 0    50   ~ 0
pressControlButton
Text Label 4000 1750 0    50   ~ 0
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
P 7650 2000
F 0 "Al_5Vcc?" H 7800 1800 40  0001 R CNN
F 1 "Alimentatore" H 7750 1700 40  0001 R CNN
F 2 "5V pressControl" H 7650 1950 30  0000 C CNN
F 3 "" H 7650 1975 60  0000 C CNN
	1    7650 2000
	1    0    0    -1  
$EndComp
Text Notes 700  4650 0    50   ~ 0
Il filo Arancio porta i 5Volt dallìAlimentatore in cisterna.\nNulla vieta di utilizzare l'alimentatore locale.\nL'ho messo in questo modo per rendere indipendente\nil frutto del press control
Text Notes 700  4750 0    50   ~ 0
e lo stato viene al contempo rilevato da Arduino.
$Comp
L LnConnectors:Mammuth_09a MM?
U 1 1 5DF5DA63
P 5550 5050
F 0 "MM?" H 5678 5088 40  0001 L CNN
F 1 "Mammuth_09a" H 5678 5050 40  0001 L CNN
F 2 "" H 5575 5300 60  0000 C CNN
F 3 "" H 5575 5300 60  0000 C CNN
	1    5550 5050
	1    0    0    -1  
$EndComp
Text Notes 6750 3300 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	6700 3700 7500 3700
Entry Wire Line
	6500 5350 6600 5450
Entry Wire Line
	6500 5150 6600 5250
Entry Wire Line
	6500 4950 6600 5050
Entry Wire Line
	6500 4750 6600 4850
Entry Wire Line
	6500 4650 6600 4750
Entry Wire Line
	6500 4850 6600 4950
Entry Wire Line
	6500 5050 6600 5150
Entry Wire Line
	6500 5250 6600 5350
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
P 2050 6000
F 0 "SW?" V 1900 6050 50  0001 C CNN
F 1 "PCButton" V 2150 5850 40  0000 C CNN
F 2 "" H 2050 6000 60  0000 C CNN
F 3 "" H 2050 6000 60  0000 C CNN
	1    2050 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFEEBE6
P 1600 5900
F 0 "D?" V 1638 5782 50  0001 R CNN
F 1 "PCState" V 1700 6000 50  0000 R CNN
F 2 "" H 1600 5900 50  0001 C CNN
F 3 "~" H 1600 5900 50  0001 C CNN
	1    1600 5900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DFEEBEC
P 1600 5500
F 0 "R?" H 1668 5546 50  0001 L CNN
F 1 "470" V 1500 5400 50  0000 L CNN
F 2 "" V 1640 5490 50  0001 C CNN
F 3 "~" H 1600 5500 50  0001 C CNN
	1    1600 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5650 1600 5750
Text Label 8550 1450 0    50   ~ 0
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
	1600 5250 1600 5350
Wire Wire Line
	2050 6150 2050 6050
Wire Wire Line
	1950 1000 2100 1000
Wire Wire Line
	1950 1100 2000 1100
Wire Wire Line
	2000 1100 2000 1200
Wire Wire Line
	2000 1200 2100 1200
$Comp
L Device:Buzzer BZ?
U 1 1 5E1B1006
P 2050 5550
F 0 "BZ?" H 2100 5550 50  0001 C CNN
F 1 "Active Buzzer" H 2000 5750 50  0000 C CNN
F 2 "" V 2025 5650 50  0001 C CNN
F 3 "~" V 2025 5650 50  0001 C CNN
	1    2050 5550
	-1   0    0    -1  
$EndComp
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5E20E831
P 2400 1100
F 0 "Al_5Vcc?" H 2550 900 40  0001 R CNN
F 1 "Alimentatore" H 2500 800 40  0001 R CNN
F 2 "5V Arduino" H 2400 1100 30  0000 C CNN
F 3 "" H 2400 1075 60  0000 C CNN
	1    2400 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1600 5250 2150 5250
Text Notes 1000 7650 0    50   ~ 0
Active Buzzer è messo come emergenza nel caso si dovesse rimuovere Arduino.\nCome pump_ON deve arrivare un GND \nSuona in modo continuo quando la pompa è accesa..
Wire Wire Line
	7500 3500 6700 3500
$Comp
L LnDevice:Pulse SW?
U 1 1 5E2F9681
P 9400 1800
F 0 "SW?" H 9250 1900 70  0001 C CNN
F 1 "Pulse" H 9400 1700 70  0001 C CNN
F 2 "" H 9400 1800 60  0000 C CNN
F 3 "" H 9400 1800 60  0000 C CNN
	1    9400 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5E36919D
P 3300 2300
F 0 "J?" H 3328 2280 50  0001 L CNN
F 1 "Conn_01x05_Female" H 3327 2235 50  0001 L CNN
F 2 "" H 3300 2300 50  0001 C CNN
F 3 "~" H 3300 2300 50  0001 C CNN
	1    3300 2300
	0    -1   1    0   
$EndComp
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5E36920E
P 3300 2400
F 0 "J?" H 3272 2377 50  0001 R CNN
F 1 "Conn_01x05_Male" H 3273 2332 50  0001 R CNN
F 2 "" H 3300 2400 50  0001 C CNN
F 3 "~" H 3300 2400 50  0001 C CNN
	1    3300 2400
	0    -1   1    0   
$EndComp
Wire Wire Line
	2150 5450 2150 5250
Connection ~ 2150 5250
Wire Wire Line
	2150 5250 2450 5250
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5DF8639E
P 3150 5750
F 0 "J?" H 3122 5727 50  0001 R CNN
F 1 "Conn_01x05_Male" H 3123 5682 50  0001 R CNN
F 2 "" H 3150 5750 50  0001 C CNN
F 3 "~" H 3150 5750 50  0001 C CNN
	1    3150 5750
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x05_Female J?
U 1 1 5DF863AD
P 3200 5750
F 0 "J?" H 3228 5730 50  0001 L CNN
F 1 "Conn_01x05_Female" H 3227 5685 50  0001 L CNN
F 2 "" H 3200 5750 50  0001 C CNN
F 3 "~" H 3200 5750 50  0001 C CNN
	1    3200 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 5250 2450 5550
Wire Wire Line
	2450 5550 2950 5550
Entry Wire Line
	6600 3900 6700 3800
Entry Wire Line
	6500 5450 6600 5550
Text Notes 6750 3800 0    50   ~ 0
Calza
Text Label 4650 5250 0    50   ~ 0
pump_ON
Text Label 4650 5350 0    50   ~ 0
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
	1400 5100 2900 5100
Wire Notes Line
	2900 5100 2900 6700
Wire Notes Line
	2900 6700 1400 6700
Wire Notes Line
	1400 6700 1400 5100
Text Notes 1450 6650 0    50   ~ 0
Frutto del PressControl \nnel Quadro elettrico \ndel Salone\nIl jumper serve per attivare il buzzer \nin caso non funzioni Arduino
Wire Wire Line
	4150 2550 5250 2550
Wire Wire Line
	4450 2650 5250 2650
Wire Wire Line
	4450 3400 4450 3450
Connection ~ 4450 3400
Wire Wire Line
	9500 1550 9500 2200
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
L power:+5VA #PWR?
U 1 1 5E0633D3
P 10450 4950
F 0 "#PWR?" H 10450 4800 50  0001 C CNN
F 1 "+5VA" H 10465 5123 50  0000 C CNN
F 2 "" H 10450 4950 50  0001 C CNN
F 3 "" H 10450 4950 50  0001 C CNN
	1    10450 4950
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:RELAY_2RT K?
U 1 1 5E0706ED
P 10250 4000
F 0 "K?" H 10250 4539 70  0001 C CNN
F 1 "RELAY_2RT" H 10250 4539 70  0001 C CNN
F 2 "" H 10250 4020 60  0000 C CNN
F 3 "" H 10250 4020 60  0000 C CNN
	1    10250 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10500 3600 10500 3900
Wire Wire Line
	10700 3600 10700 4100
Wire Wire Line
	10450 3900 10500 3900
Connection ~ 10500 3900
Wire Wire Line
	10500 3900 10500 4400
Wire Wire Line
	10450 4100 10700 4100
Connection ~ 10700 4100
Wire Wire Line
	10700 4100 10700 4400
$Comp
L power:GNDA #PWR?
U 1 1 5E0B7431
P 9700 4050
F 0 "#PWR?" H 9700 3800 50  0001 C CNN
F 1 "GNDA" H 9705 3877 50  0000 C CNN
F 2 "" H 9700 4050 50  0001 C CNN
F 3 "" H 9700 4050 50  0001 C CNN
	1    9700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3950 9700 3950
Text Label 4650 4950 0    50   ~ 0
pressControlButton
Wire Wire Line
	3500 2100 3500 1850
Wire Wire Line
	3500 1850 5250 1850
Wire Wire Line
	3400 2100 3400 1750
Wire Wire Line
	3400 1750 5250 1750
Wire Wire Line
	3300 2100 3300 1650
Wire Wire Line
	3300 1650 5250 1650
Wire Wire Line
	3200 2100 3200 1550
Wire Wire Line
	3200 1550 5250 1550
Text Label 4000 1850 0    50   ~ 0
ElettroValvola
Wire Wire Line
	3100 2100 3100 2050
Wire Wire Line
	3100 2050 2850 2050
Wire Wire Line
	2850 2050 2850 2150
$Comp
L power:GND #PWR?
U 1 1 5E12B0FE
P 2850 2150
F 0 "#PWR?" H 2850 1900 50  0001 C CNN
F 1 "GND" H 2855 1977 50  0000 C CNN
F 2 "" H 2850 2150 50  0001 C CNN
F 3 "" H 2850 2150 50  0001 C CNN
	1    2850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3300 6700 3300
Wire Wire Line
	6700 3200 7500 3200
Wire Wire Line
	6700 3100 7500 3100
Wire Wire Line
	6700 3000 7500 3000
Text Notes 5750 5250 0    50   ~ 0
Celeste
Text Notes 5750 5350 0    50   ~ 0
Bianco/Celeste
Text Notes 5750 5050 0    50   ~ 0
Marrone
Text Notes 5750 5150 0    50   ~ 0
Bianco/Marrone
Text Notes 5750 4650 0    50   ~ 0
Arancio
Text Notes 5750 4750 0    50   ~ 0
Bianco/Arancio
Text Notes 5750 4850 0    50   ~ 0
Verde
Text Notes 5750 4950 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	5550 5050 6500 5050
Wire Wire Line
	5550 5250 6500 5250
Wire Wire Line
	6500 5150 5550 5150
Text Notes 5750 5450 0    50   ~ 0
Calza
$Comp
L power:GND #PWR?
U 1 1 5E144718
P 5350 5600
F 0 "#PWR?" H 5350 5350 50  0001 C CNN
F 1 "GND" H 5355 5427 50  0000 C CNN
F 2 "" H 5350 5600 50  0001 C CNN
F 3 "" H 5350 5600 50  0001 C CNN
	1    5350 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4950 5550 4950
Wire Wire Line
	5550 4750 6500 4750
Wire Wire Line
	5550 4650 6500 4650
Wire Wire Line
	5550 5350 6500 5350
Connection ~ 5550 5450
Text Label 4650 4850 0    50   ~ 0
Horn
Text Label 4650 4750 0    50   ~ 0
ElettroValvola
Wire Wire Line
	3500 2600 3500 4750
Wire Wire Line
	3500 4750 5550 4750
Connection ~ 5550 4750
Wire Wire Line
	3400 2600 3400 4850
Wire Wire Line
	3400 4850 5550 4850
Connection ~ 5550 4850
Wire Wire Line
	5550 4850 6500 4850
Wire Wire Line
	3300 2600 3300 4950
Wire Wire Line
	3200 2600 3200 5050
Text Label 4000 1950 0    50   ~ 0
Spare
Text Label 4650 4650 0    50   ~ 0
+5Vcc
Text Label 4000 1550 0    50   ~ 0
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
	9700 1550 9700 2300
$Comp
L power:+5VA #PWR?
U 1 1 5DFBEA28
P 8050 1850
F 0 "#PWR?" H 8050 1700 50  0001 C CNN
F 1 "+5VA" H 8065 2023 50  0000 C CNN
F 2 "" H 8050 1850 50  0001 C CNN
F 3 "" H 8050 1850 50  0001 C CNN
	1    8050 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5DFBEA35
P 8050 2150
F 0 "#PWR?" H 8050 1900 50  0001 C CNN
F 1 "GNDA" H 8055 1977 50  0000 C CNN
F 2 "" H 8050 2150 50  0001 C CNN
F 3 "" H 8050 2150 50  0001 C CNN
	1    8050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2100 8050 2100
Wire Wire Line
	8050 2100 8050 2150
Wire Wire Line
	7950 1900 8050 1900
Wire Wire Line
	8050 1900 8050 1850
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
	7500 3800 7800 3800
Wire Wire Line
	7800 3800 7800 3900
Connection ~ 7500 3800
Wire Wire Line
	6700 3800 7500 3800
$Comp
L power:GNDA #PWR?
U 1 1 5DFFBDDA
P 7800 3900
F 0 "#PWR?" H 7800 3650 50  0001 C CNN
F 1 "GNDA" H 7805 3727 50  0000 C CNN
F 2 "" H 7800 3900 50  0001 C CNN
F 3 "" H 7800 3900 50  0001 C CNN
	1    7800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5450 6500 5450
Wire Wire Line
	5350 5450 5350 5600
Wire Wire Line
	5350 5450 5550 5450
$Comp
L power:GNDA #PWR?
U 1 1 5E0110BE
P 9600 2950
F 0 "#PWR?" H 9600 2700 50  0001 C CNN
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
$Comp
L power:+5VA #PWR?
U 1 1 5E01B550
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
$Comp
L power:GND #PWR?
U 1 1 5E025FED
P 3500 6050
F 0 "#PWR?" H 3500 5800 50  0001 C CNN
F 1 "GND" H 3505 5877 50  0000 C CNN
F 2 "" H 3500 6050 50  0001 C CNN
F 3 "" H 3500 6050 50  0001 C CNN
	1    3500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5550 4100 5550
Wire Wire Line
	2800 5950 2950 5950
Wire Wire Line
	1600 6050 1600 6150
Wire Wire Line
	1600 6150 1850 6150
Wire Wire Line
	1850 6150 1850 5750
Wire Wire Line
	1850 5750 2950 5750
Wire Wire Line
	2050 5850 2050 5950
Wire Wire Line
	2800 6150 2800 5950
Wire Wire Line
	2050 6150 2800 6150
Wire Wire Line
	3400 5950 3500 5950
Wire Wire Line
	3500 5950 3500 6050
Wire Wire Line
	3700 5750 3400 5750
Wire Wire Line
	3700 5350 3700 5750
Wire Wire Line
	3600 5650 3400 5650
Wire Wire Line
	8600 2450 8600 3300
Wire Wire Line
	8600 3300 7500 3300
Connection ~ 7500 3300
$Comp
L Device:R_US R?
U 1 1 5E0A008A
P 2400 5850
F 0 "R?" H 2468 5896 50  0001 L CNN
F 1 "1K" V 2500 5800 50  0000 L CNN
F 2 "" V 2440 5840 50  0001 C CNN
F 3 "~" H 2400 5850 50  0001 C CNN
	1    2400 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 5850 2250 5850
Wire Wire Line
	2550 5850 2950 5850
Wire Wire Line
	3200 5050 3600 5050
Wire Wire Line
	7500 3200 8900 3200
Wire Wire Line
	8900 3200 8900 5550
Connection ~ 7500 3200
Wire Wire Line
	9700 3950 9700 4050
Wire Wire Line
	5550 5350 3700 5350
Connection ~ 5550 5350
Wire Wire Line
	3600 5250 3600 5650
$Comp
L LnDevice:Jumper3_B SW?
U 1 1 5E11AA95
P 3600 5150
F 0 "SW?" V 3600 5251 50  0001 L CNN
F 1 "Jumper3_B" V 3645 5251 50  0001 L CNN
F 2 "" H 3550 5270 60  0000 C CNN
F 3 "" H 3550 5270 60  0000 C CNN
	1    3600 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 4950 3850 5850
Wire Wire Line
	3400 5850 3850 5850
Wire Wire Line
	3300 4950 3850 4950
Connection ~ 5550 4950
Wire Wire Line
	2150 5650 2950 5650
Connection ~ 3850 4950
Wire Wire Line
	3850 4950 5550 4950
Wire Wire Line
	3650 5150 3750 5150
Wire Wire Line
	3750 5150 3750 5250
Wire Wire Line
	3750 5250 5550 5250
Connection ~ 5550 5250
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
Wire Wire Line
	4100 5550 4100 4650
Wire Wire Line
	4100 4650 5550 4650
Connection ~ 5550 4650
$Comp
L power:GNDA #PWR?
U 1 1 5E17068F
P 7650 5200
F 0 "#PWR?" H 7650 4950 50  0001 C CNN
F 1 "GNDA" H 7655 5027 50  0000 C CNN
F 2 "" H 7650 5200 50  0001 C CNN
F 3 "" H 7650 5200 50  0001 C CNN
	1    7650 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 5200 7650 5100
Wire Wire Line
	7650 4800 8000 4800
Wire Wire Line
	8000 4900 7650 4900
Connection ~ 7650 4900
Wire Wire Line
	7650 4900 7650 4800
Wire Wire Line
	8000 5000 7650 5000
Connection ~ 7650 5000
Wire Wire Line
	7650 5000 7650 4900
Wire Wire Line
	8000 5100 7650 5100
Connection ~ 7650 5100
Wire Wire Line
	7650 5100 7650 5000
Text Label 9700 3950 0    50   ~ 0
GNDA_1
Text Label 9600 2950 0    50   ~ 0
GNDA_2
Text Label 10450 5500 0    50   ~ 0
GNDA_3
$Comp
L LnDevice:Relay_5V_LL_Dual RL?
U 3 1 5E187BC8
P 7750 1100
F 0 "RL?" H 7910 1146 50  0000 L CNN
F 1 "Relay_5V_LL_Dual" H 7910 1055 50  0000 L CNN
F 2 "" H 7750 1100 50  0001 C CNN
F 3 "" H 7750 1100 50  0001 C CNN
	3    7750 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E187D52
P 7750 1550
F 0 "#PWR?" H 7750 1300 50  0001 C CNN
F 1 "GNDA" H 7755 1377 50  0000 C CNN
F 2 "" H 7750 1550 50  0001 C CNN
F 3 "" H 7750 1550 50  0001 C CNN
	1    7750 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1550 7750 1400
Wire Bus Line
	6600 2850 6600 5750
Text Label 7800 1500 0    50   ~ 0
GNDA_4
Text Label 7700 5100 0    50   ~ 0
GNDA_1
Text Label 7700 5000 0    50   ~ 0
GNDA_2
Text Label 7700 4900 0    50   ~ 0
GNDA_3
Text Label 7700 4800 0    50   ~ 0
GNDA_4
$Comp
L power:+5VA #PWR?
U 1 1 5E19412A
P 7750 800
F 0 "#PWR?" H 7750 650 50  0001 C CNN
F 1 "+5VA" H 7765 973 50  0000 C CNN
F 2 "" H 7750 800 50  0001 C CNN
F 3 "" H 7750 800 50  0001 C CNN
	1    7750 800 
	1    0    0    -1  
$EndComp
$EndSCHEMATC
