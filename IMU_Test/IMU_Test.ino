#include <SPI.h>
#include "IMU_Test.h"
/*
   Test Code for MPU9250 with ESP32

   IO5    : HSPI_CS
   IO14   : HSPI_CLK
   IO12   : HSPI_MISO
   IO13   : HSPI_MOSI
   3.3V   : VCC
   GND    : GND

   SPI Mode : 3
   CPOL     : 1
   CPHA     : 0
*/
#define IMU_CS 19


float ax, ay, az;
SPIClass SPI2;

IMU_DATA read_data(uint8_t, uint8_t);
uint8_t read_MPU9250(uint8_t);
void write_MPU9250(uint8_t, uint8_t);

void setup() {
  Serial.begin(115200);

  delay(1000);
  Serial.println("3");
  delay(1000);
  Serial.println("2");
  delay(1000);
  Serial.println("1");
  delay(1000);

  pinMode(IMU_CS, OUTPUT); // CS
  digitalWrite(IMU_CS, HIGH); // Stop reading sensor
  SPI2.setFrequency(1000000); // Set SPI Clock to 1MHz
  SPI2.setDataMode(SPI_MODE3); // Set SPI Mode 3
  SPI2.setBitOrder(MSBFIRST); // Set MSB First
  SPI2.begin(14, 12, 13, IMU_CS); //Using HSPI(SCK, MISO, MOSI, CS)

  // Read WHO_AM_I(@0x75)
  uint8_t who_am_i = read_MPU9250(0x75, IMU_CS);
  Serial.print("WHO_AM_I : 0x");
  Serial.println(who_am_i, HEX);

  // Init IMU
  write_MPU9250(0x6B, 0x00, IMU_CS); // Disable Sleep Mode
  write_MPU9250(0x1A, 0x00, IMU_CS); // Config(FIFO, EXT_SYNC and DLPF)
  write_MPU9250(0x1C, 0x18, IMU_CS); // ACCL(Set Full Scale as pm16[g])
  write_MPU9250(0x1B, 0x18, IMU_CS); // GYRO(Set Full Scale as pm2000[deg/s])
  Serial.println("Setup Done:");

  delay(1000);
  Serial.println("3");
  delay(1000);
  Serial.println("2");
  delay(1000);
  Serial.println("1");
  delay(1000);
}

void loop() {
  IMU_DATA imu_data = read_data(IMU_CS);
  ax = (float)(imu_data.ax_raw) / 32768.0 * 16.0;
  ay = (float)(imu_data.ay_raw) / 32768.0 * 16.0;
  az = (float)(imu_data.az_raw) / 32768.0 * 16.0;
  Serial.print(ax);
  Serial.print(",");
  Serial.print(ay);
  Serial.print(",");
  Serial.println(az);
}

IMU_DATA read_data(uint8_t cs) {
  uint8_t reg_acc[7] = {0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x4A, 0x00};
  uint8_t reg_gyro[7] = {0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x80};

  uint8_t Data_acc[7];
  uint8_t Data_gyro[7];
  IMU_DATA o_data;
  digitalWrite(IMU_CS, LOW); // Start reading sensor
  for (uint8_t i = 0; i < 7; i++) {
    Data_acc[i] = SPI2.transfer(reg_acc[i] | 0x80); // Send register number
  }
  for (uint8_t i = 0; i < 7; i++) {
    Data_gyro[i] = SPI2.transfer(reg_gyro[i] | 0x80); // Send register number
  }
  digitalWrite(IMU_CS, HIGH); // Stop reading sensor
  o_data.ax_raw = Data_acc[1] << 8 | Data_acc[2];
  o_data.ay_raw = Data_acc[3] << 8 | Data_acc[4];
  o_data.az_raw = Data_acc[5] << 8 | Data_acc[6];

  o_data.pitch_raw = Data_gyro[1] << 8 | Data_gyro[2];
  o_data.roll_raw = Data_gyro[3] << 8 | Data_gyro[4];
  o_data.yaw_raw = Data_gyro[5] << 8 | Data_gyro[6];

  return o_data;
}


uint8_t read_MPU9250(uint8_t reg, uint8_t cs) {
  uint8_t Data;
  digitalWrite(cs, LOW); // Start reading sensor
  SPI2.transfer(reg | 0x80); // Send register number
  Data = SPI2.transfer(0x00); // Read reg
  digitalWrite(cs, HIGH); // Stop reading sensor
  return Data;
}

void write_MPU9250(uint8_t reg, uint8_t val, uint8_t cs) {
  digitalWrite(cs, LOW); // Start reading sensor
  SPI2.transfer(reg & 0x7F); // Send register number
  SPI2.transfer(val); // Write val
  digitalWrite(cs, HIGH); // Stop reading sensor
}
