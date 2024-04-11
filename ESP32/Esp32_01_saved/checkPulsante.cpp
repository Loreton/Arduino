/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/

#include <Arduino.h>
#include "Esp32_01.h"

void checkPulsante(int pin) {
    Serial.printf("VAL: %d\n", val);
    int state = digitalRead(pin);   // read the input pin
    // Serial.printf("PULSANTE: %d\n", state);
    if (state==0) {
        Serial.println("PULSANTE pigiato");
        digitalWrite(LED, !digitalRead(LED));
        Serial.printf("LED: %d\n", digitalRead(LED));
    }
}


// void changePin(int pin, req_state,  chat_id) {
//     int state = digitalRead(pin);   // read the input pin
//     if (state != req_state) {
//         digitalWrite(pin, req_state);
//         if (chat_id > 0) {
//             bot.sendMessage(chat_id, "LED state changed", "");
//         }
//     }
// }

// void pinState(pin) {
//     state = digitalRead(PULSANTE);   // read the input pin
//     Serial.printf("LED: %d\n", digitalRead(LED));

// }

// bool togglePin(pin) {
//     digitalWrite(pin, !digitalRead(pin));
//         Serial.printf("LED: %d\n", digitalRead(LED));
//     }
// }
//         // if (millis() - last > 1000) {
        //     last = millis();
        // }