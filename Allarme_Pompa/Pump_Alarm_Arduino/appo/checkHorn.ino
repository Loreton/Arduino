
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

