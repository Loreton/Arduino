// https://www.youtube.com/watch?v=ptig62mLN84

#define ON HIGH
#define OFF LOW
#define LED_INTERVAL 2000
int led_interval; // ms
int beep_interval = 1000; // ms
int ledPin = 13;
int pumpPin = 4;
int buzzerPin = 5;
// int pumpState;
byte ledState = 0;
byte pumpState;
unsigned long time_for_LED;
unsigned long time_for_beep=0;
unsigned long now;
// unsigned long beepMS;
unsigned long time_now;
unsigned long time_prev;
unsigned long time_next;
unsigned long beep_time;
unsigned long time_for_BEEP;
int beepMS;
int counter=0;
int counter_prev=-1;
void lnprint(char *msg, unsigned long value, const char *s2="");
// secondi dall'acensione della pompa in cui bisogna fare beep
// man mano che passa il tempo il delay si accorcia
int beepDelay[] = {
  // 1, 5, 5
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  // 2, 60, 50, 40, 30, 20, 10, 5, 5
};

// durata del beep in mS
int durataNote[] = {
  500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500
};
int freqNote[] = {
  200, 400, 600, 800, 1000, 1400, 1800, 2000, 2500, 2500, 2500, 2500
};

int volumeNote[] = {
  1, 2, 3, 4, 5, 6, 7, 8, 9
};

int BEEP[] = {
                2000, 500,  1,  // frequency, duration, volume
                2000, 1000, 2,  // frequency, duration, volume
                2100, 1000, 3,  // frequency, duration, volume
                2200, 1000, 4,  // frequency, duration, volume
                2300, 1000, 5,  // frequency, duration, volume
                2400, 1000, 6,  // frequency, duration, volume
                2500, 1000, 7,  // frequency, duration, volume
                2600, 1000, 8,  // frequency, duration, volume
                2700, 1000, 9,  // frequency, duration, volume
                2800, 1000, 9,  // frequency, duration, volume
                2900, 1000, 9,  // frequency, duration, volume
            }



// #define nCounters  (sizeof(beepDelay)/sizeof(int))
#define nCounters  (sizeof(BEEP)/sizeof(int)/3)
// #define nVolumes   (sizeof(volumeNote)/sizeof(int))
// #define ndurata    (sizeof(durataNote)/sizeof(int))

void setup() {
    Serial.begin(9600);
    pinMode(ledPin, OUTPUT);
    pinMode(pumpPin, INPUT_PULLUP);
    pinMode(buzzerPin, OUTPUT);
    Serial.println("Starting...");
    lnprint("numero di delay...: ", nCounters , "\n");
    time_for_BEEP = millis() + (unsigned long) beepDelay[counter]*1000;
    led_interval = LED_INTERVAL;
}


void loop() {
    unsigned long now = millis();
    if (millis() > time_for_LED) {
        time_for_LED = millis() + (unsigned long) led_interval;
        ledState = !ledState;
        lnprint("LED Status: ", ledState, "\n");
    }
    digitalWrite(ledPin, ledState); // blinking LED


    if (now > time_for_BEEP) {
        pumpState = !digitalRead(pumpPin); // logica inversa.

        if (pumpState==ON) {
            led_interval = LED_INTERVAL/6;

            tone(buzzerPin, freqNote[counter], durataNote[counter]);
            delay(durataNote[counter]*1.3);
            noTone(buzzerPin);

            if (counter<(nCounters-1)) counter++;
            int beepMS = (unsigned long) beepDelay[counter]*1000;
            time_for_BEEP = now + (unsigned long) beepMS;

            lnprint("pump Status: ", pumpState, " - BEEPing - ");
            lnprint("freq: ", freqNote[counter], " - ");
            lnprint("length: ", durataNote[counter], " - ");
            lnprint("counter: ", counter, " - ");
            lnprint("next beep in: ", beepMS, "\n");

            // lnprint("counter: ", counter, " - ");
            // lnprint("next beep in: ", beepMS, "\n");
            // // lnprint("beepMS: ", beepMS, " - ");
            // lnprint("now: ", now, " - ");

                // counter_prev=counter;
        }
        else {
            counter=0; // reset
            led_interval = 1000;
        }
    }
} // end loop()



#if 0
int readPumpPin() {
    int _status = OFF;
    if (millis() > time_for_LED) {
        time_for_LED = millis() + (unsigned long) INTERVAL;
        ledState = !ledState;
        lnprint("LED Status: ", ledState, "\n");
        _status = !digitalRead(pumpPin); // logica inversa.
    }
    digitalWrite(ledPin, ledState); // blinking LED
    return _status;
}

// 2. Se OFF allora azzera tutti i counter e ritorna
void processPump(void) {

    if (millis() > beep_time) {
        lnprint("counter: ", counter, " - ");
        lnprint("beep time reached: ", beepMS, "\n");

        tone(buzzerPin, 1000, durataNote[counter]);
        delay(durataNote[counter]*1.3);
        noTone(buzzerPin);

        counter++;
    }

}

unsigned long getBeepTime(unsigned long curr_time) {
    unsigned long _time;
    unsigned long now = millis();
    int beepMS = (unsigned long) beepDelay[counter]*1000;

    // lnprint("now: ", now, " - ");
    // lnprint("counter: ", counter, "\n");
    // lnprint("beepMS: ", beepMS, " - ");
    // lnprint("beep time: ", curr_time, "\n");

    if (counter != counter_prev) {
        _time = now + (unsigned long) beepMS;
        lnprint("counter: ", counter, " - ");
        lnprint("beepMS: ", beepMS, " - ");
        lnprint("now: ", now, " - ");
        lnprint("beep time: ", beep_time, "\n");
        counter_prev=counter;
    }
    else {
        _time = curr_time;
    }

    return _time;
}
#endif

void lnprint(char *msg, unsigned long value, const char *s2) {
    Serial.print(msg);
    Serial.print(value);
    Serial.print(s2);
}