// https://www.youtube.com/watch?v=ptig62mLN84
#include <Arduino.h>
#define _I_AM_ARDUINO_NANO_

#include <Pump_Alarm.h>
bool fALARM=false;    // siamo in allarme. La pompa è rimasta accesa oltre i tempi previsti
byte fPUMP;         // status della pompa

const int pumpState          = D02; // input +5Volt se Pompa accesa
const int presscontrolButton = D03; // output comanda il sonoff che spegne/accendere il pressControl.
const int Horn               = D04; // output comanda una sirena
const int ElettroValvola     = D05; // output chiusura acqua a caduta.... da implementare

const int Buzzer             = D12;
const int blinkingLED        = D13;

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
    lnprint(true, "PHASE_INTERVAL       : ", PHASE_INTERVAL);
    lnprint(true, "PHASE_ALARM_INTERVAL : ", PHASE_ALARM_INTERVAL);
    lnprint(true, "PHASE_ALARM_THRESHOLD: ", PHASE_ALARM_THRESHOLD);
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

    if (fPUMP && now%1000==0) {
        lnprint(true, "next beep in: ", (next_beep_time-now)/1000, "\n");
        delay(1);
    }
    
    if (buzzer_ON!=0 && buzzer_ON<now) { // se stiamo suonando, portiamolo a termine
        Serial.println("Beep completato.");
        noTone(Buzzer);
        buzzer_ON=0;
    }

    if (fALARM) 
        PressControl_powerOFF();

} // end loop()


// ==================================
// - Comanda il pulsante del sOnOff il quale si attiva sul rilascio.
// - Il comando è intermediato da un relay.
// ==================================
void PressControl_powerOFF() {
    Serial.println("Trying to switch-OFF the Press-Control...");
    digitalWrite(presscontrolButton, LOW);
    delay(1000);
    digitalWrite(presscontrolButton, HIGH);
}

// ==================================
// -
// ==================================
void checkPumpState() {
bool isBeepTime;

    isBeepTime = now>=next_beep_time;
    fPUMP = !digitalRead(pumpState);  // logica inversa. PumpON->LowLevel
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
            if (phase>0) {
                int _duration=500;
                int _frequency=500;
                for (int i=3;i>0;i--) {
                    tone(Buzzer, _frequency*i, _duration);
                    delay(_duration*1.1);
                }
                noTone(Buzzer);
                setPhase(0);
            }
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
// byte hornState;

    byte hornState=digitalRead(Horn);

    if (fHORN) {
        switch(hornState) {
            case HORN_ON:
                isHornTime = (now-previousHornTime)>=horn_duration;
                if (isHornTime) {
                    previousHornTime += horn_duration;
                    // NOTE: The previous line could alternatively be
                    //              previousHornTime = now
                    //        which is the style used in the BlinkWithoutDelay example sketch
                    //        Adding on the interval is a better way to ensure that succesive periods are identical
                    // hornState = HORN_OFF;
                    digitalWrite(Horn, HORN_OFF);
                    lnprint(true, "Horn is OFF for ", horn_interval/1000, " Sec.\n" );
                    // Serial.println("Horn is OFF");
                }
                break;

            case HORN_OFF:
                isHornTime = (now-previousHornTime)>=horn_interval;
                if (isHornTime) {
                    previousHornTime += horn_interval;
                    // hornState = HORN_ON;
                    digitalWrite(Horn, HORN_ON);
                    lnprint(true, "Horn is ON for ", horn_duration/1000, " Sec.\n" );

                }
                break;
        } // end switch
    }
    else {
        if (hornState==HORN_ON)
            digitalWrite(Horn, HORN_OFF);
    }


}



// ==================================
// -
// ==================================
void setPhase(int count) {
unsigned long phase_interval;

    phase=count;

    if (phase==0) noTone(Buzzer);
    if (phase>PHASE_ALARM_THRESHOLD) fALARM=true;

    buzzer_frequency = BUZZER_FREQUENCY;    //mS
    if (fALARM) {
        phase_interval = PHASE_ALARM_INTERVAL;  // secondi
        // horn_interval = HORN_INTERVAL;
        buzzer_volume    = 9;


        fHORN=true;
        led_duration = LED_ALARM_DURATION;
        led_interval = LED_ALARM_INTERVAL;
        Serial.println("Siamo in ALLARME!!!!");
    }

    else if (fPUMP) {
        fHORN=true;
        phase_interval = PHASE_INTERVAL - (phase*2000); // ogni phase diminuiamo l'intervallo
        
        led_duration = LED_PUMP_DURATION;
        led_interval = LED_PUMP_INTERVAL;
    }

    else {
        phase_interval = PHASE_INTERVAL - (phase*2000); // ogni phase diminuiamo l'intervallo
        fHORN=false;
        led_duration = LED_DURATION;
        led_interval = LED_INTERVAL;

        buzzer_volume   = 9;

    }

    horn_duration = horn_interval*.6; // suona per il 60% dell'intervllo
    buzzer_duration = phase_interval*.20; // beep il 20% dell'intervallo
    horn_interval = phase_interval;

    if (phase_interval<3000) phase_interval=3000; // controllo di salvaguardia 
    next_beep_time = now + (unsigned long) phase_interval; 
    if (fPUMP) {
        // lnprint(fPrint_BEEP, "now: ", now, " - ");
        lnprint(fPrint_BEEP, "next_beep_time in: ", phase_interval/1000, " Sec\n");
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

