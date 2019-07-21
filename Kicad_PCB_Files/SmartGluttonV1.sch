EESchema Schematic File Version 4
LIBS:SmartGluttonV1-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
L power:+3V3 #PWR011
U 1 1 5CC4B7B4
P 5900 1550
F 0 "#PWR011" H 5900 1400 50  0001 C CNN
F 1 "+3V3" V 5915 1678 50  0000 L CNN
F 2 "" H 5900 1550 50  0001 C CNN
F 3 "" H 5900 1550 50  0001 C CNN
	1    5900 1550
	0    -1   -1   0   
$EndComp
$Comp
L Regulator_Linear:MCP1700-3002E_TO92 U2
U 1 1 5CC44C53
P 6200 1550
F 0 "U2" H 6200 1308 50  0000 C CNN
F 1 "MCP1700-3002E_TO92" H 6200 1399 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 6200 1350 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001826D.pdf" H 6200 1550 50  0001 C CNN
F 4 "ETSG" H 6200 1550 50  0001 C CNN "Vendor"
	1    6200 1550
	-1   0    0    1   
$EndComp
$Comp
L Connector:USB_B J6
U 1 1 5CC50BBC
P 10000 1500
F 0 "J6" H 9770 1489 50  0000 R CNN
F 1 "USB_B" H 9770 1398 50  0000 R CNN
F 2 "SmartGluttonV1:USB_B_Molex_USB-67068-xx1x_StraightTab_Horizontal" H 10150 1450 50  0001 C CNN
F 3 " ~" H 10150 1450 50  0001 C CNN
F 4 "https://au.rs-online.com/web/p/type-b-usb-connectors/8006860/" H 10000 1500 50  0001 C CNN "Vendor"
	1    10000 1500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5CC52AA9
P 10000 2350
F 0 "#PWR021" H 10000 2100 50  0001 C CNN
F 1 "GND" H 10005 2177 50  0000 C CNN
F 2 "" H 10000 2350 50  0001 C CNN
F 3 "" H 10000 2350 50  0001 C CNN
	1    10000 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 5CC53FBF
P 9700 1300
F 0 "#PWR019" H 9700 1150 50  0001 C CNN
F 1 "+5V" V 9715 1428 50  0000 L CNN
F 2 "" H 9700 1300 50  0001 C CNN
F 3 "" H 9700 1300 50  0001 C CNN
	1    9700 1300
	0    -1   -1   0   
$EndComp
$Comp
L Interface_USB:FT231XS U1
U 1 1 5CC549D0
P 3550 4850
F 0 "U1" H 3200 5800 50  0000 C CNN
F 1 "FT231XS" H 3200 5700 50  0000 C CNN
F 2 "Package_SO:SSOP-20_3.9x8.7mm_P0.635mm" H 4150 3900 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT231X.html" H 3550 4850 50  0001 C CNN
F 4 "https://au.rs-online.com/web/p/universal-asynchronous-receivers-transmitters/7570032/" H 3550 4850 50  0001 C CNN "Vendor"
	1    3550 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5CC56543
P 5550 3250
F 0 "#PWR09" H 5550 3100 50  0001 C CNN
F 1 "+5V" H 5565 3423 50  0000 C CNN
F 2 "" H 5550 3250 50  0001 C CNN
F 3 "" H 5550 3250 50  0001 C CNN
	1    5550 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5CC57CB8
P 2300 4550
F 0 "R1" V 2500 4400 50  0000 C CNN
F 1 "27" V 2200 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 4550 50  0001 C CNN
F 3 "~" H 2300 4550 50  0001 C CNN
F 4 "ETSG" V 2300 4550 50  0001 C CNN "Vendor"
	1    2300 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5CC58F3E
P 2300 4650
F 0 "R2" V 2100 4500 50  0000 C CNN
F 1 "27" V 2400 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 4650 50  0001 C CNN
F 3 "~" H 2300 4650 50  0001 C CNN
F 4 "ETSG" V 2300 4650 50  0001 C CNN "Vendor"
	1    2300 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 4550 2450 4550
Wire Wire Line
	2450 4650 2850 4650
$Comp
L Device:C C3
U 1 1 5CC59D5A
P 1700 4800
F 0 "C3" H 1815 4846 50  0000 L CNN
F 1 "47pF" H 1815 4755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1738 4650 50  0001 C CNN
F 3 "~" H 1700 4800 50  0001 C CNN
F 4 "ETSG" H 1700 4800 50  0001 C CNN "Vendor"
	1    1700 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5CC5A681
P 1250 4800
F 0 "C2" H 1365 4846 50  0000 L CNN
F 1 "47pF" H 1365 4755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1288 4650 50  0001 C CNN
F 3 "~" H 1250 4800 50  0001 C CNN
F 4 "ETSG" H 1250 4800 50  0001 C CNN "Vendor"
	1    1250 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4650 1700 4650
Wire Wire Line
	2150 4550 1250 4550
Wire Wire Line
	1250 4550 1250 4650
$Comp
L power:GND #PWR04
U 1 1 5CC5B08B
P 1700 4950
F 0 "#PWR04" H 1700 4700 50  0001 C CNN
F 1 "GND" H 1705 4777 50  0000 C CNN
F 2 "" H 1700 4950 50  0001 C CNN
F 3 "" H 1700 4950 50  0001 C CNN
	1    1700 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5CC5B7AC
P 1250 4950
F 0 "#PWR03" H 1250 4700 50  0001 C CNN
F 1 "GND" H 1255 4777 50  0000 C CNN
F 2 "" H 1250 4950 50  0001 C CNN
F 3 "" H 1250 4950 50  0001 C CNN
	1    1250 4950
	1    0    0    -1  
$EndComp
Text GLabel 9700 1500 0    50   BiDi ~ 0
D+
Text GLabel 9700 1600 0    50   BiDi ~ 0
D-
$Comp
L power:+5V #PWR014
U 1 1 5CC5C878
P 6500 1550
F 0 "#PWR014" H 6500 1400 50  0001 C CNN
F 1 "+5V" V 6515 1678 50  0000 L CNN
F 2 "" H 6500 1550 50  0001 C CNN
F 3 "" H 6500 1550 50  0001 C CNN
	1    6500 1550
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5CC5D45E
P 2450 4100
F 0 "C4" H 2565 4146 50  0000 L CNN
F 1 "100nF" H 2565 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 3950 50  0001 C CNN
F 3 "~" H 2450 4100 50  0001 C CNN
F 4 "ETSG" H 2450 4100 50  0001 C CNN "Vendor"
	1    2450 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5CC5E67D
P 6200 1850
F 0 "#PWR013" H 6200 1600 50  0001 C CNN
F 1 "GND" H 6205 1677 50  0000 C CNN
F 2 "" H 6200 1850 50  0001 C CNN
F 3 "" H 6200 1850 50  0001 C CNN
	1    6200 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5CC5EB71
P 3650 5750
F 0 "#PWR07" H 3650 5500 50  0001 C CNN
F 1 "GND" H 3655 5577 50  0000 C CNN
F 2 "" H 3650 5750 50  0001 C CNN
F 3 "" H 3650 5750 50  0001 C CNN
	1    3650 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5CC5F168
P 3450 5750
F 0 "#PWR06" H 3450 5500 50  0001 C CNN
F 1 "GND" H 3455 5577 50  0000 C CNN
F 2 "" H 3450 5750 50  0001 C CNN
F 3 "" H 3450 5750 50  0001 C CNN
	1    3450 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5CC5F322
P 2450 4250
F 0 "#PWR05" H 2450 4000 50  0001 C CNN
F 1 "GND" H 2455 4077 50  0000 C CNN
F 2 "" H 2450 4250 50  0001 C CNN
F 3 "" H 2450 4250 50  0001 C CNN
	1    2450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4250 2850 3950
Wire Wire Line
	2850 3950 2450 3950
Text GLabel 1600 4650 0    50   BiDi ~ 0
D+
Wire Wire Line
	1600 4650 1700 4650
Connection ~ 1700 4650
Text GLabel 1150 4550 0    50   BiDi ~ 0
D-
Wire Wire Line
	1150 4550 1250 4550
Connection ~ 1250 4550
$Comp
L power:+3V3 #PWR015
U 1 1 5CC60EE7
P 7850 3400
F 0 "#PWR015" H 7850 3250 50  0001 C CNN
F 1 "+3V3" V 7865 3528 50  0000 L CNN
F 2 "" H 7850 3400 50  0001 C CNN
F 3 "" H 7850 3400 50  0001 C CNN
	1    7850 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 4350 4250 4350
Wire Wire Line
	4250 4250 4950 4250
$Sheet
S 1700 1200 3300 1800
U 5CC7A593
F0 "Sheet5CC7A592" 50
F1 "leds.sch" 50
$EndSheet
Text GLabel 7450 3350 1    50   BiDi ~ 0
NRST
$Comp
L Device:C C1
U 1 1 5CC8BEA0
P 1200 1250
F 0 "C1" H 1315 1296 50  0000 L CNN
F 1 "100nF" H 1315 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1238 1100 50  0001 C CNN
F 3 "~" H 1200 1250 50  0001 C CNN
F 4 "ETSG" H 1200 1250 50  0001 C CNN "Vendor"
	1    1200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5CC8E1C5
P 1200 1400
F 0 "#PWR02" H 1200 1150 50  0001 C CNN
F 1 "GND" H 1205 1227 50  0000 C CNN
F 2 "" H 1200 1400 50  0001 C CNN
F 3 "" H 1200 1400 50  0001 C CNN
	1    1200 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5CC8E818
P 850 1900
F 0 "#PWR01" H 850 1650 50  0001 C CNN
F 1 "GND" H 855 1727 50  0000 C CNN
F 2 "" H 850 1900 50  0001 C CNN
F 3 "" H 850 1900 50  0001 C CNN
	1    850  1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  1900 850  1900
Wire Wire Line
	1200 1100 1400 1100
Connection ~ 1200 1100
Text GLabel 1400 1100 2    50   BiDi ~ 0
NRST
$Comp
L power:+3V3 #PWR020
U 1 1 5CCA485B
P 9950 3450
F 0 "#PWR020" H 9950 3300 50  0001 C CNN
F 1 "+3V3" V 9965 3578 50  0000 L CNN
F 2 "" H 9950 3450 50  0001 C CNN
F 3 "" H 9950 3450 50  0001 C CNN
	1    9950 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9950 3450 10050 3450
$Comp
L power:GND #PWR017
U 1 1 5CCA5078
P 9500 3350
F 0 "#PWR017" H 9500 3100 50  0001 C CNN
F 1 "GND" H 9505 3177 50  0000 C CNN
F 2 "" H 9500 3350 50  0001 C CNN
F 3 "" H 9500 3350 50  0001 C CNN
	1    9500 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Female J3
U 1 1 5CCAF28E
P 6300 6600
F 0 "J3" V 6465 6530 50  0000 C CNN
F 1 "mDot pin11-20 brkout" V 6374 6530 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 6300 6600 50  0001 C CNN
F 3 "~" H 6300 6600 50  0001 C CNN
	1    6300 6600
	0    -1   1    0   
$EndComp
Wire Wire Line
	6450 5850 6450 6000
Wire Wire Line
	6450 6000 5900 6000
Wire Wire Line
	5900 6000 5900 6400
Wire Wire Line
	6000 6400 6000 6050
Wire Wire Line
	6000 6050 6600 6050
Wire Wire Line
	6600 6050 6600 5850
Wire Wire Line
	6750 5850 6750 6100
Wire Wire Line
	6750 6100 6100 6100
Wire Wire Line
	6100 6100 6100 6400
Wire Wire Line
	6300 6400 6300 6150
Wire Wire Line
	6300 6150 7100 6150
Wire Wire Line
	7100 6150 7100 5850
Wire Wire Line
	7250 5850 7250 6200
Wire Wire Line
	6400 6200 6400 6400
Wire Wire Line
	6500 6400 6500 6250
Wire Wire Line
	6500 6250 7400 6250
Wire Wire Line
	7400 6250 7400 5850
Wire Wire Line
	7550 5850 7550 6300
Wire Wire Line
	7550 6300 6600 6300
Wire Wire Line
	6600 6300 6600 6400
Wire Wire Line
	7700 6350 6700 6350
Wire Wire Line
	6700 6350 6700 6400
Wire Wire Line
	6800 6400 7850 6400
Wire Wire Line
	7250 6200 6400 6200
$Comp
L Connector:Conn_01x08_Male J1
U 1 1 5CC7163A
P 5100 4800
F 0 "J1" H 5072 4682 50  0000 R CNN
F 1 "mDot breakout" H 5700 5250 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 5100 4800 50  0001 C CNN
F 3 "~" H 5100 4800 50  0001 C CNN
	1    5100 4800
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:mDot MCU1
U 1 1 5CCCE02B
P 7050 5050
F 0 "MCU1" V 7004 6078 50  0000 L CNN
F 1 "mDot" V 7095 6078 50  0000 L CNN
F 2 "SmartGluttonV1:mdot" H 7050 5050 50  0001 C CNN
F 3 "" H 7050 5050 50  0001 C CNN
F 4 "2mm pitch headers 10x1 10x1 8x1" V 7050 5050 50  0001 C CNN "Vendor"
	1    7050 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 4500 5300 4500
Wire Wire Line
	5850 4650 5750 4650
Wire Wire Line
	5750 4650 5750 4600
Wire Wire Line
	5750 4600 5450 4600
Wire Wire Line
	5850 4800 5700 4800
Wire Wire Line
	5700 4800 5700 4700
Wire Wire Line
	5700 4700 5300 4700
Wire Wire Line
	5300 4800 5650 4800
Wire Wire Line
	5650 4800 5650 4950
Wire Wire Line
	5650 4950 5850 4950
Wire Wire Line
	5850 5150 5600 5150
Wire Wire Line
	5600 5150 5600 4900
Wire Wire Line
	5600 4900 5300 4900
Wire Wire Line
	5850 5300 5550 5300
Wire Wire Line
	5550 5300 5550 5000
Wire Wire Line
	5550 5000 5300 5000
Wire Wire Line
	5300 5100 5500 5100
Wire Wire Line
	5500 5100 5500 5450
Wire Wire Line
	5500 5450 5850 5450
Wire Wire Line
	5850 5600 5450 5600
Wire Wire Line
	5450 5600 5450 5200
Wire Wire Line
	5450 5200 5300 5200
$Comp
L power:GND #PWR010
U 1 1 5CD0AB32
P 5450 4600
F 0 "#PWR010" H 5450 4350 50  0001 C CNN
F 1 "GND" H 5455 4427 50  0000 C CNN
F 2 "" H 5450 4600 50  0001 C CNN
F 3 "" H 5450 4600 50  0001 C CNN
	1    5450 4600
	1    0    0    -1  
$EndComp
Connection ~ 5450 4600
Wire Wire Line
	5450 4600 5300 4600
Wire Wire Line
	5300 5100 4950 5100
Wire Wire Line
	4950 5100 4950 4250
Connection ~ 5300 5100
Wire Wire Line
	5300 5200 4850 5200
Wire Wire Line
	4850 5200 4850 4350
Connection ~ 5300 5200
Wire Wire Line
	8900 3250 10050 3250
Wire Wire Line
	9500 3350 10050 3350
Wire Wire Line
	3450 3950 3450 3750
$Comp
L Device:Ferrite_Bead FB1
U 1 1 5CD1AE81
P 5400 3250
F 0 "FB1" V 5126 3250 50  0000 C CNN
F 1 "47@100MHz" V 5217 3250 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5330 3250 50  0001 C CNN
F 3 "~" H 5400 3250 50  0001 C CNN
F 4 "rs-online https://au.rs-online.com/web/p/wire-wound-surface-mount-inductors/7242989/" V 5400 3250 50  0001 C CNN "Vendor"
	1    5400 3250
	0    1    1    0   
$EndComp
$Comp
L Device:CP C6
U 1 1 5CD1CB5F
P 5100 3400
F 0 "C6" H 5218 3446 50  0000 L CNN
F 1 "4.7uF" H 5218 3355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5138 3250 50  0001 C CNN
F 3 "~" H 5100 3400 50  0001 C CNN
F 4 "ETSG" H 5100 3400 50  0001 C CNN "Vendor"
	1    5100 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5CD1D5E1
P 4750 3400
F 0 "C5" H 4865 3446 50  0000 L CNN
F 1 "100nF" H 4865 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4788 3250 50  0001 C CNN
F 3 "~" H 4750 3400 50  0001 C CNN
F 4 "ETSG" H 4750 3400 50  0001 C CNN "Vendor"
	1    4750 3400
	1    0    0    -1  
$EndComp
Connection ~ 4750 3250
Wire Wire Line
	5100 3250 5250 3250
Connection ~ 5100 3250
$Comp
L power:GND #PWR08
U 1 1 5CD2433C
P 5100 3550
F 0 "#PWR08" H 5100 3300 50  0001 C CNN
F 1 "GND" H 5105 3377 50  0000 C CNN
F 2 "" H 5100 3550 50  0001 C CNN
F 3 "" H 5100 3550 50  0001 C CNN
	1    5100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3550 5100 3550
Connection ~ 5100 3550
Wire Wire Line
	3650 3950 3650 3750
Wire Wire Line
	3650 3750 3450 3750
Connection ~ 3450 3750
Wire Wire Line
	3450 3750 3450 3250
$Comp
L power:GND #PWR012
U 1 1 5CD29626
P 6950 3450
F 0 "#PWR012" H 6950 3200 50  0001 C CNN
F 1 "GND" H 6955 3277 50  0000 C CNN
F 2 "" H 6950 3450 50  0001 C CNN
F 3 "" H 6950 3450 50  0001 C CNN
	1    6950 3450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x10_Female J4
U 1 1 5CD113F9
P 7450 3700
F 0 "J4" V 7615 3630 50  0000 C CNN
F 1 "mDot pin1-10 brkout" V 7524 3630 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7450 3700 50  0001 C CNN
F 3 "~" H 7450 3700 50  0001 C CNN
	1    7450 3700
	0    1    -1   0   
$EndComp
Text Label 8250 3100 2    50   ~ 0
GPS->mDot
Text Label 8250 3300 2    50   ~ 0
mDot->GPS
Wire Wire Line
	7850 4250 7850 3900
Wire Wire Line
	7850 3900 7850 3400
Connection ~ 7850 3900
Wire Wire Line
	7700 4250 7700 4200
Wire Wire Line
	7700 4200 7750 4200
Wire Wire Line
	7750 4200 7750 3900
Wire Wire Line
	7750 3900 7750 3300
Connection ~ 7750 3900
Wire Wire Line
	7650 3900 7650 3150
Connection ~ 7650 3900
Wire Wire Line
	7650 4250 7550 4250
Wire Wire Line
	7650 3900 7650 4250
Wire Wire Line
	7400 4250 7400 4200
Wire Wire Line
	7400 4200 7550 4200
Wire Wire Line
	7550 3900 7550 4200
Wire Wire Line
	7250 4150 7250 4250
Wire Wire Line
	7450 3900 7450 4150
Wire Wire Line
	7450 4150 7250 4150
Wire Wire Line
	7350 4100 7100 4100
Wire Wire Line
	7100 4100 7100 4250
Wire Wire Line
	7350 3900 7350 4100
Wire Wire Line
	7250 4050 6950 4050
Wire Wire Line
	6950 4050 6950 4250
Wire Wire Line
	7250 3900 7250 4050
Wire Wire Line
	6600 4250 6600 4000
Wire Wire Line
	6600 4000 7050 4000
Wire Wire Line
	7050 4000 7050 3900
Wire Wire Line
	6450 4250 6450 3900
Wire Wire Line
	6450 3900 6950 3900
Wire Wire Line
	6950 3900 6950 3450
Connection ~ 6950 3900
Wire Wire Line
	7450 3900 7450 3350
Connection ~ 7450 3900
$Comp
L power:GND #PWR018
U 1 1 5CD8B696
P 9600 5750
F 0 "#PWR018" H 9600 5500 50  0001 C CNN
F 1 "GND" H 9605 5577 50  0000 C CNN
F 2 "" H 9600 5750 50  0001 C CNN
F 3 "" H 9600 5750 50  0001 C CNN
	1    9600 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5CD9334B
P 9300 4850
F 0 "#PWR016" H 9300 4700 50  0001 C CNN
F 1 "+5V" V 9315 4978 50  0000 L CNN
F 2 "" H 9300 4850 50  0001 C CNN
F 3 "" H 9300 4850 50  0001 C CNN
	1    9300 4850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:USB_A J5
U 1 1 5CD859EC
P 9600 5050
F 0 "J5" H 9370 5039 50  0000 R CNN
F 1 "USB_A" H 9370 4948 50  0000 R CNN
F 2 "SmartGluttonV1:USB_A_FCI_87583_Horizontal" H 9750 5000 50  0001 C CNN
F 3 " ~" H 9750 5000 50  0001 C CNN
F 4 "ETSG" H 9600 5050 50  0001 C CNN "Vendor"
	1    9600 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7650 3150 10050 3150
Wire Wire Line
	8900 3300 8900 3250
Wire Wire Line
	7750 3300 8900 3300
Wire Wire Line
	9300 5050 8700 5050
Wire Wire Line
	8700 5050 8700 5900
Wire Wire Line
	9300 5150 8800 5150
Wire Wire Line
	8800 5150 8800 6000
Text GLabel 6600 6950 3    50   BiDi ~ 0
LED1
Text GLabel 6500 6950 3    50   BiDi ~ 0
LED2
Text GLabel 6400 6950 3    50   BiDi ~ 0
LED3
Text GLabel 6300 6950 3    50   BiDi ~ 0
LED4
Text GLabel 6100 6950 3    50   BiDi ~ 0
LED5
Text GLabel 6000 6950 3    50   BiDi ~ 0
LED6
Wire Wire Line
	6500 6950 6500 6400
Connection ~ 6500 6400
Wire Wire Line
	6400 6400 6400 6950
Connection ~ 6400 6400
Wire Wire Line
	6300 6950 6300 6400
Connection ~ 6300 6400
Wire Wire Line
	6100 6400 6100 6950
Connection ~ 6100 6400
Wire Wire Line
	6000 6950 6000 6400
Connection ~ 6000 6400
NoConn ~ 7150 3900
NoConn ~ 6200 6400
NoConn ~ 10050 3550
NoConn ~ 10050 3050
NoConn ~ 10050 2950
NoConn ~ 10050 2850
NoConn ~ 10050 2750
Wire Wire Line
	6600 6950 6600 6400
Connection ~ 6600 6400
NoConn ~ 5000 3350
Wire Wire Line
	4250 4450 4800 4450
Wire Wire Line
	4250 4550 4750 4550
Wire Wire Line
	4250 4650 4700 4650
Wire Wire Line
	4250 4750 4650 4750
Wire Wire Line
	4250 4850 4600 4850
Wire Wire Line
	4250 4950 4550 4950
Wire Wire Line
	4500 5150 4250 5150
Wire Wire Line
	4250 5250 4450 5250
Wire Wire Line
	2850 4850 2800 4850
Wire Wire Line
	2800 4850 2800 4250
Wire Wire Line
	2800 4250 2850 4250
Connection ~ 2850 4250
$Comp
L Switch:SW_Push SW2
U 1 1 5CE97381
P 750 1500
F 0 "SW2" V 704 1648 50  0000 L CNN
F 1 "Reset" V 795 1648 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 750 1700 50  0001 C CNN
F 3 "~" H 750 1700 50  0001 C CNN
F 4 "ETSG 6x6x4.3" V 750 1500 50  0001 C CNN "Vendor"
	1    750  1500
	0    1    1    0   
$EndComp
Wire Wire Line
	750  1100 1200 1100
Wire Wire Line
	750  1300 750  1100
Wire Wire Line
	750  1700 750  1900
$Comp
L Device:R R9
U 1 1 5CEA8475
P 10100 2150
F 0 "R9" H 10170 2196 50  0000 L CNN
F 1 "0R OPT" H 10170 2105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10030 2150 50  0001 C CNN
F 3 "~" H 10100 2150 50  0001 C CNN
F 4 "ETSG" H 10100 2150 50  0001 C CNN "Vendor"
	1    10100 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1900 10000 2300
Wire Wire Line
	10100 1900 10100 2000
Wire Wire Line
	10100 2300 10000 2300
Connection ~ 10000 2300
Wire Wire Line
	10000 2300 10000 2350
Wire Wire Line
	4750 3250 5100 3250
Wire Wire Line
	3700 3250 3450 3250
Text Label 2500 4550 0    50   ~ 0
USBD-
Text Label 2500 4650 0    50   ~ 0
USBD+
$Comp
L Connector:Conn_01x09_Female J7
U 1 1 5CCAA9CC
P 10250 3150
F 0 "J7" H 10278 3176 50  0000 L CNN
F 1 "GPS Connector" H 10278 3085 50  0000 L CNN
F 2 "SmartGluttonV1:Adafruit_GPS_Breakout" H 10250 3150 50  0001 C CNN
F 3 "~" H 10250 3150 50  0001 C CNN
	1    10250 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 5CE048FB
P 5250 5850
F 0 "J2" H 5222 5824 50  0000 R CNN
F 1 "FLOW CONTROL" H 5222 5733 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 5250 5850 50  0001 C CNN
F 3 "~" H 5250 5850 50  0001 C CNN
	1    5250 5850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4250 5450 4350 5450
Wire Wire Line
	4350 5450 4350 6350
Wire Wire Line
	4350 6350 5050 6350
Wire Wire Line
	4500 5150 4500 6250
Wire Wire Line
	4500 6250 5050 6250
Wire Wire Line
	4450 5250 4450 6150
Wire Wire Line
	4450 6150 5050 6150
Wire Wire Line
	5050 5350 5050 5450
Wire Wire Line
	4250 5350 5050 5350
Wire Wire Line
	4700 4650 4700 6050
Wire Wire Line
	4700 6050 5050 6050
Wire Wire Line
	4800 4450 4800 5950
Wire Wire Line
	4800 5950 5050 5950
Wire Wire Line
	4550 4950 4550 5850
Wire Wire Line
	4550 5850 5050 5850
Wire Wire Line
	4650 4750 4650 5750
Wire Wire Line
	4650 5750 5050 5750
Wire Wire Line
	4600 4850 4600 5650
Wire Wire Line
	4600 5650 5050 5650
Wire Wire Line
	4750 4550 4750 5550
Wire Wire Line
	4750 5550 5050 5550
$Comp
L Connector:TestPoint TP2
U 1 1 5CF9BD1B
P 8100 3900
F 0 "TP2" H 8158 4018 50  0000 L CNN
F 1 "TestPoint" H 8158 3927 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 8300 3900 50  0001 C CNN
F 3 "~" H 8300 3900 50  0001 C CNN
	1    8100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3900 8100 3900
Wire Wire Line
	10000 2300 9550 2300
$Comp
L Connector:TestPoint TP3
U 1 1 5CFAC25F
P 9550 2300
F 0 "TP3" H 9608 2418 50  0000 L CNN
F 1 "TestPoint" H 9608 2327 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 9750 2300 50  0001 C CNN
F 3 "~" H 9750 2300 50  0001 C CNN
	1    9550 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5CFACB5C
P 3200 3250
F 0 "TP1" H 3258 3368 50  0000 L CNN
F 1 "TestPoint" H 3258 3277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_3.0x3.0mm" H 3400 3250 50  0001 C CNN
F 3 "~" H 3400 3250 50  0001 C CNN
	1    3200 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3250 3200 3250
Connection ~ 3450 3250
$Comp
L Device:R R10
U 1 1 5CFBC49C
P 9700 5600
F 0 "R10" H 9770 5646 50  0000 L CNN
F 1 "0R OPT" H 9770 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9630 5600 50  0001 C CNN
F 3 "~" H 9700 5600 50  0001 C CNN
F 4 "ETSG" H 9700 5600 50  0001 C CNN "Vendor"
	1    9700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5750 9600 5750
Wire Wire Line
	9600 5450 9600 5750
Connection ~ 9600 5750
Wire Wire Line
	8700 5900 7850 5900
Wire Wire Line
	7850 5850 7850 5900
Connection ~ 7850 5900
Wire Wire Line
	7850 5900 7850 6400
Wire Wire Line
	8800 6000 7700 6000
Wire Wire Line
	7700 5850 7700 6000
Connection ~ 7700 6000
Wire Wire Line
	7700 6000 7700 6350
$Comp
L Connector:Conn_01x04_Female J8
U 1 1 5D24E80E
P 7550 2150
F 0 "J8" V 7488 1862 50  0000 R CNN
F 1 "Ultrasonic Conn" V 7397 1862 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 7550 2150 50  0001 C CNN
F 3 "~" H 7550 2150 50  0001 C CNN
	1    7550 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5D25026B
P 7450 2350
F 0 "#PWR0101" H 7450 2200 50  0001 C CNN
F 1 "+5V" V 7465 2478 50  0000 L CNN
F 2 "" H 7450 2350 50  0001 C CNN
F 3 "" H 7450 2350 50  0001 C CNN
	1    7450 2350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D250C38
P 7750 2350
F 0 "#PWR0102" H 7750 2100 50  0001 C CNN
F 1 "GND" H 7755 2177 50  0000 C CNN
F 2 "" H 7750 2350 50  0001 C CNN
F 3 "" H 7750 2350 50  0001 C CNN
	1    7750 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2350 7650 2900
Wire Wire Line
	7650 2900 7550 2900
Wire Wire Line
	7550 2900 7550 3900
Connection ~ 7550 3900
Wire Wire Line
	7550 2350 7550 2850
Wire Wire Line
	7550 2850 7350 2850
Wire Wire Line
	7350 2850 7350 3900
Connection ~ 7350 3900
Wire Wire Line
	4300 3250 4750 3250
$Comp
L Switch:SW_DIP_x02 SW1
U 1 1 5CD2A5D6
P 4000 3350
F 0 "SW1" H 4000 3717 50  0000 C CNN
F 1 "UART_PWR" H 4000 3626 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 4000 3350 50  0001 C CNN
F 3 "~" H 4000 3350 50  0001 C CNN
F 4 "ETSG" H 4000 3350 50  0001 C CNN "Vendor"
	1    4000 3350
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5D276B8C
P 4300 3350
F 0 "#PWR0103" H 4300 3100 50  0001 C CNN
F 1 "GND" H 4305 3177 50  0000 C CNN
F 2 "" H 4300 3350 50  0001 C CNN
F 3 "" H 4300 3350 50  0001 C CNN
	1    4300 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3350 3700 3650
Wire Wire Line
	3700 3650 4050 3650
Wire Wire Line
	4050 3650 4050 4000
Wire Wire Line
	4050 4000 6600 4000
Connection ~ 6600 4000
$EndSCHEMATC
