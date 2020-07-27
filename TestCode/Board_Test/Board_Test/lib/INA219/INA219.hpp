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
            Wire.requestFrom(address_ic, 2);
        }

    public:
        uint8_t ADDRESS_INA = 0x40;
        const uint8_t CONFIG_ADDRESS_INA = 0x00; // CONFIG_Reg
        const uint8_t VSHUNT_ADDRESS_INA = 0x01; // Shunt_Voltage_Reg
        const uint8_t VBUS_ADDRESS_INA = 0x02; // BUS_Voltage_Reg
        const uint8_t POWER_ADDRESS_INA = 0x03; // Power_Reg
        const uint8_t CURRENT_ADDRESS_INA = 0x04; // Shunt_Current_Reg
        const uint8_t CALIB_ADDRESS_INA = 0x05; // Calibration_Reg

        void Begin(uint8_t address_ic, uint8_t brng, uint8_t gain, uint8_t badc, uint8_t sadc, uint8_t Mode) {
            /* name : bit   : Configure  
             * RST  : 15    : 1 -> Reset  
             * BRNG : 13    : 0 -> 16V FSR(LSB_BUS 4mV)
             *                1 -> 32V FSR(LSB_BUS 8mV)     *
             * PG   : 12-11 : 0 -> \pm 40[mV](LSB_SHUNT 10uV)
             *                1 -> \pm 80[mV](LSB_SHUNT 20uV)
             *                2 -> \pm 160[mV](LSB_SHUNT 40uV)
             *                3 -> \pm 320[mV](LSB_SHUNT 80uV) *
             * BDAC : 10-7  : Bit-Width/Sampling Time Settings (default = 0bX11)
             * SADC : 6-3   : Bit-Width/Sampling Time Settings (default = 0bX11)
             * MODE : 2-0   : Mode Settings (default = 0b111)
             */
            ADDRESS_INA = address_ic;
            uint16_t send_data = 0x00 | (((brng & 0x01) << 13) | ((gain & 0x03) << 11) | ((badc & 0x0F) << 7) | ((sadc & 0x0F) << 3) | (Mode & 0x07));
            _Write(ADDRESS_INA, CONFIG_ADDRESS_INA, (send_data >> 8) & 0xFF, send_data & 0xFF);
        }

        int16_t INA219_Read(uint8_t reg, uint8_t range, uint8_t gain) {
            int16_t Data;
            _Read(ADDRESS_INA, reg);
            while (Wire.available());
            Data = Wire.read() << 8 | Wire.read();
            Data = (Data >> gain) * range;
            return Data;
        }

};