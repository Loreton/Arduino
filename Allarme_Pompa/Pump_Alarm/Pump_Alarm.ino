// https://www.youtube.com/watch?v=ptig62mLN84
#define ON  1
#define OFF 0

#define HORN_DURATION     4000          // number of millisecs that Horn is ON
#define HORN_INTERVAL    2000           // number of millisecs between Horn_sound
#define HORN_ALARM_DURATION    6000    // number of millisecs that Horn is ON during alarm
#define HORN_ALARM_INTERVAL   1000    // number of millisecs between Horn_sounds during alarm
unsigned long horn_duration, horn_interval, previousHornTime;
byte hornState=OFF;
byte fHORN=false;     // Flag per suonare la sirena

#define BUZZER_DURATION     4000          // number of millisecs that Buzzer is ON
#define BUZZER_INTERVAL     5000           // number of millisecs between Buzzer
#define buzzerBUZZER_FREQUENCY    2000           // frequency sound during pump_on
#define BUZZER_ALARM_DURATION    6000    // number of millisecs that Buzzer is ON during alarm
#define BUZZER_ALARM_INTERVAL   1000    // number of millisecs between Buzzer_sounds during alarm
#define buzzerBUZZER_ALARM_FREQUENCY    2000   // frequency during alarm
unsigned long buzzer_duration, buzzer_interval, previousBuzzerTime;
byte buzzerState=OFF;
byte fBUZZER=false;     // Flag per suonare il buzzer


#define LED_DEFAULT_DURATION 2000
#define LED_DEFAULT_INTERVAL 1000
#define LED_PUMP_DURATION     500
#define LED_ALARM_DURATION    300
byte ledState = 0;
unsigned long led_duration, led_interval, previousLedTime;

#define SKIP_PRINT_VALUE    9999111

bool fPrint_BEEP = true;
bool fPrint_HORN = true;
bool fPrint_TONE = false;
bool fPrint_LED = false;
bool fPrint_VERBOSE = false;

// byte fDEBUG=0;
byte fALARM=OFF;    // siamo in allarme. La pompa è rimasta accesa oltre i tempi previsti
byte fPUMP;         // status della pompa

int pumpState          = 2; // input +5Volt se Pompa accesa
int presscontrolPower  = 3; // output comanda il sonoff che spegne/accendere il pressControl.
int Horn               = 4; // output comanda una sirena
int ElettroValvola     = 5; // output chiusura acqua a caduta.... da implementare

// int inp_DEBUG          = 9; // Scrive sulla seriale
int Buzzer             = 12;
int blinkingLED        = 13;

int phase=0;
int buzzerDELAY, buzzerFREQ, DURATION, VOLUME ;
// int led_period; // ms
long buzzer_OFF_time, horn_OFF_time, horn_ON_time;
unsigned long now,  previous_beep_time, buzzer_ON_time;



void lnprint(bool fDEBUG, char *msg, unsigned long value=SKIP_PRINT_VALUE, const char *s2="\n");
void setPhase(int);


enum {INTERVAL, FREQ, DURATION};
int BEEP[] = { // interval, frequency, duration, volume(only with tone_AC)     phase,
                     5,         2000,    1500,      1,                          //  0

                    // 30,         2000,    1000,      2,                          //  1
                    // 30,         2000,    1000,      3,                          //  2
                    // 30,         2000,    1000,      4,                          //  3
                    // 30,         2000,    1000,      5,                          //  4

                    // 15,         2000,    1000,      6,                          //  5
                    // 15,         2000,    1000,      7,                          //  6
                    // 15,         2000,    1000,      8,                          //  7
                    // 15,         2000,    1000,      9,                          //  8

                    // 10,         2000,    1000,      9,                          //  9
                    // 10,         2000,    1000,      9,                          // 10
                    // 10,         2000,    1000,      9,                          // 10
                    10,         2000,    1000,      9,                          // 10
            };


#define nPhases  (sizeof(BEEP)/sizeof(int)/4) - 1
// #define nPhases  2

void setup() {
    Serial.begin(9600);
    pinMode(pumpState          , INPUT_PULLUP);

    pinMode(presscontrolPower  , OUTPUT);
    pinMode(Horn               , OUTPUT);
    pinMode(Buzzer             , OUTPUT);
    pinMode(blinkingLED        , OUTPUT);
    // pinMode(ElettroValvola     , OUTPUT); // ...coming

    // attachInterrupt(digitalPinToInterrupt(pumpState), pumpState_ISR, CHANGE);
    // attachInterrupt(digitalPinToInterrupt(pumpState), pumpState_ISR, FALLING);

    lnprint(true, "Starting...");
    lnprint(true, "numero di phases...: ", nPhases);
    setPhase(0);
    led_duration = LED_DEFAULT_DURATION;
    led_interval = LED_DEFAULT_INTERVAL;
}


void tone_test() {
    for (int freq=2000; freq<=3000; freq+=100) {
        lnprint(fPrint_TONE, "freq: ", freq);
        tone(Buzzer   , freq, 1000);
        delay(1000*1.3); // mandatory in quanto la funzione tone non è bloccante.
        noTone(Buzzer   );
    }
}


// ==================================
// -
// ==================================
void loop() {
    now = millis();

    checkLed();
    checkPumpState();
    checkBuzzer();
    checkHorn();




} // end loop()

// ==================================
// -
// ==================================
void checkLed() {
unsigned long isLedTime;

    switch(ledState) {
        case ON:
            isLedTime = (now-previousLedTime)>=led_duration;
            if (isLedTime) {
                previousLedTime += led_duration;
                // NOTE: The previous line could alternatively be
                //              previousLedTime = now
                //        which is the style used in the BlinkWithoutDelay example sketch
                //        Adding on the interval is a better way to ensure that succesive periods are identical
                ledState = OFF;
            }
            break;

        case OFF:
            isLedTime = (now-previousLedTime)>=led_interval;
            if (isLedTime) {
                previousLedTime += led_interval;
                ledState = ON;
            }
            break;
    } // end switch

    if (isLedTime) {
        lnprint(fPrint_LED, "LED Status: ", ledState, " - ");
        lnprint(fPrint_LED, "duration: ", led_duration, " - ");
        lnprint(fPrint_LED, "interval: ", led_interval);
        digitalWrite(blinkingLED, ledState);
    }
}

// ==================================
// -
// ==================================
void checkActiveBuzzer() {
    if (fBUZZER) {
        isBuzzerTime = (now-previousBuzzerTime)>=buzzer_duration;
        if (isBuzzerTime) {
            previousBuzzerTime += buzzer_duration;
            // NOTE: The previous line could alternatively be
            //              previousBuzzerTime = now
            //        which is the style used in the BlinkWithoutDelay example sketch
            //        Adding on the interval is a better way to ensure that succesive periods are identical
            buzzerState = OFF;
        }
        break;

        case OFF:
            isBuzzerTime = (now-previousBuzzerTime)>=buzzer_interval;
            if (isBuzzerTime) {
                previousBuzzerTime += buzzer_interval;
                buzzerState = ON;
            }
            break;
    } // end switch

    if (isBuzzerTime) {
        lnprint(fPrint_BEEP, "BUZZER Status: ", buzzerState, " - ");
        lnprint(fPrint_BEEP, "duration: ", buzzer_duration, " - ");
        lnprint(fPrint_BEEP, "interval: ", buzzer_interval);
        digitalWrite(Buzzer, buzzerState);
    }

}


// ==================================
// -
// ==================================
void checkHorn() {
unsigned long isHornTime;

    // byte fHornStatus = digitalRead(Horn);
    if (fHORN) {
        switch(hornState) {
            case ON:
                isHornTime = (now-previousHornTime)>=horn_duration;
                if (isHornTime) {
                    previousHornTime += horn_duration;
                    // NOTE: The previous line could alternatively be
                    //              previousHornTime = now
                    //        which is the style used in the BlinkWithoutDelay example sketch
                    //        Adding on the interval is a better way to ensure that succesive periods are identical
                    hornState = OFF;
                }
                break;

            case OFF:
                isHornTime = (now-previousHornTime)>=horn_interval;
                if (isHornTime) {
                    previousHornTime += horn_interval;
                    hornState = ON;
                }
                break;
        } // end switch
    }
    else {
        digitalWrite(Horn, OFF);
    }


    if (isHornTime) {
        digitalWrite(Horn, hornState);
    }

}



// ==================================
// -
// ==================================
void checkPumpState() {
    fPUMP = !digitalRead(pumpState);  // logica inversa. PumpON->LowLevel

    switch(fPUMP) {
        case ON:
            if (fBUZZER) break;
            fHORN=true;
            fBUZZER=true;
            if (phase>nPhases)  {
                Serial.println("Siamo in ALLARME!!!!");
                phase=nPhases;
                fALARM=ON; // si spegnerà solo quando la pompa verrà spenta da qualcuno... oppure la spegnamo noi

                // mettiamo il buzzer con un suono più pressante
                buzzer_duration  = 500;    //ms
                buzzer_interval  = 1000;   // secondi
                buzzer_Frequency = 2000;   //Hz

                led_duration = LED_ALARM_DURATION;
                led_interval = LED_ALARM_DURATION;

                horn_duration = HORN_ALARM_DURATION;
                horn_interval = HORN_ALARM_INTERVAL;
            }
            else {
                led_duration = LED_PUMP_DURATION;
                led_interval = LED_PUMP_DURATION;

                horn_duration = HORN_DURATION;
                horn_interval = HORN_INTERVAL;

                byte index=phase*4;
                buzzer_interval  = BEEP[index+INTERVAL]*1000;
                buzzer_duration  = BEEP[index+DURATION];   //ms
                buzzer_Frequency = BEEP[index+FREQ];   //Hz
            }
            break;

        default:
            fHORN=false;
            fALARM=OFF; // allarme rientrato
            break;
    }

}
// ==================================
// -
// ==================================
void checkPassiveBuzzer() {
    if (buzzer_OFF_time!=0 && buzzer_OFF_time<now) { // se stiamo suonando ed è scaduto il time... chiudiamo il buzzer
        lnprint(fPrint_BEEP, "now: ", now, " - ");
        lnprint(fPrint_BEEP, "Beep completato after: ", buzzer_OFF_time/1000, " sec. \n" );
        noTone(Buzzer);
        buzzer_OFF_time=0;
    }
}
// ==================================
// -
// ==================================
void checkPassiveBuzzer_New() {
    if (fBUZZER) {
        isBuzzerTime = (now-previousBuzzerTime)>=buzzer_duration;
        if (isBuzzerTime) {
            previousBuzzerTime += buzzer_duration;
            // NOTE: The previous line could alternatively be
            //              previousBuzzerTime = now
            //        which is the style used in the BlinkWithoutDelay example sketch
            //        Adding on the interval is a better way to ensure that succesive periods are identical
            buzzerState = OFF;
        }
        break;

        case OFF:
            isBuzzerTime = (now-previousBuzzerTime)>=buzzer_interval;
            if (isBuzzerTime) {
                previousBuzzerTime += buzzer_interval;
                buzzerState = ON;
            }
            break;
    } // end switch

    if (isBuzzerTime) {
        lnprint(fPrint_BEEP, "BUZZER Status: ", buzzerState, " - ");
        lnprint(fPrint_BEEP, "duration: ", buzzer_duration, " - ");
        lnprint(fPrint_BEEP, "interval: ", buzzer_interval);
        digitalWrite(Buzzer, buzzerState);
    }

}
// ==================================
// -
// ==================================
void setPhase(int count) {

    if (fALARM==ON) {
        buzzerDELAY    = 1;  // secondi
        buzzerFREQ     = 2000;    //mS
        DURATION = 500;    //ms
        VOLUME   = 9;


        fHORN=true;
        led_duration = LED_ALARM_DURATION;
        led_interval = LED_ALARM_DURATION;
        horn_duration = HORN_ALARM_DURATION;
        horn_interval = HORN_ALARM_INTERVAL;
        Serial.println("Siamo in ALLARME!!!!");

    }

    else if (fPUMP) {
        fHORN=true;
        led_duration = LED_PUMP_DURATION;
        led_interval = LED_PUMP_DURATION;
        horn_duration = HORN_DURATION;
        horn_interval = HORN_INTERVAL;
    }

    else {
        fHORN=false;
        led_duration = LED_DEFAULT_DURATION;
        led_interval = LED_DEFAULT_INTERVAL;

        int index=phase*4;

        // Active Buzzer
        buzzer_duration = BEEP[index+2];
        buzzer_interval = BEEP[index];


        // Passive Buzzer
        buzzerDELAY    = BEEP[index];
        buzzerFREQ     = BEEP[index+1];
        DURATION = BEEP[index+2];
        VOLUME   = BEEP[index+3];

        if (phase==0) {
            // led_period = LED_DEFAULT_DURATION; // reset LED interval
            noTone(Buzzer);
            buzzer_OFF_time=0;
        }
    }


    buzzer_ON_time = now + (unsigned long) buzzerDELAY*1000;
    if (fPUMP) {
        lnprint(fPrint_VERBOSE, "next BEEP, if pump still ON, in: ", buzzerDELAY, " Sec - ");
        lnprint(fPrint_VERBOSE, "(at: ", buzzer_ON_time, " mS)\n");
    }
}



void lnprint(bool fPrint, char *msg, unsigned long value, const char *s2) {
    if (fPrint) {
        Serial.print(msg);
        if (value!=SKIP_PRINT_VALUE) Serial.print(value);
        Serial.print(s2);
    }
}



