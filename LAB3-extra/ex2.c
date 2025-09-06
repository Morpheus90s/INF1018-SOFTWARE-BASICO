void setup() {
  Serial.begin(115200);
  DDRD |= 0x3C;   
  DDRB = 0x00;    
}

void loop() {
  PORTD = (PINB & 0x0F) << 2; 

  Serial.print("PINB: ");
  Serial.print(PINB & 0x0F, BIN);
  Serial.print(" | PORTD: ");
  Serial.println(PORTD, BIN);

  delay(200);
}
