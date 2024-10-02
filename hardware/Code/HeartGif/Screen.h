#include <U8g2lib.h>

U8G2_SSD1306_128X64_NONAME_1_HW_I2C u8g2(U8G2_R0, U8X8_PIN_NONE);

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

class Screen{
public:
  Screen(/*width*/int w = SCREEN_WIDTH, /*height*/int h = SCREEN_HEIGHT){
  }
  Screen& init(){
    u8g2.begin();
    return*this;
  }
  Screen& setPos(int x, int y){
    u8g2.setCursor(x, y);
    return*this;
  }
  template<class T>
  Screen& SetFont(const T& font){
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
  Screen& drawBmp(int x, int y, int w, int h, const uint8_t * mybitmap){
    u8g2.drawBitmap(x, y, w / 8, h, mybitmap);
    return*this;
  }
  Screen& first(){
    u8g2.firstPage();
    return*this;
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
  Screen& drawBox(int x, int y, int X, int Y, int r){
    u8g2.drawRFrame(x, y, X, Y, r);
    return*this;
  }
  template<class T>
  Screen& Write(const T& val){
    u8g2.print(val);
    return*this;
  }  
  template<class T>
  Screen& Write(int x, int y, const T& val){
    setPos(x, y);
    u8g2.print(val);
    return*this;
  }
  template<class T>
  Screen& WriteCenterScreen(const T& val){
    int w = SCREEN_WIDTH - getStrWidthPixel(val);
    int h = SCREEN_HEIGHT - getStrHeightPixel();
    setPos(w / 2, h / 2);
    Write(val);
    return*this;
  }
  // Screen& HFA_logo(){
  //   first();
  //   do{
  //     drawBmp(0, 0, 128, 64, HFA_LOGO);
  //   } while(next());
  //   return*this;
  // }
};