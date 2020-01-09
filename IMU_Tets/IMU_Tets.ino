#include <SPI.h>
/*
   Test Code for MPU9250 with ESP32

   IO5    : VSPI_CS
   IO18   : VSPI_CLK
   IO19   : VSPI_MISO
   IO23   : VSPI_MOSI
   3.3V   : VCC
   GND    : GND

   SPI Mode : 3
   CPOL     : 1
   CPHA     : 0
*/
#define IMU_CS 5

int16_t ax_raw, ay_raw, az_raw;
int16_t yaw_raw, pitch_raw, roll_raw;

uint8_t read_MPU9250(uint8_t);
void read_MPU9250(uint8_t, uint8_t);

void setup() {
  Serial.begin(115200);
  pinMode(IMU_CS, OUTPUT); // CS
  SPI.begin();
  digitalWrite(IMU_CS, HIGH); // Stop reading sensor
  SPI.setFrequency(1000000); // Set SPI Clock to 1MHz
  SPI.setDataMode(SPI_MODE3); // Set SPI Mode 3
  SPI.setBitOrder(MSBFIRST); // Set MSB First

  // Read WHO_AM_I(@0x75)
  uint8_t who_am_i = read_MPU9250(0x75);
  Serial.print("WHO_AM_I : ");
  Serial.println(who_am_i);

  // Init IMU
  write_MPU9250(0x6B, 0x00); // Disable Sleep Mode
  write_MPU9250(0x1A, 0x00); // Config(FIFO, EXT_SYNC and DLPF)
  write_MPU9250(0x1B, 0x18); // GYRO(Set Full Scale as 2000[deg/s])
  write_MPU9250(0x1C, 0x18); // ACCL(Set Full Scale as 16[g])
  Serial.println("Setup Done:");
}

void loop() {
  ax_raw = (read_MPU9250(0x3B) << 8) | read_MPU9250(0x3C); // Read accel_x
  ay_raw = (read_MPU9250(0x3D) << 8) | read_MPU9250(0x3E); // Read accel_y
  az_raw = (read_MPU9250(0x3F) << 8) | read_MPU9250(0x40); // Read accel_z

  pitch_raw = (read_MPU9250(0x43) << 8) | read_MPU9250(0x44); // Read accel_x
  roll_raw = (read_MPU9250(0x45) << 8) | read_MPU9250(0x46); // Read accel_y
  yaw_raw = (read_MPU9250(0x47) << 8) | read_MPU9250(0x48); // Read accel_z

  Serial.print("ax_raw : ");
  Serial.println((float)ax_raw / 16.0 * 9.8); // [m/s^2]
  Serial.print("ay_raw : ");
  Serial.println((float)ay_raw / 16.0 * 9.8); // [m/s^2]
  Serial.print("az_raw : ");
  Serial.println((float)az_raw / 16.0 * 9.8); // [m/s^2]

  Serial.print("pitch_raw : ");
  Serial.println((float)pitch_raw / 2000.0 * 3.1415 / 180.0); //[rad/s]
  Serial.print("roll_raw : ");
  Serial.println((float)roll_raw / 2000.0 * 3.1415 / 180.0); //[rad/s]
  Serial.print("yaw_raw : ");
  Serial.println((float)yaw_raw / 2000.0 * 3.1415 / 180.0); //[rad/s]
}

uint8_t read_MPU9250(uint8_t reg) {
  uint8_t Data;
  digitalWrite(IMU_CS, LOW); // Start reading sensor
  SPI.transfer(reg | 0x80); // Send register number
  Data = SPI.transfer(0x00); // Read reg
  digitalWrite(IMU_CS, HIGH); // Stop reading sensor
  return Data;
}

void write_MPU9250(uint8_t reg, uint8_t val) {
  digitalWrite(IMU_CS, LOW); // Start reading sensor
  SPI.transfer(reg | 0x80); // Send register number
  SPI.transfer(val); // Write val
  digitalWrite(IMU_CS, HIGH); // Stop reading sensor

}
