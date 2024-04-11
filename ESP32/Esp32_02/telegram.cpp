/*
 * Rui Santos 
 * Complete Project Details http://randomnerdtutorials.com
*/

#include <UniversalTelegramBot.h>   // Universal Telegram Bot Library written by Brian Lough: https://github.com/witnessmenow/Universal-Arduino-Telegram-Bot
#include <WiFiClientSecure.h>


#define ESP32_TELEGRAM
#include "Esp32_02.h"

// ===================== definizioni per  Telegram BOT
#define BOTtoken "7049225401:AAFG0viCNMMSAPIfXK8Pdj-mtc10tMHVQn8"  // your Bot Token (Get from Botfather)
#define CHAT_ID "-4163250400"
#define Esp32_test "-4163250400"

WiFiClientSecure client;
UniversalTelegramBot bot(BOTtoken, client);


// Checks for new messages every 1 second.
int botRequestDelay = 1000;
unsigned long lastTimeBotRan;

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



void telegramSetup() {
    #ifdef ESP32
        client.setCACert(TELEGRAM_CERTIFICATE_ROOT); // Add root certificate for api.telegram.org
    #endif
}


void telgramHandle() {
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


void sendTelegramMessage(String chat_id, String text_msg) {
     bot.sendMessage(chat_id, text_msg, "");
}