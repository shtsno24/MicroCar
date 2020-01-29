/*
   DRV88830 with ESP32-WROOM-32D
   ESP   AE-PCA9306   DRV8830
   3.3V  VREF1 VREF2  VCC
   GND   GND   GND    GND
   IO21  SDA1  SDA2   SDA
   IO22  SCL1  SCL2   SCL
*/

#include <Wire.h>

#define ADDRESS 0x60
#define CTR_ADDRESS 0x00  // CONTROL_Reg

uint8_t power; //[0, 100]
uint8_t voltage;
uint8_t Direction = 1; //0:STBY 1:BW 2:FW 3:BRAKE


void setup() {
  Serial.begin(115200);
  //  Serial.println("DRV8830_I2C");
  Serial.println("voltage,power");
  Wire.begin(21, 22); // SDA, SCL
  delay(1000);
}

void loop() {
  if(Direction == 1){
    Direction = 2;  
  }else{
    Direction = 1;  
  }
  for (power = 0; power < 100; power++) {
    voltage = (uint8_t)(57 * (power / 100.0) + 6); // 0x3F - 0x06 = 0x39(57 Dec)
    Wire.beginTransmission(ADDRESS);
    Wire.write(CTR_ADDRESS);
    Wire.write((voltage << 2) + Direction);
    Wire.endTransmission();
    Serial.print(voltage);
    Serial.print(",");
    Serial.println(power);
    delay(10);
  }
  for (power = 100; power > 0; power--) {
    voltage = (uint8_t)(57.0 * (power / 100.0) + 6.0); // 0x3F - 0x06 = 0x39(57 Dec)
    Wire.beginTransmission(ADDRESS);
    Wire.write(CTR_ADDRESS);
    Wire.write((voltage << 2) + Direction);
    Wire.endTransmission();
    Serial.print(voltage);
    Serial.print(",");
    Serial.println(power);
    delay(10);
  }
    Wire.beginTransmission(ADDRESS);
    Wire.write(CTR_ADDRESS);
    Wire.write((voltage << 2) + 0);
    Wire.endTransmission();
  delay(1000);
}
