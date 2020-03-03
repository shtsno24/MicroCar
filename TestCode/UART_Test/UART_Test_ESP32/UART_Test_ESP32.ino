//HardwareSerial Serial2(2);

void setup() {
  Serial.begin(115200);
  Serial2.begin(115200);
  
  Serial.println("ESP32 : Hello World");
}

void loop() {
  // read from port 1, send to port 0:
  if (Serial2.available()) {
    int inByte = Serial2.read();
    Serial.write(inByte);
    Serial2.write(inByte);
  }
//  delay(1000);
}
