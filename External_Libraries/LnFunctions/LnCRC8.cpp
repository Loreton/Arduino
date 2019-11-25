#include <Arduino.h>

// calculate 8-bit CRC
byte LnCRC8 (const byte *addr, byte len) {
    byte crc = 0;
    while (len--) {
        byte inbyte = *addr++;
        for (byte i = 8; i; i--) {
            byte mix = (crc ^ inbyte) & 0x01;
            crc >>= 1;
            if (mix)
                crc ^= 0x8C;
            inbyte >>= 1;
        }  // end of for
    }  // end of while
    return crc;
}  // end of crc8