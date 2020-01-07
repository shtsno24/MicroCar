/* 
 * Sharp MTOF171000C0 I2C on ESP32-WROOM-32D
 * This code is based on http://akizukidenshi.com/catalog/g/gM-14538/
 * To upload this sketch to ESP32 Board, unplug IO12. 
 * Otherwise, you will not be able to upload this sketch to ESP32.
 * ESP   MTOF
 * 3.3V  VDD
 * GND   GND
 * IO12  TX1
 * NC    RX1
 * IO21  SDA 
 * IO22  SCL
 */

#include <Wire.h>

#define ADDRESS 0x52

uint16_t distance;
uint16_t distance_tmp;
uint8_t data_cnt;

void setup() 
{
  Serial.begin(115200);
  Serial.println("MTOF171000C0_I2C");
  Wire.begin(21, 22); // SDA, SCL
  pinMode(12, OUTPUT); // Module Select
  delay(1000);
}

void loop() 
{
  digitalWrite(12, LOW);
  delay(5);
  Serial.print("distance = ");

  Wire.beginTransmission(ADDRESS);
  Wire.write(0xD3);
  Wire.endTransmission(false);
  Wire.requestFrom(ADDRESS, 2);
  data_cnt = 0;
  distance = 0;
  distance_tmp = 0;
  while(Wire.available())
  {
    distance_tmp = Wire.read();
    distance = (distance << (data_cnt*8)) | distance_tmp;
    data_cnt++;
  }

  Serial.print(distance);
  Serial.println(" mm");
  digitalWrite(12, HIGH);
  delay(45);
}

int readDistance(byte reg)
{
  Wire.beginTransmission(ADDRESS);
  Wire.write(reg);
  Wire.endTransmission(false);
  Wire.requestFrom(ADDRESS, 2);
  data_cnt = 0;
  distance = 0;
  distance_tmp = 0;
  while(Wire.available())
  {
    distance_tmp = Wire.read();
    distance = (distance << (data_cnt*8)) | distance_tmp;
    data_cnt++;
  }
  return distance;
}
