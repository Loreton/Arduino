#include <Arduino.h>
#include <Pump_Alarm.h>


void printNchar(const char data, byte counter) {
    byte i;
    for (i=0; i<counter; i++) {
        Serial.print(data);
    }
}


// ==================================
// -
// ==================================
void LnPrint(const bool fPrint,
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

// ******************************************************************
// * Provvede a stampare piu' dati.
// * Come primo parametro il numero di argomenti passati
// ---  https://linux.die.net/man/3/va_start
// ******************************************************************
void LnPrint2(char *nArgs, ...) {
    va_list ap;
    int d;
    char c, *s;

    va_start(ap, nArgs);
        while (*nArgs)
            switch (*nArgs++) {
            case 's':              /* string */
                s = va_arg(ap, char *);
                Serial.print("string %s ");Serial.println(s);
                break;
            case 'd':              /* int */
                d = va_arg(ap, int);
                // printf("int %d\n", d);
                Serial.print("int %s ");Serial.println(d);
                break;
            case 'c':              /* char */
                /* need a cast here since va_arg only
                   takes fully promoted types */
                c = (char) va_arg(ap, int);
                Serial.print("char %s ");Serial.println(c);
                // printf("char %c\n", c);
                break;
            }
    va_end(ap);
}


// ******************************************************************
// * Provvede a concatenare piu' string tra di loro.
// * Come primo parametro il numero di argomenti passati
// ---  https://linux.die.net/man/3/va_start
// ******************************************************************
// char     *LnPrint3(int *nArgs,...) {
// byte       i;
// va_list   vaList;
// char      *next;
// char *ptr;
// char *pNewStr;
// char WorkingBuff[50];

// // char *q = D2Xbuffer;
//     // destination buffer
//     pNewStr = (char *) WorkingBuff;
//     ptr = pNewStr;

//         /* initialize vaList for num number of arguments */
//     va_start(vaList, nArgs);

//         /* access all the arguments assigned to vaList */
//     for (i=0; i<nArgs; i++) {
//         next = va_arg(vaList, char *);             // get next pointer
//         while (*next) {
//             *ptr++ = *next++;                              // add string
//         }
//         *ptr ='\0';
//         Serial.print("pNewStr ");Serial.println(pNewStr);
//     }

//         /* clean memory reserved for vaList */
//     va_end(vaList);

//     *ptr = '\0';

//     return pNewStr;
// }
