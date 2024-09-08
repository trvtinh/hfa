#include<Screen.h>

Screen scr;

byte num = 0;
class MenuItem {
private:
  String name;
  MenuItem* children[10];
public:
  int selectedItem;
  int numChildren;
  MenuItem* parent;
  byte address;
  MenuItem(String itemName, MenuItem* itemParent) {
    name = itemName;
    parent = itemParent;
    numChildren = 0;
    selectedItem = 0;
    address = num++;
  }

  void addChild(MenuItem* child) {
    children[numChildren] = child;
    numChildren++;
  }

  void display() {
    scr.first();
    do {
      if (numChildren > 0) {
        for (int i = 0; i < numChildren; i++) {
          if (i == selectedItem) {
            scr.setFont(u8g2_font_helvR10_tr);
            int8_t h = scr.getAscent() - scr.getDescent();
            int8_t w = scr.getStrWidthPixel(children[i]->name.c_str());
            if (selectedItem < 3) {
              scr.drawFrame(0, i * 20 + 3, 120, h + 4, 3);
            } else {
              scr.drawFrame(0, 2 * 20 + 3, 120, h + 4, 3);
            }
          }
          if (selectedItem < 3) {
            scr.write(5, i * 20 + 5, children[i]->name.c_str());
          } else {
            scr.write(5, (i - selectedItem + 2) * 20 + 5, children[i]->name.c_str());
          }
        }
      }
    } while (scr.next());
  }
  int getnumChildren() {
    return numChildren;
  }
  byte getAddress() {
    return address;
  }
  MenuItem* select() {
    if (numChildren > 0) {
      return children[selectedItem];
    }
    return NULL;
  }
  MenuItem* back() {
    return parent;
  }
  void selectedDown() {
    selectedItem += 1;
    if (selectedItem > numChildren - 1)
      selectedItem = 0;
  }
  void selectedUp() {
    selectedItem -= 1;
    if (selectedItem < 0)
      selectedItem = numChildren - 1;
  }
};

// Khởi tạo các menu item
MenuItem root("Root", NULL);
MenuItem measureMenu("Measure", &root);
MenuItem* currentMenu = &root;

void initMenu() {
    scr.init();
  // Xây dựng cây menu
  root.addChild(&measureMenu);
  root.addChild(new MenuItem("Connect App", &root));
  root.addChild(new MenuItem("About us", &root));
  measureMenu.addChild(new MenuItem("HR & SPO2", &measureMenu));
  measureMenu.addChild(new MenuItem("ECG", &measureMenu));
  measureMenu.addChild(new MenuItem("Body Temp", &measureMenu));
  measureMenu.addChild(new MenuItem("PCG Sound", &measureMenu));
}
void goUpMenu() {
  currentMenu->selectedUp();
}
void goDownMenu() {
  currentMenu->selectedDown();
}
void goIntoMenu() {
  if(currentMenu->select() != NULL)
    currentMenu = currentMenu->select();
}
void goOutMenu() {
  if(currentMenu->back() != NULL)
    currentMenu = currentMenu->back();
}
void displayMenu() {
  currentMenu->display();
  // Serial.println(currentMenu->getAddress());
}
int getAddressMenu(){
  return currentMenu->getAddress();
}
