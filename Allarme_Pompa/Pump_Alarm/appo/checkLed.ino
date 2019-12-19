

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
