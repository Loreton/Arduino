

// #define SKIP_PRINT_VALUE    9999111

// bool fPrint_BEEP    = true;
// bool fPrint_HORN    = true;
// bool fPrint_TONE    = false;
// bool fPrint_LED     = false;
// bool fPrint_VERBOSE = false;



// void lnprint(bool fDEBUG, char *msg, unsigned long value=SKIP_PRINT_VALUE, const char *s2="\n");
// char *Utoa(unsigned int i, byte padLen=2, byte fill=' ');
// // void print6Str(bool fDEBUG, const char *s1, const char *s2="", const char *s3="", const char *s4="", const char *s5="", const char *s6="");
// void printStr(bool fPrint,
//                 const char *s1,
//                 const char *s2="",
//                 const char *s3="",
//                 const char *s4="",
//                 const char *s5="",
//                 const char *s6="",
//                 const char *s7="",
//                 const char *s8="",
//                 const char *s9="",
//                 const char *s10="",
//                 const char *s11="",
//                 const char *s12="");

// ==================================
// -
// ==================================
void lnprint(bool fPrint, char *msg, unsigned long value, const char *s2) {
    if (fPrint) {
        Serial.print(msg);
        if (value!=SKIP_PRINT_VALUE) Serial.print(value);
        Serial.print(s2);
    }
}


// ==================================
// -
// ==================================
void printStr(bool fPrint,
                const char *s1,
                const char *s2,
                const char *s3,
                const char *s4,
                const char *s5,
                const char *s6,
                const char *s7,
                const char *s8,
                const char *s9,
                const char *s10,
                const char *s11,
                const char *s12) {
    if (fPrint) {
        Serial.print(s1);
        Serial.print(s2);
        Serial.print(s3);
        Serial.print(s4);
        Serial.print(s5);
        Serial.print(s6);
        Serial.print(s7);
        Serial.print(s8);
        Serial.print(s9);
        Serial.print(s10);
        Serial.print(s11);
        Serial.print(s12);
    }
}


// ==================================
// -
// ==================================
char UtoaBuffer[10];  // buffer dedicato
char *Utoa(unsigned int i, byte padLen,  byte fill) {
    char *ptr = &UtoaBuffer[9];
    *ptr = '\0';                  // chiude il buffer finale

    for(*ptr--=0; i>0 ;i/=10) {
        *ptr-- = i%10 + '0';
        padLen--;
    }

    while (padLen--) *ptr-- = fill;
    return ++ptr;
}