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
P 1150 1000
AR Path="/5E291BF1" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291BF1" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 1150 850 50  0001 C CNN
F 1 "+5V" H 1150 1150 50  0000 C CNN
F 2 "" H 1150 1000 50  0001 C CNN
F 3 "" H 1150 1000 50  0001 C CNN
	1    1150 1000
	1    0    0    -1  
$EndComp
$Comp
L dk_PMIC-Current-Regulation-Management:INA219AIDCNR U?
U 1 1 5E291C00
P 2200 1450
AR Path="/5E291C00" Ref="U?"  Part="1" 
AR Path="/5E247314/5E291C00" Ref="U8"  Part="1" 
F 0 "U8" H 2150 1450 60  0000 L CNN
F 1 "INA219AIDCNR" V 2350 1100 60  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-8_Handsoldering" H 2400 1650 60  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina219.pdf" H 2400 1750 60  0001 L CNN
F 4 "296-23770-1-ND" H 2400 1850 60  0001 L CNN "Digi-Key_PN"
F 5 "INA219AIDCNR" H 2400 1950 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 2400 2050 60  0001 L CNN "Category"
F 7 "PMIC - Current Regulation/Management" H 2400 2150 60  0001 L CNN "Family"
F 8 "http://www.ti.com/lit/ds/symlink/ina219.pdf" H 2400 2250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/texas-instruments/INA219AIDCNR/296-23770-1-ND/1952550" H 2400 2350 60  0001 L CNN "DK_Detail_Page"
F 10 "IC CURRENT MONITOR 1% SOT23-8" H 2400 2450 60  0001 L CNN "Description"
F 11 "Texas Instruments" H 2400 2550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2400 2650 60  0001 L CNN "Status"
	1    2200 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1950 2200 2000
$Comp
L power:GNDD #PWR?
U 1 1 5E291C08
P 2200 2000
AR Path="/5E291C08" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291C08" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 2200 1750 50  0001 C CNN
F 1 "GNDD" H 2050 1950 50  0000 C CNN
F 2 "" H 2200 2000 50  0001 C CNN
F 3 "" H 2200 2000 50  0001 C CNN
	1    2200 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E291C0E
P 1450 1200
AR Path="/5E291C0E" Ref="C?"  Part="1" 
AR Path="/5E247314/5E291C0E" Ref="C19"  Part="1" 
F 0 "C19" H 1550 1250 50  0000 L CNN
F 1 "0.1u" H 1550 1150 50  0000 L CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1450 1200 50  0001 C CNN
F 3 "~" H 1450 1200 50  0001 C CNN
	1    1450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1050 1450 1100
Wire Wire Line
	1400 1050 1450 1050
Wire Wire Line
	1450 1350 1450 1300
$Comp
L Device:R_Small R?
U 1 1 5E291C18
P 1300 1050
AR Path="/5E291C18" Ref="R?"  Part="1" 
AR Path="/5E247314/5E291C18" Ref="R34"  Part="1" 
F 0 "R34" V 1200 1050 50  0000 C CNN
F 1 "10" V 1400 1050 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1300 1050 50  0001 C CNN
F 3 "~" H 1300 1050 50  0001 C CNN
	1    1300 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 1000 1150 1050
Wire Wire Line
	1150 1050 1200 1050
Connection ~ 1150 1050
Wire Wire Line
	1150 1050 1150 1100
$Comp
L Device:R_Small R?
U 1 1 5E291C23
P 1300 1350
AR Path="/5E291C23" Ref="R?"  Part="1" 
AR Path="/5E247314/5E291C23" Ref="R35"  Part="1" 
F 0 "R35" V 1200 1350 50  0000 C CNN
F 1 "10" V 1400 1350 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1300 1350 50  0001 C CNN
F 3 "~" H 1300 1350 50  0001 C CNN
	1    1300 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 1350 1400 1350
Wire Wire Line
	1200 1350 1150 1350
Wire Wire Line
	1150 1350 1150 1300
$Comp
L Device:R_Small R?
U 1 1 5E291C2D
P 1150 1200
AR Path="/5E291C2D" Ref="R?"  Part="1" 
AR Path="/5E247314/5E291C2D" Ref="R33"  Part="1" 
F 0 "R33" H 1300 1150 50  0000 C CNN
F 1 "2m" H 1250 1250 50  0000 C CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1150 1200 50  0001 C CNN
F 3 "~" H 1150 1200 50  0001 C CNN
	1    1150 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 1050 2200 1000
$Comp
L power:+3V3 #PWR?
U 1 1 5E291C35
P 2200 1000
AR Path="/5E291C35" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291C35" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 2200 850 50  0001 C CNN
F 1 "+3V3" H 2215 1173 50  0000 C CNN
F 2 "" H 2200 1000 50  0001 C CNN
F 3 "" H 2200 1000 50  0001 C CNN
	1    2200 1000
	1    0    0    -1  
$EndComp
Text GLabel 1750 1550 0    50   Input ~ 0
I2C_SDA
Text GLabel 1750 1450 0    50   Input ~ 0
I2C_SCL
Connection ~ 1450 1350
Wire Wire Line
	1750 1450 1800 1450
Wire Wire Line
	1750 1550 1800 1550
Wire Wire Line
	1800 1650 1750 1650
Wire Wire Line
	1750 1650 1750 1750
$Comp
L power:GNDD #PWR?
U 1 1 5E291C42
P 1750 1850
AR Path="/5E291C42" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E291C42" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 1750 1600 50  0001 C CNN
F 1 "GNDD" H 1754 1695 50  0000 C CNN
F 2 "" H 1750 1850 50  0001 C CNN
F 3 "" H 1750 1850 50  0001 C CNN
	1    1750 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1750 1750 1750
Connection ~ 1750 1750
Wire Wire Line
	1750 1750 1750 1850
Wire Wire Line
	1150 1350 1150 1450
Connection ~ 1150 1350
Text GLabel 1050 1450 0    50   Input ~ 0
MD_VM
Wire Wire Line
	1450 1350 1800 1350
Wire Wire Line
	1800 1250 1750 1250
Wire Wire Line
	1750 1250 1750 1050
Wire Wire Line
	1750 1050 1450 1050
Connection ~ 1450 1050
Wire Wire Line
	1050 1450 1150 1450
Text Notes 700  2350 0    100  ~ 0
Current
Text GLabel 3550 1350 2    50   Input ~ 0
I2C_SDA
Text GLabel 3550 1450 2    50   Input ~ 0
I2C_SCL
Text GLabel 4850 1800 2    50   Input ~ 0
ADC1_Batt
Wire Wire Line
	4650 2250 4650 2200
$Comp
L power:+3V3 #PWR074
U 1 1 5ECBE3B6
P 5550 1750
F 0 "#PWR074" H 5550 1600 50  0001 C CNN
F 1 "+3V3" H 5565 1923 50  0000 C CNN
F 2 "" H 5550 1750 50  0001 C CNN
F 3 "" H 5550 1750 50  0001 C CNN
	1    5550 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR073
U 1 1 5ECBE416
P 5350 1750
F 0 "#PWR073" H 5350 1600 50  0001 C CNN
F 1 "+5V" H 5365 1923 50  0000 C CNN
F 2 "" H 5350 1750 50  0001 C CNN
F 3 "" H 5350 1750 50  0001 C CNN
	1    5350 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1750 5350 1900
Wire Wire Line
	5550 1750 5550 2000
$Comp
L Connector_Generic:Conn_01x05 J12
U 1 1 5EF1C02F
P 4200 2000
F 0 "J12" H 4200 1600 50  0000 C CNN
F 1 "Conn__PBridge" H 4250 1700 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_2x03_P1.00mm_Vertical_SMD" H 4200 2000 50  0001 C CNN
F 3 "~" H 4200 2000 50  0001 C CNN
	1    4200 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 1800 4650 1800
Wire Wire Line
	4400 1900 4600 1900
Wire Wire Line
	4400 2000 4550 2000
Wire Wire Line
	4400 2100 4500 2100
Wire Wire Line
	4400 2200 4450 2200
$Comp
L Connector_Generic:Conn_01x05 J11
U 1 1 5EF40D9B
P 4200 1150
F 0 "J11" H 4120 725 50  0000 C CNN
F 1 "Conn_PBridge" H 4120 816 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_2x03_P1.00mm_Vertical_SMD" H 4200 1150 50  0001 C CNN
F 3 "~" H 4200 1150 50  0001 C CNN
	1    4200 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 1350 4450 1350
Wire Wire Line
	4450 1350 4450 2200
Connection ~ 4450 2200
Wire Wire Line
	4450 2200 4650 2200
Wire Wire Line
	4500 2100 4500 1250
Wire Wire Line
	4500 1250 4400 1250
Connection ~ 4500 2100
Wire Wire Line
	4500 2100 4850 2100
Wire Wire Line
	4400 1150 4550 1150
Wire Wire Line
	4550 1150 4550 2000
Connection ~ 4550 2000
Wire Wire Line
	4550 2000 5550 2000
Wire Wire Line
	4600 1900 4600 1050
Wire Wire Line
	4600 1050 4400 1050
Connection ~ 4600 1900
Wire Wire Line
	4600 1900 5350 1900
Wire Wire Line
	4400 950  4650 950 
Wire Wire Line
	4650 950  4650 1800
Connection ~ 4650 1800
Wire Wire Line
	4650 1800 4850 1800
Text GLabel 4850 2100 2    50   Input ~ 0
VBUS
$Comp
L power:GNDD #PWR?
U 1 1 5EF5FD4C
P 4650 2250
AR Path="/5EF5FD4C" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5EF5FD4C" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 4650 2000 50  0001 C CNN
F 1 "GNDD" H 4500 2200 50  0000 C CNN
F 2 "" H 4650 2250 50  0001 C CNN
F 3 "" H 4650 2250 50  0001 C CNN
	1    4650 2250
	1    0    0    -1  
$EndComp
Text GLabel 1100 2950 3    50   Input ~ 0
I2C_SDA
Text GLabel 1000 2950 3    50   Input ~ 0
I2C_SCL
$Comp
L power:+3V3 #PWR?
U 1 1 5E3004E0
P 800 2750
AR Path="/5E3004E0" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E3004E0" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 800 2600 50  0001 C CNN
F 1 "+3V3" H 800 2900 50  0000 C CNN
F 2 "" H 800 2750 50  0001 C CNN
F 3 "" H 800 2750 50  0001 C CNN
	1    800  2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2850 1300 2900
$Comp
L Device:C_Small C?
U 1 1 5E3004E7
P 1350 3400
AR Path="/5E3004E7" Ref="C?"  Part="1" 
AR Path="/5E247314/5E3004E7" Ref="C18"  Part="1" 
F 0 "C18" H 1442 3446 50  0000 L CNN
F 1 "0.1u" H 1442 3355 50  0000 L CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 1350 3400 50  0001 C CNN
F 3 "~" H 1350 3400 50  0001 C CNN
	1    1350 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1450 3400 1500 3400
Wire Wire Line
	1300 2900 1500 2900
Connection ~ 1500 2900
Wire Wire Line
	1250 3400 1200 3400
Connection ~ 1200 3400
Wire Wire Line
	1200 3400 1200 2850
Wire Wire Line
	1500 3400 1500 2900
$Comp
L power:GNDD #PWR?
U 1 1 5E3004F5
P 1650 3150
AR Path="/5E3004F5" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E3004F5" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 1650 2900 50  0001 C CNN
F 1 "GNDD" H 1654 2995 50  0000 C CNN
F 2 "" H 1650 3150 50  0001 C CNN
F 3 "" H 1650 3150 50  0001 C CNN
	1    1650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2850 1100 2950
Wire Wire Line
	1000 2850 1000 2950
Wire Wire Line
	1650 2900 1650 3150
Wire Wire Line
	1500 2900 1650 2900
Wire Wire Line
	800  2750 800  3400
Wire Wire Line
	800  3400 1200 3400
Text Notes 750  3700 0    100  ~ 0
I2C & SPI
Text GLabel 2350 2950 3    50   Input ~ 0
SPI_MISO
Wire Wire Line
	2350 2950 2350 2850
Text GLabel 2250 2950 3    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	2250 2950 2250 2850
Wire Wire Line
	2150 2850 2150 2950
Text GLabel 2150 2950 3    50   Input ~ 0
SPI_CLK
Wire Notes Line
	3200 2450 3200 3750
Wire Notes Line
	3200 3750 600  3750
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5F5A4F48
P 3050 1450
F 0 "J9" H 2970 1125 50  0000 C CNN
F 1 "Conn__I2CBridge" H 2970 1216 50  0000 C CNN
F 2 "" H 3050 1450 50  0001 C CNN
F 3 "~" H 3050 1450 50  0001 C CNN
	1    3050 1450
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 5F5A81AC
P 3050 1900
F 0 "J10" H 2970 1575 50  0000 C CNN
F 1 "Conn_I2CBridge" H 2970 1666 50  0000 C CNN
F 2 "" H 3050 1900 50  0001 C CNN
F 3 "~" H 3050 1900 50  0001 C CNN
	1    3050 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 1350 3450 1350
Wire Wire Line
	3250 1450 3500 1450
Wire Wire Line
	3250 1800 3450 1800
Wire Wire Line
	3450 1800 3450 1350
Wire Wire Line
	3250 1900 3500 1900
Wire Wire Line
	3500 1900 3500 1450
Wire Wire Line
	3550 1350 3450 1350
Connection ~ 3450 1350
Wire Wire Line
	3500 1450 3550 1450
Connection ~ 3500 1450
Wire Notes Line
	5700 600  5700 2450
Wire Notes Line
	2650 600  2650 2450
Wire Notes Line
	600  2450 5700 2450
Text Notes 2750 2300 0    100  ~ 0
Board_Bridge
Wire Notes Line
	600  600  5700 600 
Wire Notes Line
	600  600  600  3750
Wire Wire Line
	2550 2850 2550 2900
$Comp
L power:GNDD #PWR?
U 1 1 5E301DF7
P 2900 3300
AR Path="/5E301DF7" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E301DF7" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 2900 3050 50  0001 C CNN
F 1 "GNDD" H 2904 3145 50  0000 C CNN
F 2 "" H 2900 3300 50  0001 C CNN
F 3 "" H 2900 3300 50  0001 C CNN
	1    2900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2900 2900 3300
Wire Wire Line
	2700 3400 2750 3400
Wire Wire Line
	2750 2900 2900 2900
Wire Wire Line
	2550 2900 2750 2900
Connection ~ 2750 2900
Wire Wire Line
	2750 3400 2750 2900
Wire Wire Line
	2450 3400 2450 2850
Wire Wire Line
	2500 3400 2450 3400
$Comp
L Device:C_Small C?
U 1 1 5E301DE9
P 2600 3400
AR Path="/5E301DE9" Ref="C?"  Part="1" 
AR Path="/5E247314/5E301DE9" Ref="C20"  Part="1" 
F 0 "C20" H 2692 3446 50  0000 L CNN
F 1 "0.1u" H 2692 3355 50  0000 L CNN
F 2 "micelib:C_0402_1005Metric_HandSoldering" H 2600 3400 50  0001 C CNN
F 3 "~" H 2600 3400 50  0001 C CNN
	1    2600 3400
	0    -1   -1   0   
$EndComp
Connection ~ 2450 3400
Wire Wire Line
	1950 3400 2450 3400
Wire Wire Line
	1950 2750 1950 3400
$Comp
L power:+3V3 #PWR?
U 1 1 5E301DE2
P 1950 2750
AR Path="/5E301DE2" Ref="#PWR?"  Part="1" 
AR Path="/5E247314/5E301DE2" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 1950 2600 50  0001 C CNN
F 1 "+3V3" H 1950 2900 50  0000 C CNN
F 2 "" H 1950 2750 50  0001 C CNN
F 3 "" H 1950 2750 50  0001 C CNN
	1    1950 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J8
U 1 1 5E3046DE
P 2350 2650
F 0 "J8" V 2316 2362 50  0000 R CNN
F 1 "Conn_SPI" V 2225 2362 50  0000 R CNN
F 2 "" H 2350 2650 50  0001 C CNN
F 3 "~" H 2350 2650 50  0001 C CNN
	1    2350 2650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5E3004D7
P 1100 2650
AR Path="/5E3004D7" Ref="J?"  Part="1" 
AR Path="/5E247314/5E3004D7" Ref="J7"  Part="1" 
F 0 "J7" H 1180 2642 50  0000 L CNN
F 1 "Conn_I2C" H 900 2350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1100 2650 50  0001 C CNN
F 3 "~" H 1100 2650 50  0001 C CNN
	1    1100 2650
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
