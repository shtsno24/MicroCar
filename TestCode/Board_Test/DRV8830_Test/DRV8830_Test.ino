/*
   DRV8830 with ESP32-WROOM-32D
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
uint8_t dir = 1; //0:STBY 1:BW 2:FW 3:BRAKE

void DRV8830_Run(uint8_t, uint8_t, uint8_t, uint8_t);

void setup() {
  Serial.begin(115200);
  //  Serial.println("DRV8830_I2C");
  Serial.println("voltage,power");
  Wire.begin(21, 22); // SDA, SCL
  delay(1000);
}

void loop() {
  if (dir == 1) {
    dir = 2;
  } else {
    dir = 1;
  }
  for (power = 0; power < 100; power++) {
    DRV8830_Run(ADDRESS, CTR_ADDRESS, power, dir);
    Serial.println(power);
    delay(10);
  }
  delay(1000);
  for (power = 100; power > 0; power--) {
    DRV8830_Run(ADDRESS, CTR_ADDRESS, power, dir);
    Serial.println(power);
    delay(10);
  }
  DRV8830_Run(ADDRESS, CTR_ADDRESS, power, 0);
  Wire.endTransmission();
  delay(1000);
}

void DRV8830_Run(uint8_t address_ic, uint8_t address_reg, uint8_t power, uint8_t Direction) {
  uint8_t voltage = (uint8_t)(57 * (power / 100.0) + 6); // 0x3F - 0x06 = 0x39(57 Dec)
  Wire.beginTransmission(address_ic);
  Wire.write(address_reg);
  Wire.write((voltage << 2) + Direction);
  Wire.endTransmission();
}
