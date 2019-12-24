
// ==================================
// -
// ==================================
void checkPumpState() {

    now = millis();
    fPUMP = !digitalRead(pumpState);  // logica inversa. PumpON->LowLevel
    // isBuzzerTime   = now>=buzzer_duration;
    // isIntervalTime = now>=buzzer_interval;

    switch(fPUMP) {
        case ON:
            fHORN=true;
            // buzzerState=true;
            // if (isBuzzerTime!=0)
            //     break;
            // buzzer_cycle=true;
            if (isBuzzerTime!=0) {
                break;
            }
            if (isIntervalTime!=0 && isIntervalTime<now) { // siamo all'interno de ciclo
                Serial.println("Ciclo completato.");
                isIntervalTime=0;
            }
            else if (phase>=5)  {
                Serial.println("Siamo in ALLARME!!!!");
                phase=nPhases; // manteniamoci sull'ultimo valore
                fALARM=ON; // terminerà solo quando la pompa verrà spenta da qualcuno...

                // mettiamo il buzzer con un suono più pressante
                buzzer_duration  = 500;    //ms
                buzzer_interval  = 1000;   // secondi
                buzzer_frequency = 2000;   //Hz

                led_duration = LED_ALARM_DURATION;
                led_interval = LED_ALARM_DURATION;

                horn_duration = HORN_ALARM_DURATION;
                horn_interval = HORN_ALARM_INTERVAL;

                buzzer_interval  = BUZZER_ALARM_INTERVAL;
                buzzer_duration  = BUZZER_ALARM_DURATION;   //ms
                buzzer_frequency = BUZZER_ALARM_FREQUENCY;   //Hz
            }
            else {
                phase++;


                led_duration = LED_PUMP_DURATION;
                led_interval = LED_PUMP_DURATION;

                horn_duration = HORN_DURATION;
                horn_interval = HORN_INTERVAL;

                // byte index=phase*4;
                // buzzer_interval  = BEEP[index+INTERVAL]*1000;
                // buzzer_duration  = BEEP[index+DURATION];   //ms
                // buzzer_frequency = BEEP[index+FREQ];   //Hz
                buzzer_interval  = BUZZER_INTERVAL; // rendiamolo sempre più veloce
                buzzer_duration  = BUZZER_DURATION;   //ms
                buzzer_frequency = BUZZER_FREQUENCY;   //Hz
            }
            printStr(fPrint_BEEP, "phase: ", Utoa(phase), "/", Utoa(nPhases), "\n");
            phase_ON=true; // attiviamo la phase
            lnprint(fPrint_BEEP, "\n\nBuzzer ON ");
            tone(Buzzer, buzzer_frequency, buzzer_duration);
            isBuzzerTime=now + BUZZER_DURATION; // tempo (millsis()) a cui il buzzer si dovrà spegnere
            lnprint(fPrint_BEEP, "isBuzzerTime: ", isBuzzerTime);
            break;

        default:
            fHORN=false;
            fALARM=OFF; // allarme rientrato
            buzzer_cycle=false;
            led_duration = LED_DEFAULT_DURATION;
            led_interval = LED_DEFAULT_INTERVAL;
            phase=0;
            break;
    }

}
