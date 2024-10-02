#include<MenuMaganer.h>

#define BUTTON_UP_PIN 12
#define BUTTON_DOWN_PIN 14
#define BUTTON_SELECT_PIN 15
#define BUTTON_BACK_PIN 27

// void readButton(){
//   if (digitalRead(BUTTON_UP_PIN) == LOW) {
//     goUpMenu();
//     delay(300);
//   }
//   else if (digitalRead(BUTTON_DOWN_PIN) == LOW) {
//     goDownMenu();
//     delay(300);
//   } 
//   else if (digitalRead(BUTTON_SELECT_PIN) == LOW) {
//     delay(300);
//     goIntoMenu();
//   } 
//   else if (digitalRead(BUTTON_BACK_PIN) == LOW) {
//     delay(300);
//     goOutMenu();
//   }
// }
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
  initMenu();
  initButton();
  Serial.begin(9600);
}

void loop() {
  displayMenu();
  //readButton();
}