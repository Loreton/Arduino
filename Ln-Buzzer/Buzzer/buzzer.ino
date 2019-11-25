int buzzerPin = 2;
int freq=200;
int durata=500;

void setup(){
  pinMode(buzzerPin, OUTPUT);
}

void loop(){
  tone(buzzerPin, freq, durata);
  delay(durata*150);
}
