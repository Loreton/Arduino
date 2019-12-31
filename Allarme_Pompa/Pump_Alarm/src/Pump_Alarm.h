// creare il link:
//      cd /usr/share/arduino/libraries
//      sudo ln -s /home/pi/gitREPO/Ln-RS485/ArduinoLibraries/LnFunctions


// #if defined(ARDUINO) && ARDUINO >= 100
//   #include "Arduino.h"
// #else
//   #include "WConstants.h"
// #endif





        // http://www.keywild.com/arduino/gallery/Nano_PinOut.png
#if defined(_I_AM_ARDUINO_NANO_)
        #define D00       0         // pin.30 D00 - RS232:RXD
        #define D01       1         // pin.31 D01 - RS232:TXD

        #define D02       2         // pin.32 - D02 -           -
        #define D03       3         // pin.01 - D03 -           - PWM
        #define D04       4         // pin.02 - D04 - I2C:SDA
        #define D05       5         // pin.09 - D05 - I2C:SCL   - PWM
        #define D06       6         // pin.10 - D06 -           - PWM
        #define D07       7         // pin.11 - D07 -           -
        #define D08       8         // pin.12 - D08 -           -
        #define D09       9         // pin.13 - D09 -           - PWM
        #define D10      10         // pin.14 - D10 - SPI:SS    - PWM
        #define D11      11         // pin.15 - D11 - SPI:MOSI  - PWM
        #define D12      12         // pin.16 - D12 - SPI:MISO  -
        #define D13      13         // pin.17 - D13 - SCK       - R1K + LED

        #define A00      A00        // pin.19 - A00-D14 - Analog or Digital
        #define A01      A01        // pin.20 - A01-D15 - Analog or Digital
        #define A02      A02        // pin.21 - A02-D16 - Analog or Digital
        #define A03      A03        // pin.22 - A03-D17 - Analog or Digital
        #define A04      A04        // pin.23 - A04-D18 - Analog or Digital
        #define A05      A05        // pin.24 - A05-D19 - Analog or Digital

        #define A06      A06        // pin.25 - A06         - Analog exclusive pins
        #define A07      A07        // pin.26 - A06         - Analog exclusive pins
        #define RESET             // pin.26 - A06         - Analog exclusive pins
#endif


#define ON  1
#define OFF 0
#define HORN_ON  0
#define HORN_OFF 1


#define PHASE_INTERVAL          60*1000L    // number of mseconds between Buzzer
#define PHASE_MIN_INTERVAL      10*1000    // minimo intervallo di Buzzer
#define PHASE_STEP_DOWN         2000    // step con cui deve scendere lìintervallo per ogni fase
#define PHASE_ALARM_INTERVAL    8*1000    // number of mseconds between Buzzer_sounds during alarm
#define BUZZER_FREQUENCY        500          // Buzzer frequency

// number of phases before alarm phase starts and pump will be forced off.
// PHASE_INTERVAL * PHASE_ALARM_THRESHOLD ==> 30*6 = (about) 3 minutes
#define PHASE_ALARM_THRESHOLD      10



#define LED_DURATION            2000
#define LED_INTERVAL            2000
#define LED_PUMP_DURATION        500
#define LED_PUMP_INTERVAL        500
#define LED_ALARM_DURATION       300
#define LED_ALARM_INTERVAL       100



#define SKIP_PRINT_VALUE    999911199



const bool fPrint_BEEP    = true;
const bool fPrint_HORN    = true;
const bool fPrint_TONE    = false;
const bool fPrint_LED     = false;
const bool fPrint_VERBOSE = false;

// int BEEP[] = { // phase, delaySec, frequency, duration)
//                    0,       5,         2000,     500,
//                    1,      10,         2000,    1000,
//                    2,      10,         2000,    1000,
//                    3,      10,         2000,    1000,
//                    4,      10,         2000,    1000,
//                    5,      10,         2000,    1000,
//                    6,      10,         2000,    1000,
//                    7,      10,         2000,    1000,
//                    8,      10,         2000,    1000,
//                    9,      10,         2000,    1000,
//                   10,      10,         2000,    1000,
//             };

// ----------- F U N C T I O N S  -------------------

void lnprint(bool fDEBUG, const char *msg, const unsigned long value=SKIP_PRINT_VALUE, const char *s2="\n");
void setPhase(int);
void checkPumpState(void);
void checkLed(void);
void checkHorn(void);
void PressControl_powerOFF(void);

    void LnPrint(const bool fPrint,
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

