// ---------------------------------------------------------------------------
// Connect your piezo buzzer (without internal oscillator) or speaker to these pins:
//   Pins  9 & 10 - ATmega328, ATmega128, ATmega640, ATmega8, Uno, Leonardo, etc.
//   Pins 11 & 12 - ATmega2560/2561, ATmega1280/1281, Mega
//   Pins 12 & 13 - ATmega1284P, ATmega644
//   Pins 14 & 15 - Teensy 2.0
//   Pins 25 & 26 - Teensy++ 2.0
// Be sure to include an inline 100 ohm resistor on one pin as you normally do when connecting a piezo or speaker.
// ---------------------------------------------------------------------------

// Syntax
// toneAC( frequency [, volume [, length [, background ]]] ) - Play a note.

//      frequency   - Play the specified frequency indefinitely, turn off with toneAC().
//      volume      - [optional] Set a volume level. (default: 10, range: 0 to 10 [0 = off])
//      length      - [optional] Set the length to play in milliseconds. (default: 0 [forever], range: 0 to 2^32-1)
//      background  - [optional] Play note in background or pause till finished? (default: false, values: true/false)
//      toneAC()    - Stop output.
//      noToneAC()  - Same as toneAC().


#include <toneAC.h>

// Melody liberated from the toneMelody Arduino example sketch by Tom Igoe.
int melody[] = { 262, 196, 196, 220, 196, 0, 247, 262 };
int noteDurations[] = { 4, 8, 8, 4, 4, 4, 4, 4 };

int buzzerPin = 2;
int freq=4000;
int durata=1000;

void setup(){
  pinMode(buzzerPin, OUTPUT);
}


// NON noto differenze di volume se non nel fatto che con toneAC posso abbassarlo.
void loop(){
    buzzerNormale();
    noTone(buzzerPin);
    buzzerAC();
    delay(durata);
    noToneAC();
    delay(durata*2);
    while(1);
}

void buzzerNormale(){
    tone(buzzerPin, freq, durata);
    //delay(durata*2);
}

void buzzerAC(){ // per Nano default pin 9 e 10
    //for (unsigned int volume=1;volume<=10; volume+=1) {
    //   toneAC(freq, volume, durata); // Play the frequency (125 Hz to 15 kHz sweep in 10 Hz steps).
    //}
    toneAC(freq, 10, durata);
    //delay(durata*2);

}

void loop2() {
  for (unsigned long freq = 125; freq <= 15000; freq += 10) {
    toneAC(freq); // Play the frequency (125 Hz to 15 kHz sweep in 10 Hz steps).
    delay(1);     // Wait 1 ms so you can hear it.
  }
  toneAC(); // Turn off toneAC, can also use noToneAC().

  delay(1000); // Wait a second.

  for (int thisNote = 0; thisNote < 8; thisNote++) {
    int noteDuration = 1000/noteDurations[thisNote];
    toneAC(melody[thisNote], 10, noteDuration, true); // Play thisNote at full volume for noteDuration in the background.
    delay(noteDuration * 4 / 3); // Wait while the tone plays in the background, plus another 33% delay between notes.
  }

  while(1); // Stop (so it doesn't repeat forever driving you crazy--you're welcome).
}
