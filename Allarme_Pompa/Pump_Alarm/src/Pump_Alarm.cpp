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
const int testAlarm          = D06; // input 

const int Buzzer             = D12;
const int blinkingLED        = D13;

int phase=0;
unsigned long now, next_beep_time;
unsigned long led_duration, led_interval;
unsigned long buzzer_duration, buzzer_frequency, buzzer_volume, buzzerOffTime;
// long buzzer_OFF;
bool buzzer_ON;
bool fTestAlarm;
unsigned long horn_duration, horn_interval;
// byte fHORN=false;     // Flag per suonare la sirena
unsigned long phase_interval, next_phase_time, phase_start_time;


void setup() {
    Serial.begin(9600);
    pinMode(pumpState, INPUT_PULLUP);
    pinMode(testAlarm, INPUT_PULLUP);

    // You can use digitalWrite(pin, HIGH) before use pinMode(pin, OUTPUT).
    // Per evitare problemi con risorse esterne al momento dell'accensione
    // conviene forzare l'output a livello desiderato prima di impostarlo come output
    digitalWrite(presscontrolButton, HIGH); pinMode(presscontrolButton , OUTPUT);
    digitalWrite(Horn, HIGH);               pinMode(Horn               , OUTPUT);
    digitalWrite(Buzzer, HIGH);             pinMode(Buzzer             , OUTPUT);
    digitalWrite(blinkingLED, HIGH);        pinMode(blinkingLED        , OUTPUT);

    lnprint(true, "Starting...");
    lnprint(true, "PHASE_INTERVAL               : ", PHASE_INTERVAL);
    lnprint(true, "PHASE_ALARM_INTERVAL         : ", PHASE_ALARM_INTERVAL);
    lnprint(true, "PHASE_ALARM_THRESHOLD_NUMBER : ", PHASE_ALARM_THRESHOLD_NUMBER);
    lnprint(true, "PHASE_MIN_INTERVAL           : ", PHASE_MIN_INTERVAL);
    lnprint(true, "PHASE_STEP_DOWN              : ", PHASE_STEP_DOWN);
    // lnprint(true, "SKIP_PRINT_VALUE         : ", SKIP_PRINT_VALUE+1);
    setPhase(0);
}



// ==================================
// - per gestire l'overflow di millis()
// - bisogna operare come segue:
//      if all your time calculations are done as:
//      if  ((later_time - earlier_time ) >=duration ) {action}
//      then the rollover does generally not come into play.
//      For ease of understanding think in bytes ( 0.. 255 ), instead of unsigned longs.
//     Example: If your old time was at 250 and now you're at 5, 
//          you calculate (5 - 250) and interpret the result as an unsigned byte, the result is 11.      
//          then the rollover does generally not come into play.
// - vedi anche: https://arduino.stackexchange.com/questions/12587/how-can-i-handle-the-millis-rollover
// ==================================
void loop() {
    fTestAlarm = !digitalRead(testAlarm);  // logica inversa.
    if (fTestAlarm) {
        int _duration=500;
        int _frequency=500;
        for (int i=1;i<=5;i++) {
            tone(Buzzer, _frequency*i, _duration);
            delay(_duration*1.1);
        }
        for (int i=5;i>0;i--) {
            tone(Buzzer, _frequency*i, _duration);
            delay(_duration*1.1);
        }
        noTone(Buzzer);

        digitalWrite(Horn, HORN_ON); delay(4000); digitalWrite(Horn, HORN_OFF);
        delay(4000);
        digitalWrite(Horn, HORN_ON); delay(4000); digitalWrite(Horn, HORN_OFF);
        PressControl_Toggle(); // switch press control state
        delay(2000);
        PressControl_Toggle(); // reset press control state
        delay(2000);
        return;
    }
    now = millis();
    checkPumpState();
    checkLed();
    checkHorn();


    if (buzzer_ON) {
        unsigned long elapsed = now-phase_start_time;  // elapsed: duration
        if (elapsed>=buzzer_duration) { // se stiamo suonando, portiamolo a termine
            lnprint(true, "Beep OFF - elapsed: ", elapsed, " mS\n");
            noTone(Buzzer);
            buzzer_ON=false;
        }
    }


    if (fALARM)
        PressControl_Toggle();

} // end loop()


// ==================================
// - Comanda il pulsante del sOnOff il quale si attiva sul rilascio.
// - Il comando è intermediato da un relay.
// ==================================
void PressControl_Toggle() {
    digitalWrite(presscontrolButton, LOW);
    Serial.println("Pushing Press-Control switch...");
    delay(500);
    digitalWrite(presscontrolButton, HIGH);
    Serial.println("... released Press-Control switch.");
}

// ==================================
// -
// ==================================
void checkPumpState() {
unsigned long elapsed;

    fPUMP = !digitalRead(pumpState);  // logica inversa. PumpON->LowLevel
    switch(fPUMP) {
        case ON:
            if (phase==0) {
                int _duration=500;
                int _frequency=500;
                for (int i=1;i<=4;i++) {
                    tone(Buzzer, _frequency*i, _duration);
                    delay(_duration*1.1);
                }
                noTone(Buzzer);
                setPhase(1);
            }
            
            elapsed = now-phase_start_time;
            if (elapsed >= phase_interval)  { 
                setPhase(++phase);
                printStatus();
                // emissione BEEP
                buzzer_ON=true;
                lnprint(true, "Beep ON for: ", buzzer_duration, " mS\n");
                tone(Buzzer, buzzer_frequency, buzzer_duration);

            }
            break;


        default:
            fALARM=false; // allarme rientrato
            // buzzer_OFF=0;
            if (phase>0) {
                setPhase(0);
                int _duration=500;
                int _frequency=500;
                for (int i=3;i>0;i--) {
                    tone(Buzzer, _frequency*i, _duration);
                    delay(_duration*1.1);
                }
                noTone(Buzzer);
            }
            break;
    }

}



// ==================================
// -
// ==================================
void checkLed() {
// bool isLedTime;
static byte ledState;
static unsigned long LED_LastChangeTime;
unsigned long elapsed;

    // mai comparare due tempi
    // while (millis() < start + ms) ;  // BUGGY version
    // and
    // while (millis() - start < ms) ;  // CORRECT version

    elapsed = now-LED_LastChangeTime;
    switch(ledState) {
        case ON:
            // if the LED is on, we must wait for the duration to expire before turning it off
            if (elapsed >= led_duration) {
                // change the state to LOW
                ledState = OFF;
                digitalWrite(blinkingLED, ledState);
                // and save the time when we made the change
                LED_LastChangeTime += led_duration;
                // NOTE: The previous line could alternatively be
                //              LED_LastChangeTime = now
                //        which is the style used in the BlinkWithoutDelay example sketch
                //        Adding on the interval is a better way to ensure that succesive periods are identical
            }
            break;

        default:
            // if the LED is off, we must wait for the interval to expire before turning it on
            if (elapsed >= led_interval) {
                // change the state to HIGH
                ledState = ON;
                digitalWrite(blinkingLED, ledState);
                // and save the time when we made the change
                LED_LastChangeTime += led_interval;
            }
            break;
    } // end switch

}






// ==================================
// -
// ==================================
void checkHorn() {
static unsigned long HORN_lastChangeTime;
byte hornState;
unsigned long elapsed;

    hornState=digitalRead(Horn);
    elapsed = now-HORN_lastChangeTime;
    if (fPUMP) {
        switch(hornState) {
            case HORN_ON:
                if (elapsed >= horn_duration) {
                    digitalWrite(Horn, HORN_OFF);
                    HORN_lastChangeTime += horn_duration;
                    // NOTE: The previous line could alternatively be
                    //              HORN_lastChangeTime = now
                    //        which is the style used in the BlinkWithoutDelay example sketch
                    //        Adding on the interval is a better way to ensure that succesive periods are identical
                    lnprint(true, "Horn will be OFF for ", horn_interval/1000, " Sec.\n" );
                }
                break;

            case HORN_OFF:
                if (elapsed >= horn_interval) {
                    digitalWrite(Horn, HORN_ON);
                    HORN_lastChangeTime += horn_interval;
                    lnprint(true, "Horn will be ON for ", horn_duration/1000, " Sec.\n" );

                }
                break;
        } // end switch
    }
    else {
        if (hornState==HORN_ON)
            digitalWrite(Horn, HORN_OFF);
        HORN_lastChangeTime=now; // ??? ma serve?
    }


}



// ==================================
// -
// ==================================
void setPhase(int count) {

    phase=count;

    if (phase==0) noTone(Buzzer);
    if (phase>PHASE_ALARM_THRESHOLD_NUMBER) {
        fALARM=true;
        phase=PHASE_ALARM_THRESHOLD_NUMBER;
    }


    // - defaults....
    buzzer_frequency = BUZZER_FREQUENCY;   
    led_duration = LED_DURATION;
    led_interval = LED_INTERVAL;
    buzzer_volume   = 9;


    if ((phase*PHASE_STEP_DOWN) > PHASE_INTERVAL) // controllo di salvaguardia
        phase_interval=PHASE_MIN_INTERVAL;
    else
        phase_interval = PHASE_INTERVAL - (phase*PHASE_STEP_DOWN); // ogni phase diminuiamo l'intervallo

    if (fALARM) {
        phase_interval = PHASE_ALARM_INTERVAL;  // secondi

        horn_interval = PHASE_ALARM_THRESHOLD_NUMBER*500;
        // horn_duration = PHASE_ALARM_THRESHOLD_NUMBER*1000*2; // suona per il 50% dell'intervllo
        horn_duration = horn_interval*4; // suona per il 80% del ciclo

        led_duration = LED_DURATION/6;
        led_interval = LED_INTERVAL/4;

        // Serial.println("Siamo in ALLARME!!!!");
    }

    else if (fPUMP) {
        led_duration = LED_DURATION/4;
        led_interval = LED_INTERVAL/4;
        horn_interval = phase_interval;
        horn_duration = (phase+2)*1000;

    }


    buzzer_duration = (phase+1)*1000;
    if (buzzer_duration>phase_interval) buzzer_duration=phase_interval/3;

    phase_start_time = now;
    printStatus();
}



// ==================================
// -
// ==================================
void printStatus() {
    lnprint(fPrint_BEEP, "\nnow: ", now, " - ");
    lnprint(fPrint_BEEP, "phase # : ", phase);
    if (fALARM) {
        lnprint(fPrint_BEEP, "      ALARM ON");
    }
    if (fPUMP) {
        lnprint(fPrint_BEEP, "      phase_interval  : ", phase_interval, " mSec\n");
        lnprint(fPrint_BEEP, "      buzzer_duration : ", buzzer_duration, " mSec\n");
        lnprint(fPrint_BEEP, "      buzzer_frequency: ", buzzer_frequency, " Hz\n");
        lnprint(fPrint_BEEP, "      horn_interval   : ", horn_interval, " mSec\n");
        lnprint(fPrint_BEEP, "      horn_duration   : ", horn_duration, " mSec\n\n");
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

