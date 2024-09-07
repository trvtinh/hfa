// mỗi lần đo nhịp tim & SPO2 (MAX30102) mất khoảng 4s
// To do: thời gian đo nhiệt độ (MLX90614) -> trả về thời gian một lần đo -> 130ms
// To do: thời gian cần để đo âm thanh (INMP441) ? 
// To do: mất 500ms để hiển thị ảnh động trái tim 
// To do: Tìm ảnh động lúc đo nhiệt độ, âm thanh ?

// To do: logo -> QR Code kết nối app -> báo kết nối thành công trên màn QR Code -> chuyển về menu chính 
//  -> đo SPO2 & nhịp tim -> hiển thị giá trị & hiển thị thông báo gửi thành công về app hoặc gửi lỗi

// Biến lưu vị trí menu từ 0 - tổng số menu. Trong hàm loop dùng switch case theo biến vị trí

#include<Sensor.h>
#include<MenuMaganer.h>

Sensor sensor;

#define BUTTON_UP_PIN 12
#define BUTTON_DOWN_PIN 14
#define BUTTON_SELECT_PIN 15
#define BUTTON_BACK_PIN 27

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
  scr.init();
  // Hiển thị logo
  delay(1000);
  scr.HFA_logo();
  // khởi tạo cảm biến
  if(!sensor.init()){
    Serial.print("Error init sensor");
  }
  sensor.sensorConfig();
  // Hiển thị menu
  initMenu();
  initButton();
  delay(2000);

}
void displayFrame(const unsigned char* frame_name){
  scr.drawBmp(0, 0, 40, 40, frame_name);
}

void displayGIF(){
  for(int i = 0; i < 7; i++){
    scr.first();
    do{
        scr.drawBmp(0, 0, 40, 40, frame_Array[i]);
    } while(scr.next());
    if(++i == 7) i = 0;
    delay(50);
  }
}
void loop() {
  displayMenu();
  switch(getAddressMenu()){
    case 2: displayQRCode("KHOE MACH"); break; // connect app
    case 3: displayQRCode("About us"); break;
    case 4: displayGIF(); break;
    case 5: scr.first();
            do{scr.WriteCenterScreen("ECG");}while(scr.next()); break;
    case 6: scr.first();
            do{scr.WriteCenterScreen("Temp");}while(scr.next()); break;
    case 7: scr.first();
            do{scr.WriteCenterScreen("PCG");}while(scr.next()); break;
  }
}
