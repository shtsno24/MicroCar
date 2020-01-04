//Sharp MTOF171000C0 I2C
//Due MTOF
//3.3 VDD
//GND GND
//18  TX1
//19  RX1
//20  SDA
//21  SCL

#include <Wire.h>

#define ADDRESS 0x52

uint16_t distance;
uint16_t distance_tmp;
uint8_t data_cnt;

void setup() 
{
  Serial.begin(9600);
  Serial.println("MTOF171000C0_I2C");
  Wire.begin();
  pinMode(18, OUTPUT);
  delay(1000);
}

void loop() 
{
  digitalWrite(18, LOW);
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
  digitalWrite(18, HIGH);
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
