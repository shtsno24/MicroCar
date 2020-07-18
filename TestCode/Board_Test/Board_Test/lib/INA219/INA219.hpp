/*
 * INA219 Library for Arduino
 */
#include "Arduino.h"
#include "Wire.h"
#include <cstdint>

class INA219{
    private:
        void _Write(uint8_t address, uint8_t reg, uint8_t data_h, uint8_t data_l){
            Wire.beginTransmission(address);
            Wire.write(reg);
            Wire.write((data_h >> 8) & 0xFF);
            Wire.write(data_l & 0xFF);
            Wire.endTransmission();
        }

        void _Read(uint8_t address, uint8_t reg){
            Wire.beginTransmission(address_ic);
            Wire.write(reg);
            Wire.endTransmission();
            Wire.requestFrom(address_ic, 16);
        }

    public:
        const uint8_t ADDRESS_INA = 0x40;
        const uint8_t CONFIG_ADDRESS_INA = 0x00; // CONFIG_Reg
        const uint8_t VSHUNT_ADDRESS_INA = 0x01; // Shunt_Voltage_Reg
        const uint8_t VBUS_ADDRESS_INA = 0x02; // BUS_Voltage_Reg
        const uint8_t POWER_ADDRESS_INA = 0x03; // Power_Reg
        const uint8_t CURRENT_ADDRESS_INA = 0x04; // Shunt_Current_Reg
        const uint8_t Callib_ADDRESS_INA = 0x05; // Calibration_Reg

        void Init(uint8_t address_ic, uint8_t brng, uint8_t gain, uint8_t badc, uint8_t sadc, uint8_t Mode) {
            uint16_t send_data = ((brng & 0x01) << 13) | ((gain & 0x03) << 11) | ((badc & 0x07) << 7) | ((sadc & 0x07) << 3) | (Mode & 0x07);
            _Write(address_ic, CONFIG_ADDRESS_INA, (send_data >> 8) & 0xFF, send_data & 0xFF);
        }

        int16_t INA219_Read(uint8_t address_ic, uint8_t reg, uint8_t range, uint8_t gain) {
            int16_t Data;
            _Read(address_ic, reg);
            while (Wire.available() < 16);
            Data = Wire.read() << 8 | Wire.read();
            Data = (Data >> gain) * range;
            return Data;
        }

};