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
#define IMU_CS 5


float ax, ay, az, pitch, roll, yaw;
SPIClass SPI2;
IMU_DATA imu_data;

void read_gyro(SPIClass spi, IMU_DATA* imu_data, uint8_t cs);
void read_acc(SPIClass spi, IMU_DATA* imu_data, uint8_t cs);
uint8_t read_MPU9250(SPIClass spi, uint8_t reg, uint8_t cs);
void write_MPU9250(SPIClass spi, uint8_t reg, uint8_t val, uint8_t cs);

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
  SPI2.begin(14, 12, 13); //Using HSPI(SCK, MISO, MOSI)

  // Read WHO_AM_I(@0x75)
  uint8_t who_am_i = read_MPU9250(SPI2, 0x75, IMU_CS);
  Serial.print("WHO_AM_I : 0x");
  Serial.println(who_am_i, HEX);

  // Init IMU
  write_MPU9250(SPI2, 0x6B, 0x00, IMU_CS); // Disable Sleep Mode
  write_MPU9250(SPI2, 0x1A, 0x00, IMU_CS); // Config(FIFO, EXT_SYNC and DLPF)
  write_MPU9250(SPI2, 0x1C, 0x18, IMU_CS); // ACCL(Set Full Scale as pm16[g])
  write_MPU9250(SPI2, 0x1B, 0x18, IMU_CS); // GYRO(Set Full Scale as pm2000[deg/s])
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
  read_acc(SPI2, &imu_data, IMU_CS);
  delay(1);
  read_gyro(SPI2, &imu_data, IMU_CS);

  ax = (float)(imu_data.ax_raw) / 32767.0 * 16.0;
  ay = (float)(imu_data.ay_raw) / 32767.0 * 16.0;
  az = (float)(imu_data.az_raw) / 32767.0 * 16.0;

  pitch = (float)(imu_data.pitch_raw) / 32767.0 * 2000.0;
  roll = (float)(imu_data.roll_raw) / 32767.0 * 2000.0;
  yaw = (float)(imu_data.yaw_raw) / 32767.0 * 2000.0;

  Serial.print(ax);
  Serial.print(",");
  Serial.print(ay);
  Serial.print(",");
  Serial.print(az);
  Serial.print(",");
  Serial.print(pitch);
  Serial.print(",");
  Serial.print(roll);
  Serial.print(",");
  Serial.println(yaw);
}

void read_gyro(SPIClass spi, IMU_DATA* imu_data, uint8_t cs) {
  uint8_t reg_gyro[7] = {0x43 | 0x80, 0x44 | 0x80, 0x45 | 0x80, 0x46 | 0x80, 0x47 | 0x80, 0x48 | 0x80, 0x00 | 0x80};

  spi.setFrequency(20000000); // Set SPI Clock to 20MHz
  spi.setDataMode(SPI_MODE3); // Set SPI Mode 3
  spi.setBitOrder(MSBFIRST); // Set MSB First
  spi.begin(14, 12, 13); //Using HSPI(SCK, MISO, MOSI)

  digitalWrite(cs, LOW); // Start reading sensor
  spi.transfer(reg_gyro, 7); // Send register number
  digitalWrite(cs, HIGH); // Stop reading sensor

  imu_data->pitch_raw = reg_gyro[1] << 8 | reg_gyro[2];
  imu_data->roll_raw = reg_gyro[3] << 8 | reg_gyro[4];
  imu_data->yaw_raw = reg_gyro[5] << 8 | reg_gyro[6];
}

void read_acc(SPIClass spi, IMU_DATA* imu_data, uint8_t cs) {
  uint8_t reg_acc[7] = {0x3B | 0x80, 0x3C | 0x80, 0x3D | 0x80, 0x3E | 0x80, 0x3F | 0x80, 0x40 | 0x80, 0x00 | 0x80};

  spi.setFrequency(20000000); // Set SPI Clock to 20MHz
  spi.setDataMode(SPI_MODE3); // Set SPI Mode 3
  spi.setBitOrder(MSBFIRST); // Set MSB First
  spi.begin(14, 12, 13); //Using HSPI(SCK, MISO, MOSI)

  digitalWrite(cs, LOW); // Start reading sensor
  spi.transfer(reg_acc, 7); // Send register number
  digitalWrite(cs, HIGH); // Stop reading sensor

  imu_data->ax_raw = reg_acc[1] << 8 | reg_acc[2];
  imu_data->ay_raw = reg_acc[3] << 8 | reg_acc[4];
  imu_data->az_raw = reg_acc[5] << 8 | reg_acc[6];
}


uint8_t read_MPU9250(SPIClass spi, uint8_t reg, uint8_t cs) {
  uint8_t Data[2] = {reg | 0x80, 0x00};

  digitalWrite(cs, LOW); // Start reading sensor
  spi.transfer(Data, 2); // Send register number
  digitalWrite(cs, HIGH); // Stop reading sensor
  return Data[1];
}

void write_MPU9250(SPIClass spi, uint8_t reg, uint8_t val, uint8_t cs) {
  uint8_t reg_buff[2] = {reg & 0x7F, val};

  spi.setFrequency(1000000); // Set SPI Clock to 1MHz
  spi.setDataMode(SPI_MODE3); // Set SPI Mode 3
  spi.setBitOrder(MSBFIRST); // Set MSB First
  spi.begin(14, 12, 13); //Using HSPI(SCK, MISO, MOSI)
  
  digitalWrite(cs, LOW); // Start reading sensor
  spi.transfer(reg_buff, 2); // Send register number
  digitalWrite(cs, HIGH); // Stop reading sensor
}
