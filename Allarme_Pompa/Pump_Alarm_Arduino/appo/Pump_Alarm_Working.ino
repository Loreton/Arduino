// https://www.youtube.com/watch?v=ptig62mLN84
#define ON  1
#define OFF 0
#define HORN_TIME 4000
#define LED_PERIOD_DEFAULT 2000
// #define HORN_TIME 4000
byte fDEBUG=0;
byte fALARM=OFF;
byte fPUMPSTATUS;

int pumpState          = 2; // input +5Volt se Pompa accesa
int presscontrolPower  = 3; // output comanda il sonoff che spegne/accendere il pressControl.
int Horn               = 4; // output comanda una sirena
int ElettroValvola     = 5; // output chiusura acqua a caduta.... da implementare
int pressControlState  = 6; // output chiusura acqua a caduta.... da implementare


int inp_DEBUG          = 10; // Scrive sulla seriale
int pressControlButton = 11; // pulsante per accendere manualmente il pressControl
int Buzzer             = 12;
int ledPin             = 13;

byte ledState = 0;
int phase=0;
int DELAY, FREQ, DURATION, VOLUME ;
int led_period; // ms
long buzzer_ON, horn_ON;
unsigned long now, previousLedTime, previous_beep_time, next_beep_time;

int buttonDebounce = 20; //ms
// volatile byte buttonFlag=0;

void lnprint(char *msg, unsigned long value, const char *s2="");

int BEEP[] = { // delaySec, frequency, duration, volume(only with tone_AC)     phase,
                     5,         2000,    1500,      1,                          //  0
                    30,         2000,    1000,      2,                          //  1
                    30,         2000,    1000,      3,                          //  2
                    30,         2000,    1000,      4,                          //  3
                    30,         2000,    1000,      5,                          //  4
                    15,         2000,    1000,      6,                          //  5
                    15,         2000,    1000,      7,                          //  6
                    15,         2000,    1000,      8,                          //  7
                    15,         2000,    1000,      9,                          //  8
                    10,         2000,    1000,      9,                          //  9
                    10,         2000,    1000,      9,                          // 10
                    10,         2000,    1000,      9,                          // 10
                    10,         2000,    1000,      9,                          // 10
            };


#define nPhases  (sizeof(BEEP)/sizeof(int)/4) - 1
// #define nPhases  2

void setup() {
    Serial.begin(9600);
    pinMode(pressControlState  , INPUT); // NO PULLUP perché c'è il LED verso il +
    pinMode(pumpState          , INPUT_PULLUP);
    pinMode(pressControlButton , INPUT_PULLUP);
    pinMode(inp_DEBUG          , INPUT_PULLUP);
    pinMode(Buzzer             , OUTPUT);
    pinMode(presscontrolPower  , OUTPUT);
    pinMode(Horn               , OUTPUT);
    pinMode(ledPin             , OUTPUT);

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
    // fDEBUG = !digitalRead(inp_DEBUG); // logica inversa.
    now = millis();

    checkLed();
    checkPumpState();

    // verifica il taso per accendere la Pompa e cioè il PressControl
    // if (!digitalRead(pressControlButton)) TurnOnOffPressControl();

    if (buzzer_ON!=0 && buzzer_ON<now) { // se stiamo suonando, portiamolo a termine
        lnprint("now: ", now, " - ");
        // Serial.println("Beep completato.");
        noTone(Buzzer);
        buzzer_ON=0;
    }

    if (horn_ON!=0 && horn_ON<now) { // se stiamo suonando, portiamolo a termine
        lnprint("now: ", now, " - ");
        Serial.println("Horn completato.");
        digitalWrite(Horn, OFF); // Rilascia il pulsante del sonoff
        horn_ON=0;
    }

    // if (phase>=nPhases) { // abbiamo esaurito le fasi
    //     TurnOnOffPressControl();
    //     setPhase(0); // reset all
    // }
} // end loop()


// ==================================
// -
// ==================================
void checkLed() {
unsigned long isLedTime;

    isLedTime = (now-previousLedTime)>=led_period;
    if (isLedTime) {
        previousLedTime = now;
        ledState = !ledState;
        if (fDEBUG) {
            lnprint("LED Status: ", ledState, "" );
            lnprint(" - period: ", led_period, "\n" );
        }
        digitalWrite(ledPin, ledState);
    }
}

// ==================================
// -
// ==================================
void checkPumpState() {
unsigned long isBeepTime;

    isBeepTime = now>=next_beep_time;
    fPUMPSTATUS = !digitalRead(pumpState); // logica inversa.
    switch(fPUMPSTATUS) {
        case ON:
            if (buzzer_ON!=0) {
                break;
            }
            if (isBeepTime || phase==0 ) { // phase=0 vogliamo un beep appena acesa la pompa
                previous_beep_time = now;
                led_period = LED_PERIOD_DEFAULT/6;

                // emissione BEEP
                tone(Buzzer, FREQ, DURATION);
                buzzer_ON=now + DURATION; // tempo (millsis()) a cui il buzzer si dovrà spegnere
                lnprint("now: ", now, " - ");
                lnprint("pump Status: ", fPUMPSTATUS, " - BEEPing - ");
                lnprint("phase: ", phase, " - ");
                lnprint("frequency: ", FREQ, " - ");
                lnprint("duration: ", DURATION, "\n");
                setPhase(++phase);

                /*
                   Siccome devo far suonare anche la sirena, ed il tone non blocca il programma,
                   posso utilizzare il tempo della sirena come delay per il tono
                */
                digitalWrite(Horn, ON); // Pigia il pulsante del sonoff
                horn_ON = now + HORN_TIME;
                // digitalWrite(Horn, OFF); // Rilascia il pulsante del sonoff

                // delay(DURATION*1.3); // mandatory in quanto la funzione tone non è bloccante.
            }
            break;

        default:   // tone to advice the pump is off (only if it was ON)
            if (phase>0) {
                Serial.print("pump has been turned off.");
                int _duration=300;

                // in questo caso blocco il programma con il delay()
                for (int i=0; i<=3; i++) {
                    tone(Buzzer, FREQ, _duration);
                    delay(_duration*1.3); // mandatory in quanto la funzione tone non è bloccante.
                }
                led_period = LED_PERIOD_DEFAULT; // reset LED interval
                setPhase(0); // reset Buzzer data
                Serial.println(" - power-off beep completed.");
            }
            break;
    }

}

// ==================================
// - E' stato spinto  pulsante per accendere la pompa
// - Attendiamo il debounce e leggiamo di nuovo
// ==================================
void TurnOnOffPressControl() {
    // byte button = !digitalRead(pressControlButton); // logica inversa.
    delay(100);
    byte button = !digitalRead(pressControlButton); // logica inversa.

    if (fALARM) {
        fALARM=OFF; // vuol dire che c'è la presenza di qualcuno.
        setPhase(0); // ripristiniamo
    }
    if (button) {
        if (!digitalRead(pressControlState)==LOW) {
            digitalWrite(presscontrolPower, LOW); // Turn-ON PressControl
        }
        else {
            digitalWrite(presscontrolPower, HIGH); // Turn-ON PressControl
        }
    }
    lnprint("PressControl status: ", !digitalRead(pressControlState), "\n");
}


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
    if (fPUMPSTATUS) {
        lnprint("next BEEP, if pump still ON, in: ", DELAY, " Sec - ");
        lnprint("(at: ", next_beep_time, " mS)\n");
    }
}



void lnprint(char *msg, unsigned long value, const char *s2) {
    Serial.print(msg);
    Serial.print(value);
    Serial.print(s2);
}