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
P 6100 2800
F 0 "A?" H 6100 1714 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" V 6100 2650 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 6250 1850 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 6100 1800 50  0001 C CNN
	1    6100 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DEB74D1
P 2200 3700
F 0 "R?" H 2268 3746 50  0001 L CNN
F 1 "100" H 2268 3655 50  0000 L CNN
F 2 "" V 2240 3690 50  0001 C CNN
F 3 "~" H 2200 3700 50  0001 C CNN
	1    2200 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DEB73CD
P 2200 4100
F 0 "D?" V 2238 3982 50  0001 R CNN
F 1 "LED" V 2147 3982 50  0000 R CNN
F 2 "" H 2200 4100 50  0001 C CNN
F 3 "~" H 2200 4100 50  0001 C CNN
	1    2200 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Buzzer BZ?
U 1 1 5DEBAA3F
P 1800 4100
F 0 "BZ?" H 1850 4100 50  0001 C CNN
F 1 "Buzzer" H 1650 4100 50  0000 C CNN
F 2 "" V 1775 4200 50  0001 C CNN
F 3 "~" V 1775 4200 50  0001 C CNN
	1    1800 4100
	-1   0    0    -1  
$EndComp
$Comp
L LnConnectors:CONN_02 J?
U 1 1 5DEBCAE0
P 9500 1300
F 0 "J?" V 9503 1628 60  0001 L CNN
F 1 "220V" V 9400 1400 60  0000 L CNN
F 2 "" H 9500 1300 60  0000 C CNN
F 3 "" H 9500 1300 60  0000 C CNN
	1    9500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3850 2200 3950
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
	10250 2100 10250 1550
$Comp
L LnDevice:Alimentatore Al_5Vcc
U 1 1 5DED1D58
P 10850 5150
F 0 "Al_5Vcc" H 10850 5050 40  0000 R CNN
F 1 "Alimentatore" H 10950 4850 40  0000 R CNN
F 2 "" H 10850 5125 60  0000 C CNN
F 3 "" H 10850 5125 60  0000 C CNN
	1    10850 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9300 5300 9300 5150
Wire Wire Line
	1900 4200 1900 4400
Wire Wire Line
	2200 4250 2200 4400
Text Label 3600 3400 0    50   ~ 0
Buzzer
Text Label 3600 3500 0    50   ~ 0
BlinkingLED
Wire Wire Line
	1900 4000 1900 3400
Wire Wire Line
	5100 2400 5600 2400
$Comp
L power:GNDA #PWR?
U 1 1 5DF1D0BD
P 9700 3200
F 0 "#PWR?" H 9700 2950 50  0001 C CNN
F 1 "GNDA" H 9800 3100 50  0000 C CNN
F 2 "" H 9700 3200 50  0001 C CNN
F 3 "" H 9700 3200 50  0001 C CNN
	1    9700 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF1F5E5
P 2800 1400
F 0 "#PWR?" H 2800 1150 50  0001 C CNN
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
L power:+5V #PWR?
U 1 1 5DF218E3
P 6300 850
F 0 "#PWR?" H 6300 700 50  0001 C CNN
F 1 "+5V" H 6315 1023 50  0000 C CNN
F 2 "" H 6300 850 50  0001 C CNN
F 3 "" H 6300 850 50  0001 C CNN
	1    6300 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF22BEF
P 6100 3950
F 0 "#PWR?" H 6100 3700 50  0001 C CNN
F 1 "GND" H 6105 3777 50  0000 C CNN
F 2 "" H 6100 3950 50  0001 C CNN
F 3 "" H 6100 3950 50  0001 C CNN
	1    6100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3800 6100 3850
Wire Wire Line
	6100 3850 6200 3850
Wire Wire Line
	6200 3850 6200 3800
Connection ~ 6100 3850
Wire Wire Line
	6100 3850 6100 3950
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
Text Notes 7400 3600 0    50   ~ 0
Celeste
Text Notes 7400 3700 0    50   ~ 0
Bianco/Celeste
Text Notes 7400 3000 0    50   ~ 0
Marrone
Text Notes 7400 3100 0    50   ~ 0
Bianco/Marrone
Text Notes 7400 3400 0    50   ~ 0
Arancio
Text Notes 7400 3500 0    50   ~ 0
Bianco/Arancio
Text Notes 7400 3200 0    50   ~ 0
Verde
Wire Wire Line
	10700 1050 10500 1050
Wire Wire Line
	9650 1050 9800 1050
Wire Wire Line
	9650 1150 9800 1150
Wire Wire Line
	9200 5300 9300 5300
$Comp
L power:GNDA #PWR?
U 1 1 5DF0F3FB
P 8850 5750
F 0 "#PWR?" H 8850 5500 50  0001 C CNN
F 1 "GNDA" H 8855 5577 50  0000 C CNN
F 2 "" H 8850 5750 50  0001 C CNN
F 3 "" H 8850 5750 50  0001 C CNN
	1    8850 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5DF0F410
P 9300 5450
F 0 "#PWR?" H 9300 5200 50  0001 C CNN
F 1 "GNDA" H 9305 5277 50  0000 C CNN
F 2 "" H 9300 5450 50  0001 C CNN
F 3 "" H 9300 5450 50  0001 C CNN
	1    9300 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5400 9300 5400
Wire Wire Line
	9300 5400 9300 5450
Wire Wire Line
	8850 5700 8850 5750
$Comp
L LnDevice:sOnOff_Basic K?
U 1 1 5DEED482
P 10150 1200
F 0 "K?" H 10150 1642 50  0000 C CNN
F 1 "sOnOff_Basic" H 10150 1551 50  0000 C CNN
F 2 "sOnOff" H 10250 975 25  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 10175 1025 50  0001 C CNN
	1    10150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1900 10050 1900
Wire Wire Line
	10050 1900 10050 1550
$Comp
L power:GNDA #PWR?
U 1 1 5DF162D4
P 7950 1550
F 0 "#PWR?" H 7950 1300 50  0001 C CNN
F 1 "GNDA" H 8050 1550 50  0000 C CNN
F 2 "" H 7950 1550 50  0001 C CNN
F 3 "" H 7950 1550 50  0001 C CNN
	1    7950 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1400 7950 1550
$Comp
L power:+5VA #PWR?
U 1 1 5DF176AA
P 9500 2450
F 0 "#PWR?" H 9500 2300 50  0001 C CNN
F 1 "+5VA" H 9515 2623 50  0000 C CNN
F 2 "" H 9500 2450 50  0001 C CNN
F 3 "" H 9500 2450 50  0001 C CNN
	1    9500 2450
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:Relay_5V_LL RL?
U 1 1 5DF237EE
P 8850 5400
F 0 "RL?" H 8850 5878 50  0001 C CNN
F 1 "Relay_5V_LL" H 8850 5100 50  0000 C CNN
F 2 "" H 8850 5400 50  0001 C CNN
F 3 "" H 8850 5400 50  0001 C CNN
	1    8850 5400
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09a MM?
U 1 1 5DF28D2C
P 8150 3400
F 0 "MM?" H 8278 3438 40  0001 L CNN
F 1 "Mammuth_09a" H 8278 3400 40  0001 L CNN
F 2 "" H 8175 3650 60  0000 C CNN
F 3 "" H 8175 3650 60  0000 C CNN
	1    8150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5DF30D15
P 1100 6750
F 0 "#PWR?" H 1100 6500 50  0001 C CNN
F 1 "GNDA" H 1105 6577 50  0000 C CNN
F 2 "" H 1100 6750 50  0001 C CNN
F 3 "" H 1100 6750 50  0001 C CNN
	1    1100 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF30D28
P 7850 4000
F 0 "#PWR?" H 7850 3750 50  0001 C CNN
F 1 "GND" H 7855 3827 50  0000 C CNN
F 2 "" H 7850 4000 50  0001 C CNN
F 3 "" H 7850 4000 50  0001 C CNN
	1    7850 4000
	1    0    0    -1  
$EndComp
Text Label 5300 7300 0    50   ~ 0
Horn
Text Label 5300 6900 0    50   ~ 0
pumpState
Text Label 5300 6700 0    50   ~ 0
pressControlState
Text Label 5300 7100 0    50   ~ 0
pressControlPower
Text Label 5300 6600 0    50   ~ 0
ElettroValvola
$Comp
L Device:Speaker LS?
U 1 1 5DF4E72D
P 9500 5050
F 0 "LS?" H 9669 5046 50  0001 L CNN
F 1 "Horn" H 9669 5000 50  0000 L CNN
F 2 "" H 9500 4850 50  0001 C CNN
F 3 "~" H 9490 5000 50  0001 C CNN
	1    9500 5050
	1    0    0    -1  
$EndComp
Wire Notes Line style solid
	9450 5025 9450 5075
Wire Notes Line style solid
	9425 5050 9475 5050
Wire Notes Line style solid
	9425 5150 9475 5150
Wire Wire Line
	7850 4000 7850 3800
Wire Wire Line
	7850 3800 8150 3800
Wire Wire Line
	5100 2500 5600 2500
Wire Wire Line
	5100 2600 5600 2600
Wire Wire Line
	5100 2700 5600 2700
Wire Wire Line
	3100 3500 5600 3500
Wire Wire Line
	3100 3400 5600 3400
Wire Wire Line
	6300 850  6300 1000
Wire Wire Line
	2700 1000 6300 1000
Connection ~ 6300 1000
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5DFBEDAD
P 2900 3300
F 0 "J?" H 2794 3593 50  0001 C CNN
F 1 "Conn_01x06_Female" H 2794 3594 50  0001 C CNN
F 2 "" H 2900 3300 50  0001 C CNN
F 3 "~" H 2900 3300 50  0001 C CNN
	1    2900 3300
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5DFBEE1C
P 2850 3300
F 0 "J?" H 2822 3227 50  0001 R CNN
F 1 "Conn_01x06_Male" H 2823 3182 50  0001 R CNN
F 2 "" H 2850 3300 50  0001 C CNN
F 3 "~" H 2850 3300 50  0001 C CNN
	1    2850 3300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DFBEF66
P 3200 3700
F 0 "#PWR?" H 3200 3450 50  0001 C CNN
F 1 "GND" H 3205 3527 50  0000 C CNN
F 2 "" H 3200 3700 50  0001 C CNN
F 3 "" H 3200 3700 50  0001 C CNN
	1    3200 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4400 2200 4400
Wire Wire Line
	2200 3550 2200 3500
Wire Wire Line
	2200 3500 2650 3500
Wire Wire Line
	2200 4400 2550 4400
Wire Wire Line
	2550 4400 2550 3600
Wire Wire Line
	2550 3600 2650 3600
Connection ~ 2200 4400
Wire Wire Line
	1900 3400 2650 3400
Wire Wire Line
	3100 3600 3200 3600
Wire Wire Line
	3200 3600 3200 3700
Text Label 3600 2500 0    50   ~ 0
pressControlState
Entry Wire Line
	3400 2900 3500 2800
Entry Wire Line
	3400 2600 3500 2500
Entry Wire Line
	3400 2700 3500 2600
Entry Wire Line
	3400 2800 3500 2700
Entry Wire Line
	3400 2500 3500 2400
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5E04BEF4
P 4900 2500
F 0 "J?" H 4794 2793 50  0001 C CNN
F 1 "Conn_01x06_Female" H 4794 2794 50  0001 C CNN
F 2 "" H 4900 2500 50  0001 C CNN
F 3 "~" H 4900 2500 50  0001 C CNN
	1    4900 2500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E04EFD1
P 5250 2250
F 0 "#PWR?" H 5250 2000 50  0001 C CNN
F 1 "GND" H 5350 2250 50  0000 C CNN
F 2 "" H 5250 2250 50  0001 C CNN
F 3 "" H 5250 2250 50  0001 C CNN
	1    5250 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2300 5100 2150
Wire Wire Line
	5100 2150 5250 2150
Wire Wire Line
	5250 2150 5250 2250
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5E055622
P 4850 2500
F 0 "J?" H 4822 2427 50  0001 R CNN
F 1 "Conn_01x06_Male" H 4823 2382 50  0001 R CNN
F 2 "" H 4850 2500 50  0001 C CNN
F 3 "~" H 4850 2500 50  0001 C CNN
	1    4850 2500
	-1   0    0    -1  
$EndComp
Text Label 3600 2400 0    50   ~ 0
pumpState
Text Label 3600 2600 0    50   ~ 0
pressControlPower
Text Label 3600 2700 0    50   ~ 0
Horn
Text Label 3600 2800 0    50   ~ 0
ElettroValvola
Wire Wire Line
	3500 2400 4650 2400
Wire Wire Line
	3500 2500 4650 2500
Wire Wire Line
	3500 2600 4650 2600
Wire Wire Line
	3500 2700 4650 2700
Wire Wire Line
	3500 2800 4650 2800
Entry Wire Line
	3400 2400 3500 2300
Wire Wire Line
	3500 2300 4650 2300
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F74E
P 4450 2350
F 0 "#SYM?" H 4450 2410 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4460 2300 50  0001 C CNN
F 2 "" H 4450 2350 50  0001 C CNN
F 3 "~" H 4450 2350 50  0001 C CNN
	1    4450 2350
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F78F
P 4450 2450
F 0 "#SYM?" H 4450 2510 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4460 2400 50  0001 C CNN
F 2 "" H 4450 2450 50  0001 C CNN
F 3 "~" H 4450 2450 50  0001 C CNN
	1    4450 2450
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F7A2
P 4450 2550
F 0 "#SYM?" H 4450 2610 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4460 2500 50  0001 C CNN
F 2 "" H 4450 2550 50  0001 C CNN
F 3 "~" H 4450 2550 50  0001 C CNN
	1    4450 2550
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F7B5
P 4450 2650
F 0 "#SYM?" H 4450 2710 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4460 2600 50  0001 C CNN
F 2 "" H 4450 2650 50  0001 C CNN
F 3 "~" H 4450 2650 50  0001 C CNN
	1    4450 2650
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F7C8
P 4450 2750
F 0 "#SYM?" H 4450 2810 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4460 2700 50  0001 C CNN
F 2 "" H 4450 2750 50  0001 C CNN
F 3 "~" H 4450 2750 50  0001 C CNN
	1    4450 2750
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F801
P 4650 3350
F 0 "#SYM?" H 4650 3410 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4660 3300 50  0001 C CNN
F 2 "" H 4650 3350 50  0001 C CNN
F 3 "~" H 4650 3350 50  0001 C CNN
	1    4650 3350
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F814
P 4650 3450
F 0 "#SYM?" H 4650 3510 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4660 3400 50  0001 C CNN
F 2 "" H 4650 3450 50  0001 C CNN
F 3 "~" H 4650 3450 50  0001 C CNN
	1    4650 3450
	-1   0    0    -1  
$EndComp
Entry Wire Line
	7250 3100 7350 3000
Entry Wire Line
	7250 3200 7350 3100
Entry Wire Line
	7250 3400 7350 3300
Entry Wire Line
	7250 3800 7350 3700
Entry Wire Line
	7250 3600 7350 3500
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A94AD
P 6200 6550
F 0 "#SYM?" H 6200 6610 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 6210 6500 50  0001 C CNN
F 2 "" H 6200 6550 50  0001 C CNN
F 3 "~" H 6200 6550 50  0001 C CNN
	1    6200 6550
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A94F4
P 6200 6650
F 0 "#SYM?" H 6200 6710 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 6210 6600 50  0001 C CNN
F 2 "" H 6200 6650 50  0001 C CNN
F 3 "~" H 6200 6650 50  0001 C CNN
	1    6200 6650
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A9507
P 6200 6850
F 0 "#SYM?" H 6200 6910 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 6210 6800 50  0001 C CNN
F 2 "" H 6200 6850 50  0001 C CNN
F 3 "~" H 6200 6850 50  0001 C CNN
	1    6200 6850
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A951A
P 6200 7050
F 0 "#SYM?" H 6200 7110 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 6210 7000 50  0001 C CNN
F 2 "" H 6200 7050 50  0001 C CNN
F 3 "~" H 6200 7050 50  0001 C CNN
	1    6200 7050
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A952D
P 6200 7250
F 0 "#SYM?" H 6200 7310 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 6210 7200 50  0001 C CNN
F 2 "" H 6200 7250 50  0001 C CNN
F 3 "~" H 6200 7250 50  0001 C CNN
	1    6200 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5550 8500 5550
Wire Wire Line
	6300 1000 6300 1800
Text Label 8300 3300 0    50   ~ 0
pumpState
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5DF2F833
P 10100 2700
F 0 "Al_5Vcc?" H 10250 2500 40  0001 R CNN
F 1 "Alimentatore" H 10200 2400 40  0001 R CNN
F 2 "5Vdc" H 10100 2700 60  0000 C CNN
F 3 "" H 10100 2675 60  0000 C CNN
	1    10100 2700
	-1   0    0    -1  
$EndComp
Text Label 7900 2550 0    50   ~ 0
pressControlState
$Comp
L Device:R R?
U 1 1 5DF49EB1
P 8700 900
F 0 "R?" H 8770 946 50  0001 L CNN
F 1 "10K" V 8700 800 50  0000 L CNN
F 2 "" V 8630 900 50  0001 C CNN
F 3 "~" H 8700 900 50  0001 C CNN
	1    8700 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DF434D9
P 7600 900
F 0 "R?" V 7700 900 50  0001 C CNN
F 1 "1K" V 7600 900 50  0000 C CNN
F 2 "" V 7530 900 50  0001 C CNN
F 3 "~" H 7600 900 50  0001 C CNN
	1    7600 900 
	0    -1   -1   0   
$EndComp
$Comp
L LnDevice:RELAY_1RT K?
U 1 1 5DFA3B23
P 10200 4100
F 0 "K?" H 10225 4518 40  0000 C CNN
F 1 "RELAY_1RT" H 10225 4442 40  0000 C CNN
F 2 "" H 10200 4120 60  0000 C CNN
F 3 "" H 10200 4120 60  0000 C CNN
	1    10200 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10500 3600 10500 3850
Wire Wire Line
	10700 3600 10700 4250
Wire Wire Line
	10400 3850 10500 3850
Connection ~ 10500 3850
Wire Wire Line
	10500 3850 10500 4400
Wire Wire Line
	10400 4250 10700 4250
Connection ~ 10700 4250
Wire Wire Line
	10700 4250 10700 4400
Wire Wire Line
	9950 4050 9500 4050
Wire Wire Line
	10050 4150 9200 4150
Text Notes 700  4650 0    50   ~ 0
‍pressControlState, porta 5Vcc che accendono direttamente il LED
Text Notes 700  4750 0    50   ~ 0
e lo stato viene al contempo rilevato da Arduino.
Wire Wire Line
	5100 2800 5600 2800
$Comp
L Isolator:PC817 U?
U 1 1 5DF21B6D
P 8250 1300
F 0 "U?" H 8250 1625 50  0001 C CNN
F 1 "PC817" H 8250 1400 43  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 8050 1100 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 8250 1300 50  0001 L CNN
	1    8250 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DF32F2B
P 7700 1200
F 0 "R?" V 7800 1200 50  0001 C CNN
F 1 "1K" V 7700 1200 50  0000 C CNN
F 2 "" V 7630 1200 50  0001 C CNN
F 3 "~" H 7700 1200 50  0001 C CNN
	1    7700 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 1200 7950 1200
Wire Wire Line
	6800 1200 7550 1200
Wire Wire Line
	8150 3500 7350 3500
Wire Wire Line
	8150 3300 7350 3300
Wire Wire Line
	7350 3000 8150 3000
Wire Wire Line
	7350 3100 8150 3100
$Comp
L LnConnectors:Mammuth_09a MM?
U 1 1 5DF5DA63
P 3400 5900
F 0 "MM?" H 3528 5938 40  0001 L CNN
F 1 "Mammuth_09a" H 3528 5900 40  0001 L CNN
F 2 "" H 3425 6150 60  0000 C CNN
F 3 "" H 3425 6150 60  0000 C CNN
	1    3400 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF5DA69
P 3150 6400
F 0 "#PWR?" H 3150 6150 50  0001 C CNN
F 1 "GND" H 3155 6227 50  0000 C CNN
F 2 "" H 3150 6400 50  0001 C CNN
F 3 "" H 3150 6400 50  0001 C CNN
	1    3150 6400
	1    0    0    -1  
$EndComp
Text Notes 7400 3300 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	7350 3700 8150 3700
Entry Wire Line
	4350 6200 4450 6300
Entry Wire Line
	4350 6000 4450 6100
Entry Wire Line
	4350 5800 4450 5900
Entry Wire Line
	4350 5600 4450 5700
Entry Wire Line
	4350 5500 4450 5600
Entry Wire Line
	4350 5700 4450 5800
Entry Wire Line
	4350 5900 4450 6000
Entry Wire Line
	4350 6100 4450 6200
Entry Wire Line
	7250 3700 7350 3600
Entry Wire Line
	7250 3500 7350 3400
Entry Wire Line
	7250 3300 7350 3200
Wire Wire Line
	7350 3200 8150 3200
Wire Wire Line
	7350 3400 8150 3400
Wire Wire Line
	7350 3600 8150 3600
$Comp
L Isolator:PC817 U?
U 1 1 5DF9E28A
P 8000 1900
F 0 "U?" H 8000 2225 50  0001 C CNN
F 1 "PC817" H 8000 2000 43  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 7800 1700 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 8000 1900 50  0001 L CNN
	1    8000 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DFC6D04
P 8500 1800
F 0 "R?" V 8600 1800 50  0001 C CNN
F 1 "1K" V 8500 1800 50  0000 C CNN
F 2 "" V 8430 1800 50  0001 C CNN
F 3 "~" H 8500 1800 50  0001 C CNN
	1    8500 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 1800 8300 1800
$Comp
L LnDevice:PulsanteNO SW?
U 1 1 5DFEEB6E
P 2950 6350
F 0 "SW?" V 2800 6400 50  0001 C CNN
F 1 "PCButton" V 3050 6200 40  0000 C CNN
F 2 "" H 2950 6350 60  0000 C CNN
F 3 "" H 2950 6350 60  0000 C CNN
	1    2950 6350
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFEEBE6
P 1400 6200
F 0 "D?" V 1438 6082 50  0001 R CNN
F 1 "PCState" V 1500 6300 50  0000 R CNN
F 2 "" H 1400 6200 50  0001 C CNN
F 3 "~" H 1400 6200 50  0001 C CNN
	1    1400 6200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DFEEBEC
P 1400 5850
F 0 "R?" H 1468 5896 50  0001 L CNN
F 1 "470" V 1300 5750 50  0000 L CNN
F 2 "" V 1440 5840 50  0001 C CNN
F 3 "~" H 1400 5850 50  0001 C CNN
	1    1400 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6000 1400 6050
$Comp
L power:GND #PWR?
U 1 1 5E00D544
P 3050 6950
F 0 "#PWR?" H 3050 6700 50  0001 C CNN
F 1 "GND" H 3055 6777 50  0000 C CNN
F 2 "" H 3050 6950 50  0001 C CNN
F 3 "" H 3050 6950 50  0001 C CNN
	1    3050 6950
	1    0    0    -1  
$EndComp
Text Label 9650 1900 0    50   ~ 0
pc_button
Text Label 9900 2100 0    50   ~ 0
pc_GND
Text Label 8350 3700 0    50   ~ 0
pc_button
Wire Wire Line
	9700 2100 10250 2100
Wire Wire Line
	8900 1900 8900 3700
Wire Wire Line
	9200 3300 9200 4150
Wire Wire Line
	10700 1050 10700 2800
Wire Wire Line
	10500 1150 10500 2600
Wire Wire Line
	9700 2100 9700 2800
Wire Wire Line
	9500 2450 9500 2600
Wire Wire Line
	9800 2800 9700 2800
Connection ~ 9700 2800
Wire Wire Line
	9700 2800 9700 3100
Wire Wire Line
	9800 2600 9500 2600
Connection ~ 9500 2600
Wire Wire Line
	9500 2600 9500 3000
Wire Wire Line
	10400 2600 10500 2600
Connection ~ 10500 2600
Wire Wire Line
	10500 2600 10500 3300
Wire Wire Line
	10400 2800 10700 2800
Connection ~ 10700 2800
Wire Wire Line
	10700 2800 10700 3300
Connection ~ 8150 3100
Wire Wire Line
	8150 3100 9700 3100
Connection ~ 8150 3000
Wire Wire Line
	8150 3000 9500 3000
Connection ~ 9500 3000
Wire Wire Line
	9500 3000 9500 4050
Connection ~ 9700 3100
Wire Wire Line
	9700 3100 9700 3200
Text Notes 3600 6100 0    50   ~ 0
Celeste
Text Notes 3600 6200 0    50   ~ 0
Bianco/Celeste
Text Notes 3600 5500 0    50   ~ 0
Marrone
Text Notes 3600 5600 0    50   ~ 0
Bianco/Marrone
Text Notes 3600 5900 0    50   ~ 0
Arancio
Text Notes 3600 6000 0    50   ~ 0
Bianco/Arancio
Text Notes 3600 5700 0    50   ~ 0
Verde
Wire Wire Line
	4350 5800 3400 5800
Wire Wire Line
	3400 5500 4350 5500
Wire Wire Line
	3400 5600 4350 5600
Text Notes 3600 5800 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	3400 5700 4350 5700
Wire Wire Line
	3400 6000 4350 6000
Wire Wire Line
	3400 6200 4350 6200
Wire Wire Line
	3400 5900 4350 5900
Wire Wire Line
	3400 6100 4350 6100
Wire Wire Line
	3400 5500 1100 5500
Connection ~ 3400 5500
Wire Wire Line
	3400 5600 1400 5600
Wire Wire Line
	1400 5600 1400 5700
Connection ~ 3400 5600
Wire Wire Line
	1100 5500 1100 6600
Wire Wire Line
	1400 6350 1400 6600
Connection ~ 1100 6600
Wire Wire Line
	1100 6600 1100 6750
Wire Wire Line
	8150 3700 8900 3700
Connection ~ 8150 3700
Wire Wire Line
	9200 3300 8150 3300
Connection ~ 8150 3300
Wire Wire Line
	3400 6200 2950 6200
Wire Wire Line
	2950 6200 2950 6300
Wire Wire Line
	2950 6600 2950 6400
Connection ~ 1400 6600
Wire Wire Line
	1400 6600 2950 6600
Wire Wire Line
	1100 6600 1400 6600
Connection ~ 3400 6200
Wire Wire Line
	3400 6300 3150 6300
Wire Wire Line
	3150 6300 3150 6400
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5E19C1AD
P 2400 1100
F 0 "Al_5Vcc?" H 2550 900 40  0001 R CNN
F 1 "Alimentatore" H 2500 800 40  0001 R CNN
F 2 "5Vdc" H 2400 1100 60  0000 C CNN
F 3 "" H 2400 1075 60  0000 C CNN
	1    2400 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1000 2100 1000
Wire Wire Line
	1950 1100 2000 1100
Wire Wire Line
	2000 1100 2000 1200
Wire Wire Line
	2000 1200 2100 1200
Wire Bus Line
	3400 2400 3400 4500
Wire Bus Line
	7250 2850 7250 4100
Wire Bus Line
	4450 5350 4450 6600
$EndSCHEMATC
