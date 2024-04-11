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
#include "time.h"




#define SERIAL_BAUDRATE 115200

#define LAMP_1 "LED01"
#define LAMP_2 "LED02"
#define Esp32_test "-4163250400" // chat_id


void wifiSetup(void);
void alexaSetup(void);
void mySwitchSetup(void);
void setupTouch(int pin);
void telegramSetup(void);
void ntp_timeSetup(void);




void printLocalTime(void);
struct tm getTime(void);
void checkPulsante(int pin);

bool check_touchIrq();

void telgramHandle(void);
void check_mySwitch(void);
void sendTelegramMessage(String chat_id, String text_msg);





#ifdef ESP32_ALEXA
    fauxmoESP fauxmo;
#endif

#ifdef  ESP32_MAIN
    extern fauxmoESP fauxmo;
#endif


// #else