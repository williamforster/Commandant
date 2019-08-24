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
Wire Wire Line
	6000 6050 6600 6050
Wire Wire Line
	6600 6050 6600 5850
Wire Wire Line
	6750 5850 6750 6100
Wire Wire Line
	6750 6100 6100 6100
Wire Wire Line
	6300 6150 7100 6150
Wire Wire Line
	7100 6150 7100 5850
Wire Wire Line
	7250 5850 7250 6200
Wire Wire Line
	6500 6250 7400 6250
Wire Wire Line
	7400 6250 7400 5850
Wire Wire Line
	7550 5850 7550 6300
Wire Wire Line
	7550 6300 6600 6300
Wire Wire Line
	7250 6200 6400 6200
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
$Comp
L power:GND #PWR010
U 1 1 5CD0AB32
P 5850 4650
F 0 "#PWR010" H 5850 4400 50  0001 C CNN
F 1 "GND" H 5855 4477 50  0000 C CNN
F 2 "" H 5850 4650 50  0001 C CNN
F 3 "" H 5850 4650 50  0001 C CNN
	1    5850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3250 10050 3250
Wire Wire Line
	9500 3350 10050 3350
$Comp
L power:GND #PWR012
U 1 1 5CD29626
P 6450 4250
F 0 "#PWR012" H 6450 4000 50  0001 C CNN
F 1 "GND" H 6455 4077 50  0000 C CNN
F 2 "" H 6450 4250 50  0001 C CNN
F 3 "" H 6450 4250 50  0001 C CNN
	1    6450 4250
	-1   0    0    1   
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
	7650 4250 7550 4250
Wire Wire Line
	7400 4250 7400 4200
Wire Wire Line
	7400 4200 7550 4200
Wire Wire Line
	7250 4150 7250 4250
Wire Wire Line
	7450 4150 7250 4150
Wire Wire Line
	7350 4100 7100 4100
Wire Wire Line
	7100 4100 7100 4250
Wire Wire Line
	7650 3150 10050 3150
Wire Wire Line
	8900 3300 8900 3250
Wire Wire Line
	7750 3300 8900 3300
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
NoConn ~ 10050 3550
NoConn ~ 10050 3050
NoConn ~ 10050 2950
NoConn ~ 10050 2850
NoConn ~ 10050 2750
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
	7550 2350 7550 2850
Wire Wire Line
	7550 2850 7350 2850
Wire Wire Line
	7750 3300 7750 4200
Wire Wire Line
	7650 3150 7650 4250
Wire Wire Line
	7550 2900 7550 4200
Wire Wire Line
	7450 3350 7450 4150
Wire Wire Line
	7350 2850 7350 4100
Wire Wire Line
	6000 6050 6000 6950
Wire Wire Line
	6100 6100 6100 6950
Wire Wire Line
	6300 6150 6300 6950
Wire Wire Line
	6400 6200 6400 6950
Wire Wire Line
	6500 6250 6500 6950
Wire Wire Line
	6600 6300 6600 6950
$Sheet
S 2050 1050 3300 1800
U 5CC7A593
F0 "Sheet5CC7A592" 50
F1 "leds.sch" 50
$EndSheet
$Comp
L Mechanical:MountingHole H1
U 1 1 5D5F5A49
P 5750 2450
F 0 "H1" H 5850 2496 50  0000 L CNN
F 1 "MountingHole" H 5850 2405 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 5750 2450 50  0001 C CNN
F 3 "~" H 5750 2450 50  0001 C CNN
	1    5750 2450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D5F61EF
P 5750 2650
F 0 "H2" H 5850 2696 50  0000 L CNN
F 1 "MountingHole" H 5850 2605 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 5750 2650 50  0001 C CNN
F 3 "~" H 5750 2650 50  0001 C CNN
	1    5750 2650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5D5F6710
P 5750 2850
F 0 "H3" H 5850 2896 50  0000 L CNN
F 1 "MountingHole" H 5850 2805 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 5750 2850 50  0001 C CNN
F 3 "~" H 5750 2850 50  0001 C CNN
	1    5750 2850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5D5F68ED
P 5750 3050
F 0 "H4" H 5850 3096 50  0000 L CNN
F 1 "MountingHole" H 5850 3005 50  0000 L CNN
F 2 "MountingHole:MountingHole_4mm" H 5750 3050 50  0001 C CNN
F 3 "~" H 5750 3050 50  0001 C CNN
	1    5750 3050
	1    0    0    -1  
$EndComp
NoConn ~ 5850 4950
NoConn ~ 5850 4800
NoConn ~ 5850 5150
NoConn ~ 5850 5300
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5D61C7A4
P 10000 1650
F 0 "J4" H 10080 1642 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 10080 1551 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10000 1650 50  0001 C CNN
F 3 "~" H 10000 1650 50  0001 C CNN
	1    10000 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5D61D3D4
P 9800 1650
F 0 "#PWR0103" H 9800 1500 50  0001 C CNN
F 1 "+5V" V 9815 1778 50  0000 L CNN
F 2 "" H 9800 1650 50  0001 C CNN
F 3 "" H 9800 1650 50  0001 C CNN
	1    9800 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5D61DC22
P 9800 1750
F 0 "#PWR0104" H 9800 1500 50  0001 C CNN
F 1 "GND" H 9805 1577 50  0000 C CNN
F 2 "" H 9800 1750 50  0001 C CNN
F 3 "" H 9800 1750 50  0001 C CNN
	1    9800 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5D6258C8
P 4900 5450
F 0 "J1" H 4792 5125 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4792 5216 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4900 5450 50  0001 C CNN
F 3 "~" H 4900 5450 50  0001 C CNN
	1    4900 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 5600 5100 5600
Wire Wire Line
	5100 5600 5100 5450
Wire Wire Line
	5850 5450 5200 5450
Wire Wire Line
	5200 5450 5200 5350
Wire Wire Line
	5200 5350 5100 5350
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5D611D0F
P 6850 3250
F 0 "J3" H 6930 3242 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 6930 3151 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6850 3250 50  0001 C CNN
F 3 "~" H 6850 3250 50  0001 C CNN
	1    6850 3250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5D61142E
P 6500 3250
F 0 "J2" H 6580 3242 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 6580 3151 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6500 3250 50  0001 C CNN
F 3 "~" H 6500 3250 50  0001 C CNN
	1    6500 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5CD9334B
P 6500 3450
F 0 "#PWR016" H 6500 3300 50  0001 C CNN
F 1 "+5V" V 6515 3578 50  0000 L CNN
F 2 "" H 6500 3450 50  0001 C CNN
F 3 "" H 6500 3450 50  0001 C CNN
	1    6500 3450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5CD8B696
P 6600 3450
F 0 "#PWR018" H 6600 3200 50  0001 C CNN
F 1 "GND" H 6605 3277 50  0000 C CNN
F 2 "" H 6600 3450 50  0001 C CNN
F 3 "" H 6600 3450 50  0001 C CNN
	1    6600 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 3450 6950 4250
Wire Wire Line
	6850 3450 6850 4250
Wire Wire Line
	6850 4250 6600 4250
$Comp
L Device:R_POT RV2
U 1 1 5D63CA7E
P 8150 6150
F 0 "RV2" V 8035 6150 50  0000 C CNN
F 1 "R_POT" V 7944 6150 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 8150 6150 50  0001 C CNN
F 3 "~" H 8150 6150 50  0001 C CNN
	1    8150 6150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_POT RV3
U 1 1 5D63EF2A
P 8600 6150
F 0 "RV3" V 8485 6150 50  0000 C CNN
F 1 "R_POT" V 8394 6150 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 8600 6150 50  0001 C CNN
F 3 "~" H 8600 6150 50  0001 C CNN
	1    8600 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 5850 7850 5850
$Comp
L power:GND #PWR0105
U 1 1 5D640D68
P 8000 6150
F 0 "#PWR0105" H 8000 5900 50  0001 C CNN
F 1 "GND" H 8005 5977 50  0000 C CNN
F 2 "" H 8000 6150 50  0001 C CNN
F 3 "" H 8000 6150 50  0001 C CNN
	1    8000 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5D641220
P 8450 6150
F 0 "#PWR0106" H 8450 5900 50  0001 C CNN
F 1 "GND" H 8455 5977 50  0000 C CNN
F 2 "" H 8450 6150 50  0001 C CNN
F 3 "" H 8450 6150 50  0001 C CNN
	1    8450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4500 4600 4500
Wire Wire Line
	4600 4500 4600 7350
Wire Wire Line
	4600 7350 5800 7350
Wire Wire Line
	6900 7350 6900 6500
Wire Wire Line
	6900 6500 8300 6500
Connection ~ 8300 6500
Wire Wire Line
	8300 6500 8750 6500
Wire Wire Line
	8150 6000 7700 6000
Wire Wire Line
	7700 6000 7700 5850
Wire Wire Line
	8600 5850 8600 6000
Wire Wire Line
	8750 6150 8750 6500
Wire Wire Line
	8300 6150 8300 6500
$Comp
L Device:R_POT RV1
U 1 1 5D64D731
P 5600 6150
F 0 "RV1" V 5485 6150 50  0000 C CNN
F 1 "R_POT" V 5394 6150 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 5600 6150 50  0001 C CNN
F 3 "~" H 5600 6150 50  0001 C CNN
	1    5600 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 7350 5800 6150
Wire Wire Line
	5800 6150 5750 6150
Connection ~ 5800 7350
Wire Wire Line
	5800 7350 6900 7350
$Comp
L power:GND #PWR0107
U 1 1 5D64F605
P 5450 6150
F 0 "#PWR0107" H 5450 5900 50  0001 C CNN
F 1 "GND" H 5455 5977 50  0000 C CNN
F 2 "" H 5450 6150 50  0001 C CNN
F 3 "" H 5450 6150 50  0001 C CNN
	1    5450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 6000 5600 5900
Wire Wire Line
	5600 5900 6450 5900
Wire Wire Line
	6450 5900 6450 5850
$EndSCHEMATC
