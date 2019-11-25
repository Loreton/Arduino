// https://www.youtube.com/watch?v=ptig62mLN84

#define ON HIGH
#define OFF LOW
#define INTERVAL 1000 // ms
int beep_interval = 1000; // ms
int ledPin = 13;
int pumpPin = 3;
int buzzerPin = 2;
// int pumpState;
byte ledState = 0;
byte pumpCurrState;
unsigned long time_for_LED;
unsigned long time_for_beep=0;
unsigned long now;
// unsigned long beepMS;
unsigned long time_now;
unsigned long time_prev;
unsigned long time_next;
unsigned long beep_time;
unsigned long next_beep_time;
int beepMS;
int counter=0;
int counter_prev=-1;
void lnprint(char *msg, unsigned long value, const char *s2="");
// secondi dall'acensione della pompa in cui bisogna fare beep
// man mano che passa il tempo il delay si accorcia
int beepDelay[] = {
  2, 60, 50, 40, 30, 20, 10, 5, 5
};

// durata del beep in mS
int durataNote[] = {
  500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500
};

int volumeNote[] = {
  1, 2, 3, 4, 5, 6, 7, 8, 9
};


void setup() {
    Serial.begin(9600);
    pinMode(ledPin, OUTPUT);
    pinMode(pumpPin, INPUT_PULLUP);
    pinMode(buzzerPin, OUTPUT);
    Serial.println("Starting...");
    next_beep_time = millis() + (unsigned long) beepDelay[counter]*1000;
}


void loop() {
    // int pumpState = readPumpPin();
    // if (pumpState==ON) {
    if (readPumpPin()==ON) {
        pumpCurrState = ON;
        lnprint("pump Status: ", pumpCurrState, "\n");
        // update next_beep_time
        unsigned long now = millis();
        // lnprint("counter: ", counter, " - ");
        // lnprint("counter_prev: ", counter_prev, "\n");
        // if (counter != counter_prev) {
        // }

        if (now > next_beep_time) {
            counter++;
            int beepMS = (unsigned long) beepDelay[counter]*1000;
            next_beep_time = now + (unsigned long) beepMS;
            lnprint("counter: ", counter, " - ");
            lnprint("beepMS: ", beepMS, " - ");
            lnprint("now: ", now, " - ");
            lnprint("next beep time: ", next_beep_time, "\n");
            tone(buzzerPin, 1000, durataNote[counter]);
            delay(durataNote[counter]*1.3);
            noTone(buzzerPin);

            // counter_prev=counter;
        }
    }

    else {
        counter=0; // reset
        lnprint("pump Status: ", 0, "\n");
        // counter_prev=-1; // reset
        // next_beep_time = getBeepTime(next_beep_time);
    }

}


int readPumpPin() {
    int _status = OFF;
    if (millis() > time_for_LED) {
        time_for_LED = millis() + (unsigned long) INTERVAL;
        ledState = !ledState;
        lnprint("LED Status: ", ledState, " - ");
        _status = !digitalRead(pumpPin); // logica inversa.
    }
    digitalWrite(ledPin, ledState); // blinking LED
    return _status;
}

#if 0
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