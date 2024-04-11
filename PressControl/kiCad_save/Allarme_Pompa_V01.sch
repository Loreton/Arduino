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
L LnDevice:PulsanteNO SW?
U 1 1 5DEB8F6A
P 1400 3750
F 0 "SW?" V 1250 3800 50  0001 C CNN
F 1 "inp_PCButton" V 1400 3550 40  0000 C CNN
F 2 "" H 1400 3750 60  0000 C CNN
F 3 "" H 1400 3750 60  0000 C CNN
	1    1400 3750
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
P 9000 1350
F 0 "J?" V 9003 1678 60  0001 L CNN
F 1 "220V" V 8900 1450 60  0000 L CNN
F 2 "" H 9000 1350 60  0000 C CNN
F 3 "" H 9000 1350 60  0000 C CNN
	1    9000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3850 2200 3950
Wire Notes Line
	9550 3350 9550 3650
Wire Notes Line
	9550 3650 10450 3650
Wire Notes Line
	10450 3650 10450 3350
Wire Notes Line
	10450 3350 9550 3350
Text Notes 9750 3550 0    50   ~ 0
PressControl
Wire Notes Line
	9550 4450 9550 4750
Wire Notes Line
	9550 4750 10450 4750
Wire Notes Line
	10450 4750 10450 4450
Wire Notes Line
	10450 4450 9550 4450
Text Notes 9750 4650 0    50   ~ 0
Pump
Wire Wire Line
	9750 2050 9750 1600
$Comp
L LnDevice:Alimentatore Al_5Vcc
U 1 1 5DED1D58
P 10350 5200
F 0 "Al_5Vcc" H 10350 5100 40  0000 R CNN
F 1 "Alimentatore" H 10450 4900 40  0000 R CNN
F 2 "" H 10350 5175 60  0000 C CNN
F 3 "" H 10350 5175 60  0000 C CNN
	1    10350 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8800 5350 8800 5200
Wire Wire Line
	8800 5100 8800 4100
Wire Wire Line
	1450 3800 1450 4400
Wire Wire Line
	1900 4200 1900 4400
Wire Wire Line
	2200 4250 2200 4400
Text Label 3600 3300 0    50   ~ 0
pressControlButton
Text Label 3600 3400 0    50   ~ 0
Buzzer
Text Label 3600 3500 0    50   ~ 0
BlinkingLED
Wire Wire Line
	1900 4000 1900 3400
Wire Wire Line
	5100 2400 5600 2400
Wire Wire Line
	1450 3300 1450 3700
$Comp
L power:GNDA #PWR?
U 1 1 5DF1D0BD
P 9000 3250
F 0 "#PWR?" H 9000 3000 50  0001 C CNN
F 1 "GNDA" H 9005 3077 50  0000 C CNN
F 2 "" H 9000 3250 50  0001 C CNN
F 3 "" H 9000 3250 50  0001 C CNN
	1    9000 3250
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:Alimentatore Al?
U 1 1 5DF1F4B3
P 2450 850
F 0 "Al?" H 2300 750 40  0000 R CNN
F 1 "Alimentatore" H 2550 550 40  0000 R CNN
F 2 "" H 2450 825 60  0000 C CNN
F 3 "" H 2450 825 60  0000 C CNN
	1    2450 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF1F5E5
P 2800 1150
F 0 "#PWR?" H 2800 900 50  0001 C CNN
F 1 "GND" H 2805 977 50  0000 C CNN
F 2 "" H 2800 1150 50  0001 C CNN
F 3 "" H 2800 1150 50  0001 C CNN
	1    2800 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1100 2800 1100
Wire Wire Line
	2800 1100 2800 1150
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
Wire Wire Line
	1950 1000 2150 1000
Wire Wire Line
	2150 1100 1950 1100
Text Notes 6250 4650 0    50   ~ 0
Celeste
Text Notes 6250 4750 0    50   ~ 0
Bianco/Celeste
Text Notes 6250 4850 0    50   ~ 0
Marrone
Text Notes 6250 4950 0    50   ~ 0
Bianco/Marrone
Text Notes 6250 5050 0    50   ~ 0
Arancio
Text Notes 6250 5150 0    50   ~ 0
Bianco/Arancio
Text Notes 6250 5250 0    50   ~ 0
Verde
Text Notes 6250 5350 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	10000 1200 10000 2850
Wire Wire Line
	10200 1100 10200 2950
Wire Wire Line
	9700 2850 10000 2850
Connection ~ 10000 2850
Wire Wire Line
	10000 2850 10000 3350
Wire Wire Line
	9700 2950 10200 2950
Connection ~ 10200 2950
Wire Wire Line
	10200 2950 10200 3350
Wire Wire Line
	10200 1100 10000 1100
Wire Wire Line
	9150 1100 9300 1100
Wire Wire Line
	9150 1200 9300 1200
Wire Wire Line
	8350 5150 8350 4200
Wire Wire Line
	8700 5350 8800 5350
$Comp
L power:GNDA #PWR?
U 1 1 5DF0F3FB
P 8350 5800
F 0 "#PWR?" H 8350 5550 50  0001 C CNN
F 1 "GNDA" H 8355 5627 50  0000 C CNN
F 2 "" H 8350 5800 50  0001 C CNN
F 3 "" H 8350 5800 50  0001 C CNN
	1    8350 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5DF0F410
P 8800 5500
F 0 "#PWR?" H 8800 5250 50  0001 C CNN
F 1 "GNDA" H 8805 5327 50  0000 C CNN
F 2 "" H 8800 5500 50  0001 C CNN
F 3 "" H 8800 5500 50  0001 C CNN
	1    8800 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5450 8800 5450
Wire Wire Line
	8800 5450 8800 5500
Wire Wire Line
	8350 5750 8350 5800
$Comp
L LnDevice:sOnOff_Basic K?
U 1 1 5DEED482
P 9650 1250
F 0 "K?" H 9650 1692 50  0000 C CNN
F 1 "sOnOff_Basic" H 9650 1601 50  0000 C CNN
F 2 "sOnOff" H 9750 1025 25  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 9675 1075 50  0001 C CNN
	1    9650 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1950 9550 1950
Wire Wire Line
	9550 1950 9550 1600
$Comp
L power:GNDA #PWR?
U 1 1 5DF162D4
P 9000 2400
F 0 "#PWR?" H 9000 2150 50  0001 C CNN
F 1 "GNDA" H 9100 2400 50  0000 C CNN
F 2 "" H 9000 2400 50  0001 C CNN
F 3 "" H 9000 2400 50  0001 C CNN
	1    9000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2350 9000 2400
$Comp
L power:+5VA #PWR?
U 1 1 5DF176AA
P 9000 1650
F 0 "#PWR?" H 9000 1500 50  0001 C CNN
F 1 "+5VA" H 9015 1823 50  0000 C CNN
F 2 "" H 9000 1650 50  0001 C CNN
F 3 "" H 9000 1650 50  0001 C CNN
	1    9000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1650 9000 1750
Wire Wire Line
	9350 2050 9750 2050
$Comp
L LnDevice:Relay_5V_LL RL?
U 1 1 5DF20FDA
P 9000 2050
F 0 "RL?" H 9000 2528 50  0001 C CNN
F 1 "Relay_5V_LL" H 9300 1850 50  0000 C CNN
F 2 "" H 9000 2050 50  0001 C CNN
F 3 "" H 9000 2050 50  0001 C CNN
	1    9000 2050
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:Relay_5V_LL RL?
U 1 1 5DF237EE
P 8350 5450
F 0 "RL?" H 8350 5928 50  0001 C CNN
F 1 "Relay_5V_LL" H 8350 5150 50  0000 C CNN
F 2 "" H 8350 5450 50  0001 C CNN
F 3 "" H 8350 5450 50  0001 C CNN
	1    8350 5450
	1    0    0    -1  
$EndComp
$Comp
L LnConnectors:Mammuth_09a MM?
U 1 1 5DF28D2C
P 6100 5050
F 0 "MM?" H 6228 5088 40  0001 L CNN
F 1 "Mammuth_09a" H 6228 5050 40  0001 L CNN
F 2 "" H 6125 5300 60  0000 C CNN
F 3 "" H 6125 5300 60  0000 C CNN
	1    6100 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 5200 6150 5250
Wire Wire Line
	6100 5150 4750 5150
$Comp
L power:GNDA #PWR?
U 1 1 5DF30D15
P 6400 5550
F 0 "#PWR?" H 6400 5300 50  0001 C CNN
F 1 "GNDA" H 6405 5377 50  0000 C CNN
F 2 "" H 6400 5550 50  0001 C CNN
F 3 "" H 6400 5550 50  0001 C CNN
	1    6400 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF30D28
P 5800 5550
F 0 "#PWR?" H 5800 5300 50  0001 C CNN
F 1 "GND" H 5805 5377 50  0000 C CNN
F 2 "" H 5800 5550 50  0001 C CNN
F 3 "" H 5800 5550 50  0001 C CNN
	1    5800 5550
	1    0    0    -1  
$EndComp
Text Label 4900 5350 0    50   ~ 0
Horn
Text Label 4900 4950 0    50   ~ 0
pumpState
Text Label 4900 4750 0    50   ~ 0
pressControlState
Text Label 4900 5150 0    50   ~ 0
pressControlPower
Text Label 4900 4650 0    50   ~ 0
ElettroValvola
Wire Wire Line
	6100 4950 4750 4950
$Comp
L Device:LED_ALT D?
U 1 1 5DF3E3FE
P 1050 4050
F 0 "D?" V 1088 3932 50  0001 R CNN
F 1 "PCState" V 1150 4150 50  0000 R CNN
F 2 "" H 1050 4050 50  0001 C CNN
F 3 "~" H 1050 4050 50  0001 C CNN
	1    1050 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DF3E411
P 1050 3550
F 0 "R?" H 1118 3596 50  0001 L CNN
F 1 "470" H 1118 3505 50  0000 L CNN
F 2 "" V 1090 3540 50  0001 C CNN
F 3 "~" H 1050 3550 50  0001 C CNN
	1    1050 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Speaker LS?
U 1 1 5DF4E72D
P 9000 5100
F 0 "LS?" H 9169 5096 50  0001 L CNN
F 1 "Horn" H 9169 5050 50  0000 L CNN
F 2 "" H 9000 4900 50  0001 C CNN
F 3 "~" H 8990 5050 50  0001 C CNN
	1    9000 5100
	1    0    0    -1  
$EndComp
Wire Notes Line style solid
	8950 5075 8950 5125
Wire Notes Line style solid
	8925 5100 8975 5100
Wire Notes Line style solid
	8925 5200 8975 5200
Wire Wire Line
	5800 5550 5800 5450
Wire Wire Line
	5800 5450 6100 5450
Wire Wire Line
	6400 5550 6400 5450
Wire Wire Line
	6400 5450 6100 5450
Connection ~ 6100 5450
Wire Wire Line
	4750 4750 6100 4750
Wire Wire Line
	4750 4650 6100 4650
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
	3100 3300 5600 3300
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
Connection ~ 1900 4400
Wire Wire Line
	1900 4400 2200 4400
Wire Wire Line
	1450 4400 1900 4400
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
	1450 3300 2650 3300
Wire Wire Line
	1900 3400 2650 3400
Wire Wire Line
	2650 3200 1050 3200
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
U 1 1 5E07F7EE
P 4650 3250
F 0 "#SYM?" H 4650 3310 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4660 3200 50  0001 C CNN
F 2 "" H 4650 3250 50  0001 C CNN
F 3 "~" H 4650 3250 50  0001 C CNN
	1    4650 3250
	1    0    0    -1  
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
	4650 4750 4750 4650
Entry Wire Line
	4650 4850 4750 4750
Entry Wire Line
	4650 5050 4750 4950
Entry Wire Line
	4650 5450 4750 5350
Entry Wire Line
	4650 5250 4750 5150
Wire Wire Line
	6100 5350 4750 5350
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A94AD
P 5800 4600
F 0 "#SYM?" H 5800 4660 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5810 4550 50  0001 C CNN
F 2 "" H 5800 4600 50  0001 C CNN
F 3 "~" H 5800 4600 50  0001 C CNN
	1    5800 4600
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A94F4
P 5800 4700
F 0 "#SYM?" H 5800 4760 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5810 4650 50  0001 C CNN
F 2 "" H 5800 4700 50  0001 C CNN
F 3 "~" H 5800 4700 50  0001 C CNN
	1    5800 4700
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A9507
P 5800 4900
F 0 "#SYM?" H 5800 4960 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5810 4850 50  0001 C CNN
F 2 "" H 5800 4900 50  0001 C CNN
F 3 "~" H 5800 4900 50  0001 C CNN
	1    5800 4900
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A951A
P 5800 5100
F 0 "#SYM?" H 5800 5160 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5810 5050 50  0001 C CNN
F 2 "" H 5800 5100 50  0001 C CNN
F 3 "~" H 5800 5100 50  0001 C CNN
	1    5800 5100
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E0A952D
P 5800 5300
F 0 "#SYM?" H 5800 5360 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5810 5250 50  0001 C CNN
F 2 "" H 5800 5300 50  0001 C CNN
F 3 "~" H 5800 5300 50  0001 C CNN
	1    5800 5300
	1    0    0    -1  
$EndComp
Wire Bus Line
	3400 4500 4650 4500
Wire Wire Line
	7800 5600 8000 5600
Wire Wire Line
	6100 5350 7800 5350
Wire Wire Line
	7800 5350 7800 5600
Connection ~ 6100 5350
Wire Wire Line
	7100 2200 8650 2200
Wire Wire Line
	6300 1000 6300 1800
Text Label 9050 4600 0    50   ~ 0
pumpState
$Comp
L LnConnectors:CONN_05 J?
U 1 1 5DF288BD
P 8000 4150
F 0 "J?" H 8056 4531 60  0001 C CNN
F 1 "CONN_05" H 8056 4531 60  0001 C CNN
F 2 "" H 8000 4150 60  0000 C CNN
F 3 "" H 8000 4150 60  0000 C CNN
	1    8000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3900 8150 3900
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5DF2F833
P 9400 2700
F 0 "Al_5Vcc?" H 9400 2600 40  0000 R CNN
F 1 "Alimentatore" H 9500 2400 40  0000 R CNN
F 2 "" H 9400 2675 60  0000 C CNN
F 3 "" H 9400 2675 60  0000 C CNN
	1    9400 2700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9150 2950 9000 2950
Wire Wire Line
	7300 5150 6100 5150
Connection ~ 6100 5150
Wire Wire Line
	8350 4200 8150 4200
Wire Wire Line
	8150 4100 8800 4100
Wire Wire Line
	8150 4300 8200 4300
Wire Wire Line
	8200 4300 8200 4750
Wire Wire Line
	8200 4750 6100 4750
Connection ~ 6100 4750
Text Label 7800 2850 0    50   ~ 0
pressControlState
Wire Wire Line
	7100 4950 6100 4950
Connection ~ 6100 4950
Connection ~ 9100 2850
Wire Wire Line
	9100 2850 9150 2850
$Comp
L power:+5VA #PWR?
U 1 1 5DF8F3A4
P 9100 2800
F 0 "#PWR?" H 9100 2650 50  0001 C CNN
F 1 "+5VA" H 9115 2973 50  0000 C CNN
F 2 "" H 9100 2800 50  0001 C CNN
F 3 "" H 9100 2800 50  0001 C CNN
	1    9100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2800 9100 2850
Wire Wire Line
	9100 3900 9100 2850
$Comp
L Device:R R?
U 1 1 5DF49EB1
P 10850 3000
F 0 "R?" H 10920 3046 50  0001 L CNN
F 1 "10K" V 10850 2900 50  0000 L CNN
F 2 "" V 10780 3000 50  0001 C CNN
F 3 "~" H 10850 3000 50  0001 C CNN
	1    10850 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DF434D9
P 10750 2700
F 0 "R?" V 10850 2700 50  0001 C CNN
F 1 "1K" V 10750 2700 50  0000 C CNN
F 2 "" V 10680 2700 50  0001 C CNN
F 3 "~" H 10750 2700 50  0001 C CNN
	1    10750 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9000 2950 9000 3250
$Comp
L LnDevice:RELAY_1RT K?
U 1 1 5DFA3B23
P 9700 4150
F 0 "K?" H 9725 4568 40  0000 C CNN
F 1 "RELAY_1RT" H 9725 4492 40  0000 C CNN
F 2 "" H 9700 4170 60  0000 C CNN
F 3 "" H 9700 4170 60  0000 C CNN
	1    9700 4150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10000 3650 10000 3900
Wire Wire Line
	10200 3650 10200 4300
Wire Wire Line
	9900 3900 10000 3900
Connection ~ 10000 3900
Wire Wire Line
	10000 3900 10000 4450
Wire Wire Line
	9900 4300 10200 4300
Wire Wire Line
	9050 2850 9100 2850
Wire Wire Line
	7800 2850 9100 2850
Connection ~ 10200 4300
Wire Wire Line
	10200 4300 10200 4450
Wire Wire Line
	9450 4100 9300 4100
Wire Wire Line
	9550 4200 9500 4200
Wire Wire Line
	9500 4200 9500 4600
Wire Wire Line
	9500 4600 9000 4600
$Comp
L power:+5VA #PWR?
U 1 1 5DFB25A6
P 9300 4050
F 0 "#PWR?" H 9300 3900 50  0001 C CNN
F 1 "+5VA" H 9315 4223 50  0000 C CNN
F 2 "" H 9300 4050 50  0001 C CNN
F 3 "" H 9300 4050 50  0001 C CNN
	1    9300 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4100 9300 4050
Wire Wire Line
	1050 3200 1050 3400
Wire Wire Line
	1050 3700 1050 3900
Wire Wire Line
	1450 4400 1050 4400
Wire Wire Line
	1050 4400 1050 4200
Connection ~ 1450 4400
Text Notes 700  4650 0    50   ~ 0
‍pressControlState, porta 5Vcc che accendono direttamente il LED
Text Notes 700  4750 0    50   ~ 0
e lo stato viene al contempo rilevato da Arduino.
Wire Wire Line
	3100 3200 5600 3200
Wire Wire Line
	5100 2800 5600 2800
Text Label 3600 3200 0    50   ~ 0
pressControlLED
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5DF5AAAF
P 4650 3150
F 0 "#SYM?" H 4650 3210 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 4660 3100 50  0001 C CNN
F 2 "" H 4650 3150 50  0001 C CNN
F 3 "~" H 4650 3150 50  0001 C CNN
	1    4650 3150
	-1   0    0    -1  
$EndComp
Wire Bus Line
	3400 2400 3400 4500
Wire Bus Line
	4650 4500 4650 5750
$EndSCHEMATC
