/*
  Rui Santos
  Complete project details at https://RandomNerdTutorials.com/esp32-save-data-permanently-preferences/

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files.

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
*/

#include <Preferences.h>
#include "WiFi.h"

Preferences preferences;

String ssid;
String password;
String nsCredentials="wifiCredentials";




// const char * nsCredentials="wifiCredentials";

void writeCredentials() {
  ssid = "Casetta";
  password = "Casetta.Adsl";

  preferences.begin(nsCredentials.c_str(), false);
  preferences.putString("ssid", ssid);
  preferences.putString("password", password);
  preferences.end();

  Serial.println("Network Credentials Saved using Preferences");
  Serial.print("ssid: ");Serial.println(ssid);
  Serial.print("password: ");Serial.println(password);
}




bool readCredentials() {
    bool found_it=true;

    preferences.begin(nsCredentials.c_str(), true);

    ssid = preferences.getString("ssid", "");
    password = preferences.getString("password", "");

    if (ssid == "" || password == "") {
        Serial.println("No values found for ssid or password");
        found_it=false;
    } else {
        Serial.println("ssid and password values have been read from flash memory");
        found_it=true;
    }

    preferences.end();
    Serial.print("ssid: ");Serial.println(ssid);
    Serial.print("password: ");Serial.println(password);
    return found_it;
}






void setup() {
    Serial.begin(115200);
    Serial.println("waiting 5 seconds ..");
    delay(5000);


    // Serial.print("size Class: ");Serial.println(sizeof(xnsCredentials));
    // Serial.print("size Class: ");Serial.println(sizeof(nsCredentials));
    if (!readCredentials()) { // se falso ....
        writeCredentials();
    }

    // Connect to Wi-Fi
    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid.c_str(), password.c_str());
    Serial.print("Connecting to WiFi ..");
    while (WiFi.status() != WL_CONNECTED) {
      Serial.print('.');
      delay(1000);
    }
    Serial.println(WiFi.localIP());
}

void loop() {
  // put your main code here, to run repeatedly:
}


