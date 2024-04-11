/*
This is an example how to use Touch Intrrerupts
The bigger the threshold, the more sensible is the touch
ref: https://espressif-docs.readthedocs-hosted.com/projects/arduino-esp32/en/latest/api/touch.html
*/
#include "Esp32_02.h"

int threshold = 40;

bool touch_02_detected = false;
// touchSetCycles(uint16_t 1, uint16_t 1); // void touchSetCycles(uint16_t measure, uint16_t sleep);

void gotTouch_02(){
    touch_02_detected = true;
}

void setupTouch(int pin) {
    touchAttachInterrupt(pin, gotTouch_02, threshold);
    Serial.println("ESP32 Touch Interrupt Test");
}

bool check_touchIrq(){
    bool xx=touch_02_detected;

    if(touch_02_detected) {
        Serial.print("Touch 2 detected");
        touch_02_detected = false;
    }
    return xx;
}


bool readTouchPin(int pin) {
    int xx=touchRead(T1);
    return xx;
}





// ref: https://github.com/espressif/arduino-esp32/issues/4321
// ref: https://github.com/espressif/arduino-esp32/issues/4321
// ref: https://github.com/espressif/arduino-esp32/issues/4321
// ref: https://github.com/espressif/arduino-esp32/issues/4321
// ref: https://github.com/espressif/arduino-esp32/issues/4321

#ifdef XXXXX
int touchPins_[] = {0, 2, 4, 12,13, 14, 15, 27, 32, 33};
int touchPins__[] = {2};

//define primary struct
typedef struct {
  unsigned int  pin_nr;
  unsigned int  rele_nr;
} touchPins_struct;



#define TOUCH_PIN_COUNT 1
touchPins_struct touchPin[TOUCH_PIN_COUNT];
touchPin[0] = {2, 5};
touchPin[1] = {4, 9};



void gotTouch(touchPins_struct *s) {
    pin=s.pin_nr;
    rele=s.rele_nr;

    touch_02_detected = true;
}


bool multipleTouchPin(int pin) {
    for(int i=0; i<TOUCH_PIN_COUNT; i++) {
      touchAttachInterruptArg(touchPin[i].pin_nr, gotTouch, &touchPin[i], threshold);
      // touchSleepWakeUpEnable(pinNames[i], 500);
    }
}
#endif