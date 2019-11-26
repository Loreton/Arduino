// -----------SOLO per toneAC -------------------------------------------------
// Syntax:
//      toneAC( frequency [, volume [, length [, background ]]] ) - Play a note.
//          frequency   - Play the specified frequency indefinitely, turn off with toneAC().
//          volume      - [optional] Set a volume level. (default: 10, range: 0 to 10 [0 = off])
//          length      - [optional] Set the length to play in milliseconds. (default: 0 [forever], range: 0 to 2^32-1)
//          background  - [optional] Play note in background or pause till finished? (default: false, values: true/false)
//          toneAC()    - Stop output.
//          noToneAC()  - Same as toneAC().
//
// Connect your piezo buzzer (without internal oscillator) or speaker to these pins:
//   Pins  9 & 10 - ATmega328, ATmega128, ATmega640, ATmega8, Uno, Leonardo, etc.
//   Pins 11 & 12 - ATmega2560/2561, ATmega1280/1281, Mega
//   Pins 12 & 13 - ATmega1284P, ATmega644
//   Pins 14 & 15 - Teensy 2.0
//   Pins 25 & 26 - Teensy++ 2.0
// Be sure to include an inline 100 ohm resistor on one pin as you normally do when connecting a piezo or speaker.
// ---------------------------------------------------------------------------


#ifndef toneAC_h
    // #include <toneAC.h>
#endif







// https://www.youtube.com/watch?v=ptig62mLN84
#define ON HIGH
#define OFF LOW
#define LED_INTERVAL 2000
int led_interval; // ms

int pumpPin   = 4;
int buzzerPin = 5;
int relePin   = 6;
int ledPin    = 13;

byte ledState = 0;
unsigned long time_for_LED;
unsigned long time_for_BEEP;
int counter=0;
int DELAY, FREQ, DURATION, VOLUME ;

void lnprint(char *msg, unsigned long value, const char *s2="");

int BEEP[] = {
                 5, 2000, 500,  1,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 2,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 3,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 4,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 5,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 6,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 7,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 8,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 9,  // delaySec, frequency, duration, volume(only with tone_AC)
                60, 2000, 1000, 9,  // delaySec, frequency, duration, volume(only with tone_AC)
                10, 2000, 1000, 9   // delaySec, frequency, duration, volume(only with tone_AC)
            };



#define nCounters  (sizeof(BEEP)/sizeof(int)/4) - 1

void setup() {
    Serial.begin(9600);
    pinMode(ledPin, OUTPUT);
    pinMode(pumpPin, INPUT_PULLUP);
    pinMode(buzzerPin, OUTPUT);
    pinMode(relePin, OUTPUT);
    Serial.println("Starting...");
    lnprint("numero di counters...: ", nCounters , "\n");
    setValues(counter);
    led_interval = LED_INTERVAL;
}


void loop_test() {
    for (int freq=2000; freq<=3000; freq+=100) {
        lnprint("freq: ", freq, "\n");
        tone(buzzerPin, freq, 1000);
        delay(1000*1.3); // mandatory in quanto la funzione tone non è bloccante.
        noTone(buzzerPin);
    }
}

void loop() {
    unsigned long now = millis();
    if (millis() > time_for_LED) {
        time_for_LED = millis() + (unsigned long) led_interval;
        ledState = !ledState;
    }
    digitalWrite(ledPin, ledState); // blinking LED


    if (now > time_for_BEEP) {
        byte pumpState = !digitalRead(pumpPin); // logica inversa.

        if (pumpState==ON) {
            led_interval = LED_INTERVAL/6; // velocizza lampeggio per indicare pompa accesa

            lnprint("pump Status: ", pumpState, " - BEEPing - ");
            lnprint("counter: ", counter, " - ");
            lnprint("frequency: ", FREQ, " - ");

            // emissione BEEP
            digitalWrite(relePin, ON); // Activate Rele
            #if defined(toneAC_h)
                toneAC(FREQ, VOLUME, DURATION, true); // Play thisNote at full volume for noteDuration in the background.
                delay(DURATION*1.3); // mandatory in quanto la funzione tone non è bloccante.
                noToneAC();
                lnprint("duration: ", DURATION, " - ");
                lnprint("volume: ", VOLUME, "\n");
            #else
                tone(buzzerPin, FREQ, DURATION);
                delay(DURATION*1.3); // mandatory in quanto la funzione tone non è bloccante.
                noTone(buzzerPin);
                lnprint("duration: ", DURATION, "\n");
            #endif
            digitalWrite(relePin, OFF); // Activate Rele
            // increment counter
            if (counter<nCounters) counter++;
            setValues(counter);

        }
        else {
            counter=0; // reset
            led_interval = LED_INTERVAL;
            setValues(counter);
        }
    }
} // end loop()


void setValues(int count) {
    int index=count*4;
    DELAY    = BEEP[index];
    FREQ     = BEEP[index+1];
    DURATION = BEEP[index+2];
    VOLUME   = BEEP[index+3];
    time_for_BEEP = millis() + (unsigned long) DELAY*1000;
    lnprint("next check for pump status in: ", DELAY, " Sec\n");
}



void lnprint(char *msg, unsigned long value, const char *s2) {
    Serial.print(msg);
    Serial.print(value);
    Serial.print(s2);
}



