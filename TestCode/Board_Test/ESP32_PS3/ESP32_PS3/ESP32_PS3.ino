//http://gijin77.blog.jp/archives/21966552.html
//Mac Address = D8:A0:1D:50:FD:46
#include <Ps3Controller.h>
uint8_t btmac[6];
void setup(void) {
  Serial.begin(115200);
  Serial.println("-----------------------------");
  esp_read_mac(btmac, ESP_MAC_BT);
  Serial.printf("[Bluetooth] Mac Address = %02X:%02X:%02X:%02X:%02X:%02X\r\n", btmac[0], btmac[1], btmac[2], btmac[3], btmac[4], btmac[5]);
  Ps3.begin("D8:A0:1D:50:FD:46");
}

void loop() {
//  Serial.printf("[Bluetooth] Mac Address = %02X:%02X:%02X:%02X:%02X:%02X\r\n", btmac[0], btmac[1], btmac[2], btmac[3], btmac[4], btmac[5]);
  if(Ps3.isConnected()){
    if (Ps3.data.button.select){
      Serial.println("select ボタン圧下");
    }
    if (Ps3.data.button.l3 ){
      Serial.println("l3 ボタン圧下");
    }
    if (Ps3.data.button.r3){
      Serial.println("r3 ボタン圧下");
    }
    if (Ps3.data.button.start){
      Serial.println("start ボタン圧下");
    }

    if (Ps3.data.button.up ){
      Serial.println("up ボタン圧下");
    }
    if (Ps3.data.button.right){
      Serial.println("right ボタン圧下");
    }
    if (Ps3.data.button.down ){
      Serial.println("down ボタン圧下");
    }
    if (Ps3.data.button.left){
      Serial.println("left ボタン圧下");
    }

    if (Ps3.data.button.l2 ){
      Serial.println("l2 ボタン圧下");
    }
    if (Ps3.data.button.r2){
      Serial.println("r2 ボタン圧下");
    }
    if (Ps3.data.button.l1 ){
      Serial.println("l1 ボタン圧下");
    }
    if (Ps3.data.button.r1){
      Serial.println("r1 ボタン圧下");
    }

    if (Ps3.data.button.cross){
      Serial.println("cross ボタン圧下");
    }
    if (Ps3.data.button.square){
      Serial.println("square ボタン圧下");
    }
    if (Ps3.data.button.triangle){
      Serial.println("triangle ボタン圧下");
    }
    if (Ps3.data.button.circle){
      Serial.println("circle ボタン圧下");
    }

    if (Ps3.data.button.ps){
      Serial.println("ps ボタン圧下");
    }
    
    Serial.print("128,-128,LX=,"); //プロッタ用基準線
    Serial.print(Ps3.data.analog.stick.lx);
    Serial.print(",LY=,");
    Serial.print(Ps3.data.analog.stick.ly);
    Serial.print(",RX=,");
    Serial.print(Ps3.data.analog.stick.rx);
    Serial.print(",RY=,");
    Serial.print(Ps3.data.analog.stick.ry);
    Serial.print(",SX=,");
    Serial.print(Ps3.data.sensor.accelerometer.x);
    Serial.print(",SY=,");
    Serial.print(Ps3.data.sensor.accelerometer.y);
    Serial.print(",SZ=,");
    Serial.print(Ps3.data.sensor.accelerometer.z); 
    Serial.println();
  }
  delay(100);
}
