int buzzerPin=2;
int pompaPin=3;

int freq=200;
int durata=500;

void setup(){
    pinMode(buzzerPin, OUTPUT);
    pinMode(pompaPin,  INPUT_PULLUP);
}

void loop(){
  while (digitalRead(pompaPin) == LOW) {
      tone(buzzerPin, freq, durata);
      delay(durata*2);
  }
}
