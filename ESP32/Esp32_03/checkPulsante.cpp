/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/
#include "Esp32_03.h"

void checkPulsante(int pin) {
    int state = digitalRead(pin);   // read the input pin
    if (state==0) {
        Serial.println("PULSANTE pigiato");
        digitalWrite(LED, !digitalRead(LED));
        Serial.printf("LED: %d\n", digitalRead(LED));
    }
}


