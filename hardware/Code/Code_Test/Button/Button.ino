int button1 = 12;
int button2 = 14;
int button3 = 15;
int button4 = 27;

void setup() {
  // put your setup code here, to run once:
  pinMode(button1, INPUT_PULLUP);
  pinMode(button2, INPUT_PULLUP);
  pinMode(button3, INPUT_PULLUP);
  pinMode(button4, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.print("button1: "); Serial.print(digitalRead(button1));
  Serial.print("    button2: "); Serial.print(digitalRead(button2));
  Serial.print("    button3: "); Serial.print(digitalRead(button3));
  Serial.print("    button4: "); Serial.println(digitalRead(button4));
  delay(100);
}
