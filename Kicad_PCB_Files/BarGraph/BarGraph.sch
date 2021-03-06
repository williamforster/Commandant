EESchema Schematic File Version 4
LIBS:BarGraph-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR02
U 1 1 5CB1C99B
P 2600 4350
F 0 "#PWR02" H 2600 4100 50  0001 C CNN
F 1 "GND" H 2605 4177 50  0000 C CNN
F 2 "" H 2600 4350 50  0001 C CNN
F 3 "" H 2600 4350 50  0001 C CNN
	1    2600 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5CB1CDEC
P 2500 4350
F 0 "#PWR01" H 2500 4100 50  0001 C CNN
F 1 "GND" H 2505 4177 50  0000 C CNN
F 2 "" H 2500 4350 50  0001 C CNN
F 3 "" H 2500 4350 50  0001 C CNN
	1    2500 4350
	1    0    0    -1  
$EndComp
Text GLabel 3100 3400 2    50   Input ~ 0
USB5V
Text GLabel 5950 3800 0    50   Input ~ 0
USB5V
$Comp
L Device:CP1 C1
U 1 1 5CB23D04
P 3700 3600
F 0 "C1" H 3815 3646 50  0000 L CNN
F 1 "22u" H 3815 3555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3700 3600 50  0001 C CNN
F 3 "~" H 3700 3600 50  0001 C CNN
	1    3700 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5CB25804
P 5000 3600
F 0 "#PWR05" H 5000 3350 50  0001 C CNN
F 1 "GND" H 5005 3427 50  0000 C CNN
F 2 "" H 5000 3600 50  0001 C CNN
F 3 "" H 5000 3600 50  0001 C CNN
	1    5000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3600 5150 3600
Wire Wire Line
	5150 3800 5150 3600
Connection ~ 5150 3600
Wire Wire Line
	5150 3600 5400 3600
$Comp
L Device:R R1
U 1 1 5CB26FC5
P 3150 3950
F 0 "R1" V 2943 3950 50  0000 C CNN
F 1 "10k" V 3034 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3080 3950 50  0001 C CNN
F 3 "~" H 3150 3950 50  0001 C CNN
	1    3150 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 3950 3000 3950
$Comp
L power:GND #PWR07
U 1 1 5CB2C918
P 5950 4550
F 0 "#PWR07" H 5950 4300 50  0001 C CNN
F 1 "GND" H 5955 4377 50  0000 C CNN
F 2 "" H 5950 4550 50  0001 C CNN
F 3 "" H 5950 4550 50  0001 C CNN
	1    5950 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5CB2E4E5
P 3700 3750
F 0 "#PWR03" H 3700 3500 50  0001 C CNN
F 1 "GND" H 3705 3577 50  0000 C CNN
F 2 "" H 3700 3750 50  0001 C CNN
F 3 "" H 3700 3750 50  0001 C CNN
	1    3700 3750
	1    0    0    -1  
$EndComp
Text GLabel 7750 3000 0    50   Input ~ 0
USB5V
Wire Wire Line
	9300 3000 9300 3350
Wire Wire Line
	9300 4700 9200 4700
Wire Wire Line
	9200 4550 9300 4550
Connection ~ 9300 4550
Wire Wire Line
	9300 4550 9300 4700
Wire Wire Line
	9200 4400 9300 4400
Connection ~ 9300 4400
Wire Wire Line
	9300 4400 9300 4550
Wire Wire Line
	9200 4250 9300 4250
Connection ~ 9300 4250
Wire Wire Line
	9300 4250 9300 4400
Wire Wire Line
	9200 4100 9300 4100
Connection ~ 9300 4100
Wire Wire Line
	9300 4100 9300 4250
Wire Wire Line
	9200 3950 9300 3950
Connection ~ 9300 3950
Wire Wire Line
	9300 3950 9300 4100
Wire Wire Line
	9200 3800 9300 3800
Connection ~ 9300 3800
Wire Wire Line
	9300 3800 9300 3950
Wire Wire Line
	9200 3650 9300 3650
Connection ~ 9300 3650
Wire Wire Line
	9300 3650 9300 3800
Wire Wire Line
	9200 3500 9300 3500
Connection ~ 9300 3500
Wire Wire Line
	9300 3500 9300 3650
Wire Wire Line
	9200 3350 9300 3350
Connection ~ 9300 3350
Wire Wire Line
	9300 3350 9300 3500
$Comp
L power:GND #PWR06
U 1 1 5CB42D13
P 5100 4950
F 0 "#PWR06" H 5100 4700 50  0001 C CNN
F 1 "GND" H 5105 4777 50  0000 C CNN
F 2 "" H 5100 4950 50  0001 C CNN
F 3 "" H 5100 4950 50  0001 C CNN
	1    5100 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5CB44C34
P 5100 4700
F 0 "R4" V 4893 4700 50  0000 C CNN
F 1 "1.6k" V 4984 4700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5030 4700 50  0001 C CNN
F 3 "~" H 5100 4700 50  0001 C CNN
	1    5100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3400 3100 3400
$Comp
L Connector:TestPoint TP4
U 1 1 5CB4BC5D
P 8100 3000
F 0 "TP4" H 8158 3118 50  0000 L CNN
F 1 "TestPoint" H 8158 3027 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 8300 3000 50  0001 C CNN
F 3 "~" H 8300 3000 50  0001 C CNN
	1    8100 3000
	1    0    0    -1  
$EndComp
Connection ~ 8100 3000
Wire Wire Line
	8100 3000 9300 3000
Wire Wire Line
	5100 4400 5100 4550
Wire Wire Line
	5100 4850 5100 4950
Wire Wire Line
	3300 3950 3500 3950
Wire Wire Line
	3500 3950 3500 3450
Wire Wire Line
	3700 3450 3500 3450
Wire Wire Line
	3700 3450 3800 3450
Connection ~ 3700 3450
Wire Wire Line
	3800 3450 4000 3450
Wire Wire Line
	4000 3450 4000 3900
Connection ~ 3800 3450
Wire Wire Line
	2900 3750 2900 3400
$Comp
L power:GND #PWR04
U 1 1 5CB60BC4
P 4200 4450
F 0 "#PWR04" H 4200 4200 50  0001 C CNN
F 1 "GND" H 4205 4277 50  0000 C CNN
F 2 "" H 4200 4450 50  0001 C CNN
F 3 "" H 4200 4450 50  0001 C CNN
	1    4200 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5CB49173
P 3800 3450
F 0 "TP1" H 3858 3568 50  0000 L CNN
F 1 "TestPoint" H 3858 3477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 4000 3450 50  0001 C CNN
F 3 "~" H 4000 3450 50  0001 C CNN
	1    3800 3450
	1    0    0    -1  
$EndComp
Connection ~ 3900 4450
Wire Wire Line
	3900 4450 3900 4050
Text GLabel 3600 4450 0    50   Input ~ 0
USB5V
$Comp
L Device:R R3
U 1 1 5CB6073B
P 4050 4450
F 0 "R3" V 3843 4450 50  0000 C CNN
F 1 "3.6k" V 3934 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 3980 4450 50  0001 C CNN
F 3 "~" H 4050 4450 50  0001 C CNN
	1    4050 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5CB5E1E9
P 3750 4450
F 0 "R2" V 3543 4450 50  0000 C CNN
F 1 "1.6k" V 3634 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 3680 4450 50  0001 C CNN
F 3 "~" H 3750 4450 50  0001 C CNN
	1    3750 4450
	0    1    1    0   
$EndComp
Wire Notes Line
	4400 4700 3250 4700
Wire Notes Line
	3250 4700 3250 4150
Wire Notes Line
	3250 4150 4400 4150
Wire Notes Line
	4400 4150 4400 4700
Text Notes 3200 4800 0    50   ~ 0
Optional Divider for Reference High
$Comp
L lm3914n:LM3914N U2
U 1 1 5D46F6ED
P 6500 4100
F 0 "U2" H 6500 5015 50  0000 C CNN
F 1 "LM3914N" H 6500 4924 50  0000 C CNN
F 2 "Package_DIP:DIP-18_W7.62mm_Socket_LongPads" H 6500 3900 50  0001 C CNN
F 3 "" H 6500 3900 50  0001 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3000 8100 3000
Wire Wire Line
	5550 3600 5550 3650
Wire Wire Line
	5550 3650 5950 3650
Wire Wire Line
	5600 3800 5600 3950
Wire Wire Line
	5600 3950 5950 3950
Wire Wire Line
	5150 3800 5600 3800
Wire Wire Line
	5100 4400 5950 4400
Wire Wire Line
	4550 4250 4550 4050
Wire Wire Line
	4550 4050 3900 4050
Wire Wire Line
	4550 4250 5950 4250
Wire Wire Line
	4000 3900 4750 3900
Wire Wire Line
	4750 3900 4750 4100
Wire Wire Line
	4750 4100 5950 4100
$Comp
L Custom:LED-Bar-Graph U1
U 1 1 5CB1C738
P 8850 4050
F 0 "U1" H 8875 3135 50  0000 C CNN
F 1 "LED-Bar-Graph" H 8875 3226 50  0000 C CNN
F 2 "ledbar:led-bar-graph-10" H 8850 4050 50  0001 C CNN
F 3 "" H 8850 4050 50  0001 C CNN
	1    8850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3350 7900 3350
Wire Wire Line
	7900 3350 7900 3200
Wire Wire Line
	7900 3200 5950 3200
Wire Wire Line
	5950 3200 5950 3500
$Comp
L Connector:USB_B J1
U 1 1 5D489EC6
P 2600 3950
F 0 "J1" H 2657 4417 50  0000 C CNN
F 1 "USB_B" H 2657 4326 50  0000 C CNN
F 2 "SmartGluttonV1:USB_B_Molex_USB-67068-xx1x_StraightTab_Horizontal" H 2750 3900 50  0001 C CNN
F 3 " ~" H 2750 3900 50  0001 C CNN
	1    2600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4700 7050 4700
Wire Wire Line
	8550 4550 7050 4550
Wire Wire Line
	7050 4400 8550 4400
Wire Wire Line
	8550 4250 7050 4250
Wire Wire Line
	7050 4100 8550 4100
Wire Wire Line
	8550 3950 7050 3950
Wire Wire Line
	7050 3800 8550 3800
Wire Wire Line
	8550 3650 7050 3650
Wire Wire Line
	7050 3500 8550 3500
$Comp
L Connector:TestPoint TP2
U 1 1 5D467D46
P 5400 3600
F 0 "TP2" H 5458 3718 50  0000 L CNN
F 1 "TestPoint" H 5458 3627 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 5600 3600 50  0001 C CNN
F 3 "~" H 5600 3600 50  0001 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
Connection ~ 5400 3600
Wire Wire Line
	5400 3600 5550 3600
Text GLabel 5950 4700 0    50   Input ~ 0
USB5V
$Comp
L Mechanical:MountingHole H1
U 1 1 5D46FB90
P 3950 2450
F 0 "H1" H 4050 2496 50  0000 L CNN
F 1 "MountingHole" H 4050 2405 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 3950 2450 50  0001 C CNN
F 3 "~" H 3950 2450 50  0001 C CNN
	1    3950 2450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5D4716A5
P 4200 2450
F 0 "H3" H 4300 2496 50  0000 L CNN
F 1 "MountingHole" H 4300 2405 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 4200 2450 50  0001 C CNN
F 3 "~" H 4200 2450 50  0001 C CNN
	1    4200 2450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D4718D9
P 3950 2700
F 0 "H2" H 4050 2746 50  0000 L CNN
F 1 "MountingHole" H 4050 2655 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 3950 2700 50  0001 C CNN
F 3 "~" H 3950 2700 50  0001 C CNN
	1    3950 2700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5D471C37
P 4200 2700
F 0 "H4" H 4300 2746 50  0000 L CNN
F 1 "MountingHole" H 4300 2655 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 4200 2700 50  0001 C CNN
F 3 "~" H 4200 2700 50  0001 C CNN
	1    4200 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D623D89
P 3150 4050
F 0 "R5" V 2943 4050 50  0000 C CNN
F 1 "10k" V 3034 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3080 4050 50  0001 C CNN
F 3 "~" H 3150 4050 50  0001 C CNN
	1    3150 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 4050 3000 4050
Wire Wire Line
	3300 4050 3900 4050
Connection ~ 3900 4050
$EndSCHEMATC
