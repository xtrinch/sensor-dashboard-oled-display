EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector:Conn_01x18_Female J1
U 1 1 5F4935D2
P 3000 2650
F 0 "J1" V 3050 2950 50  0000 C CNN
F 1 "Left rail ESP32 devkit v1" V 3050 2350 50  0000 C CNN
F 2 "" H 3000 2650 50  0001 C CNN
F 3 "~" H 3000 2650 50  0001 C CNN
	1    3000 2650
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5F4AB5F8
P 4100 2250
F 0 "SW1" V 4000 2450 50  0000 C CNN
F 1 "NO" V 4100 2444 50  0000 C CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "~" H 4100 2450 50  0001 C CNN
	1    4100 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F4ACA30
P 4800 3100
F 0 "R1" H 4730 3054 50  0000 R CNN
F 1 "220k" H 4730 3145 50  0000 R CNN
F 2 "" V 4730 3100 50  0001 C CNN
F 3 "~" H 4800 3100 50  0001 C CNN
	1    4800 3100
	-1   0    0    1   
$EndComp
NoConn ~ 2800 2750
Wire Wire Line
	4800 2950 4800 2850
$Comp
L power:GNDREF #PWR0101
U 1 1 5F4E6A2F
P 4100 2450
F 0 "#PWR0101" H 4100 2200 50  0001 C CNN
F 1 "GNDREF" H 4250 2450 50  0000 C CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "" H 4100 2450 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x18_Female J2
U 1 1 5F49485E
P 3400 2650
F 0 "J2" V 3450 2950 50  0000 C CNN
F 1 "Right rail ESP32 devkit v1" V 3450 2300 50  0000 C CNN
F 2 "" H 3400 2650 50  0001 C CNN
F 3 "~" H 3400 2650 50  0001 C CNN
	1    3400 2650
	-1   0    0    1   
$EndComp
NoConn ~ 2800 2650
NoConn ~ 2800 2550
NoConn ~ 2800 2450
NoConn ~ 2800 2350
NoConn ~ 2800 2250
NoConn ~ 2800 2150
NoConn ~ 2800 2050
NoConn ~ 2800 1850
NoConn ~ 2800 1750
NoConn ~ 2800 2950
NoConn ~ 2800 2850
NoConn ~ 2800 3050
NoConn ~ 2800 3250
NoConn ~ 3600 3350
NoConn ~ 3600 3250
NoConn ~ 3600 2950
NoConn ~ 3600 2850
NoConn ~ 3600 2550
NoConn ~ 3600 2450
NoConn ~ 3600 2350
NoConn ~ 3600 2250
NoConn ~ 3600 2050
NoConn ~ 3600 1950
NoConn ~ 2800 3450
$Comp
L power:GNDREF #PWR0102
U 1 1 5F4E7867
P 4150 3250
F 0 "#PWR0102" H 4150 3000 50  0001 C CNN
F 1 "GNDREF" H 4200 3100 50  0000 C CNN
F 2 "" H 4150 3250 50  0001 C CNN
F 3 "" H 4150 3250 50  0001 C CNN
	1    4150 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J3
U 1 1 5F57D50E
P 5250 2050
F 0 "J3" V 5300 1600 50  0000 L CNN
F 1 "PCD8544 display" V 5300 1750 50  0000 L CNN
F 2 "" H 5250 2050 50  0001 C CNN
F 3 "~" H 5250 2050 50  0001 C CNN
	1    5250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1750 4550 1750
Wire Wire Line
	4550 1750 4550 1850
Text Label 3650 1850 0    50   ~ 0
GPIO22
Text Label 4900 1750 0    50   ~ 0
RST
Wire Wire Line
	5050 1850 4650 1850
Wire Wire Line
	4650 1850 4650 3150
Text Label 4950 1850 0    50   ~ 0
CE
Text Label 3650 3150 0    50   ~ 0
GPIO2
Wire Wire Line
	5050 1950 4550 1950
Wire Wire Line
	4550 1950 4550 3050
Text Label 3650 3050 0    50   ~ 0
GPIO4
Text Label 4950 1950 0    50   ~ 0
DC
Wire Wire Line
	5050 2050 4450 2050
Wire Wire Line
	4450 2050 4450 1750
Text Label 3650 1750 0    50   ~ 0
GPIO23
Text Label 4900 2050 0    50   ~ 0
DIN
Wire Wire Line
	4450 2650 4450 2150
Wire Wire Line
	4450 2150 5050 2150
Text Label 4900 2150 0    50   ~ 0
CLK
Text Label 3650 2650 0    50   ~ 0
GPIO18
$Comp
L power:+3.3V #PWR?
U 1 1 5F58593F
P 4800 2250
F 0 "#PWR?" H 4800 2100 50  0001 C CNN
F 1 "+3.3V" H 4950 2300 50  0000 C CNN
F 2 "" H 4800 2250 50  0001 C CNN
F 3 "" H 4800 2250 50  0001 C CNN
	1    4800 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2250 5050 2250
$Comp
L Device:R_POT RV1
U 1 1 5F589E2E
P 4800 2700
F 0 "RV1" H 5150 2750 50  0000 R CNN
F 1 "10k" H 5150 2650 50  0000 R CNN
F 2 "" H 4800 2700 50  0001 C CNN
F 3 "~" H 4800 2700 50  0001 C CNN
	1    4800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2350 4800 2350
Wire Wire Line
	4800 2350 4800 2550
$Comp
L power:GNDREF #PWR?
U 1 1 5F58BFCC
P 4800 3250
F 0 "#PWR?" H 4800 3000 50  0001 C CNN
F 1 "GNDREF" H 4750 3100 50  0000 C CNN
F 2 "" H 4800 3250 50  0001 C CNN
F 3 "" H 4800 3250 50  0001 C CNN
	1    4800 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F58CD6A
P 5050 2450
F 0 "#PWR?" H 5050 2200 50  0001 C CNN
F 1 "GNDREF" H 4950 2500 50  0000 C CNN
F 2 "" H 5050 2450 50  0001 C CNN
F 3 "" H 5050 2450 50  0001 C CNN
	1    5050 2450
	1    0    0    -1  
$EndComp
Text Label 4850 2350 0    50   ~ 0
LIGHT
Wire Wire Line
	3600 2150 3950 2150
Wire Wire Line
	3600 1850 4550 1850
Wire Wire Line
	3600 1750 4450 1750
Wire Wire Line
	3600 2650 4450 2650
Wire Wire Line
	3600 3050 4550 3050
Wire Wire Line
	3600 3150 4650 3150
Text Label 3650 2150 0    50   ~ 0
GPIO21
Wire Wire Line
	3950 2050 4100 2050
Wire Wire Line
	3950 2050 3950 2150
NoConn ~ 3600 2750
NoConn ~ 3600 3450
NoConn ~ 2800 1950
$Comp
L power:+3V3 #PWR0104
U 1 1 5F4EC730
P 3900 3450
F 0 "#PWR0104" H 3900 3300 50  0001 C CNN
F 1 "+3V3" H 3650 3500 50  0000 L CNN
F 2 "" H 3900 3450 50  0001 C CNN
F 3 "" H 3900 3450 50  0001 C CNN
	1    3900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3450 3900 3450
NoConn ~ 2800 3150
NoConn ~ 2800 3350
Wire Wire Line
	3600 3350 3850 3350
Text Label 3650 3350 0    50   ~ 0
GND
Wire Wire Line
	3850 3350 3850 3250
Wire Wire Line
	3850 3250 4150 3250
$EndSCHEMATC
