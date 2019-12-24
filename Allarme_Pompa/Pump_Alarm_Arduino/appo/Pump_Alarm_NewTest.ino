// https://www.youtube.com/watch?v=ptig62mLN84

#define ON  1
#define OFF 0

#define HORN_DURATION           4000          // number of millisecs that Horn is ON
#define HORN_INTERVAL           2000           // number of millisecs between Horn_sound
#define HORN_ALARM_DURATION     6000    // number of millisecs that Horn is ON during alarm
#define HORN_ALARM_INTERVAL     1000    // number of millisecs between Horn_sounds during alarm
unsigned long horn_duration, horn_interval, previousHornTime;
byte hornState=OFF;
byte fHORN=false;     // Flag per suonare la sirena

#define BUZZER_DURATION         4000          // number of millisecs that Buzzer is ON
#define BUZZER_INTERVAL         5000           // number of millisecs between Buzzer
#define BUZZER_FREQUENCY        2000           // frequency sound during pump_on
#define BUZZER_ALARM_DURATION   6000    // number of millisecs that Buzzer is ON during alarm
#define BUZZER_ALARM_INTERVAL   1000    // number of millisecs between Buzzer_sounds during alarm
#define BUZZER_ALARM_FREQUENCY  2000   // frequency during alarm
unsigned long buzzer_duration, buzzer_interval, buzzer_frequency, previousBuzzerTime;
byte buzzerState=OFF;
byte buzzer_cycle=false;     // Flag per suonare il buzzer


#define LED_DEFAULT_DURATION 2000
#define LED_DEFAULT_INTERVAL 1000
#define LED_PUMP_DURATION     500
#define LED_ALARM_DURATION    300
byte ledState = 0;
long led_period; // ms
unsigned long led_duration, led_interval, previousLedTime;

#define SKIP_PRINT_VALUE    9999111

bool fPrint_BEEP    = true;
bool fPrint_HORN    = true;
bool fPrint_TONE    = false;
bool fPrint_LED     = false;
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
// int buzzerDELAY, buzzerFREQ, DURATION, VOLUME ;
// long buzzer_OFF_time, horn_OFF_time, horn_ON_time;
unsigned long now,  previous_beep_time, buzzer_ON_time;

int DELAY, FREQ, DURATION, VOLUME ;
// - prototype Functions
void lnprint(bool fDEBUG, char *msg, unsigned long value=SKIP_PRINT_VALUE, const char *s2="\n");
char *Utoa(unsigned int i, byte padLen=2, byte fill=' ');
void printStr(bool fPrint,
                const char *s1,
                const char *s2="",
                const char *s3="",
                const char *s4="",
                const char *s5="",
                const char *s6="",
                const char *s7="",
                const char *s8="",
                const char *s9="",
                const char *s10="",
                const char *s11="",
                const char *s12="");
// - prototype Functions



// enum {INTERVAL, FREQ, DURATION};
int BEEP[] = { // interval, frequency, duration, volume(only with tone_AC)     phase,
                     5,         2000,    1500,      1,                          //  0

                    // 30,         2000,    1001,      2,                          //  1
                    // 30,         2000,    1002,      3,                          //  2
                    // 30,         2000,    1003,      4,                          //  3
                    // 30,         2000,    1004,      5,                          //  4
                    15,         2000,    1005,      6,                          //  5
                    // 15,         2000,    1006,      7,                          //  6
                    // 15,         2000,    1007,      8,                          //  7
                    // 15,         2000,    1008,      9,                          //  8
                    10,         2000,    1009,      9,                          //  9
                    // 10,         2000,    1010,      9,                          // 10
                    // 10,         2000,    1011,      9,                          // 10
                    10,         2000,    1012,      9,                          // 10
            };


int nPhases  = (sizeof(BEEP)/sizeof(int)/4) - 1;
// #define nPhases  2




void setup() {
    Serial.begin(9600);
    pinMode(pumpState          , INPUT_PULLUP);
    pinMode(Buzzer             , OUTPUT);
    pinMode(presscontrolPower  , OUTPUT);
    pinMode(Horn               , OUTPUT);
    pinMode(blinkingLED        , OUTPUT);

    // attachInterrupt(digitalPinToInterrupt(pumpState), pumpState_ISR, CHANGE);
    // attachInterrupt(digitalPinToInterrupt(pumpState), pumpState_ISR, FALLING);

    Serial.println("Starting...");
    lnprint("numero di phases...: ", nPhases , "\n");
    setPhase(0);
    led_period = LED_PERIOD_DEFAULT;
}


void tone_test() {
    for (int freq=2000; freq<=3000; freq+=100) {
        lnprint("freq: ", freq, "\n");
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
    // checkPumpState();

} // end loop()



// ==================================
// -
// ==================================
void setPhase(int count) {
    if (fALARM) {
        DELAY    = 10;  // secondi
        FREQ     = 2000;    //mS
        DURATION = 4000;    //ms
        VOLUME   = 9;
        led_period = 300;
        Serial.println("Siamo in ALLARME!!!!");
        return;
    }

    else {
        phase=count;
        if (phase>nPhases)  {
            phase=nPhases;
            fALARM=ON;
        }

        int index=phase*4;

        DELAY    = BEEP[index];
        FREQ     = BEEP[index+1];
        DURATION = BEEP[index+2];
        VOLUME   = BEEP[index+3];

        if (phase==0) {
            led_period = LED_PERIOD_DEFAULT; // reset LED interval
            noTone(Buzzer);
            buzzer_ON=0;
        }
    }


    next_beep_time = now + (unsigned long) DELAY*1000;
    // lnprint("DELAY: ", DELAY, " - ");
    if (fPUMP) {
        lnprint("next BEEP, if pump still ON, in: ", DELAY, " Sec - ");
        lnprint("(at: ", next_beep_time, " mS)\n");
    }
}


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



