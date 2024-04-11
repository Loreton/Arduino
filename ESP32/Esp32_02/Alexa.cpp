/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/
#define ESP32_ALEXA

#include "Esp32_02.h"







void alexaSetup() {

    // By default, fauxmoESP creates it's own webserver on the defined port
    // The TCP port must be 80 for gen3 devices (default is 1901)
    // This has to be done before the call to enable()
    fauxmo.createServer(true); // not needed, this is the default value
    fauxmo.setPort(80); // This is required for gen3 devices

    // You have to call enable(true) once you have a WiFi connection
    // You can enable or disable the library at any moment
    // Disabling it will prevent the devices from being discovered and switched
    fauxmo.enable(true);
    // You can use different ways to invoke alexa to modify the devices state:
    // "Alexa, turn lamp two on"

    // Add virtual devices
    fauxmo.addDevice(LAMP_1);
    fauxmo.addDevice(LAMP_2);

    fauxmo.onSetState([](unsigned char device_id, const char * device_name, bool state, unsigned char value) {
    // Callback when a command from Alexa is received. 
    // You can use device_id or device_name to choose the element to perform an action onto (relay, LED,...)
    // State is a boolean (ON/OFF) and value a number from 0 to 255 (if you say "set kitchen light to 50%" you will receive a 128 here).
    // Just remember not to delay too much here, this is a callback, exit as soon as possible.
    // If you have to do something more involved here set a flag and process it in your main loop.
        
    Serial.printf("[MAIN] Alexa Device #%d (%s) state: %s value: %d\n", device_id, device_name, state ? "ON" : "OFF", value);
    if ( (strcmp(device_name, LAMP_1) == 0) ) {
        // this just sets a variable that the main loop() does something about
        Serial.println("RELAY 1 switched by Alexa");
        //digitalWrite(RELAY_PIN_1, !digitalRead(RELAY_PIN_1));
        if (state) {
          digitalWrite(RELAY_PIN_1, LOW);
        } else {
          digitalWrite(RELAY_PIN_1, HIGH);
        }
    }
    if ( (strcmp(device_name, LAMP_2) == 0) ) {
        // this just sets a variable that the main loop() does something about
        Serial.println("LED switched by Alexa");
        if (state) {
          digitalWrite(LED, HIGH);
        } else {
          digitalWrite(LED, LOW);
        }
        Serial.printf("LED: %d\n", digitalRead(LED));
        sendTelegramMessage(Esp32_test, "LED switched by Alexa");
    }
    });

}


