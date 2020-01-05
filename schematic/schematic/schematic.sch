EESchema Schematic File Version 4
LIBS:schematic-cache
EELAYER 26 0
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
NoConn ~ 5550 3550
NoConn ~ 5550 3650
NoConn ~ 5550 3750
NoConn ~ 5550 3850
NoConn ~ 5550 3950
NoConn ~ 5550 4050
Wire Wire Line
	6750 3350 7100 3350
Wire Wire Line
	6750 3450 7100 3450
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5E1084F6
P 10900 5900
F 0 "J?" H 10850 6100 50  0000 L CNN
F 1 "Conn_M5StickV" H 10400 5600 50  0000 L CNN
F 2 "" H 10900 5900 50  0001 C CNN
F 3 "~" H 10900 5900 50  0001 C CNN
	1    10900 5900
	1    0    0    -1  
$EndComp
Text GLabel 10650 6000 0    50   Input ~ 0
M5_TX
Wire Wire Line
	10700 6000 10650 6000
Text GLabel 10650 6100 0    50   Input ~ 0
M5_RX
Wire Wire Line
	10700 6100 10650 6100
Text GLabel 9400 6100 2    50   Input ~ 0
M5_TX
Text GLabel 9400 6200 2    50   Input ~ 0
M5_RX
Text GLabel 7100 3350 2    50   Input ~ 0
ESP32_RX
Text GLabel 7100 3450 2    50   Input ~ 0
ESP32_TX
Text GLabel 9300 6100 0    50   Input ~ 0
ESP32_RX
Text GLabel 9300 6200 0    50   Input ~ 0
ESP32_TX
Wire Wire Line
	9400 6100 9300 6100
Wire Wire Line
	9300 6200 9400 6200
Wire Notes Line
	8850 5500 11100 5500
Wire Notes Line
	11100 5500 11100 6300
Wire Notes Line
	11100 6300 8850 6300
Wire Notes Line
	8850 6300 8850 5500
Text Notes 9000 5650 0    50   ~ 0
M5StickV
Wire Wire Line
	10700 5800 10250 5800
Wire Wire Line
	10250 5800 10250 5950
$Comp
L power:GNDD #PWR?
U 1 1 5E1089E5
P 10250 5950
F 0 "#PWR?" H 10250 5700 50  0001 C CNN
F 1 "GNDD" H 10254 5795 50  0000 C CNN
F 2 "" H 10250 5950 50  0001 C CNN
F 3 "" H 10250 5950 50  0001 C CNN
	1    10250 5950
	1    0    0    -1  
$EndComp
NoConn ~ 10700 5900
Wire Wire Line
	6150 4950 6150 5050
$Comp
L power:GNDD #PWR?
U 1 1 5E108B33
P 6150 5050
F 0 "#PWR?" H 6150 4800 50  0001 C CNN
F 1 "GNDD" H 6154 4895 50  0000 C CNN
F 2 "" H 6150 5050 50  0001 C CNN
F 3 "" H 6150 5050 50  0001 C CNN
	1    6150 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2150 6150 2100
$Comp
L power:+3V3 #PWR?
U 1 1 5E108D22
P 6150 2100
F 0 "#PWR?" H 6150 1950 50  0001 C CNN
F 1 "+3V3" H 6165 2273 50  0000 C CNN
F 2 "" H 6150 2100 50  0001 C CNN
F 3 "" H 6150 2100 50  0001 C CNN
	1    6150 2100
	1    0    0    -1  
$EndComp
Text GLabel 7100 3750 2    50   Input ~ 0
I2C_SDA
$Comp
L RF_Module:ESP32-WROOM-32D U?
U 1 1 5E10842D
P 6150 3550
F 0 "U?" H 6150 3250 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 6050 2700 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 6150 2050 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 5850 3600 50  0001 C CNN
	1    6150 3550
	1    0    0    -1  
$EndComp
Text GLabel 7100 3850 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	6750 3750 7100 3750
Wire Wire Line
	6750 3850 7100 3850
$Comp
L micelib:TPS6300x U?
U 1 1 5E109930
P 1550 1200
F 0 "U?" H 1550 1665 50  0000 C CNN
F 1 "TPS63001" H 1550 1574 50  0000 C CNN
F 2 "" H 1550 1200 50  0001 C CNN
F 3 "" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1200 1050 1200
Wire Wire Line
	1050 1200 1050 1150
$Comp
L power:GND #PWR?
U 1 1 5E109CE0
P 850 1200
F 0 "#PWR?" H 850 950 50  0001 C CNN
F 1 "GND" H 855 1027 50  0000 C CNN
F 2 "" H 850 1200 50  0001 C CNN
F 3 "" H 850 1200 50  0001 C CNN
	1    850  1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1300 1000 1300
Wire Wire Line
	1000 1300 1000 1450
Wire Wire Line
	1000 1450 700  1450
$Comp
L Device:L_Small L?
U 1 1 5E10A80D
P 700 1250
F 0 "L?" H 850 1200 50  0000 R CNN
F 1 "2.2u" H 900 1300 50  0000 R CNN
F 2 "" H 700 1250 50  0001 C CNN
F 3 "~" H 700 1250 50  0001 C CNN
	1    700  1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 1100 700  1100
Wire Wire Line
	1050 1150 850  1150
Wire Wire Line
	850  1150 850  1200
Wire Wire Line
	2000 1200 2100 1200
Wire Wire Line
	2100 1200 2100 1300
Wire Wire Line
	2000 1300 2100 1300
Connection ~ 2100 1300
Wire Wire Line
	2100 1300 2100 1400
Wire Wire Line
	2000 1400 2100 1400
Wire Wire Line
	1550 1600 1550 1650
$Comp
L power:GNDD #PWR?
U 1 1 5E10BBCC
P 1650 1700
F 0 "#PWR?" H 1650 1450 50  0001 C CNN
F 1 "GNDD" H 1654 1545 50  0000 C CNN
F 2 "" H 1650 1700 50  0001 C CNN
F 3 "" H 1650 1700 50  0001 C CNN
	1    1650 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1700 1650 1650
Wire Wire Line
	1650 1650 1550 1650
Wire Wire Line
	1550 1650 1450 1650
Wire Wire Line
	1450 1650 1450 1700
Connection ~ 1550 1650
$Comp
L power:GND #PWR?
U 1 1 5E10C577
P 1450 1700
F 0 "#PWR?" H 1450 1450 50  0001 C CNN
F 1 "GND" H 1455 1527 50  0000 C CNN
F 2 "" H 1450 1700 50  0001 C CNN
F 3 "" H 1450 1700 50  0001 C CNN
	1    1450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1400 1050 1400
Wire Wire Line
	2100 1500 2100 1400
Connection ~ 2100 1400
Wire Wire Line
	2000 1100 2250 1100
Wire Wire Line
	2250 1100 2250 1200
$Comp
L power:GNDD #PWR?
U 1 1 5E10DB0D
P 2250 1200
F 0 "#PWR?" H 2250 950 50  0001 C CNN
F 1 "GNDD" H 2254 1045 50  0000 C CNN
F 2 "" H 2250 1200 50  0001 C CNN
F 3 "" H 2250 1200 50  0001 C CNN
	1    2250 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1000 2050 1000
Wire Wire Line
	2050 1000 2050 950 
$Comp
L power:+3V3 #PWR?
U 1 1 5E10EB71
P 2050 950
F 0 "#PWR?" H 2050 800 50  0001 C CNN
F 1 "+3V3" H 2050 1100 50  0000 C CNN
F 2 "" H 2050 950 50  0001 C CNN
F 3 "" H 2050 950 50  0001 C CNN
	1    2050 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1000 1050 1000
$Comp
L power:+3V3 #PWR?
U 1 1 5E10F471
P 1050 900
F 0 "#PWR?" H 1050 750 50  0001 C CNN
F 1 "+3V3" H 1050 1050 50  0000 C CNN
F 2 "" H 1050 900 50  0001 C CNN
F 3 "" H 1050 900 50  0001 C CNN
	1    1050 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E10F4C6
P 1050 1700
F 0 "C?" H 1142 1746 50  0000 L CNN
F 1 "10u" H 1142 1655 50  0000 L CNN
F 2 "" H 1050 1700 50  0001 C CNN
F 3 "~" H 1050 1700 50  0001 C CNN
	1    1050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1800 1050 1850
$Comp
L power:GND #PWR?
U 1 1 5E1107B8
P 1050 1850
F 0 "#PWR?" H 1050 1600 50  0001 C CNN
F 1 "GND" H 1055 1677 50  0000 C CNN
F 2 "" H 1050 1850 50  0001 C CNN
F 3 "" H 1050 1850 50  0001 C CNN
	1    1050 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E1108BC
P 2250 950
F 0 "C?" H 2342 996 50  0000 L CNN
F 1 "10uF" H 2342 905 50  0000 L CNN
F 2 "" H 2250 950 50  0001 C CNN
F 3 "~" H 2250 950 50  0001 C CNN
	1    2250 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1050 2250 1100
Connection ~ 2250 1100
Wire Wire Line
	2250 850  2250 800 
$Comp
L power:+3V3 #PWR?
U 1 1 5E111CB5
P 2250 800
F 0 "#PWR?" H 2250 650 50  0001 C CNN
F 1 "+3V3" H 2250 950 50  0000 C CNN
F 2 "" H 2250 800 50  0001 C CNN
F 3 "" H 2250 800 50  0001 C CNN
	1    2250 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  1350 700  1450
Wire Wire Line
	700  1150 700  1100
$Comp
L Device:Battery_Cell BT?
U 1 1 5E114232
P 850 2950
F 0 "BT?" H 968 3046 50  0000 L CNN
F 1 "LiPo" H 968 2955 50  0000 L CNN
F 2 "" V 850 3010 50  0001 C CNN
F 3 "~" V 850 3010 50  0001 C CNN
	1    850  2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2750 850  2650
Wire Wire Line
	850  2650 1150 2650
Wire Wire Line
	850  3050 850  3150
$Comp
L power:GND #PWR?
U 1 1 5E116898
P 850 3150
F 0 "#PWR?" H 850 2900 50  0001 C CNN
F 1 "GND" H 855 2977 50  0000 C CNN
F 2 "" H 850 3150 50  0001 C CNN
F 3 "" H 850 3150 50  0001 C CNN
	1    850  3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2950 1350 3100
$Comp
L power:GND #PWR?
U 1 1 5E117635
P 1350 3100
F 0 "#PWR?" H 1350 2850 50  0001 C CNN
F 1 "GND" H 1355 2927 50  0000 C CNN
F 2 "" H 1350 3100 50  0001 C CNN
F 3 "" H 1350 3100 50  0001 C CNN
	1    1350 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PMOS_GSD Q?
U 1 1 5E1E155C
P 1350 2750
F 0 "Q?" V 1693 2750 50  0000 C CNN
F 1 "Q_PMOS_GSD" V 1602 2750 50  0000 C CNN
F 2 "" H 1550 2850 50  0001 C CNN
F 3 "~" H 1350 2750 50  0001 C CNN
	1    1350 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_PMOS_GSD Q?
U 1 1 5E1E16B2
P 1900 2750
F 0 "Q?" V 2243 2750 50  0000 C CNN
F 1 "Q_PMOS_GSD" V 2152 2750 50  0000 C CNN
F 2 "" H 2100 2850 50  0001 C CNN
F 3 "~" H 1900 2750 50  0001 C CNN
	1    1900 2750
	0    1    -1   0   
$EndComp
Wire Wire Line
	1700 2650 1600 2650
Wire Wire Line
	1600 2650 1600 2750
Connection ~ 1600 2650
Wire Wire Line
	1600 2650 1550 2650
$Comp
L Device:R_Small R?
U 1 1 5E1E3D9B
P 1600 2850
F 0 "R?" H 1659 2896 50  0000 L CNN
F 1 "10k" H 1659 2805 50  0000 L CNN
F 2 "" H 1600 2850 50  0001 C CNN
F 3 "~" H 1600 2850 50  0001 C CNN
	1    1600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2950 1600 3050
Wire Wire Line
	1600 3050 1900 3050
Wire Wire Line
	1900 3050 1900 2950
Wire Wire Line
	1900 3050 1900 3100
Connection ~ 1900 3050
$Comp
L power:+BATT #PWR?
U 1 1 5E1E6222
P 2500 1450
F 0 "#PWR?" H 2500 1300 50  0001 C CNN
F 1 "+BATT" H 2500 1600 50  0000 C CNN
F 2 "" H 2500 1450 50  0001 C CNN
F 3 "" H 2500 1450 50  0001 C CNN
	1    2500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1450 2500 1500
Wire Wire Line
	2100 1500 2500 1500
$Comp
L power:+BATT #PWR?
U 1 1 5E1E83EE
P 600 1650
F 0 "#PWR?" H 600 1500 50  0001 C CNN
F 1 "+BATT" H 600 1800 50  0000 C CNN
F 2 "" H 600 1650 50  0001 C CNN
F 3 "" H 600 1650 50  0001 C CNN
	1    600  1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1400 1050 1500
Wire Wire Line
	600  1650 600  1700
Wire Wire Line
	600  1700 900  1700
Wire Wire Line
	900  1700 900  1500
Wire Wire Line
	900  1500 1050 1500
Connection ~ 1050 1500
Wire Wire Line
	1050 1500 1050 1600
Wire Wire Line
	1050 900  1050 1000
$Comp
L Battery_Management:MCP73831-5-OT U?
U 1 1 5E1EAF69
P 2950 2900
F 0 "U?" H 2950 3378 50  0000 C CNN
F 1 "MCP73831-5-OT" H 2950 3287 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3000 2650 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 2800 2850 50  0001 C CNN
	1    2950 2900
	1    0    0    -1  
$EndComp
$Comp
L micelib:TPS6300x U?
U 1 1 5E1EC928
P 3750 1150
F 0 "U?" H 3750 1615 50  0000 C CNN
F 1 "TPS63002" H 3750 1524 50  0000 C CNN
F 2 "" H 3750 1150 50  0001 C CNN
F 3 "" H 3750 1150 50  0001 C CNN
	1    3750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1150 3250 1150
Wire Wire Line
	3250 1150 3250 1100
$Comp
L power:GND #PWR?
U 1 1 5E1EC931
P 3050 1150
F 0 "#PWR?" H 3050 900 50  0001 C CNN
F 1 "GND" H 3055 977 50  0000 C CNN
F 2 "" H 3050 1150 50  0001 C CNN
F 3 "" H 3050 1150 50  0001 C CNN
	1    3050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1250 3200 1250
Wire Wire Line
	3200 1250 3200 1400
Wire Wire Line
	3200 1400 2900 1400
$Comp
L Device:L_Small L?
U 1 1 5E1EC93A
P 2900 1200
F 0 "L?" H 3050 1150 50  0000 R CNN
F 1 "2.2u" H 3100 1250 50  0000 R CNN
F 2 "" H 2900 1200 50  0001 C CNN
F 3 "~" H 2900 1200 50  0001 C CNN
	1    2900 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 1050 2900 1050
Wire Wire Line
	3250 1100 3050 1100
Wire Wire Line
	3050 1100 3050 1150
Wire Wire Line
	4200 1150 4300 1150
Wire Wire Line
	4300 1150 4300 1250
Wire Wire Line
	4200 1250 4300 1250
Connection ~ 4300 1250
Wire Wire Line
	4300 1250 4300 1350
Wire Wire Line
	4200 1350 4300 1350
Wire Wire Line
	3750 1550 3750 1600
$Comp
L power:GNDD #PWR?
U 1 1 5E1EC94B
P 3850 1650
F 0 "#PWR?" H 3850 1400 50  0001 C CNN
F 1 "GNDD" H 3854 1495 50  0000 C CNN
F 2 "" H 3850 1650 50  0001 C CNN
F 3 "" H 3850 1650 50  0001 C CNN
	1    3850 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1650 3850 1600
Wire Wire Line
	3850 1600 3750 1600
Wire Wire Line
	3750 1600 3650 1600
Wire Wire Line
	3650 1600 3650 1650
Connection ~ 3750 1600
$Comp
L power:GND #PWR?
U 1 1 5E1EC956
P 3650 1650
F 0 "#PWR?" H 3650 1400 50  0001 C CNN
F 1 "GND" H 3655 1477 50  0000 C CNN
F 2 "" H 3650 1650 50  0001 C CNN
F 3 "" H 3650 1650 50  0001 C CNN
	1    3650 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1350 3250 1350
Wire Wire Line
	4300 1450 4300 1350
Connection ~ 4300 1350
Wire Wire Line
	4200 1050 4450 1050
Wire Wire Line
	4450 1050 4450 1150
$Comp
L power:GNDD #PWR?
U 1 1 5E1EC961
P 4450 1150
F 0 "#PWR?" H 4450 900 50  0001 C CNN
F 1 "GNDD" H 4454 995 50  0000 C CNN
F 2 "" H 4450 1150 50  0001 C CNN
F 3 "" H 4450 1150 50  0001 C CNN
	1    4450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 950  4250 950 
Wire Wire Line
	4250 950  4250 900 
$Comp
L power:+3V3 #PWR?
U 1 1 5E1EC969
P 4250 900
F 0 "#PWR?" H 4250 750 50  0001 C CNN
F 1 "+3V3" H 4250 1050 50  0000 C CNN
F 2 "" H 4250 900 50  0001 C CNN
F 3 "" H 4250 900 50  0001 C CNN
	1    4250 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 950  3250 950 
$Comp
L Device:C_Small C?
U 1 1 5E1EC976
P 3250 1650
F 0 "C?" H 3342 1696 50  0000 L CNN
F 1 "10u" H 3342 1605 50  0000 L CNN
F 2 "" H 3250 1650 50  0001 C CNN
F 3 "~" H 3250 1650 50  0001 C CNN
	1    3250 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1750 3250 1800
$Comp
L power:GND #PWR?
U 1 1 5E1EC97E
P 3250 1800
F 0 "#PWR?" H 3250 1550 50  0001 C CNN
F 1 "GND" H 3255 1627 50  0000 C CNN
F 2 "" H 3250 1800 50  0001 C CNN
F 3 "" H 3250 1800 50  0001 C CNN
	1    3250 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E1EC984
P 4450 900
F 0 "C?" H 4542 946 50  0000 L CNN
F 1 "10uF" H 4542 855 50  0000 L CNN
F 2 "" H 4450 900 50  0001 C CNN
F 3 "~" H 4450 900 50  0001 C CNN
	1    4450 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1000 4450 1050
Connection ~ 4450 1050
Wire Wire Line
	4450 800  4450 750 
Wire Wire Line
	2900 1300 2900 1400
Wire Wire Line
	2900 1100 2900 1050
$Comp
L power:+BATT #PWR?
U 1 1 5E1EC996
P 4700 1400
F 0 "#PWR?" H 4700 1250 50  0001 C CNN
F 1 "+BATT" H 4700 1550 50  0000 C CNN
F 2 "" H 4700 1400 50  0001 C CNN
F 3 "" H 4700 1400 50  0001 C CNN
	1    4700 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1400 4700 1450
Wire Wire Line
	4300 1450 4700 1450
$Comp
L power:+BATT #PWR?
U 1 1 5E1EC99E
P 2800 1600
F 0 "#PWR?" H 2800 1450 50  0001 C CNN
F 1 "+BATT" H 2800 1750 50  0000 C CNN
F 2 "" H 2800 1600 50  0001 C CNN
F 3 "" H 2800 1600 50  0001 C CNN
	1    2800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1350 3250 1450
Wire Wire Line
	2800 1600 2800 1650
Wire Wire Line
	2800 1650 3100 1650
Wire Wire Line
	3100 1650 3100 1450
Wire Wire Line
	3100 1450 3250 1450
Connection ~ 3250 1450
Wire Wire Line
	3250 1450 3250 1550
Wire Wire Line
	3250 850  3250 950 
$Comp
L power:+5V #PWR?
U 1 1 5E1EF3A8
P 4450 750
F 0 "#PWR?" H 4450 600 50  0001 C CNN
F 1 "+5V" H 4465 923 50  0000 C CNN
F 2 "" H 4450 750 50  0001 C CNN
F 3 "" H 4450 750 50  0001 C CNN
	1    4450 750 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E1EF406
P 3250 850
F 0 "#PWR?" H 3250 700 50  0001 C CNN
F 1 "+5V" H 3265 1023 50  0000 C CNN
F 2 "" H 3250 850 50  0001 C CNN
F 3 "" H 3250 850 50  0001 C CNN
	1    3250 850 
	1    0    0    -1  
$EndComp
$Comp
L micelib:DW01-P U?
U 1 1 5E1F3AA3
P 2900 3750
F 0 "U?" H 2900 4115 50  0000 C CNN
F 1 "DW01-P" H 2900 4024 50  0000 C CNN
F 2 "" H 2900 3750 50  0001 C CNN
F 3 "" H 2900 3750 50  0001 C CNN
	1    2900 3750
	1    0    0    -1  
$EndComp
$Comp
L micelib:BR8205 U?
U 1 1 5E1F762A
P 2800 4700
F 0 "U?" H 2800 5065 50  0000 C CNN
F 1 "BR8205" H 2800 4974 50  0000 C CNN
F 2 "" H 2800 4700 50  0001 C CNN
F 3 "" H 2800 4700 50  0001 C CNN
	1    2800 4700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
