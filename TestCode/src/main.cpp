#include <Arduino.h>
#include <SPI.h>
#include <BluetoothSerial.h>

#include "MPU6500.hpp"
#include "DRV8830.hpp"
#include "INA219.hpp"
#include "GS1502.hpp"

DRV8830 MD0;
INA219 CS0;
GS1502 SERVO0;
SPIClass SPI2(HSPI);
MPU6500 IMU0;
BluetoothSerial SerialBT;
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

    CS0.Begin(0x40, 0, 0, 0x07, 0x07, 0x07, CS0.CALIB_REGISTER_DATA);

    SERVO0.Begin(0, 32, 1.0 / 0.020, 16);

    SerialBT.begin("MicroCar_ESP32");
    Serial.println("Bluetooth : Done");
}

void loop() {
    // SerialBT.println("from Bluetooth!");
    IMU0.ReadSensor();
    // SerialBT.print("IMU0 : ax = ");
    SerialBT.print(IMU0.IMU_DATA[IMU0.ax]);
    // SerialBT.println("[m/s^2]");
    SerialBT.print(",");
    pow_md += step_md;
    MD0.Set_Pow_Dir(pow_md, 0x01);
    SERVO0.set_pos((float)pow_md * 2.0 - 100.0);
    if(pow_md == 0 || pow_md >= 100){
        step_md *= -1;
    }
    SerialBT.print(pow_md);
    SerialBT.print(",");
    // SerialBT.println("%");
    SerialBT.println(CS0.INA219_Read(CS0.CURRENT_ADDRESS_INA, CS0.I_LSB_Shunt), 6);
    // SerialBT.println("[A]");
    // SerialBT.print(CS0.INA219_Read(CS0.VSHUNT_ADDRESS_INA, CS0.V_LSB_Shunt), 6);
    // SerialBT.println("[V]");
    delay(100 - pow_md);
}
