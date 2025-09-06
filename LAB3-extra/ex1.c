int contador = 0;

void setup() {
  Serial.begin(115200);
  DDRD |= 0x3C;  
}

void loop() {
  PORTD = contador << 2; 

  Serial.print("Contador: ");
  Serial.print(contador);
  Serial.print(" | Binário: ");
  Serial.print(contador, BIN);
  Serial.print(" | PORTD: ");
  Serial.println(PORTD, BIN);

  contador++;
  if (contador > 15) contador = 0; 
  delay(1000);
}
