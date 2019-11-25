// https://www.youtube.com/watch?v=ptig62mLN84

#define INTERVAL 1000 // ms

int ledPin = 13;
byte ledState;
unsigned long time_for_action;

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (millis() > time_for_action) {
    time_for_action = millis() + (unsigned long) INTERVAL;
    Serial.println(time_for_action); //prints time since program started
    ledState = !ledState;
  }
  digitalWrite(ledPin, ledState);
}
