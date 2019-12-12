EESchema Schematic File Version 4
LIBS:Allarme_Pompa_no_Arduino-cache
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
P 2850 4250
F 0 "#PWR?" H 2850 4000 50  0001 C CNN
F 1 "GNDA" H 2855 4077 50  0000 C CNN
F 2 "" H 2850 4250 50  0001 C CNN
F 3 "" H 2850 4250 50  0001 C CNN
	1    2850 4250
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
Wire Wire Line
	7850 4000 7850 3800
Wire Wire Line
	7850 3800 8150 3800
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
P 5150 3400
F 0 "MM?" H 5278 3438 40  0001 L CNN
F 1 "Mammuth_09a" H 5278 3400 40  0001 L CNN
F 2 "" H 5175 3650 60  0000 C CNN
F 3 "" H 5175 3650 60  0000 C CNN
	1    5150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF5DA69
P 4900 3900
F 0 "#PWR?" H 4900 3650 50  0001 C CNN
F 1 "GND" H 4905 3727 50  0000 C CNN
F 2 "" H 4900 3900 50  0001 C CNN
F 3 "" H 4900 3900 50  0001 C CNN
	1    4900 3900
	1    0    0    -1  
$EndComp
Text Notes 7400 3300 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	7350 3700 8150 3700
Entry Wire Line
	6100 3700 6200 3800
Entry Wire Line
	6100 3500 6200 3600
Entry Wire Line
	6100 3300 6200 3400
Entry Wire Line
	6100 3100 6200 3200
Entry Wire Line
	6100 3000 6200 3100
Entry Wire Line
	6100 3200 6200 3300
Entry Wire Line
	6100 3400 6200 3500
Entry Wire Line
	6100 3600 6200 3700
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
L LnDevice:PulsanteNO SW?
U 1 1 5DFEEB6E
P 4700 3850
F 0 "SW?" V 4550 3900 50  0001 C CNN
F 1 "PCButton" V 4800 3700 40  0000 C CNN
F 2 "" H 4700 3850 60  0000 C CNN
F 3 "" H 4700 3850 60  0000 C CNN
	1    4700 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFEEBE6
P 3150 3700
F 0 "D?" V 3188 3582 50  0001 R CNN
F 1 "PCState" V 3250 3800 50  0000 R CNN
F 2 "" H 3150 3700 50  0001 C CNN
F 3 "~" H 3150 3700 50  0001 C CNN
	1    3150 3700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DFEEBEC
P 3150 3350
F 0 "R?" H 3218 3396 50  0001 L CNN
F 1 "470" V 3050 3250 50  0000 L CNN
F 2 "" V 3190 3340 50  0001 C CNN
F 3 "~" H 3150 3350 50  0001 C CNN
	1    3150 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3500 3150 3550
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
Text Notes 5350 3600 0    50   ~ 0
Celeste
Text Notes 5350 3700 0    50   ~ 0
Bianco/Celeste
Text Notes 5350 3000 0    50   ~ 0
Marrone
Text Notes 5350 3100 0    50   ~ 0
Bianco/Marrone
Text Notes 5350 3400 0    50   ~ 0
Arancio
Text Notes 5350 3500 0    50   ~ 0
Bianco/Arancio
Text Notes 5350 3200 0    50   ~ 0
Verde
Wire Wire Line
	6100 3300 5150 3300
Wire Wire Line
	5150 3000 6100 3000
Wire Wire Line
	5150 3100 6100 3100
Text Notes 5350 3300 0    50   ~ 0
Bianco/Verde
Wire Wire Line
	5150 3200 6100 3200
Wire Wire Line
	5150 3500 6100 3500
Wire Wire Line
	5150 3700 6100 3700
Wire Wire Line
	5150 3400 6100 3400
Wire Wire Line
	5150 3600 6100 3600
Wire Wire Line
	5150 3000 2850 3000
Connection ~ 5150 3000
Wire Wire Line
	5150 3100 3150 3100
Wire Wire Line
	3150 3100 3150 3200
Connection ~ 5150 3100
Wire Wire Line
	2850 3000 2850 4100
Wire Wire Line
	3150 3850 3150 4100
Connection ~ 2850 4100
Wire Wire Line
	2850 4100 2850 4250
Wire Wire Line
	8150 3700 8900 3700
Connection ~ 8150 3700
Wire Wire Line
	9200 3300 8150 3300
Connection ~ 8150 3300
Wire Wire Line
	5150 3700 4700 3700
Wire Wire Line
	4700 3700 4700 3800
Wire Wire Line
	4700 4100 4700 3900
Connection ~ 3150 4100
Wire Wire Line
	3150 4100 3900 4100
Wire Wire Line
	2850 4100 3150 4100
Connection ~ 5150 3700
Wire Wire Line
	5150 3800 4900 3800
Wire Wire Line
	4900 3800 4900 3900
$Comp
L Device:Buzzer BZ?
U 1 1 5DF25F7B
P 3700 3400
F 0 "BZ?" H 3750 3450 50  0001 C CNN
F 1 "Buzzer" H 3500 3400 50  0000 C CNN
F 2 "" V 3675 3500 50  0001 C CNN
F 3 "~" V 3675 3500 50  0001 C CNN
	1    3700 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 3300 5150 3300
Connection ~ 5150 3300
Wire Wire Line
	3800 3500 3900 3500
Wire Wire Line
	3900 3500 3900 4100
Wire Bus Line
	7250 2850 7250 4100
Wire Bus Line
	6200 2850 6200 4100
Connection ~ 3900 4100
Wire Wire Line
	3900 4100 4700 4100
$EndSCHEMATC
