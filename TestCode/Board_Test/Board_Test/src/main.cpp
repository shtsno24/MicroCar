#include <Arduino.h>
#include <SPI.h>
#include <BluetoothSerial.h>

#include "MPU6500.hpp"

SPIClass SPI2(HSPI);
MPU6500 IMU0;
BluetoothSerial SerialBT;

void setup() {
    Serial.begin(9600);
    Serial.println("Hello World");

    SPI2.begin(14, 12, 13, 27);
    SPI2.setDataMode(SPI_MODE0);
    SPI2.setBitOrder(MSBFIRST);
    SPI2.setFrequency(IMU0.MPU_WRITE_CLOCK);

    IMU0.Begin(SPI2, 27);

    SerialBT.begin("ESP32Card");
    SerialBT.println("Bluetooth : Done");
}

void loop() {
    SerialBT.println("from Bluetooth!");
    IMU0.ReadSensor();
    SerialBT.print("IMU0 : ax = ");
    SerialBT.println(IMU0.IMU_DATA[IMU0.ax]);
}