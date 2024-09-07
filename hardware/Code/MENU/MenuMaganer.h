#include <U8g2lib.h>

U8G2_SSD1306_128X64_NONAME_1_HW_I2C u8g2(U8G2_R0, U8X8_PIN_NONE);

class MenuItem {
private:
  String name;
  MenuItem* children[10];
public:
  int selectedItem;
  int numChildren;
  MenuItem* parent;
  MenuItem(String itemName, MenuItem* itemParent) {
    name = itemName;
    parent = itemParent;
    numChildren = 0;
    selectedItem = 0;
  }

  void addChild(MenuItem* child) {
    children[numChildren] = child;
    numChildren++;
  }

  void display() {
    u8g2.firstPage();
    do {
      if (numChildren > 0) {
        for (int i = 0; i < numChildren; i++) {
          if (i == selectedItem) {
            u8g2.setFont(u8g2_font_helvR10_tr);
            int8_t h = u8g2.getAscent() - u8g2.getDescent();
            int8_t w = u8g2.getStrWidth(children[i]->name.c_str());
            if (selectedItem < 3) {
              u8g2.drawRFrame(0, i * 20 + 3, 120, h + 4, 3);
            } else {
              u8g2.drawRFrame(0, 2 * 20 + 3, 120, h + 4, 3);
            }
          }
          if (selectedItem < 3) {
            u8g2.drawStr(5, i * 20 + 5, children[i]->name.c_str());
          } else {
            u8g2.drawStr(5, (i - selectedItem + 2) * 20 + 5, children[i]->name.c_str());
          }
        }
      }
    } while (u8g2.nextPage());
  }
  int getnumChildren() {
    return numChildren;
  }
  MenuItem* select() {
    if (numChildren > 0) {
      return children[selectedItem];
    }
  }
  MenuItem* back() {
    return parent;
  }
  void selectedDown(){
    Serial.print("Down: ");
    Serial.println(selectedItem);
    selectedItem += 1;
    if(selectedItem > numChildren - 1)
      selectedItem = 0;
  }
  void selectedUp(){
    Serial.print("Up: ");
    Serial.println(selectedItem);
    selectedItem -= 1; 
    if(selectedItem < 0)
      selectedItem = numChildren - 1;
  }
};

// Khởi tạo các menu item
MenuItem root("Root", NULL);
MenuItem measureMenu("Measure", &root);
MenuItem* currentMenu = &root;

void initMenu(){
  u8g2.begin();
  u8g2.setFont(u8g2_font_helvR10_tr);
  u8g2.setFontPosTop();


  // Xây dựng cây menu
  root.addChild(&measureMenu);
  root.addChild(new MenuItem("Connect App", &root));
  root.addChild(new MenuItem("About us", &root));
  measureMenu.addChild(new MenuItem("HeartRate & SPO2", &measureMenu));
  measureMenu.addChild(new MenuItem("ECG", &measureMenu));
  measureMenu.addChild(new MenuItem("Ambient & Obj Temp", &measureMenu));
  measureMenu.addChild(new MenuItem("PCG Sounds", &measureMenu));
}
void goUpMenu(){
  currentMenu->selectedUp();
}
void goDownMenu(){
  currentMenu->selectedDown();
}
void goIntoMenu(){
  currentMenu = currentMenu->select();
}
void goOutMenu(){
  currentMenu = currentMenu->back();
}
void displayMenu(){
  currentMenu->display();
}