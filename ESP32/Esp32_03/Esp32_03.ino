/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/

#define ESP32_MAIN
#include "Esp32_03.h"


// RCSwitch mySwitch = RCSwitch();
// fauxmoESP fauxmo;




void setup() {
    // Init serial port and clean garbage
    Serial.begin(SERIAL_BAUDRATE);
    Serial.println();

    // Wi-Fi connection
    wifiSetup();
    telegramSetup();
    alexaSetup();
    mySwitchSetup();


    // LED
    pinMode(RELAY_PIN_1, OUTPUT);
    digitalWrite(RELAY_PIN_1, HIGH);

    pinMode(LED, OUTPUT);
    digitalWrite(LED, HIGH);

    pinMode(PULSANTE, INPUT);
    digitalWrite(PULSANTE, HIGH);

    // pinMode(TOUCH_02, INPUT);
    // digitalWrite(TOUCH_02, HIGH);

    setupTouch(TOUCH_02);

    ntp_timeSetup();
    struct tm now=getTime();
    Serial.print("ORA: ");Serial.println(&now, "%A, %B %d %Y %H:%M:%S");

}



void loop() {
    // fauxmoESP uses an async TCP server but a sync UDP server
    // Therefore, we have to manually poll for UDP packets
    fauxmo.handle();

    static unsigned long last = millis();
    if (millis() - last > 50000) {
        Serial.printf("[MAIN] Free heap: %d bytes\n", ESP.getFreeHeap());
        last = millis();
    }

    check_mySwitch();


    telgramHandle();

    checkPulsante(PULSANTE);


    bool xx = check_touchIrq();
    if(xx) {
        Serial.println("Touch 2 detected - main");
    }
}


// void checkPulsante_interno(int pin) {
//     int state = digitalRead(pin);   // read the input pin
//     // Serial.printf("PULSANTE: %d\n", state);
//     if (state==0) {
//         Serial.println("PULSANTE pigiato");
//         digitalWrite(LED, !digitalRead(LED));
//         Serial.printf("LED: %d\n", digitalRead(LED));
//     }
// }


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