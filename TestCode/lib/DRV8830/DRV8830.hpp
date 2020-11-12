/*
 * DRV8830 Library for Arduino
 */
#include "Arduino.h"
#include "Wire.h"
#include <cstdint>

class DRV8830{
    private:
        void Send_Data(uint8_t reg, uint8_t data){ 
            Wire.beginTransmission(DRV8830_ADDR);
            Wire.write(reg);
            Wire.write(data);
            Wire.endTransmission();
        }

        void Receive_Data_Single_Byte(uint8_t reg, uint8_t data[]){ 
            Wire.beginTransmission(DRV8830_ADDR);
            Wire.write(reg); //  read register 0x01
            Wire.endTransmission();

            Wire.requestFrom(DRV8830_ADDR, 1);
            while (Wire.available()) {
                data[0] = Wire.read();
            }
        }

    public:
        const uint8_t CTRL_REG = 0x00;
        const uint8_t FAULT_REG = 0x01;

        const uint8_t MAX_POWER = 0x3F;
        const uint8_t MIN_POWER = 0x06;
        const uint8_t COAST = 0x00;
        const uint8_t REVERSE = 0x10;
        const uint8_t FORWARD = 0x01;
        const uint8_t BRAKE = 0x11;

        uint8_t DRV8830_ADDR;

        void Begin(uint8_t addr){
            DRV8830_ADDR = addr;
            // Init Fault reg
            Send_Data(FAULT_REG, 0x80);
            // Set Power and Direction
            Send_Data(CTRL_REG, (MIN_POWER << 2) | COAST);
        } 

        void Set_Pow_Dir(uint8_t power, uint8_t direction){
            uint8_t power_hex = (uint8_t)(57 * (power / 100.0) + 6); // 0x3F - 0x06 = 0x39(57 Dec)
            Send_Data(CTRL_REG, (power_hex << 2) | direction);
        }

        uint8_t Read_Fault(){
            uint8_t data[]={0};
            Receive_Data_Single_Byte(FAULT_REG, data);
            return data[0];
        }

        void Print_Fault(){
            uint8_t data = Read_Fault();
            Serial.print("CLEAR : ");
            Serial.println((data >> 7) & 0x01);
            Serial.print("ILimit : ");
            Serial.println((data >> 4) & 0x01);
            Serial.print("OverHeat : ");
            Serial.println((data >> 3) & 0x01);
            Serial.print("UnderVoltage : ");
            Serial.println((data >> 2) & 0x01);
            Serial.print("OverCurrent : ");
            Serial.println((data >> 1) & 0x01);
            Serial.print("Fault : ");
            Serial.println(data & 0x01);
        }

        uint8_t Volt2Power(float voltage){
            return (uint8_t)(voltage * 16.0 / 1.285);
        }

        float Power2Volt(uint8_t power){
            return (1.285 * (float)power / 16.0);
        }

};