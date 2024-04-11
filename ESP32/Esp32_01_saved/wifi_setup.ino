/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/


#define ESP32_MAIN

#include <Arduino.h>
#include "Esp32_01.h"

#ifdef ESP32
  #include <WiFi.h>
  #define RF_RECEIVER 13
  #define RELAY_PIN_1 16
  #define LED 17
  #define PULSANTE 18
#else
  #include <ESP8266WiFi.h>
  #define RF_RECEIVER 5
  #define RELAY_PIN_1 4
  #define LED 2
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

#define BOTtoken "7049225401:AAFG0viCNMMSAPIfXK8Pdj-mtc10tMHVQn8"  // your Bot Token (Get from Botfather)
#define CHAT_ID "-4163250400"


void checkPulsante(int pin);

// fauxmoESP fauxmo;

// RCSwitch mySwitch = RCSwitch();

// // ===================== definizioni per  Telegram BOT

// // Use @myidbot to find out the chat ID of an individual or a group
// // Also note that you need to click "start" on a bot before it can
// // message you

WiFiClientSecure client;
UniversalTelegramBot bot(BOTtoken, client);

// // Checks for new messages every 1 second.
// int botRequestDelay = 1000;
// unsigned long lastTimeBotRan;
// void changePin(int pin, int req_state, const String chat_id="");

// const int LED = 2;
// bool ledState = LOW;
// ===================== definizioni per  Telegram BOT

// int val=0;

// Handle what happens when you receive new messages
void handleNewMessages(int numNewMessages) {
    Serial.print("handleNewMessages: ");
    Serial.println(String(numNewMessages));

    for (int i=0; i<numNewMessages; i++) {
        // Chat id of the requester
        String chat_id = String(bot.messages[i].chat_id);
        Serial.print("chat_id: ");Serial.println(chat_id);
        Serial.print("CHAT_ID: ");Serial.println(CHAT_ID);
        if ((chat_id != CHAT_ID) and (chat_id != "129190557")) {
            bot.sendMessage(chat_id, "Unauthorized user", "");
            continue;
        }

        // Print the received message
        String text = bot.messages[i].text;
        Serial.print("received msg: ");Serial.println(text);
        int index=text.indexOf("@");
        text=text.substring(0, index);
        Serial.print("received msg: ");Serial.println(text);

        String from_name = bot.messages[i].from_name;

        if (text == "/start") {
            String welcome = "Welcome, " + from_name + ".\n";
            welcome += "Use the following commands to control your outputs.\n\n";
            welcome += "/led_on to turn GPIO ON \n";
            welcome += "/led_off to turn GPIO OFF \n";
            welcome += "/state to request current GPIO state \n";
            bot.sendMessage(chat_id, welcome, "");
        } else if (text == "/led_on") {
            bot.sendMessage(chat_id, "LED state set to ON", "");
            digitalWrite(LED, HIGH);
        } else if (text == "/led_off") {
            bot.sendMessage(chat_id, "LED state set to OFF", "");
            digitalWrite(LED, LOW);
        } else if (text == "/state") {
            if (digitalRead(LED)){
                bot.sendMessage(chat_id, "LED is ON", "");
            } else {
                bot.sendMessage(chat_id, "LED is OFF", "");
            }
        }

    }
}




// Wi-Fi Connection
void wifiSetup() {
    // Set WIFI module to STA mode
    WiFi.mode(WIFI_STA);

    // Connect
    Serial.printf("[WIFI] Connecting to %s ", WIFI_SSID);
    WiFi.begin(WIFI_SSID, WIFI_PASS);

    #ifdef ESP32
        client.setCACert(TELEGRAM_CERTIFICATE_ROOT); // Add root certificate for api.telegram.org
    #endif

    // Wait
    while (WiFi.status() != WL_CONNECTED) {
        Serial.print(".");
        delay(100);
    }
    Serial.println();

    // Connected!
    Serial.printf("[WIFI] STATION Mode, SSID: %s, IP address: %s\n", WiFi.SSID().c_str(), WiFi.localIP().toString().c_str());
}

void setup() {
  // Init serial port and clean garbage
  Serial.begin(SERIAL_BAUDRATE);
  Serial.println();

  // Wi-Fi connection
  wifiSetup();

  // LED
  pinMode(RELAY_PIN_1, OUTPUT);
  digitalWrite(RELAY_PIN_1, HIGH);

  pinMode(LED, OUTPUT);
  digitalWrite(LED, HIGH);

  pinMode(PULSANTE, INPUT);
  digitalWrite(PULSANTE, HIGH); 
  
  mySwitch.enableReceive(RF_RECEIVER);  // Receiver on interrupt 0 => that is pin #2

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
    }
  });

}


void telegramLoop() {
    if (millis() > lastTimeBotRan + botRequestDelay)  {
        int numNewMessages = bot.getUpdates(bot.last_message_received + 1);

        while(numNewMessages) {
            Serial.println("got response");
            handleNewMessages(numNewMessages);
            numNewMessages = bot.getUpdates(bot.last_message_received + 1);
        }

        lastTimeBotRan = millis();
    }
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

    checkPulsante(PULSANTE);



    telegramLoop();
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