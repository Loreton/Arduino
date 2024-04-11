/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/
#include <RCSwitch.h>

#include "Esp32_03.h"


RCSwitch mySwitch = RCSwitch();




void mySwitchSetup() {
    mySwitch.enableReceive(RF_RECEIVER);  // Receiver on interrupt 0 => that is pin #2

}



void check_mySwitch() {
    if (mySwitch.available()) {
        /*Serial.print("Received ");
        Serial.print( mySwitch.getReceivedValue() );
        Serial.print(" / ");
        Serial.print( mySwitch.getReceivedBitlength() );
        Serial.print("bit ");
        Serial.print("Protocol: ");
        Serial.println( mySwitch.getReceivedProtocol() );*/
        if (mySwitch.getReceivedValue()==6819768) {
            digitalWrite(RELAY_PIN_1, !digitalRead(RELAY_PIN_1));
        }
        if (mySwitch.getReceivedValue()==9463928) {
            digitalWrite(LED, !digitalRead(LED));
        }
        delay(600);
        mySwitch.resetAvailable();
    }

}
