float pow2pw(float);
uint16_t pw2cnt(float);

void setup() {
  /*
    pulse precision : 0.010[s] / 16[bit] = 1.52587891e-7 [s/bit]
                      0.020[s] / 16[bit] = 3.05175781e-7 [s/bit]
  */
  Serial.begin(115200);
  ledcSetup(0, 100, 16); // Timer channel, Base clock, counter bit width
  ledcAttachPin(32, 0); //IO pin, Timer channel
  ledcWrite(0, 0x8000); //Timer channel, polarity change threshold count
}

void loop() {
  for (int i = -100; i < 1; i++) {
    ledcWrite(0, pw2cnt(pow2pw((float)i)));
    Serial.println(pw2cnt(pow2pw((float)i)));
    delay(1);
  }
  for (int i = 0; i < 100; i++) {
    ledcWrite(0, pw2cnt(pow2pw(0.0)));
    Serial.println(pw2cnt(pow2pw(0.0)));
    delay(10);
  }
  for (int i = 0; i < 101; i++) {
    ledcWrite(0, pw2cnt(pow2pw((float)i)));
    Serial.println(pw2cnt(pow2pw((float)i)));
    delay(1);
  }
  for (int i = 100; i > -101; i--) {
    ledcWrite(0, pw2cnt(pow2pw((float)i)));
    Serial.println(pw2cnt(pow2pw((float)i)));
    delay(1);
  }
}

float pow2pw(float power) {
  /*
     power must be [-100, 100]
     Dir : 0->CW, 1->CCW
     pulse_width is [700us, 2300us]
  */
  float pulse_width;
  if (power < -100.0) {
    power = -100.0;
  }
  if (power > 100.0) {
    power = 100.0;
  }

  //  if (Dir == 0) {
  //    power *= -1.0;
  //  }

  pulse_width = (power - (-100.0)) / (100.0 - (-100.0)) * (2300.0 - 700.0) + 700.0;
  return pulse_width;
}

uint16_t pw2cnt(float pulse_width) {
  /*
      pulse_width is [700us, 2300us]
      pulse precision : 10000[us] / 2^16 = 1.52587891e-1 [us/single_pulse_width]
                      : 20000[us] / 16[bit] = 3.05175781e-1 [us/bit]
  */
  uint16_t count;
  count = uint16_t(pulse_width / 1.52587891e-1);
  return count;
}
