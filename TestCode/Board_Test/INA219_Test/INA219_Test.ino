/*
   DRV8830, INA219 with ESP32-WROOM-32D
   ESP   AE-PCA9306   DRV8830
   3.3V  VREF1 VREF2  VCC
   GND   GND   GND    GND
   IO21  SDA1  SDA2   SDA
   IO22  SCL1  SCL2   SCL
*/

#include <Wire.h>

#define ADDRESS_INA 0x40
#define CONFIG_ADDRESS_INA 0x00 // CONFIG_Reg
#define VSHUNT_ADDRESS_INA 0x01 // Shunt_Voltage_Reg
#define VBUS_ADDRESS_INA 0x02 // BUS_Voltage_Reg
#define POWER_ADDRESS_INA 0x03 // Power_Reg
#define CURRENT_ADDRESS_INA 0x04 // Shunt_Current_Reg
#define Callib_ADDRESS_INA 0x05 // Calibration_Reg

int16_t raw_shunt;
float vshunt, cshunt;

void INA219_Init(uint8_t, uint8_t, uint8_t, uint8_t, uint8_t);
int16_t INA219_Read(uint8_t, uint8_t, uint8_t, uint8_t);

void setup() {
  Serial.begin(115200);
  Serial.println("VBUS,VSHUNT");

  Wire.begin(21, 22); // SDA, SCL
  INA219_Init(ADDRESS_INA, 0x01, 0x03, 0x04, 0x04, 0x07); // 32VFSR, 320mV, 12bit, 12bit, Shunt, Bus, Continuous
  delay(1000);
}

void loop() {
  raw_shunt = INA219_Read(ADDRESS_INA, VSHUNT_ADDRESS_INA, 4, 3);
  vshunt = raw_shunt * 0.01; // [mV]
  cshunt = vshunt / 100; // [A]
  Serial.print(vshunt);
  Serial.print(",");
  Serial.println(vshunt);
  delay(10);
}

void INA219_Init(uint8_t address_ic, uint8_t brng, uint8_t gain, uint8_t badc, uint8_t sadc, uint8_t Mode) {
  uint16_t send_data = ((brng & 0x01) << 13) | ((gain & 0x03) << 11) | ((badc & 0x07) << 7) | ((sadc & 0x07) << 3) | (Mode & 0x07);
  Wire.beginTransmission(address_ic);
  Wire.write(CONFIG_ADDRESS_INA);
  Wire.write((send_data >> 8) & 0xFF);
  Wire.write(send_data & 0xFF);
  Wire.endTransmission();
}

int16_t INA219_Read(uint8_t address_ic, uint8_t reg, uint8_t range, uint8_t gain) {
  int16_t Data;
  Wire.beginTransmission(address_ic);
  Wire.write(reg);
  Wire.endTransmission();
  Wire.requestFrom(0x40, 16);
  while (Wire.available() < 16);
  Data = Wire.read() << 8 | Wire.read();
  Data = (Data >> gain) * range;
  return Data;
}
