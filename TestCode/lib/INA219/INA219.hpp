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
 * LSB_Min_15 = I_Max_Expected / (2^15) ~ 1.2207e-4 [A]
 * LSB_Max_12 = I_Max_Expected / (2^12) ~ 9.7656e-4 [A]
 * -> LSB_Current = 1.28e-4 [A]
 * 
 * Calibration Register = RoundDown(0.04096 / (1.28e-4[A] * 0.01)) = 32000 = 0x7D00
 * P/LSB_Power = (I_Shunt / LSB_Current) * (V_Bus / 0.004) / 5000 = P / (LSB_Current * 20)
 * 
 * LSB_Power = 20 * LSB_Current = 20 * 128uA = 2560uW
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
            Wire.write(data_h);
            Wire.write(data_l);
            Wire.endTransmission();
        }

        void _Read(uint8_t address, uint8_t reg, uint8_t data[]){ 
            Wire.beginTransmission(address);
            Wire.write(reg);
            Wire.endTransmission();

            Wire.requestFrom(address, 2);
            uint8_t i = 0;
            while (Wire.available()) {
                data[i] = Wire.read();
                i += 1;
            }
        }

    public:
        uint8_t ADDRESS_INA = 0x40;
        const uint8_t CONFIG_ADDRESS_INA = 0x00; // CONFIG_Reg
        const uint8_t VSHUNT_ADDRESS_INA = 0x01; // Shunt_Voltage_Reg
        const uint8_t VBUS_ADDRESS_INA = 0x02; // BUS_Voltage_Reg
        const uint8_t POWER_ADDRESS_INA = 0x03; // Power_Reg
        const uint8_t CURRENT_ADDRESS_INA = 0x04; // Shunt_Current_Reg
        const uint8_t CALIB_ADDRESS_INA = 0x05; // Calibration_Reg

        uint16_t CALIB_REGISTER_DATA = 0x7D00;
        float I_LSB_Shunt = 1.28 * 1.0e-4 ; // [A]
        float V_LSB_Shunt = 10.0 * 1.0e-6; // [V]
        float V_LSB_Bus = 4.0 * 1.0e-3; // [V]

        void Begin(uint8_t address_ic, uint16_t brng, uint16_t pg, uint16_t badc, uint16_t sadc, uint16_t mode, uint16_t calib) {
            /* name : bit   : Configure  
             * RST  : 15    : 1 -> Reset  
             * BRNG : 13    : 0 -> 16V FSR(LSB_BUS 4mV) *
             *                1 -> 32V FSR(LSB_BUS 8mV)
             * PG   : 12-11 : 0 -> \pm 40[mV](LSB_SHUNT 10uV) *
             *                1 -> \pm 80[mV](LSB_SHUNT 20uV)
             *                2 -> \pm 160[mV](LSB_SHUNT 40uV)
             *                3 -> \pm 320[mV](LSB_SHUNT 80uV)
             * BDAC : 10-7  : Bit-Width/Sampling Time Settings (0b0111)
             * SADC : 6-3   : Bit-Width/Sampling Time Settings (0b0111)
             * MODE : 2-0   : Mode Settings (default = 0b111)
             */

            ADDRESS_INA = address_ic;
            uint16_t send_data = 0x0000 | ((brng & 0x01) << 13) | ((pg & 0x03) << 11) | ((badc & 0x0F) << 7) | ((sadc & 0x0F) << 3) | (mode & 0x07);
            _Write(ADDRESS_INA, CONFIG_ADDRESS_INA, (send_data >> 8) & 0xFF, send_data & 0xFF);
            _Write(ADDRESS_INA, CALIB_ADDRESS_INA, (calib >> 8) & 0xFF, calib & 0xFF);
        }

        float INA219_Read(uint8_t reg, float LSB) {
            uint8_t data_reg[2];
            _Read(ADDRESS_INA, reg, data_reg);
            return (float)(int16_t)((uint16_t)data_reg[0] << 8 | (uint16_t)data_reg[1]) * LSB;
        }
};