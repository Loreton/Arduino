// https://www.youtube.com/watch?v=ptig62mLN84
#include <Arduino.h>
#define _I_AM_ARDUINO_NANO_

#include <Pump_Alarm.h>
bool fALARM=false;    // siamo in allarme. La pompa è rimasta accesa oltre i tempi previsti
byte fPUMP;         // status della pompa

const int pumpState          = 2; // input +5Volt se Pompa accesa
const int presscontrolButton = 3; // output comanda il sonoff che spegne/accendere il pressControl.
const int Horn               = 4; // output comanda una sirena
const int ElettroValvola     = 5; // output chiusura acqua a caduta.... da implementare

const int Buzzer             = 12;
const int blinkingLED        = 13;

int phase=0;
unsigned long now, next_beep_time;
unsigned long led_duration, led_interval;
unsigned long buzzer_duration, buzzer_frequency, buzzer_volume, buzzer_ON;
unsigned long horn_duration, horn_interval;
byte fHORN=false;     // Flag per suonare la sirena


void setup() {
    Serial.begin(9600);
    pinMode(pumpState, INPUT_PULLUP);

    // You can use digitalWrite(pin, HIGH) before use pinMode(pin, OUTPUT).
    // Per evitare problemi con risorse esterne al momento dell'accensione
    // conviene forzare l'output a livello desiderato prima di impostarlo come output
    digitalWrite(presscontrolButton, HIGH); pinMode(presscontrolButton , OUTPUT);
    digitalWrite(Horn, HIGH);               pinMode(Horn               , OUTPUT);
    digitalWrite(Buzzer, HIGH);             pinMode(Buzzer             , OUTPUT);
    digitalWrite(blinkingLED, HIGH);        pinMode(blinkingLED        , OUTPUT);

    lnprint(true, "Starting...");
    lnprint(true, "PHASE_ALARM_INTERVAL: ", PHASE_ALARM_INTERVAL);
    lnprint(true, "PHASE_INTERVAL: ", PHASE_INTERVAL);
    lnprint(true, "SKIP_PRINT_VALUE: ", SKIP_PRINT_VALUE+1);
    setPhase(0);
}



// ==================================
// -
// ==================================
void loop() {
    now = millis();
    checkPumpState();
    checkLed();
    checkHorn();

    if (now%1000==0) {
        lnprint(true, "now: ", now, "\n");
        delay(1);
    }
    if (buzzer_ON!=0 && buzzer_ON<now) { // se stiamo suonando, portiamolo a termine
        Serial.println("Beep completato.");
        noTone(Buzzer);
        buzzer_ON=0;
    }

    // comanda il pulsante del sOnOff (tramite un rele) il quale si attiva sul rilascio.
    // Il relè di fatto lavora su fronte negativo.
    if (fALARM) {
        digitalWrite(presscontrolButton, LOW);
        delay(1000);
        digitalWrite(presscontrolButton, HIGH);
    }
} // end loop()


// ==================================
// -
// ==================================
void checkPumpState() {
bool isBeepTime;

    fPUMP = !digitalRead(pumpState);  // logica inversa. PumpON->LowLevel
    isBeepTime = now>=next_beep_time;
    switch(fPUMP) {
        case ON:
            if (buzzer_ON!=0) {
                break;
            }

            if (isBeepTime || phase==0)  { // phase=0 indica che vogliamo un beep appena accesa la pompa
                // emissione BEEP
                tone(Buzzer, buzzer_frequency, buzzer_duration);
                buzzer_ON=now + buzzer_duration; // tempo (millsis()) a cui il buzzer si dovrà spegnere
                lnprint(fPrint_BEEP, "\nnow: ", now, " - ");
                lnprint(fPrint_BEEP, "pump Status: ", fPUMP, " - BEEPing - ");
                lnprint(fPrint_BEEP, "phase: ", phase, " - ");
                lnprint(fPrint_BEEP, "frequency: ", buzzer_frequency, " - ");
                lnprint(fPrint_BEEP, "duration: ", buzzer_duration, "\n");
                setPhase(++phase);
            }
            break;


        default:
            fALARM=false; // allarme rientrato
            if (phase>0) setPhase(0);
            break;
    }

}



// ==================================
// -
// ==================================
void checkLed() {
bool isLedTime;
static byte ledState;
static unsigned long previousLedTime;


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

        default:
            isLedTime = (now-previousLedTime)>=led_interval;
            if (isLedTime) {
                previousLedTime += led_interval;
                ledState = ON;
            }
            break;
    } // end switch

    if (isLedTime) {
        // lnprint(true, "LED Status: ", ledState, " - ");
        // lnprint(true, "duration: ", led_duration, " - ");
        // lnprint(true, "interval: ", led_interval);
        digitalWrite(blinkingLED, ledState);
    }
}






// ==================================
// -
// ==================================
void checkHorn() {
bool isHornTime;
static unsigned long previousHornTime;
static byte hornState;


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
        if (digitalRead(Horn))
            digitalWrite(Horn, OFF);
    }


    if (isHornTime) {
        digitalWrite(Horn, hornState);
    }

}



// ==================================
// -
// ==================================
void setPhase(int count) {
unsigned long phase_interval;

    phase=count;

    if (phase==0) noTone(Buzzer);
    if (phase>=PHASE_ALARM_THRESHOLD) fALARM=true;

    if (fALARM) {
        phase_interval   = PHASE_ALARM_INTERVAL;  // secondi
        buzzer_frequency = BUZZER_FREQUENCY;    //mS
        buzzer_duration  = BUZZER_ALARM_DURATION;    //ms
        buzzer_volume    = 9;


        fHORN=true;
        led_duration = LED_ALARM_DURATION;
        led_interval = LED_ALARM_INTERVAL;
        horn_duration = HORN_ALARM_DURATION;
        horn_interval = HORN_ALARM_INTERVAL;
        Serial.println("Siamo in ALLARME!!!!");
    }

    else if (fPUMP) {
        fHORN=true;
        led_duration = LED_PUMP_DURATION;
        led_interval = LED_PUMP_INTERVAL;
        horn_duration = HORN_DURATION;
        horn_interval = HORN_INTERVAL;
        buzzer_duration = BUZZER_DURATION;
        buzzer_frequency = BUZZER_FREQUENCY;
        phase_interval = PHASE_INTERVAL - (phase*2); // ogni phase diminuiamo l'intervallo
    }

    else {
        fHORN=false;
        led_duration = LED_DURATION;
        led_interval = LED_INTERVAL;

        buzzer_duration = BUZZER_DURATION;
        buzzer_frequency = BUZZER_FREQUENCY;
        buzzer_volume   = 9;

        phase_interval = PHASE_INTERVAL - (phase*2); // ogni phase diminuiamo l'intervallo

    }

    next_beep_time = now + (unsigned long) phase_interval*1000; // phase_interval è in secondi
    if (fPUMP) {
        lnprint(fPrint_BEEP, "now: ", now, " - ");
        lnprint(fPrint_BEEP, "in: ", phase_interval, " Sec - ");
        lnprint(fPrint_BEEP, "next_beep_time at: ", next_beep_time, "mS\n");

    }
}



// ==================================
// -
// ==================================
void lnprint(bool fPrint, const char *msg, const unsigned long value, const char *s2) {
    if (fPrint) {
        Serial.print(msg);
        if (value!=SKIP_PRINT_VALUE) Serial.print(value);
        Serial.print(s2);
    }
}

