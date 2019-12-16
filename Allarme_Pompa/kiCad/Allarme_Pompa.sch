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
P 5750 2800
F 0 "A?" H 5750 1714 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" V 5750 2650 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5900 1850 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5750 1800 50  0001 C CNN
	1    5750 2800
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
P 2200 4050
F 0 "D?" V 2238 3932 50  0001 R CNN
F 1 "LED" V 2147 3932 50  0000 R CNN
F 2 "" H 2200 4050 50  0001 C CNN
F 3 "~" H 2200 4050 50  0001 C CNN
	1    2200 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Buzzer BZ?
U 1 1 5DEBAA3F
P 1800 3700
F 0 "BZ?" H 1850 3700 50  0001 C CNN
F 1 "Passive Buzzer" H 2050 3900 50  0000 C CNN
F 2 "" V 1775 3800 50  0001 C CNN
F 3 "~" V 1775 3800 50  0001 C CNN
	1    1800 3700
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
	2200 3850 2200 3900
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
	10450 5400 10450 5150
Wire Wire Line
	1900 3800 1900 4250
Wire Wire Line
	2200 4200 2200 4250
Text Label 3950 3400 0    50   ~ 0
Buzzer
Text Label 3950 3500 0    50   ~ 0
BlinkingLED
Wire Wire Line
	1900 3600 1900 3400
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
P 5750 3950
F 0 "#PWR0103" H 5750 3700 50  0001 C CNN
F 1 "GND" H 5755 3777 50  0000 C CNN
F 2 "" H 5750 3950 50  0001 C CNN
F 3 "" H 5750 3950 50  0001 C CNN
	1    5750 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3800 5750 3850
Wire Wire Line
	5750 3850 5850 3850
Wire Wire Line
	5850 3850 5850 3800
Connection ~ 5750 3850
Wire Wire Line
	5750 3850 5750 3950
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
Text Notes 6750 3000 0    50   ~ 0
Marrone
Text Notes 6750 3100 0    50   ~ 0
Bianco/Marrone
Text Notes 6750 3400 0    50   ~ 0
Arancio
Text Notes 6750 3500 0    50   ~ 0
Bianco/Arancio
Text Notes 6750 3200 0    50   ~ 0
Verde
Wire Wire Line
	10700 1050 10500 1050
Wire Wire Line
	9650 1050 9800 1050
Wire Wire Line
	9650 1150 9800 1150
$Comp
L power:GNDA #PWR0104
U 1 1 5DF0F3FB
P 10000 5750
F 0 "#PWR0104" H 10000 5500 50  0001 C CNN
F 1 "GNDA" H 10005 5577 50  0000 C CNN
F 2 "" H 10000 5750 50  0001 C CNN
F 3 "" H 10000 5750 50  0001 C CNN
	1    10000 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0105
U 1 1 5DF0F410
P 10650 5450
F 0 "#PWR0105" H 10650 5200 50  0001 C CNN
F 1 "GNDA" H 10655 5277 50  0000 C CNN
F 2 "" H 10650 5450 50  0001 C CNN
F 3 "" H 10650 5450 50  0001 C CNN
	1    10650 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5700 10000 5750
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
$Comp
L power:+5VA #PWR0106
U 1 1 5DF176AA
P 9500 2450
F 0 "#PWR0106" H 9500 2300 50  0001 C CNN
F 1 "+5VA" H 9515 2623 50  0000 C CNN
F 2 "" H 9500 2450 50  0001 C CNN
F 3 "" H 9500 2450 50  0001 C CNN
	1    9500 2450
	1    0    0    -1  
$EndComp
$Comp
L LnDevice:Relay_5V_LL RL?
U 1 1 5DF237EE
P 10000 5400
F 0 "RL?" H 10000 5878 50  0001 C CNN
F 1 "Relay_5V_LL" H 10000 5100 50  0000 C CNN
F 2 "" H 10000 5400 50  0001 C CNN
F 3 "" H 10000 5400 50  0001 C CNN
	1    10000 5400
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
Wire Wire Line
	4250 2500 5250 2500
Wire Wire Line
	4250 2600 5250 2600
Wire Wire Line
	4250 2700 5250 2700
Wire Wire Line
	5950 850  5950 1000
Wire Wire Line
	2700 1000 5950 1000
Connection ~ 5950 1000
$Comp
L power:GND #PWR0108
U 1 1 5DFBEF66
P 2200 4300
F 0 "#PWR0108" H 2200 4050 50  0001 C CNN
F 1 "GND" H 2205 4127 50  0000 C CNN
F 2 "" H 2200 4300 50  0001 C CNN
F 3 "" H 2200 4300 50  0001 C CNN
	1    2200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4250 2200 4250
Wire Wire Line
	2200 3550 2200 3500
$Comp
L power:GND #PWR0109
U 1 1 5E04EFD1
P 3800 1950
F 0 "#PWR0109" H 3800 1700 50  0001 C CNN
F 1 "GND" H 3900 1950 50  0000 C CNN
F 2 "" H 3800 1950 50  0001 C CNN
F 3 "" H 3800 1950 50  0001 C CNN
	1    3800 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2300 4250 1900
Text Label 4300 2400 0    50   ~ 0
pumpState
Text Label 4300 2500 0    50   ~ 0
pressControlPower
Text Label 4300 2600 0    50   ~ 0
Horn
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F74E
P 5000 2350
F 0 "#SYM?" H 5000 2410 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5010 2300 50  0001 C CNN
F 2 "" H 5000 2350 50  0001 C CNN
F 3 "~" H 5000 2350 50  0001 C CNN
	1    5000 2350
	1    0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F78F
P 5100 2450
F 0 "#SYM?" H 5100 2510 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5110 2400 50  0001 C CNN
F 2 "" H 5100 2450 50  0001 C CNN
F 3 "~" H 5100 2450 50  0001 C CNN
	1    5100 2450
	-1   0    0    -1  
$EndComp
$Comp
L Graphic:SYM_Arrow_Normal #SYM?
U 1 1 5E07F7A2
P 5100 2550
F 0 "#SYM?" H 5100 2610 50  0001 C CNN
F 1 "SYM_Arrow_Normal" H 5110 2500 50  0001 C CNN
F 2 "" H 5100 2550 50  0001 C CNN
F 3 "~" H 5100 2550 50  0001 C CNN
	1    5100 2550
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
	6600 3100 6700 3000
Entry Wire Line
	6600 3200 6700 3100
Entry Wire Line
	6600 3400 6700 3300
Entry Wire Line
	6600 3800 6700 3700
Entry Wire Line
	6600 3600 6700 3500
Wire Wire Line
	5950 1000 5950 1800
Text Label 7700 3300 0    50   ~ 0
pumpState
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5DF2F833
P 10100 2700
F 0 "Al_5Vcc?" H 10250 2500 40  0001 R CNN
F 1 "Alimentatore" H 10200 2400 40  0001 R CNN
F 2 "5V pressControl" H 10100 2650 30  0000 C CNN
F 3 "" H 10100 2675 60  0000 C CNN
	1    10100 2700
	-1   0    0    -1  
$EndComp
Text Label 7700 3100 0    50   ~ 0
pressControlState
Text Notes 700  4650 0    50   ~ 0
‍pressControlState, porta 5Vcc che accendono direttamente il LED
Text Notes 700  4750 0    50   ~ 0
e lo stato viene al contempo rilevato da Arduino.
Wire Wire Line
	6700 3000 7500 3000
Wire Wire Line
	6700 3100 7500 3100
$Comp
L LnConnectors:Mammuth_09a MM?
U 1 1 5DF5DA63
P 5550 5050
F 0 "MM?" H 5678 5088 40  0001 L CNN
F 1 "Mammuth_09a" H 5678 5050 40  0001 L CNN
F 2 "" H 5575 5300 60  0000 C CNN
F 3 "" H 5575 5300 60  0000 C CNN
	1    5550 5050
	1    0    0    1   
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
	6700 3200 7500 3200
Wire Wire Line
	6700 3400 7500 3400
Wire Wire Line
	6700 3600 7500 3600
$Comp
L LnDevice:PulsanteNO SW?
U 1 1 5DFEEB6E
P 2400 5950
F 0 "SW?" V 2250 6000 50  0001 C CNN
F 1 "PCButton" V 2500 5800 40  0000 C CNN
F 2 "" H 2400 5950 60  0000 C CNN
F 3 "" H 2400 5950 60  0000 C CNN
	1    2400 5950
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
Text Label 9300 1700 0    50   ~ 0
pc_button
Text Label 9900 2350 0    50   ~ 0
pc_GND
Text Label 7700 3700 0    50   ~ 0
pc_button
Wire Wire Line
	8900 1700 8900 3700
Wire Wire Line
	10700 1050 10700 2800
Wire Wire Line
	10500 1150 10500 2600
Wire Wire Line
	9700 1900 9700 2800
Wire Wire Line
	9500 2450 9500 2600
Wire Wire Line
	9800 2800 9700 2800
Connection ~ 9700 2800
Wire Wire Line
	9800 2600 9500 2600
Connection ~ 9500 2600
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
Text Notes 5750 4850 0    50   ~ 0
Celeste
Text Notes 5750 4750 0    50   ~ 0
Bianco/Celeste
Text Notes 5750 5450 0    50   ~ 0
Marrone
Text Notes 5750 5350 0    50   ~ 0
Bianco/Marrone
Text Notes 5750 5050 0    50   ~ 0
Arancio
Text Notes 5750 4950 0    50   ~ 0
Bianco/Arancio
Text Notes 5750 5250 0    50   ~ 0
Verde
Wire Wire Line
	6500 4950 5550 4950
Wire Wire Line
	5550 4650 6500 4650
Wire Wire Line
	5550 4750 6500 4750
Text Notes 5750 5150 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	5550 4850 6500 4850
Wire Wire Line
	5550 5150 6500 5150
Wire Wire Line
	5550 5350 6500 5350
Wire Wire Line
	5550 5050 6500 5050
Wire Wire Line
	5550 5250 6500 5250
Wire Wire Line
	1600 5250 1600 5350
Wire Wire Line
	1600 6050 1600 6150
Wire Wire Line
	2400 5750 2400 5900
Wire Wire Line
	2400 6150 2400 6000
Wire Wire Line
	2950 5850 2700 5850
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
F 1 "Active Buzzer" H 2000 5400 50  0000 C CNN
F 2 "" V 2025 5650 50  0001 C CNN
F 3 "~" V 2025 5650 50  0001 C CNN
	1    2050 5550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10700 3600 10700 4100
Wire Wire Line
	10500 3600 10500 3900
Wire Wire Line
	10400 3900 10500 3900
Connection ~ 10500 3900
Wire Wire Line
	10500 3900 10500 4400
Wire Wire Line
	10400 4100 10700 4100
Connection ~ 10700 4100
Wire Wire Line
	10700 4100 10700 4400
$Comp
L LnDevice:Alimentatore Al_5Vcc?
U 1 1 5E1C2DB3
P 10100 4000
F 0 "Al_5Vcc?" H 10250 3800 40  0001 R CNN
F 1 "Alimentatore" H 10200 3700 40  0001 R CNN
F 2 "5V Pump" H 10100 3950 30  0000 C CNN
F 3 "" H 10100 3975 60  0000 C CNN
	1    10100 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10350 5050 10450 5050
Wire Wire Line
	10350 5400 10450 5400
Wire Wire Line
	10350 5300 10650 5300
Wire Wire Line
	10650 5300 10650 5450
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
	2950 5750 2400 5750
Wire Wire Line
	1600 5250 2150 5250
Text Notes 1000 7650 0    50   ~ 0
Active Buzzer è messo come emergenza nel caso si dovesse rimuovere Arduino.\nCome pumpState deve arrivare un +5V. \nSuonerebbe in modo continuo ad ogni attacco di pompa.
Wire Wire Line
	2700 5850 2700 6150
Wire Wire Line
	4250 1900 3800 1900
Wire Wire Line
	3800 1900 3800 1950
Wire Wire Line
	7500 3300 6700 3300
Wire Wire Line
	7500 3500 6700 3500
Connection ~ 7500 3600
Wire Wire Line
	7500 3600 8150 3600
Connection ~ 7500 3700
Wire Wire Line
	7500 3700 8900 3700
Text Notes 6850 6250 0    50   ~ 0
Ard/NoArd indica se è presente o meno Arduino. Se è presente mandiamo un LowLevel\nSe non è presente inviamo i +5V che andranno sul buzzer attivo
$Comp
L LnDevice:Pulse SW?
U 1 1 5E2F9681
P 9150 1700
F 0 "SW?" H 9000 1800 70  0001 C CNN
F 1 "Pulse" H 9150 1600 70  0001 C CNN
F 2 "" H 9150 1700 60  0000 C CNN
F 3 "" H 9150 1700 60  0000 C CNN
	1    9150 1700
	1    0    0    -1  
$EndComp
Text Label 7700 3000 0    50   ~ 0
GNDA
Wire Wire Line
	10050 1550 10050 1700
Wire Wire Line
	10250 1550 10250 1900
Wire Wire Line
	8900 1700 10050 1700
Wire Wire Line
	9700 1900 10250 1900
Wire Wire Line
	8150 3600 8150 5550
Wire Wire Line
	8150 5550 9650 5550
$Comp
L Connector:Conn_01x05_Female J?
U 1 1 5E36919D
P 4050 2500
F 0 "J?" H 4078 2480 50  0001 L CNN
F 1 "Conn_01x05_Female" H 4077 2435 50  0001 L CNN
F 2 "" H 4050 2500 50  0001 C CNN
F 3 "~" H 4050 2500 50  0001 C CNN
	1    4050 2500
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5E36920E
P 4000 2500
F 0 "J?" H 3972 2477 50  0001 R CNN
F 1 "Conn_01x05_Male" H 3973 2432 50  0001 R CNN
F 2 "" H 4000 2500 50  0001 C CNN
F 3 "~" H 4000 2500 50  0001 C CNN
	1    4000 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10350 4850 10000 4850
Wire Wire Line
	10000 4850 10000 5100
Wire Wire Line
	10350 4850 10350 5050
Wire Wire Line
	1600 6150 2400 6150
Wire Wire Line
	2150 5450 2150 5250
Connection ~ 2150 5250
Wire Wire Line
	2150 5250 2450 5250
$Comp
L Connector:Conn_01x04_Male J?
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
L Connector:Conn_01x04_Female J?
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
	2700 6150 2400 6150
Connection ~ 2400 6150
$Comp
L power:GNDA #PWR0110
U 1 1 5DFBEDEF
P 9700 3150
F 0 "#PWR0110" H 9700 2900 50  0001 C CNN
F 1 "GNDA" H 9705 2977 50  0000 C CNN
F 2 "" H 9700 3150 50  0001 C CNN
F 3 "" H 9700 3150 50  0001 C CNN
	1    9700 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2800 9700 3000
Wire Wire Line
	7500 3100 9500 3100
Wire Wire Line
	9500 2600 9500 3100
Connection ~ 7500 3100
Wire Wire Line
	7500 3000 9100 3000
Connection ~ 7500 3000
Connection ~ 9700 3000
Wire Wire Line
	9700 3000 9700 3150
$Comp
L power:GNDA #PWR0111
U 1 1 5DFCCF19
P 2400 6250
F 0 "#PWR0111" H 2400 6000 50  0001 C CNN
F 1 "GNDA" H 2405 6077 50  0000 C CNN
F 2 "" H 2400 6250 50  0001 C CNN
F 3 "" H 2400 6250 50  0001 C CNN
	1    2400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6250 2400 6150
Wire Wire Line
	2150 5650 2950 5650
Wire Wire Line
	2450 5250 2450 5550
Wire Wire Line
	2450 5550 2950 5550
$Comp
L LnDevice:PulsanteNO SW?
U 1 1 5E0017B1
P 5450 7200
F 0 "SW?" V 5300 7250 50  0001 C CNN
F 1 "PCButton" V 5550 7050 40  0000 C CNN
F 2 "" H 5450 7200 60  0000 C CNN
F 3 "" H 5450 7200 60  0000 C CNN
	1    5450 7200
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5E0017B7
P 4550 7150
F 0 "D?" V 4588 7032 50  0001 R CNN
F 1 "PCState" V 4650 7250 50  0000 R CNN
F 2 "" H 4550 7150 50  0001 C CNN
F 3 "~" H 4550 7150 50  0001 C CNN
	1    4550 7150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5E0017BD
P 4550 6750
F 0 "R?" H 4618 6796 50  0001 L CNN
F 1 "470" V 4450 6650 50  0000 L CNN
F 2 "" V 4590 6740 50  0001 C CNN
F 3 "~" H 4550 6750 50  0001 C CNN
	1    4550 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6900 4550 7000
Wire Wire Line
	4550 6500 4550 6600
Wire Wire Line
	4550 7300 4550 7400
Wire Wire Line
	5450 7000 5450 7150
Wire Wire Line
	5450 7400 5450 7250
Wire Wire Line
	5900 7100 5650 7100
$Comp
L Device:Buzzer BZ?
U 1 1 5E0017C9
P 5000 7150
F 0 "BZ?" H 5050 7150 50  0001 C CNN
F 1 "Active Buzzer" H 4950 7000 50  0000 C CNN
F 2 "" V 4975 7250 50  0001 C CNN
F 3 "~" V 4975 7250 50  0001 C CNN
	1    5000 7150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5900 7000 5450 7000
Wire Wire Line
	5650 7100 5650 7400
Wire Wire Line
	4550 7400 5100 7400
Text Notes 5150 6800 0    50   ~ 0
+5Vcc Press_Control
Wire Wire Line
	5650 7400 5450 7400
Connection ~ 5450 7400
$Comp
L power:GNDA #PWR0112
U 1 1 5E0017E5
P 5450 7500
F 0 "#PWR0112" H 5450 7250 50  0001 C CNN
F 1 "GNDA" H 5455 7327 50  0000 C CNN
F 2 "" H 5450 7500 50  0001 C CNN
F 3 "" H 5450 7500 50  0001 C CNN
	1    5450 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 7500 5450 7400
Wire Wire Line
	5100 6500 5100 6800
Wire Wire Line
	5100 6800 5900 6800
Wire Wire Line
	5100 7250 5100 7400
Connection ~ 5100 7400
Wire Wire Line
	5100 7400 5450 7400
Wire Wire Line
	4550 6500 5100 6500
Wire Wire Line
	5100 7050 5100 6900
Wire Wire Line
	5100 6900 5900 6900
Text Notes 5150 6900 0    50   ~ 0
+5Vcc Pump
Text Notes 1600 5250 0    50   ~ 0
+5Vcc Press_Control
Text Notes 2250 5650 0    50   ~ 0
GND from Pump
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5E02082C
P 6100 7000
F 0 "J?" H 6072 6977 50  0001 R CNN
F 1 "Conn_01x05_Male" H 6073 6932 50  0001 R CNN
F 2 "" H 6100 7000 50  0001 C CNN
F 3 "~" H 6100 7000 50  0001 C CNN
	1    6100 7000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5E020839
P 6150 7000
F 0 "J?" H 6178 6980 50  0001 L CNN
F 1 "Conn_01x05_Female" H 6177 6935 50  0001 L CNN
F 2 "" H 6150 7000 50  0001 C CNN
F 3 "~" H 6150 7000 50  0001 C CNN
	1    6150 7000
	-1   0    0    1   
$EndComp
$Comp
L LnDevice:Relay-Reed K?
U 1 1 5E02F159
P 9450 4050
F 0 "K?" H 9170 4096 50  0000 R CNN
F 1 "Relay-Reed" H 9650 3950 50  0000 R CNN
F 2 "" H 9800 4000 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 9500 4050 50  0001 C CNN
	1    9450 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 3300 9300 3300
Wire Wire Line
	9300 3300 9300 3800
Connection ~ 7500 3300
Wire Wire Line
	9300 4400 9300 4300
Wire Wire Line
	9800 3900 9800 3700
Wire Wire Line
	9800 3700 9550 3700
Wire Wire Line
	9550 3700 9550 3800
Wire Wire Line
	9550 4300 9550 4400
Wire Wire Line
	9550 4400 9800 4400
Wire Wire Line
	9800 4400 9800 4100
$Comp
L LnDevice:Jumper3_B SW?
U 1 1 5E0580D5
P 9100 4400
F 0 "SW?" V 9100 4501 50  0001 L CNN
F 1 "Jumper3_B" V 9145 4501 50  0001 L CNN
F 2 "" H 9050 4520 60  0000 C CNN
F 3 "" H 9050 4520 60  0000 C CNN
	1    9100 4400
	0    1    -1   0   
$EndComp
Wire Wire Line
	9150 4400 9300 4400
Wire Wire Line
	9100 4300 9100 3000
Connection ~ 9100 3000
Wire Wire Line
	9100 3000 9700 3000
Wire Wire Line
	7500 3800 8900 3800
Wire Wire Line
	8900 3800 8900 4600
Wire Wire Line
	8900 4600 9100 4600
Wire Wire Line
	9100 4600 9100 4500
Text Notes 8300 4850 0    25   ~ 0
Il jumper cambia il riferimento di massa e quindi\ndecide se deve suonare il buzzer dentro il frutto di pressControl\noppure il buzzer dentro il frutto di  Arduino.\nNel primo caso si ha un suono continuo per tutto il tempo in cui la pompa rimane accesa.\nNel secondo caso suonerà come stabilito da Arduino.
Entry Wire Line
	6600 3900 6700 3800
Entry Wire Line
	6500 5450 6600 5550
Wire Wire Line
	5550 5450 6500 5450
Wire Wire Line
	6700 3800 7500 3800
Connection ~ 7500 3800
Text Notes 6750 3800 0    50   ~ 0
Calza
Text Notes 5750 4650 0    50   ~ 0
Calza
Text Label 4700 4750 0    50   ~ 0
pc_button
Wire Wire Line
	5550 4650 5300 4650
Wire Wire Line
	5300 4650 5300 3850
Wire Wire Line
	5300 3850 5750 3850
Connection ~ 5550 4650
Wire Wire Line
	3400 5850 4800 5850
Wire Wire Line
	4800 5850 4800 5450
Connection ~ 5550 5450
Wire Wire Line
	4800 5450 5550 5450
Wire Wire Line
	3400 5550 3550 5550
Wire Wire Line
	3550 5550 3550 5350
Wire Wire Line
	3550 5350 5550 5350
Connection ~ 5550 5350
Wire Wire Line
	3400 5750 4650 5750
Wire Wire Line
	4650 5750 4650 4750
Wire Wire Line
	4650 4750 5550 4750
Connection ~ 5550 4750
$Comp
L LnDevice:Jumper3_B SW?
U 1 1 5E11CA4D
P 4100 5150
F 0 "SW?" V 4100 5251 50  0001 L CNN
F 1 "Jumper3_B" V 4145 5251 50  0001 L CNN
F 2 "" H 4050 5270 60  0000 C CNN
F 3 "" H 4050 5270 60  0000 C CNN
	1    4100 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 5150 5550 5150
Connection ~ 5550 5150
Wire Wire Line
	4100 5250 4100 5650
Wire Wire Line
	4100 5650 3400 5650
Text Label 4700 5150 0    50   ~ 0
pumpState
Text Label 4700 5350 0    50   ~ 0
pressControlState
Text Label 7700 3600 0    50   ~ 0
Horn
Wire Wire Line
	4250 2400 5250 2400
$Comp
L LnDevice:Edge SW?
U 1 1 5E2F36EA
P 4800 2400
F 0 "SW?" H 4650 2500 70  0001 C CNN
F 1 "Edge" H 4800 2300 70  0001 C CNN
F 2 "" H 4800 2400 60  0000 C CNN
F 3 "" H 4800 2400 60  0000 C CNN
	1    4800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5050 3350 5050
Wire Wire Line
	3350 5050 3350 2400
Wire Wire Line
	3350 2400 3800 2400
Wire Wire Line
	3550 5350 3550 2500
Wire Wire Line
	3550 2500 3800 2500
Connection ~ 3550 5350
Wire Wire Line
	5550 4850 3700 4850
Wire Wire Line
	3700 4850 3700 2600
Wire Wire Line
	3700 2600 3800 2600
Connection ~ 5550 4850
Wire Notes Line
	1400 5100 2900 5100
Wire Notes Line
	2900 5100 2900 6500
Wire Notes Line
	2900 6500 1400 6500
Wire Notes Line
	1400 6500 1400 5100
Text Notes 1450 6450 0    50   ~ 0
Frutto del PressControl \nnel Quadro elettrico \ndel Salone
Wire Wire Line
	1900 3400 5250 3400
Wire Wire Line
	2200 3500 5250 3500
Wire Wire Line
	2200 4250 2200 4300
Connection ~ 2200 4250
Wire Bus Line
	6600 2850 6600 5750
$EndSCHEMATC
