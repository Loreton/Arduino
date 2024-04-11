#include <LnFunctions.h>
/*
void LnPrint(const char *data1, const char *data2, const char *data3) {
    Serial.print(data1);
    Serial.print(data2);
    Serial.print(data3);
}

*/

void printNchar(const char data, byte counter) {
    byte i;
    for (i=0; i<counter; i++) {
        Serial.print(data);
    }
}


// ---------------------------------------
// stampa solo char visualizzabili
// se la len==0 allora calcoliamo la
// lunghezza cercando il '\0' nella stringa.
// ---------------------------------------
void printDelimitedStr(const char *data, byte len, const char *delimiter) {
    byte i;
    if (delimiter) Serial.print(delimiter[0]);

    // - calcolo len
    if (len==0) len = stringLen(data);

    // - print data
    for (i=0; i<len; i++) {
        if ( (data[i]>=32) & (data[i]<127))
            Serial.print(char(data[i]));
        else if ( (data[i]==10) & (data[i]==13))
            Serial.print(char(data[i]));
        else
            Serial.print(' ');
    }

    if (delimiter) Serial.print(delimiter[1]);
}


void print6Str(const char *s1, const char *s2, const char *s3, const char *s4, const char *s5, const char *s6) {
    Serial.print(s1);
    Serial.print(s2);
    Serial.print(s3);
    Serial.print(s4);
    Serial.print(s5);
    Serial.print(s6);
}


// ==================================
// -
// ==================================
void LnPrint(bool fPrint,
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
