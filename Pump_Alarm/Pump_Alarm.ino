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
#define LED_INTERVAL_DEFAULT 2000
#define HORN_TIME 4000
int led_interval; // ms

int Buzzer       =  2;
int pumpPin      =  3;
int pumpOnOff    =  4; // comanda il sonoff che spegne la pompa.
int HornRele     =  5;
int AuxRele      =  6;
int ledPin       = 13;

byte ledState = 0;
unsigned long time_for_LED;
unsigned long time_for_BEEP;
int counter=0;
int DELAY, FREQ, DURATION, VOLUME ;

void lnprint(char *msg, unsigned long value, const char *s2="");

int BEEP[] = { // delaySec, frequency, duration, volume(only with tone_AC)
                     5,         2000,    500,       1,
                    10,         2000,    1000,      2,
                    10,         2000,    1000,      3,
                    10,         2000,    1000,      4,
                    10,         2000,    1000,      5,
                    10,         2000,    1000,      6,
                    10,         2000,    1000,      7,
                    10,         2000,    1000,      8,
                    10,         2000,    1000,      9,
                    10,         2000,    1000,      9,
                    10,         2000,    1000,      9,
            };


#define nCounters  (sizeof(BEEP)/sizeof(int)/4) - 1

void setup() {
    Serial.begin(9600);
    pinMode(pumpPin, INPUT_PULLUP);
    pinMode(ledPin, OUTPUT);
    pinMode(Buzzer   , OUTPUT);
    pinMode(pumpOnOff, OUTPUT);
    pinMode(HornRele, OUTPUT);
    pinMode(AuxRele, OUTPUT);
    Serial.println("Starting...");
    lnprint("numero di counters...: ", nCounters , "\n");
    setValues(counter);
    led_interval = LED_INTERVAL_DEFAULT;
}


void tone_test() {
    for (int freq=2000; freq<=3000; freq+=100) {
        lnprint("freq: ", freq, "\n");
        tone(Buzzer   , freq, 1000);
        delay(1000*1.3); // mandatory in quanto la funzione tone non è bloccante.
        noTone(Buzzer   );
    }
}


void loop() {
    unsigned long now = millis();

    // LED on/off
    if (now > time_for_LED) {
        time_for_LED = now + (unsigned long) led_interval;
        ledState = !ledState;
    }
    digitalWrite(ledPin, ledState); // blinking LED

    // check pump state
    byte pumpState = !digitalRead(pumpPin); // logica inversa.

    switch(pumpState) {
        case ON:
            if (now>time_for_BEEP || counter==0){
                led_interval = LED_INTERVAL_DEFAULT/6; // velocizza lampeggio per indicare pompa accesa

                lnprint("pump Status: ", pumpState, " - BEEPing - ");
                lnprint("counter: ", counter, " - ");
                lnprint("frequency: ", FREQ, " - ");

                // emissione BEEP
                tone(Buzzer   , FREQ, DURATION);

                // Siccome devo far suonare anche la sirena, ed il tone non blocca il programma,
                // posso utilizzare il tempo della sirena come delay per il tono
                digitalWrite(HornRele, ON); // Pigia il pulsante del sonoff
                delay(HORN_TIME);
                digitalWrite(HornRele, OFF); // Rilascia il pulsante del sonoff

                // delay(DURATION*1.3); // mandatory in quanto la funzione tone non è bloccante.
                noTone(Buzzer   );
                lnprint("duration: ", DURATION, "\n");




                digitalWrite(AuxRele, ON); // Pigia il pulsante del sonoff
                delay(2000);
                digitalWrite(AuxRele, OFF); // Rilascia il pulsante del sonoff

                // increment counter
                if (counter<nCounters)  {
                    counter++;
                }
                else {
                    digitalWrite(pumpOnOff, OFF); // Rilascia il pulsante del sonoff
                    delay(2000);
                    digitalWrite(pumpOnOff, ON); // Pigia il pulsante del sonoff
                }
                setValues(counter);
            }
            break;

        default:
            // tone to advice the pump is off only it it was ON
            if (counter > 0) {
                Serial.println("pump has been turned off.");
                int _duration=300;
                for (int i=0; i<=2; i++) {
                    tone(Buzzer   , FREQ, _duration);
                    delay(_duration*1.3); // mandatory in quanto la funzione tone non è bloccante.
                    noTone(Buzzer   );
                }
                counter=0; // reset
                led_interval = LED_INTERVAL_DEFAULT; // reset LED interval
                setValues(counter); // reset Buzzer data
            }
            break;
        }

} // end loop()


void setValues(int count) {
    int index=count*4;
    DELAY    = BEEP[index];
    FREQ     = BEEP[index+1];
    DURATION = BEEP[index+2];
    VOLUME   = BEEP[index+3];
    time_for_BEEP = millis() + (unsigned long) DELAY*1000;
    lnprint("next BEEP, if pump still ON, in: ", DELAY, " Sec\n");
}



void lnprint(char *msg, unsigned long value, const char *s2) {
    Serial.print(msg);
    Serial.print(value);
    Serial.print(s2);
}



