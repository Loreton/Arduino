#define BUZZER_DURATION         1000          // number of millisecs that Buzzer is ON
#define BUZZER_INTERVAL         3000           // number of millisecs between Buzzer
#define BUZZER_FREQUENCY        2000           // frequency sound during pump_on

#define BUZZER_ALARM_DURATION   1000    // number of millisecs that Buzzer is ON during alarm
#define BUZZER_ALARM_INTERVAL   300    // number of millisecs between Buzzer_sounds during alarm
#define BUZZER_ALARM_FREQUENCY  2000   // frequency during alarm
unsigned long buzzer_duration, buzzer_interval, buzzer_frequency, previousBuzzerTime, isBuzzerTime, isIntervalTime;
byte buzzerState=OFF;
byte buzzer_cycle=false;     // Flag per suonare il buzzer

// ==================================
// - Il ciclo è dato dal tempo del suono + il tempo di interval
// ==================================
void checkBuzzer() {
    // isBuzzerTime = (now-previousBuzzerTime)>=buzzer_duration;
    if (isBuzzerTime!=0 && isBuzzerTime<now) { // se stiamo suonando, portiamolo a termine
        // lnprint("now: ", now);
        noTone(Buzzer);
        Serial.println("Beep completato.");
        isBuzzerTime=0;
    }
}

// ==================================
// -
// ==================================
void _checkBuzzer() {
    if (phase_ON) {
        switch (buzzerState) {
            case ON:
                isBuzzerTime = (now-previousBuzzerTime)>=buzzer_duration;
                if (isBuzzerTime) {
                    previousBuzzerTime += buzzer_duration;
                    // NOTE: The previous line could alternatively be
                    //              previousBuzzerTime = now
                    //        which is the style used in the BlinkWithoutDelay example sketch
                    //        Adding on the interval is a better way to ensure that succesive periods are identical
                    buzzerState = OFF;
                    // lnprint(fPrint_BEEP, "Interval OFF ");
                    noTone(Buzzer);

                }
                break;

            case OFF:
                isBuzzerTime = (now-previousBuzzerTime)>=buzzer_interval;
                if (isBuzzerTime) {
                    previousBuzzerTime += buzzer_interval;
                    buzzerState = ON;
                    phase_ON=false;
                    // lnprint(fPrint_BEEP, "Buzzer OFF ");
                }
                break;
        } // end switch

    // if (isBuzzerTime) {
    //     lnprint(fPrint_BEEP, "BUZZER Status: ", buzzerState, " - ");
    //     lnprint(fPrint_BEEP, "duration: ", buzzer_duration, " - ");
    //     lnprint(fPrint_BEEP, "interval: ", buzzer_interval);
    //     digitalWrite(Buzzer, buzzerState);
    }

}
