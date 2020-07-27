#include <Arduino.h>
#include <SPI.h>
#include <BluetoothSerial.h>

#include "MPU6500.hpp"
#include "DRV8830.hpp"

SPIClass SPI2(HSPI);
MPU6500 IMU0;
BluetoothSerial SerialBT;
DRV8830 MD0;
uint8_t pow_md = 0;
uint8_t step_md = 1;

void setup() {
    Serial.begin(115200);
    Serial.println("Hello World");

    SPI2.begin(14, 12, 13, 27);
    SPI2.setDataMode(SPI_MODE0);
    SPI2.setBitOrder(MSBFIRST);
    SPI2.setFrequency(IMU0.MPU_WRITE_CLOCK);
    IMU0.Begin(SPI2, 27);

    Wire.begin(21, 22); // SDA, SCL
    MD0.Begin(0x60);

    SerialBT.begin("ESP32");
    Serial.println("Bluetooth : Done");
}

void loop() {
    SerialBT.println("from Bluetooth!");
    IMU0.ReadSensor();
    SerialBT.print("IMU0 : ax = ");
    SerialBT.println(IMU0.IMU_DATA[IMU0.ax]);
    pow_md += step_md;
    MD0.Set_Pow_Dir(pow_md, 0x01);
    if(pow_md >= 100){
        step_md *= -1;
    }
    Serial.println(pow_md);
    delay(500);
}
