byte leds = 0;         
byte lastButtons = 0;  

void setup() {
  Serial.begin(115200);
  DDRD |= 0x3C;  
  DDRB = 0x00;    
}

void loop() {
  byte buttons = PINB & 0x0F;      
  byte changed = buttons & ~lastButtons;

  for (int i = 0; i < 4; i++) {
    if (changed & (1 << i)) {
      leds ^= (1 << (i + 2));  
    }
  }

  PORTD = leds; 
  lastButtons = buttons;  

  Serial.print("Botões: ");
  Serial.print(buttons, BIN);
  Serial.print(" | LEDs: ");
  Serial.println(leds >> 2, BIN);

  delay(100);
}
