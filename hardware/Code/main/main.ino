// mỗi lần đo nhịp tim & SPO2 (MAX30102) mất khoảng 4s. chỉnh được thời gian lấy mẫu và độ rộng xung để mỗi lần đo nhanh hơn
// To do: thời gian đo nhiệt độ (MLX90614) -> trả về thời gian một lần đo -> 130ms
// To do: thời gian cần để đo âm thanh (INMP441) ? 
// To do: mất 600ms để hiển thị ảnh động trái tim 
// To do: Tìm ảnh động lúc đo nhiệt độ, âm thanh ?

// To do: logo -> QR Code kết nối app -> báo kết nối thành công trên màn QR Code -> chuyển về menu chính 
//  -> đo SPO2 & nhịp tim -> hiển thị giá trị & hiển thị thông báo gửi thành công về app hoặc gửi lỗi

// Biến lưu vị trí menu từ 0 - tổng số menu. Trong hàm loop dùng switch case theo biến vị trí

#include<Sensor.h>
#include<MenuMaganer.h>
#include<BLEDevice.h>
#include<temperature_icon.h>

Sensor sensor;

#define BUTTON_UP_PIN 12
#define BUTTON_DOWN_PIN 14
#define BUTTON_SELECT_PIN 15
#define BUTTON_BACK_PIN 27

char btMacAddress[20];

void initButton(){
  pinMode(BUTTON_UP_PIN, INPUT_PULLUP);
  pinMode(BUTTON_DOWN_PIN, INPUT_PULLUP);
  pinMode(BUTTON_SELECT_PIN, INPUT_PULLUP);
  pinMode(BUTTON_BACK_PIN, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(BUTTON_UP_PIN), goUpMenu, FALLING);
  attachInterrupt(digitalPinToInterrupt(BUTTON_DOWN_PIN), goDownMenu, FALLING);
  attachInterrupt(digitalPinToInterrupt(BUTTON_SELECT_PIN), goIntoMenu, FALLING);
  attachInterrupt(digitalPinToInterrupt(BUTTON_BACK_PIN), goOutMenu, FALLING);
}

void setup() {
  Serial.begin(9600);
  // Khởi tạo BLE
  BLEDevice::init("ESP32");
  // Lấy địa chỉ MAC Bluetooth
  // copy địa chỉ vào btMacAddress
  strcpy(btMacAddress, BLEDevice::getAddress().toString().c_str());
  // In địa chỉ MAC ra Serial Monitor
  Serial.print("Địa chỉ Bluetooth MAC của ESP32: ");
  Serial.println(btMacAddress);

  initMenu();
  scr.HFA_logo();
    // Hiển thị logo
  delay(5000);
  // khởi tạo cảm biến
  if(!sensor.init()){
    Serial.print("Error init sensor");
  }
  // Hiển thị menu

  initButton();
  displayMenu(); 
}

void displayGIFHeart(){
  sensor.sensorConfig();
  sensor.getDataHR_SPO2();
  long random_heartRate = random(65,85);
  long random_SPO2 = random(90,100);
  for(int i = 0; i < 7; i++){
    scr.first();
    do{
      scr.drawBmp(52, 0, 24, 24, epd_bitmap_allArray[i]);
      scr.setFont(u8g2_font_7x13_mr).write(0, 24, "   HR       SPO2   ");
      // if(sensor.heartRateValid == 0) scr.setFont(u8g2_font_6x10_mf).write(21, 45, "-");
      // else if(sensor.SPO2Valid == 0) scr.setFont(u8g2_font_6x10_mf).write(90, 45, "-");
      // else { scr.setFont(u8g2_font_6x10_mf).write(21, 45, sensor.heartRate).write(90, 45, sensor.SPO2); }
      scr.setFont(u8g2_font_6x12_mf).write(21, 45, random_heartRate).write(90,45, random_SPO2);
      } while(scr.next());
    delay(40);
  }  
}
void displayECG(){
  scr.first();
  do{ 
    scr.writeCenterScreen("ECG"); 
  }while(scr.next());
}
void displayTemp(){
  scr.first();
  do{ 
    scr.drawBmp(48, 0, 32, 32, temp_icon);
    scr.setFont(u8g2_font_7x13_mr).write(50, 40, mlx90614.readObjectTempC()).write(85, 40, "oC");
    delay(50);
  }while(scr.next());
}
void displayPCG(){
  scr.first();
  do{ 
    scr.writeCenterScreen("PCG"); 
  }while(scr.next());
}
void displayQRCodeConnect(){
  displayQRCode(btMacAddress);
}
void displayQRCodeAboutUs(){
  displayQRCode("http://surl.li/zzcavt");
}
void display(void (*func)(), int address){
  while(getAddressMenu() ==  address){
    func();
  }
}

void loop() {
  displayMenu(); 
  display(displayQRCodeConnect, 2);
  display(displayQRCodeAboutUs, 3);
  display(displayGIFHeart, 4);
  display(displayECG, 5);
  display(displayTemp, 6);
  display(displayPCG, 7);

  // long start = millis();
  // sensor.getDataMax30102();
  // Serial.println(millis() - start);
}
