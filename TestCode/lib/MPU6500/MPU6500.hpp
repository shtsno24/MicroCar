/*
 * MPU6500 Library for Arduino
 */
#include "Arduino.h"
#include "SPI.h"

class MPU6500{
    private:
        SPIClass *_SPI;
        uint8_t _CS;
        float _ACCEL_SCALE;
        float _GYRO_SCALE;
        const float G = 9.8f;
        const float _D2R = 3.14159265359f/180.0f;
        uint8_t _data_buff[14+1], _addr_buff[14+1];

        const uint8_t _WRITE_MASK = 0x80;
        const uint8_t _READ_MASK = 0x7F;

        void TransferBytes(uint8_t* address, uint8_t* rdata, uint8_t len_data){
            for(uint8_t i = 0; i < len_data; i++){
                address[i] = address[i] | _WRITE_MASK;
            }
            digitalWrite(_CS, LOW);
            _SPI->transferBytes(address, rdata, (uint32_t)len_data);
            digitalWrite(_CS, HIGH);
        // for(uint8_t i = 0; i < len_data; i++){
        //         rdata[i] = rdata[i] & _READ_MASK;
        //     }
        }

        void WriteBytes(uint8_t* wdata, uint8_t len_data){
            for(uint8_t i = 0; i < len_data; i++){
                wdata[i] |= _WRITE_MASK;
            }
            digitalWrite(_CS, LOW);
            _SPI->writeBytes(wdata, (uint32_t)len_data);
            digitalWrite(_CS, HIGH);
        }


    public:
        const uint32_t MPU_WRITE_CLOCK = 500000; // 500kHz
        const uint32_t MPU_READ_CLOCK = 20000000; // 20MHz

        const uint8_t WHO_AM_I = 0x75;
        const uint8_t PWR_MGMT_1 = 0x6B;
        const uint8_t CONFIG = 0x1A;
        const uint8_t GYRO_CONFIG = 0x1B;
        const uint8_t ACCEL_CONFIG = 0x1C;
        const uint8_t SIGNAL_PATH_RESET = 0x68;
        const uint8_t ACCEL_XOUT_H = 0x3B;
        const uint8_t ACCEL_XOUT_L = 0x3C;
        const uint8_t ACCEL_YOUT_H = 0x3D;
        const uint8_t ACCEL_YOUT_L = 0x3E;
        const uint8_t ACCEL_ZOUT_H = 0x3F;
        const uint8_t ACCEL_ZOUT_L = 0x40;
        const uint8_t TEMP_OUT_H = 0x41;
        const uint8_t TEMP_OUT_L = 0x42;
        const uint8_t GYRO_XOUT_H = 0x43;
        const uint8_t GYRO_XOUT_L = 0x44;
        const uint8_t GYRO_YOUT_H = 0x45;
        const uint8_t GYRO_YOUT_L = 0x46;
        const uint8_t GYRO_ZOUT_H = 0x47;
        const uint8_t GYRO_ZOUT_L = 0x48;

        enum {
            GYRO_FS_PM250DPS = 0,
            GYRO_FS_PM500DPS,
            GYRO_FS_PM1000DPS,
            GYRO_FS_PM2000DPS,
        };
        enum {
            ACCEL_FS_PM2G = 0,
            ACCEL_FS_PM4G,
            ACCEL_FS_PM8G,
            ACCEL_FS_PM16G,
        };
        enum{
            ax = 0,
            ay,
            az,
            t,
            gx,
            gy,
            gz
        };

        float IMU_DATA[7];

        int16_t Begin(SPIClass &bus, uint8_t CS){
            _SPI = &bus;
            _CS = CS;
            uint8_t config_reg[] = {0x00, 0x00};
            uint8_t receve_reg[] = {0x00, 0x00};
            pinMode(_CS, OUTPUT);
            digitalWrite(_CS, HIGH);

            // Read WHO_AM_I
            config_reg[0] = WHO_AM_I;
            config_reg[1] = WHO_AM_I;
            TransferBytes(config_reg, receve_reg, 2);
            Serial.print("IMU CS ");
            Serial.print(_CS);
            Serial.print(", WHO_AM_I : 0x");
            Serial.println(receve_reg[1], HEX);
            if (receve_reg[1] != 0x70){
                Serial.println("WHO_AM_I is not 0x70");
                return(-1);
            }

            // Wake Up IMU
            delay(50);
            Serial.print("IMU CS ");
            Serial.print(_CS);
            Serial.println(", Booting...");
            delay(1000);
            config_reg[0] = PWR_MGMT_1;
            config_reg[1] = 0x00;
            WriteBytes(config_reg, 2);
            delay(50);

            // Set up CONFIG
            config_reg[0] = CONFIG;
            config_reg[1] = 0x00;
            WriteBytes(config_reg, 2);

            // Set up GYRO_CONFIG(pm2000dps)
            config_reg[0] = GYRO_CONFIG;
            config_reg[1] = GYRO_FS_PM2000DPS << 3;
            Serial.print("IMU CS ");
            Serial.print(_CS);
            Serial.print(", GYRO_FS : 0x");
            Serial.println(config_reg[1], HEX);
            WriteBytes(config_reg, 2);
            // _GYRO_SCALE = 2000.0f / 32767.5f * _D2R;
            _GYRO_SCALE = 1.0 / 131.0 * _D2R;

            // Set up ACCEL_CONFIG(pm16g)
            config_reg[0] = ACCEL_CONFIG;
            config_reg[1] = ACCEL_FS_PM16G << 3;
            Serial.print("IMU CS ");
            Serial.print(_CS);
            Serial.print(", ACCEL_FS : 0x");
            Serial.println(config_reg[1], HEX);
            WriteBytes(config_reg, 2);            
            // _ACCEL_SCALE = 16.0f / 32767.5f * G;
            _ACCEL_SCALE = 1.0 / 16384.0 * G;
            return 0;
        }

        void ReadSensor(){
            for(uint8_t i = 0; i < 15; i++ ){
                _addr_buff[i] = i + ACCEL_XOUT_H;
            }
            TransferBytes(_addr_buff, _data_buff, 15);

            for(uint8_t i = 0; i < 7; i++ ){
                IMU_DATA[i] = (int16_t)((_data_buff[2 * i + 1] << 8) | _data_buff[2 * i + 2]);
            } 
            IMU_DATA[ax] *= _ACCEL_SCALE;
            IMU_DATA[ay] *= _ACCEL_SCALE;
            IMU_DATA[az] *= _ACCEL_SCALE; 
            IMU_DATA[gx] *= _GYRO_SCALE;
            IMU_DATA[gy] *= _GYRO_SCALE;
            IMU_DATA[gz] *= _GYRO_SCALE; 
        }

};
