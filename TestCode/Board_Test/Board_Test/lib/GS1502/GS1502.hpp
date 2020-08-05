#include "Arduino.h"
#include <cstdint>

class GS1502{
    private:

    void set_count(uint8_t channel, uint16_t count){
        ledcWrite(channel, (uint32_t)count); //Timer channel, polarity change threshold count
    }

    public:
    /*
     *  http://berry.sakura.ne.jp/technics/servo_control_p3.html
     *  pulse_width     : [900us, 2100us]
     *  pulse precision : 10000[us] / 2^16 = 1.52587891e-1 [us/LSB]
     *                  : 20000[us] / 2^16 = 3.05175781e-1 [us/LSB]
     */
    float MIN_PULSE_WIDTH = 900.0; // [us]
    float MAX_PULSE_WIDTH = 2100.0; // [us]
    float LSB_PRECISION = 3.05175781e-1; // [us/LSB]
    uint8_t CHANNEL;

    void Begin(uint8_t channel, uint8_t pin, double freq, uint8_t bit_num){
        CHANNEL = channel;
        ledcSetup(CHANNEL, freq, bit_num); // Timer channel, Base clock, counter bit width
        ledcAttachPin(pin, CHANNEL); //IO pin, Timer channel
        set_count(CHANNEL, percent2count(0.0));
    }

    uint16_t percent2count(float percent){
        /* 
         * percent : [-100.0%, 100.0%]
         */
        float pulse_width = (percent - (-100.0)) / (100.0 - (-100.0)) * (MAX_PULSE_WIDTH - MIN_PULSE_WIDTH) + MIN_PULSE_WIDTH;
        uint16_t count = (uint16_t)(pulse_width / LSB_PRECISION);
        return count;
    }

    void set_pos(float percent){
        set_count(CHANNEL, percent2count(percent));
    }

};
