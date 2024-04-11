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

#include "fauxmoESP.h"
#include <RCSwitch.h>
#include <WiFiClientSecure.h>
#include <UniversalTelegramBot.h>   // Universal Telegram Bot Library written by Brian Lough: https://github.com/witnessmenow/Universal-Arduino-Telegram-Bot
#include <ArduinoJson.h>


#define SERIAL_BAUDRATE 115200

#define WIFI_SSID "Casetta"
#define WIFI_PASS "Casetta.Adsl"

#define LAMP_1 "LED01"
#define LAMP_2 "LED02"

void checkPulsante(int pin);



#ifdef ESP32_MAIN
    int val=0;
    fauxmoESP fauxmo;

    RCSwitch mySwitch = RCSwitch();

    // Checks for new messages every 1 second.
    int botRequestDelay = 1000;
    unsigned long lastTimeBotRan;
#else
    extern int val;

    extern fauxmoESP fauxmo;
    extern RCSwitch mySwitch;


    // Checks for new messages every 1 second.
    extern int botRequestDelay;
    extern unsigned long lastTimeBotRan;
#endif
