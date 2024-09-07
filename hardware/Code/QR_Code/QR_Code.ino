#include <U8g2lib.h>
#include <qrcode.h>

U8G2_SSD1306_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

#define OLED_WIDTH 128
#define OLED_HEIGHT 64

void setup() {
  Serial.begin(9600);
  u8g2.begin();
  u8g2.clearBuffer();
  displayQRCode("KHOE MACH");
  u8g2.sendBuffer();
}

void loop() {
}

void displayQRCode(const char* text) {
  QRCode qrcode;
  uint8_t qrcodeData[qrcode.qrcode_getBufferSize(3)];
  qrcode.qrcode_initText(&qrcode, qrcodeData, 3, 0, text);
  
  int scale = min(OLED_WIDTH / qrcode.size, OLED_HEIGHT / qrcode.size);
  
  int shiftX = (OLED_WIDTH - qrcode.size * scale) / 2;
  int shiftY = (OLED_HEIGHT - qrcode.size * scale) / 2;
  Serial.println(qrcode.size);
  Serial.println("\n\n\n");
  for (uint8_t y = 0; y < qrcode.size; y++) {
    for (uint8_t x = 0; x < qrcode.size; x++) {
      if (qrcode.qrcode_getModule(&qrcode, x, y)) {
        u8g2.drawBox(shiftX + x * scale, shiftY + y * scale, scale, scale);
        Serial.print("\u2588\u2588");
      } else {
          Serial.print("  ");
        }
      }
      Serial.println();
    }
    Serial.println("\n\n\n");
  }
