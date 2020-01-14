EESchema Schematic File Version 4
LIBS:schematic-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L power:+5V #PWR?
U 1 1 5E291BF1
P 1150 1100
AR Path="/5E291BF1" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291BF1" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 1150 950 50  0001 C CNN
F 1 "+5V" H 1150 1250 50  0000 C CNN
F 2 "" H 1150 1100 50  0001 C CNN
F 3 "" H 1150 1100 50  0001 C CNN
	1    1150 1100
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Current-Regulation-Management:INA219AIDCNR U?
U 1 1 5E291C00
P 2200 1550
AR Path="/5E291C00" Ref="U?"  Part="1" 
AR Path="/5E247314/5E291C00" Ref="U9"  Part="1" 
F 0 "U9" H 2150 1550 60  0000 L CNN
F 1 "INA219AIDCNR" V 2350 1200 60  0000 L CNN
F 2 "digikey-footprints:SOT-23-8" H 2400 1750 60  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina219.pdf" H 2400 1850 60  0001 L CNN
F 4 "296-23770-1-ND" H 2400 1950 60  0001 L CNN "Digi-Key_PN"
F 5 "INA219AIDCNR" H 2400 2050 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2400 2150 60  0001 L CNN "Category"
F 7 "PMIC - Current Regulation/Management" H 2400 2250 60  0001 L CNN "Family"
F 8 "http://www.ti.com/lit/ds/symlink/ina219.pdf" H 2400 2350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/INA219AIDCNR/296-23770-1-ND/1952550" H 2400 2450 60  0001 L CNN "DK_Detail_Page"
F 10 "IC CURRENT MONITOR 1% SOT23-8" H 2400 2550 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 2400 2650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2400 2750 60  0001 L CNN "Status"
	1    2200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2050 2200 2100
$Comp
L power:GNDD #PWR?
U 1 1 5E291C08
P 2200 2100
AR Path="/5E291C08" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291C08" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2200 1850 50  0001 C CNN
F 1 "GNDD" H 2050 2050 50  0000 C CNN
F 2 "" H 2200 2100 50  0001 C CNN
F 3 "" H 2200 2100 50  0001 C CNN
	1    2200 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E291C0E
P 1450 1300
AR Path="/5E291C0E" Ref="C?"  Part="1" 
AR Path="/5E247314/5E291C0E" Ref="C22"  Part="1" 
F 0 "C22" H 1550 1350 50  0000 L CNN
F 1 "0.1u" H 1550 1250 50  0000 L CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1450 1300 50  0001 C CNN
F 3 "~" H 1450 1300 50  0001 C CNN
	1    1450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1150 1450 1200
Wire Wire Line
	1400 1150 1450 1150
Wire Wire Line
	1450 1450 1450 1400
$Comp
L Device:R_Small R?
U 1 1 5E291C18
P 1300 1150
AR Path="/5E291C18" Ref="R?"  Part="1" 
AR Path="/5E247314/5E291C18" Ref="R27"  Part="1" 
F 0 "R27" V 1200 1150 50  0000 C CNN
F 1 "10" V 1400 1150 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1300 1150 50  0001 C CNN
F 3 "~" H 1300 1150 50  0001 C CNN
	1    1300 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 1100 1150 1150
Wire Wire Line
	1150 1150 1200 1150
Connection ~ 1150 1150
Wire Wire Line
	1150 1150 1150 1200
$Comp
L Device:R_Small R?
U 1 1 5E291C23
P 1300 1450
AR Path="/5E291C23" Ref="R?"  Part="1" 
AR Path="/5E247314/5E291C23" Ref="R28"  Part="1" 
F 0 "R28" V 1200 1450 50  0000 C CNN
F 1 "10" V 1400 1450 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1300 1450 50  0001 C CNN
F 3 "~" H 1300 1450 50  0001 C CNN
	1    1300 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 1450 1400 1450
Wire Wire Line
	1200 1450 1150 1450
Wire Wire Line
	1150 1450 1150 1400
$Comp
L Device:R_Small R?
U 1 1 5E291C2D
P 1150 1300
AR Path="/5E291C2D" Ref="R?"  Part="1" 
AR Path="/5E247314/5E291C2D" Ref="R11"  Part="1" 
F 0 "R11" H 1300 1250 50  0000 C CNN
F 1 "2m" H 1250 1350 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1150 1300 50  0001 C CNN
F 3 "~" H 1150 1300 50  0001 C CNN
	1    1150 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 1150 2200 1100
$Comp
L power:+3V3 #PWR?
U 1 1 5E291C35
P 2200 1100
AR Path="/5E291C35" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291C35" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2200 950 50  0001 C CNN
F 1 "+3V3" H 2215 1273 50  0000 C CNN
F 2 "" H 2200 1100 50  0001 C CNN
F 3 "" H 2200 1100 50  0001 C CNN
	1    2200 1100
	1    0    0    -1  
$EndComp
Text GLabel 1750 1650 0    50   Input ~ 0
I2C_SDA
Text GLabel 1750 1550 0    50   Input ~ 0
I2C_SCL
Connection ~ 1450 1450
Wire Wire Line
	1750 1550 1800 1550
Wire Wire Line
	1750 1650 1800 1650
Wire Wire Line
	1800 1750 1750 1750
Wire Wire Line
	1750 1750 1750 1850
$Comp
L power:GNDD #PWR?
U 1 1 5E291C42
P 1750 1950
AR Path="/5E291C42" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291C42" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 1750 1700 50  0001 C CNN
F 1 "GNDD" H 1754 1795 50  0000 C CNN
F 2 "" H 1750 1950 50  0001 C CNN
F 3 "" H 1750 1950 50  0001 C CNN
	1    1750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1850 1750 1850
Connection ~ 1750 1850
Wire Wire Line
	1750 1850 1750 1950
Wire Wire Line
	1150 1450 1150 1550
Connection ~ 1150 1450
Text GLabel 1050 1550 0    50   Input ~ 0
MD_VM
Wire Wire Line
	1450 1450 1800 1450
Wire Wire Line
	1800 1350 1750 1350
Wire Wire Line
	1750 1350 1750 1150
Wire Wire Line
	1750 1150 1450 1150
Connection ~ 1450 1150
Wire Wire Line
	1050 1550 1150 1550
Text GLabel 1100 5950 0    50   Input ~ 0
VSPI_CS0
Text GLabel 1200 2750 0    50   Input ~ 0
VSPI_CLK
Text GLabel 1200 2850 0    50   Input ~ 0
VSPI_MISO
Text GLabel 1200 2950 0    50   Input ~ 0
VSPI_MOSI
Text GLabel 1100 6050 0    50   Input ~ 0
VSPI_CS1
Text Label 1250 2750 0    50   ~ 0
CLK
Text Label 1250 2850 0    50   ~ 0
MISO
Text Label 1250 2950 0    50   ~ 0
MOSI
Wire Wire Line
	1200 2750 1450 2750
Wire Wire Line
	1200 2850 1450 2850
Wire Wire Line
	1200 2950 1450 2950
Entry Wire Line
	1450 2750 1550 2850
Entry Wire Line
	1450 2850 1550 2950
Entry Wire Line
	1450 2950 1550 3050
Text Label 1150 5950 0    50   ~ 0
CS0
Text Label 1150 6050 0    50   ~ 0
CS1
Wire Wire Line
	1100 6050 1450 6050
Wire Wire Line
	1100 5950 1450 5950
Entry Wire Line
	1450 6050 1550 5950
Entry Wire Line
	1450 5950 1550 5850
$Comp
L Sensor_Motion:MPU-9250 U10
U 1 1 5E54588E
P 2850 4300
F 0 "U10" H 2850 4300 50  0000 C CNN
F 1 "MPU-9250" H 2850 4200 50  0000 C CNN
F 2 "micelib:InvenSense_QFN-24_3x3mm_P0.4mm_HandSoldering" H 2850 3300 50  0001 C CNN
F 3 "https://store.invensense.com/datasheets/invensense/MPU9250REV1.0.pdf" H 2850 4150 50  0001 C CNN
	1    2850 4300
	1    0    0    -1  
$EndComp
Text Label 1650 4300 0    50   ~ 0
CS0
Entry Wire Line
	1550 4400 1650 4300
Text Label 1650 4200 0    50   ~ 0
CLK
Text Label 1650 4100 0    50   ~ 0
MISO
Text Label 1650 4000 0    50   ~ 0
MOSI
Entry Wire Line
	1550 3900 1650 4000
Entry Wire Line
	1550 4000 1650 4100
Entry Wire Line
	1550 4100 1650 4200
$Comp
L Sensor_Motion:MPU-9250 U11
U 1 1 5E5E9FF7
P 5650 4300
F 0 "U11" H 5650 4300 50  0000 C CNN
F 1 "MPU-9250" H 5650 4200 50  0000 C CNN
F 2 "micelib:InvenSense_QFN-24_3x3mm_P0.4mm_HandSoldering" H 5650 3300 50  0001 C CNN
F 3 "https://store.invensense.com/datasheets/invensense/MPU9250REV1.0.pdf" H 5650 4150 50  0001 C CNN
	1    5650 4300
	1    0    0    -1  
$EndComp
Wire Bus Line
	1550 4400 1550 5550
Connection ~ 1550 5550
Text Label 4100 4300 0    50   ~ 0
CS1
Text Label 4100 4200 0    50   ~ 0
CLK
Text Label 4100 4100 0    50   ~ 0
MISO
Text Label 4100 4000 0    50   ~ 0
MOSI
Entry Wire Line
	4100 4300 4000 4400
Entry Wire Line
	4000 3900 4100 4000
Entry Wire Line
	4000 4000 4100 4100
Entry Wire Line
	4000 4100 4100 4200
Wire Bus Line
	4000 4400 4000 5550
Wire Bus Line
	1550 5550 4000 5550
Wire Bus Line
	4000 3100 1550 3100
Connection ~ 1550 3100
NoConn ~ 4950 4500
$Comp
L power:GNDD #PWR061
U 1 1 5E5EE43C
P 2850 5300
F 0 "#PWR061" H 2850 5050 50  0001 C CNN
F 1 "GNDD" H 2854 5145 50  0000 C CNN
F 2 "" H 2850 5300 50  0001 C CNN
F 3 "" H 2850 5300 50  0001 C CNN
	1    2850 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5300 2850 5250
$Comp
L power:GNDD #PWR074
U 1 1 5E5EEB7B
P 5650 5300
F 0 "#PWR074" H 5650 5050 50  0001 C CNN
F 1 "GNDD" H 5654 5145 50  0000 C CNN
F 2 "" H 5650 5300 50  0001 C CNN
F 3 "" H 5650 5300 50  0001 C CNN
	1    5650 5300
	1    0    0    -1  
$EndComp
NoConn ~ 6350 4600
NoConn ~ 3550 4600
Connection ~ 2850 5250
Wire Wire Line
	2850 5250 2850 5200
$Comp
L Device:C_Small C30
U 1 1 5E5F2305
P 3700 4500
F 0 "C30" V 3471 4500 50  0000 C CNN
F 1 "0.1u" V 3562 4500 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 3700 4500 50  0001 C CNN
F 3 "~" H 3700 4500 50  0001 C CNN
	1    3700 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4500 3550 4500
Wire Wire Line
	3800 4500 3850 4500
Wire Wire Line
	3850 4500 3850 4700
Wire Wire Line
	2850 5250 3850 5250
Wire Wire Line
	3550 4700 3850 4700
Connection ~ 3850 4700
Wire Wire Line
	3850 4700 3850 5250
$Comp
L Device:C_Small C33
U 1 1 5E5F42C1
P 6500 4500
F 0 "C33" V 6271 4500 50  0000 C CNN
F 1 "0.1u" V 6362 4500 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 6500 4500 50  0001 C CNN
F 3 "~" H 6500 4500 50  0001 C CNN
	1    6500 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 4500 6650 4500
Wire Wire Line
	6650 4500 6650 4700
Wire Wire Line
	5650 5250 6650 5250
Wire Wire Line
	6350 4700 6650 4700
Connection ~ 6650 4700
Wire Wire Line
	6650 4700 6650 5250
Wire Wire Line
	5650 5200 5650 5250
Wire Wire Line
	5650 5250 5650 5300
Connection ~ 5650 5250
Wire Wire Line
	6400 4500 6350 4500
NoConn ~ 3550 4000
NoConn ~ 3550 4200
NoConn ~ 3550 4300
NoConn ~ 6350 4000
NoConn ~ 6350 4200
NoConn ~ 6350 4300
$Comp
L power:+3V3 #PWR039
U 1 1 5E5FB928
P 1650 3250
F 0 "#PWR039" H 1650 3100 50  0001 C CNN
F 1 "+3V3" H 1800 3300 50  0000 C CNN
F 2 "" H 1650 3250 50  0001 C CNN
F 3 "" H 1650 3250 50  0001 C CNN
	1    1650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3300 2950 3400
Wire Wire Line
	2750 3300 2750 3400
Connection ~ 2750 3300
Wire Wire Line
	2750 3300 2950 3300
$Comp
L Device:C_Small C28
U 1 1 5E5FE9A8
P 1650 3450
F 0 "C28" H 1742 3496 50  0000 L CNN
F 1 "10n" H 1742 3405 50  0000 L CNN
F 2 "micelib:C_0201_0603Metric_HandSoldering" H 1650 3450 50  0001 C CNN
F 3 "~" H 1650 3450 50  0001 C CNN
	1    1650 3450
	1    0    0    -1  
$EndComp
NoConn ~ 2150 4500
Wire Wire Line
	1650 4300 2150 4300
Wire Wire Line
	1650 4200 2150 4200
Wire Wire Line
	1650 4100 2150 4100
Wire Wire Line
	1650 4000 2150 4000
Wire Wire Line
	1650 3250 1650 3300
Wire Wire Line
	1650 3300 2000 3300
Connection ~ 1650 3300
Wire Wire Line
	1650 3300 1650 3350
$Comp
L Device:C_Small C29
U 1 1 5E6052A2
P 2000 3450
F 0 "C29" H 2092 3496 50  0000 L CNN
F 1 "0.1u" H 2092 3405 50  0000 L CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 2000 3450 50  0001 C CNN
F 3 "~" H 2000 3450 50  0001 C CNN
	1    2000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3300 2000 3350
Connection ~ 2000 3300
Wire Wire Line
	2000 3300 2750 3300
Wire Wire Line
	2000 3550 2000 3600
Wire Wire Line
	2000 3600 1650 3600
Wire Wire Line
	1650 3600 1650 3550
Connection ~ 2000 3600
Wire Wire Line
	2000 3600 2000 3650
$Comp
L power:GNDD #PWR060
U 1 1 5E608003
P 2000 3650
F 0 "#PWR060" H 2000 3400 50  0001 C CNN
F 1 "GNDD" H 2004 3495 50  0000 C CNN
F 2 "" H 2000 3650 50  0001 C CNN
F 3 "" H 2000 3650 50  0001 C CNN
	1    2000 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR066
U 1 1 5E608F3C
P 4450 3250
F 0 "#PWR066" H 4450 3100 50  0001 C CNN
F 1 "+3V3" H 4600 3300 50  0000 C CNN
F 2 "" H 4450 3250 50  0001 C CNN
F 3 "" H 4450 3250 50  0001 C CNN
	1    4450 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C31
U 1 1 5E608F42
P 4450 3450
F 0 "C31" H 4542 3496 50  0000 L CNN
F 1 "10n" H 4542 3405 50  0000 L CNN
F 2 "micelib:C_0201_0603Metric_HandSoldering" H 4450 3450 50  0001 C CNN
F 3 "~" H 4450 3450 50  0001 C CNN
	1    4450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3250 4450 3300
Wire Wire Line
	4450 3300 4800 3300
Connection ~ 4450 3300
Wire Wire Line
	4450 3300 4450 3350
$Comp
L Device:C_Small C32
U 1 1 5E608F4D
P 4800 3450
F 0 "C32" H 4892 3496 50  0000 L CNN
F 1 "0.1u" H 4892 3405 50  0000 L CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 4800 3450 50  0001 C CNN
F 3 "~" H 4800 3450 50  0001 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3300 4800 3350
Connection ~ 4800 3300
Wire Wire Line
	4800 3550 4800 3600
Wire Wire Line
	4800 3600 4450 3600
Wire Wire Line
	4450 3600 4450 3550
Connection ~ 4800 3600
Wire Wire Line
	4800 3600 4800 3650
$Comp
L power:GNDD #PWR067
U 1 1 5E608F5C
P 4800 3650
F 0 "#PWR067" H 4800 3400 50  0001 C CNN
F 1 "GNDD" H 4804 3495 50  0000 C CNN
F 2 "" H 4800 3650 50  0001 C CNN
F 3 "" H 4800 3650 50  0001 C CNN
	1    4800 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4000 4950 4000
Wire Wire Line
	4100 4100 4950 4100
Wire Wire Line
	4100 4200 4950 4200
Wire Wire Line
	4100 4300 4950 4300
Wire Wire Line
	5750 3300 5750 3400
Wire Wire Line
	4800 3300 5550 3300
Wire Wire Line
	5550 3300 5550 3400
Connection ~ 5550 3300
Wire Wire Line
	5550 3300 5750 3300
Wire Notes Line
	600  700  2650 700 
Wire Notes Line
	2650 700  2650 2300
Text Notes 700  2200 0    100  ~ 0
Current
Wire Notes Line
	600  700  600  6450
Text Notes 700  6350 0    100  ~ 0
IMU
Wire Notes Line
	650  2300 6800 2300
Wire Notes Line
	6800 2300 6800 6450
Wire Notes Line
	6800 6450 600  6450
Text GLabel 3500 700  2    50   Input ~ 0
PWM_MD
Text GLabel 3500 800  2    50   Input ~ 0
MD_IN1
Text GLabel 3500 900  2    50   Input ~ 0
MD_IN2
Text GLabel 3500 1000 2    50   Input ~ 0
I2C_SDA
Text GLabel 3500 1100 2    50   Input ~ 0
I2C_SCL
$Comp
L power:GND #PWR?
U 1 1 5EC61195
P 4650 1950
AR Path="/5EC61195" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5EC61195" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 4650 1700 50  0001 C CNN
F 1 "GND" H 4650 1800 50  0000 C CNN
F 2 "" H 4650 1950 50  0001 C CNN
F 3 "" H 4650 1950 50  0001 C CNN
	1    4650 1950
	1    0    0    -1  
$EndComp
Text GLabel 4850 1600 2    50   Input ~ 0
ADC1_Batt
Wire Wire Line
	4650 1950 4650 1900
$Comp
L Connector_Generic:Conn_01x04 J14
U 1 1 5ECB2FF3
P 4300 1800
F 0 "J14" H 4220 1375 50  0000 C CNN
F 1 "Conn_01x04" H 4220 1466 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4300 1800 50  0001 C CNN
F 3 "~" H 4300 1800 50  0001 C CNN
	1    4300 1800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J13
U 1 1 5ECB3055
P 4300 1150
F 0 "J13" H 4220 725 50  0000 C CNN
F 1 "Conn_01x04" H 4220 816 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4300 1150 50  0001 C CNN
F 3 "~" H 4300 1150 50  0001 C CNN
	1    4300 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4500 1900 4650 1900
$Comp
L power:+3V3 #PWR077
U 1 1 5ECBE3B6
P 5550 1550
F 0 "#PWR077" H 5550 1400 50  0001 C CNN
F 1 "+3V3" H 5565 1723 50  0000 C CNN
F 2 "" H 5550 1550 50  0001 C CNN
F 3 "" H 5550 1550 50  0001 C CNN
	1    5550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR076
U 1 1 5ECBE416
P 5350 1550
F 0 "#PWR076" H 5350 1400 50  0001 C CNN
F 1 "+5V" H 5365 1723 50  0000 C CNN
F 2 "" H 5350 1550 50  0001 C CNN
F 3 "" H 5350 1550 50  0001 C CNN
	1    5350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1550 5350 1700
Wire Wire Line
	4650 1900 4650 1250
Wire Wire Line
	4650 1250 4500 1250
Connection ~ 4650 1900
Wire Wire Line
	4500 1700 4750 1700
Wire Wire Line
	4500 1800 4700 1800
Wire Wire Line
	4500 1150 4700 1150
Wire Wire Line
	4700 1150 4700 1800
Connection ~ 4700 1800
Wire Wire Line
	4500 1050 4750 1050
Wire Wire Line
	4750 1050 4750 1700
Connection ~ 4750 1700
Wire Wire Line
	5550 1550 5550 1800
Wire Wire Line
	4750 1700 5350 1700
Wire Wire Line
	4700 1800 5550 1800
Wire Wire Line
	4500 950  4800 950 
Wire Wire Line
	4800 950  4800 1600
Wire Wire Line
	4800 1600 4500 1600
Wire Wire Line
	4850 1600 4800 1600
Connection ~ 4800 1600
Text GLabel 3500 1200 2    50   Input ~ 0
PWM0
Text GLabel 3500 1300 2    50   Input ~ 0
PWM1
$Comp
L Connector_Generic:Conn_01x07 J11
U 1 1 5ED4250E
P 2800 1000
F 0 "J11" H 2700 550 50  0000 C CNN
F 1 "Conn_01x07" H 2700 600 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 2800 1000 50  0001 C CNN
F 3 "~" H 2800 1000 50  0001 C CNN
	1    2800 1000
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x07 J12
U 1 1 5ED425C0
P 2800 1900
F 0 "J12" H 2700 1450 50  0000 C CNN
F 1 "Conn_01x07" H 2700 1500 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 2800 1900 50  0001 C CNN
F 3 "~" H 2800 1900 50  0001 C CNN
	1    2800 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 700  3150 700 
Wire Wire Line
	3000 800  3200 800 
Wire Wire Line
	3000 900  3250 900 
Wire Wire Line
	3000 1000 3300 1000
Wire Wire Line
	3000 1100 3350 1100
Wire Wire Line
	3000 1200 3400 1200
Wire Wire Line
	3000 1600 3150 1600
Wire Wire Line
	3150 1600 3150 700 
Connection ~ 3150 700 
Wire Wire Line
	3200 1700 3000 1700
Wire Wire Line
	3000 1800 3250 1800
Wire Wire Line
	3250 1800 3250 900 
Connection ~ 3250 900 
Wire Wire Line
	3200 1700 3200 800 
Connection ~ 3200 800 
Wire Wire Line
	3300 1000 3300 1900
Wire Wire Line
	3300 1900 3000 1900
Connection ~ 3300 1000
Wire Wire Line
	3000 2000 3350 2000
Wire Wire Line
	3350 2000 3350 1100
Connection ~ 3350 1100
Wire Wire Line
	3400 1200 3400 2100
Wire Wire Line
	3400 2100 3000 2100
Connection ~ 3400 1200
Wire Wire Line
	3000 1300 3450 1300
Wire Wire Line
	3400 1200 3500 1200
Wire Wire Line
	3350 1100 3500 1100
Wire Wire Line
	3300 1000 3500 1000
Wire Wire Line
	3250 900  3500 900 
Wire Wire Line
	3200 800  3500 800 
Wire Wire Line
	3150 700  3500 700 
Wire Wire Line
	3450 1300 3450 2200
Wire Wire Line
	3450 2200 3000 2200
Wire Bus Line
	1550 5550 1550 5950
Wire Bus Line
	1550 2850 1550 3100
Wire Bus Line
	1550 3100 1550 4100
Wire Bus Line
	4000 3100 4000 4100
Connection ~ 3450 1300
Wire Wire Line
	3450 1300 3500 1300
$EndSCHEMATC
