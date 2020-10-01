//http://gijin77.blog.jp/archives/21966552.html
//Mac Address = D8:A0:1D:50:FD:46
void setup(void) {
  Serial.begin(115200);
//  Serial.println("-----------------------------");
  uint8_t btmac[6];
//  esp_read_mac(btmac, ESP_MAC_BT);
//  Serial.printf("[Bluetooth] Mac Address = %02X:%02X:%02X:%02X:%02X:%02X\r\n", btmac[0], btmac[1], btmac[2], btmac[3], btmac[4], btmac[5]);
}

void loop() {
//    Serial.begin(115200);
  Serial.println("-----------------------------");
  uint8_t btmac[6];
  esp_read_mac(btmac, ESP_MAC_BT);
  Serial.printf("[Bluetooth] Mac Address = %02X:%02X:%02X:%02X:%02X:%02X\r\n", btmac[0], btmac[1], btmac[2], btmac[3], btmac[4], btmac[5]);
}
