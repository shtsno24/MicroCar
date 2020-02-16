/*
   Sharp MTOF171000C0 I2C on ESP32-WROOM-32D
   This code is based on http://akizukidenshi.com/catalog/g/gM-14538/

   ESP   MTOF
   3.3V  VDD(Red)
   GND   GND(Black)
   IO25  TXD/CS(White)
   NC    RXD(Brown)
   IO21  SDA(Yellow)
   IO22  SCL(Green)
*/

#include <Wire.h>

#define MTOF_ADDRESS 0x52

int32_t distance_h, distance_l, distance;

void setup() {
  Serial.begin(115200);
  Wire.begin(21, 22); // SDA, SCL
  pinMode(25, OUTPUT); // Module Select
  delay(1000);
}

void loop() {
  digitalWrite(25, LOW);
  delay(5);
  Serial.print("distance = ");

  Wire.beginTransmission(MTOF_ADDRESS);
  Wire.write(0xD3);
  Wire.endTransmission(false);
  Wire.requestFrom(MTOF_ADDRESS, 2);

  distance_h = Wire.read();
  distance_l = Wire.read();
  distance = (distance_h << 8) | distance_l;

  Serial.print(distance);
  Serial.println(" mm");
  digitalWrite(25, HIGH);
//  delay(30);
}
