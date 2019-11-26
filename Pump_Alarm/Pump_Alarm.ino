// https://www.youtube.com/watch?v=ptig62mLN84

#define ON HIGH
#define OFF LOW
#define LED_INTERVAL 2000
int led_interval; // ms
// int beep_interval = 1000; // ms
int ledPin = 13;
int pumpPin = 4;
int buzzerPin = 5;
// int pumpState;
byte ledState = 0;
byte pumpState;
unsigned long time_for_LED;
// unsigned long time_for_beep=0;
unsigned long now;
// unsigned long beepMS;
// unsigned long time_now;
// unsigned long time_prev;
// unsigned long time_next;
// unsigned long beep_time;
unsigned long time_for_BEEP;
int beepMS;
int counter=0;
// int counter_prev=-1;
void lnprint(char *msg, unsigned long value, const char *s2="");
// secondi dall'acensione della pompa in cui bisogna fare beep
// man mano che passa il tempo il delay si accorcia
// int beepDelay[] = {
//   // 1, 5, 5
//   1, 2, 3, 4, 5, 6, 7, 8, 9, 10
//   // 2, 60, 50, 40, 30, 20, 10, 5, 5
// };

// // durata del beep in mS
// int durataNote[] = {
//   500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500
// };
// int freqNote[] = {
//   200, 400, 600, 800, 1000, 1400, 1800, 2000, 2500, 2500, 2500, 2500
// };

// int volumeNote[] = {
//   1, 2, 3, 4, 5, 6, 7, 8, 9
// };

int DELAY ;
int FREQ ;
int DURATION ;
int VOLUME ;

int BEEP[] = {
                 5, 2000, 500,  1,  // delaySec, frequency, duration, volume
                60, 2000, 1000, 2,  // delaySec, frequency, duration, volume
                60, 2100, 1000, 3,  // delaySec, frequency, duration, volume
                60, 2200, 1000, 4,  // delaySec, frequency, duration, volume
                60, 2300, 1000, 5,  // delaySec, frequency, duration, volume
                60, 2400, 1000, 6,  // delaySec, frequency, duration, volume
                60, 2500, 1000, 7,  // delaySec, frequency, duration, volume
                60, 2600, 1000, 8,  // delaySec, frequency, duration, volume
                60, 2700, 1000, 9,  // delaySec, frequency, duration, volume
                60, 2800, 1000, 9,  // delaySec, frequency, duration, volume
                10, 2900, 1000, 9  // delaySec, frequency, duration, volume
            };



#define nCounters  (sizeof(BEEP)/sizeof(int)/4) - 1

void setup() {
    Serial.begin(9600);
    pinMode(ledPin, OUTPUT);
    pinMode(pumpPin, INPUT_PULLUP);
    pinMode(buzzerPin, OUTPUT);
    Serial.println("Starting...");
    lnprint("numero di counters...: ", nCounters , "\n");
    setValues(counter);
    led_interval = LED_INTERVAL;
}


void loop() {
    unsigned long now = millis();
    if (millis() > time_for_LED) {
        time_for_LED = millis() + (unsigned long) led_interval;
        ledState = !ledState;
        // lnprint("LED Status: ", ledState, "\n");
    }
    digitalWrite(ledPin, ledState); // blinking LED


    if (now > time_for_BEEP) {
        pumpState = !digitalRead(pumpPin); // logica inversa.

        if (pumpState==ON) {
            led_interval = LED_INTERVAL/6; // velocizza lampeggio per indicare pompa accesa

            // emissione BEEP
            tone(buzzerPin, FREQ, DURATION);
            delay(DURATION*1.3); // mandatory in quanto la funzione tone non è bloccante.
            noTone(buzzerPin);

            if (counter<nCounters) counter++;
            setValues(counter);

            // time_for_BEEP = now + (unsigned long) DELAY;

            lnprint("pump Status: ", pumpState, " - BEEPing - ");
            lnprint("counter: ", counter, " - ");
            lnprint("frequency: ", FREQ, " - ");
            lnprint("duration: ", DURATION, "\n");

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
    DELAY    = BEEP[index]*1000;
    FREQ     = BEEP[index+1];
    DURATION = BEEP[index+2];
    VOLUME   = BEEP[index+3];
    time_for_BEEP = millis() + (unsigned long) DELAY;
    lnprint("next check for pump status in: ", BEEP[index], " Sec\n");
}



void lnprint(char *msg, unsigned long value, const char *s2) {
    Serial.print(msg);
    Serial.print(value);
    Serial.print(s2);
}