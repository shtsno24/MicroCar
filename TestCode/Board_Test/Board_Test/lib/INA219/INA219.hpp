/*
 * INA219 Library for Arduino
 * INA219 is 13bit ADC with I2C  
 * 
 * V_LSB_shunt : PG / 4096(2^12)(=40mV/4096=10uV)
 * V_LSB_bus   : BRNG / 4096(=16V/4096=4mV)
 * 
 * V_Shunt = Shunt_Voltage_Register * (PG / 4096)
 * V_Bus   = Bus_Voltage_Register * (BRNG / 4096)
 * Sampled Value = Register Value * V_LSB
 * 
 * Current Register = Shunt Voltage Register * Calibration Register / 4096
 * Power Register = Shunt Voltage Register * Current Register / 5000
 * 
 * I_shunt = Current Register * LSB_Current
 * Current Register = I_shunt / LSB_Current = V_Shunt / R_Shunt / LSB_Current
 * Current Register = Shunt_Voltage_Register * (PG / 4096) / R_Shunt / LSB_Current
 * Shunt Voltage Register * Calibration Register / 4096 = Shunt_Voltage_Register * (PG / 4096) / R_Shunt / LSB_Current
 * Calibration Register = RoundDown(((PG / 4096) * 4096) / (LSB_Current * R_Shunt) * (1V / (100000 * 10uV)))
 * Calibration Register = RoundDown(0.04096 / (LSB_Current * R_shunt))
 * 
 * V_BusMax = 16V -> BRNG = 0
 * V_ShuntMax = 40mV -> PGA = 0
 * R_Shunt = 0.01\Ohm
 * I_Max_Pos = 40mV / 0.01\Ohm = 4A
 * I_Max_Expected = I_Max_Pos
 * LSB_Min_15 = I_Max_Expected / (2^15) ~ 122.07uA
 * LSB_Max_12 = I_Max_Expected / (2^12) ~ 976.56uA
 * -> LSB_Current = 128uA
 * 
 * Calibration Register = RoundDown(0.04096 / (125uA * 0.01)) = 32768 =0x8000
 * P/LSB_Power = (I_Shunt / LSB_Current) * (V_Bus / 0.004) / 5000 = P / (LSB_Current * 20)
 * 
 * LSB_Power = 20 * LSB_Current = 20 * 128uA = 2560uA
 * 
 * I_Max_Shunt_Calc = LSB_Current * 32767 ~ 4.194176A
 * if I_Max_Shunt_Calc > I_Max_Pos:
 *  I_Max_OVF = I_Max_Pos       <- This One(4A)
 * else:
 *  I_Max_OVF = I_Max_Shunt_Calc
 * 
 * V_Max_Shunt_Calc = I_Max_OVF * R_Shunt
 * if V_Max_Shunt_Calc > V_ShuntMax:
 *  V_Max_OVF = V_ShuntMax      <- This One(40mV)
 * else:
 *  V_Max_OVF = V_Max_Shunt_Calc <- This One(40mV)
 * 
 * P_Max = I_Max_OVF * V_Bus_Max = 4A * 16V = 64W
 * 
 * Option:
 * Corrected Calibration Register = Calibration Register = RoundDown(Calibration Register * I_Measured / I_INA219)
 * 
 * http://cdwilson.us/articles/understanding-the-INA219/
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