#include <U8g2lib.h>
#include "logo.h"
#include "Heart_GIF.h"
#include  <qrcode.h>

U8G2_SSD1306_128X64_NONAME_1_HW_I2C u8g2(U8G2_R0, U8X8_PIN_NONE);

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

class Screen{
public:
  Screen(){}
  void init(){
    u8g2.begin();
    u8g2.setFontPosTop();
  }
  Screen& setPos(int x, int y){
    u8g2.setCursor(x, y);
    return*this;
  }
  template<class T>
  Screen& setFont(const T& font){
    u8g2.setFont(font);
    return*this;
  }
  Screen& setFontTop(){
    u8g2.setFontPosTop();
    return*this;
  }
  Screen& clearScreen(){
    u8g2.clear();
    return*this;
  }
  void clearBuffer(){
    u8g2.clearBuffer();
  }
  void sendBuffer(){
    u8g2.sendBuffer();
  }
  void first(){
    u8g2.firstPage();
  }
  bool next(){
    return u8g2.nextPage();
  }
  int getAscent(){
    return u8g2.getAscent();
  }
  int getDescent(){
    return u8g2.getDescent();
  }
  int getStrWidthPixel(const char* str){
    return u8g2.getStrWidth(str);
  }
  int getStrHeightPixel(){
    return u8g2.getMaxCharHeight();
  }
  Screen& drawBmp(int x, int y, int w, int h, const uint8_t * mybitmap){
    u8g2.drawBitmap(x, y, w / 8, h, mybitmap);
    return*this;
  }
  Screen& drawFrame(int x, int y, int X, int Y, int r){
    u8g2.drawRFrame(x, y, X, Y, r);
    return*this;
  }
  Screen& drawBox(int x, int y, int w, int h){
    u8g2.drawBox(x, y, w, h);
    return*this;
  }
  template<class T>
  Screen& write(const T& val){
    u8g2.print(val);
    return*this;
  }  
  template<class T>
  Screen& write(int x, int y, const T& val){
    setPos(x, y);
    u8g2.print(val);
    return*this;
  }
  template<class T>
  void writeCenterScreen(const T& val){
    int w = SCREEN_WIDTH - getStrWidthPixel(val);
    int h = SCREEN_HEIGHT - getStrHeightPixel();
    setPos(w / 2, h / 2);
    write(val);
  }
  void HFA_logo(){
    first();
    do{
      drawBmp(0, 0, 128, 64, HFA_LOGO);
    } while(next());
  }
};

void displayQRCode(const char* text) {
  QRCode qrcode;
  uint8_t qrcodeData[qrcode.qrcode_getBufferSize(3)];
  qrcode.qrcode_initText(&qrcode, qrcodeData, 3, 0, text);
  
  int scale = min(SCREEN_WIDTH / qrcode.size, SCREEN_HEIGHT / qrcode.size);
  
  int shiftX = (SCREEN_WIDTH - qrcode.size * scale) / 2;
  int shiftY = (SCREEN_HEIGHT - qrcode.size * scale) / 2;
  // Serial.println(qrcode.size);
  // Serial.println("\n\n\n");
  Screen().first();
  do{
    for (uint8_t y = 0; y < qrcode.size; y++) {
      for (uint8_t x = 0; x < qrcode.size; x++) {
        if (qrcode.qrcode_getModule(&qrcode, x, y)) {
          Screen().drawBox(shiftX + x * scale, shiftY + y * scale, scale, scale);
          // Serial.print("\u2588\u2588");
        } else {
            // Serial.print("  ");
          }
        }
        // Serial.println();
      }
    }while(Screen().next());
    // Serial.println("\n\n\n");
  }