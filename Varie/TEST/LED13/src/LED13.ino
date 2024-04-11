/*
  LED 13
  Modifica il lampeggio del LED 13

    by Loreto
    This example code is in the public domain.
 */



int LED             = 13;   // select the pin for the LED (13 e' quello incorporato)
int LEDSTatus       = LOW;
// the setup routine runs once when you press reset:
void setup() {
    pinMode(LED, OUTPUT);
    digitalWrite(LED, LEDSTatus);

    Serial.begin(9600);  // Debug
}

// the loop routine runs over and over again forever:
void loop() {

    LEDSTatus = digitalRead(LED);
    if (LEDSTatus == LOW) {
        digitalWrite(LED, HIGH);
    }
    else {
        digitalWrite(LED, LOW);
    }

    Serial.print("  LED STATUS (by Loreto): "); Serial.println(LEDSTatus);
    delay(3000); // in mSec

}

