/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/

#include <Arduino.h>

#ifdef ESP32
  #include <WiFi.h>
  #define RF_RECEIVER 13
  #define RELAY_PIN_1 16
  #define LED 17
  #define PULSANTE 18
#endif
  #define TOUCH_02 2

#include <ArduinoJson.h>
#include "fauxmoESP.h"



#define SERIAL_BAUDRATE 115200

#define LAMP_1 "LED01"
#define LAMP_2 "LED02"
#define Esp32_test "-4163250400" // chat_id



void checkPulsante(int pin);

void setupTouch(int pin);
bool check_touchIrq();

void telegramSetup(void);
void telgramHandle(void);
void wifiSetup(void);
void alexaSetup(void);
void check_mySwitch(void);
void mySwitchSetup(void);
void sendTelegramMessage(String chat_id, String text_msg);





#ifdef ESP32_ALEXA
    fauxmoESP fauxmo;
#endif

#ifdef  ESP32_MAIN
    extern fauxmoESP fauxmo;
#endif


// #else