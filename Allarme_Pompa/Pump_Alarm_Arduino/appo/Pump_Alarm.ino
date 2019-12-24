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



#define LED_DEFAULT_DURATION 2000
#define LED_DEFAULT_INTERVAL 1000
#define LED_PUMP_DURATION     500
#define LED_ALARM_DURATION    300
byte ledState = 0;
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
bool phase_ON = false;
int pumpState          = 2; // input +5Volt se Pompa accesa
int presscontrolPower  = 3; // output comanda il sonoff che spegne/accendere il pressControl.
int Horn               = 4; // output comanda una sirena
int ElettroValvola     = 5; // output chiusura acqua a caduta.... da implementare

// int inp_DEBUG          = 9; // Scrive sulla seriale
int Buzzer             = 12;
int blinkingLED        = 13;

int phase=0;
// int buzzerDELAY, buzzerFREQ, DURATION, VOLUME ;
// int led_period; // ms
// long buzzer_OFF_time, horn_OFF_time, horn_ON_time;
unsigned long now,  previous_beep_time, buzzer_ON_time;



void lnprint(bool fDEBUG, char *msg, unsigned long value=SKIP_PRINT_VALUE, const char *s2="\n");
char *Utoa(unsigned int i, byte padLen=2, byte fill=' ');
// void print6Str(bool fDEBUG, const char *s1, const char *s2="", const char *s3="", const char *s4="", const char *s5="", const char *s6="");
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

enum {INTERVAL, FREQ, DURATION};
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

    pinMode(presscontrolPower  , OUTPUT);
    pinMode(Horn               , OUTPUT);
    pinMode(Buzzer             , OUTPUT);
    pinMode(blinkingLED        , OUTPUT);
    // pinMode(ElettroValvola     , OUTPUT); // ...coming

    // attachInterrupt(digitalPinToInterrupt(pumpState), pumpState_ISR, CHANGE);
    // attachInterrupt(digitalPinToInterrupt(pumpState), pumpState_ISR, FALLING);

    lnprint(true, "Starting...");
    lnprint(true, "numero di phases...: ", nPhases);
    // setPhase(0);
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
    checkPumpState();
    checkLed();
    checkBuzzer();
    checkHorn();
} // end loop()







// ==================================
// -
// ==================================
void lnprint(bool fPrint, char *msg, unsigned long value, const char *s2) {
    if (fPrint) {
        Serial.print(msg);
        if (value!=SKIP_PRINT_VALUE) Serial.print(value);
        Serial.print(s2);
    }
}


// ==================================
// -
// ==================================
void printStr(bool fPrint,
                const char *s1,
                const char *s2,
                const char *s3,
                const char *s4,
                const char *s5,
                const char *s6,
                const char *s7,
                const char *s8,
                const char *s9,
                const char *s10,
                const char *s11,
                const char *s12) {
    if (fPrint) {
        Serial.print(s1);
        Serial.print(s2);
        Serial.print(s3);
        Serial.print(s4);
        Serial.print(s5);
        Serial.print(s6);
        Serial.print(s7);
        Serial.print(s8);
        Serial.print(s9);
        Serial.print(s10);
        Serial.print(s11);
        Serial.print(s12);
    }
}


// ==================================
// -
// ==================================
char UtoaBuffer[10];  // buffer dedicato
char *Utoa(unsigned int i, byte padLen,  byte fill) {
    char *ptr = &UtoaBuffer[9];
    *ptr = '\0';                  // chiude il buffer finale

    for(*ptr--=0; i>0 ;i/=10) {
        *ptr-- = i%10 + '0';
        padLen--;
    }

    while (padLen--) *ptr-- = fill;
    return ++ptr;
}