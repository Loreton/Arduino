/*
  ReadAnalogVoltage
  Reads an analog input on pin 0, converts it to voltage, and prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

 This example code is in the public domain.
 */

int THR_Pin         = A0;   // select the input pin for the potentiometer
int THR_Value       = 0;    // valore analogico del potenziometro

int LDR_Pin         = A3;   // select the input pin for the LDR
int LDR_Value       = 0;    // valore analogico LDR

int LED             = 5;   // select the pin for the LED (13 e' quello incorporato)
int Relay           = 3;

int debounce       = 0;
int led_state       = 0;
int idleCounter       = 0;

boolean isBUIO, isLUCE;

int LED_SPEED;
#define LED_LOW_SPEED   3  // # of cycles
#define LED_HIGH_SPEED  0  // # of cycles

#define DEBOUNCE_MAX     15 // tempo (sec) di monitor prima di accendere o spegnere le luc


// the setup routine runs once when you press reset:
void setup() {
    pinMode(LED, OUTPUT);
    pinMode(Relay, OUTPUT);
    digitalWrite(LED, LOW);
    digitalWrite(Relay, LOW);
    // initialize serial communication at 9600 bits per second:
    Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

        // ------------------------------------
        // - leggi i due pin analogici
        // - LDR diminuisce all'aumentare della luce
        // - THR diminuisce girando il trimmer in CW
        // ------------------------------------
    THR_Value = readAnalogPin(THR_Pin);
    lightLED(); // per aumentare un pò il ritmo del led
    LDR_Value = readAnalogPin(LDR_Pin);
    isBUIO=(LDR_Value <= THR_Value);
    isLUCE=(not isBUIO);
    // LDR_Value = 1023-LDR_Value;             //lo invertiamo per non invertire i fili del potenziometro.
    // THR_Value = 1023-THR_Value;             //lo invertiamo per non invertire i fili del potenziometro.

    float LDR_Voltage = LDR_Value * (5.0 / 1023.0);
    float THR_Voltage = THR_Value * (5.0 / 1023.0);


    Serial.print("LDR - Value :"); Serial.print(LDR_Value, DEC); Serial.print("  LDR - Volt     :"); Serial.println(LDR_Voltage, 2);
    Serial.print("THR - Value :"); Serial.print(THR_Value, DEC); Serial.print("  THR - Volt     :"); Serial.println(THR_Voltage, 2);


    LED_SPEED = LED_LOW_SPEED; // set del ritmo del led
    if (isBUIO) {

        if (debounce >= DEBOUNCE_MAX) {
            Serial.print("  BUIO raggiunto ");
            debounce = DEBOUNCE_MAX;
            if (digitalRead(Relay) == LOW) digitalWrite(Relay, HIGH);
        }
        // debounce per l'accensione
        else {
            Serial.print("  Rilevato BUIO: "); Serial.print("  - debounce:");Serial.println(debounce);
            debounce += 1;
            LED_SPEED = LED_HIGH_SPEED; // mettiamo al massimo il ritmo del led
        }
    }

    else {
        if (digitalRead(Relay) == LOW) debounce=0;
        // debounce per lo spegnimento
        if (debounce > 0) {
            Serial.print("  Rilevato LUCE: "); Serial.print("  - debounce:");Serial.println(debounce);
            LED_SPEED = LED_HIGH_SPEED; // mettiamo al massimo il ritmo del led
            debounce -= 1;
        }
        else {
            Serial.print("  LUCE raggiunto ");
            if (digitalRead(Relay) == HIGH) digitalWrite(Relay, LOW);
        }
    }


    Serial.println();

    lightLED();




}


void lightLED() {
    Serial.print("  idleCounter ");Serial.print(idleCounter);
    Serial.print("  LED_SPEED   ");Serial.print(LED_SPEED);
    Serial.print("  debounce    ");Serial.print(debounce);
    Serial.println();
    if (idleCounter >= LED_SPEED) {
        togglePIN(LED);
        idleCounter=0;
    }
    else {
        idleCounter+=1;
        digitalWrite(LED, LOW);
    }
}

void togglePIN(int pin) {
    if (digitalRead(pin) == HIGH) {
        digitalWrite(pin, LOW);
    }
    else {
        digitalWrite(pin, HIGH);
    }
}

// ##################################################
// #
// ##################################################
int readAnalogPin(int pin) {
const int MAX_READS = 10;
int readings[MAX_READS];           // the readings from the analog input
int readInx = 0;              // the index of the current reading
int totValue = 0;                  // the running totValue
int avgValue = 0;                // the avgValue
int MIN = 2000;
int MAX= 0;

        // Lettura del pin
    for (readInx = 0; readInx < MAX_READS; readInx++) {
        readings[readInx] = analogRead(pin);    // lettura pin

        // add the reading to the totValue:
        totValue = totValue + readings[readInx];
        delay(100);        // delay in between reads for stability
    }

    // calculate the avgValue:
    avgValue = totValue / MAX_READS;

        // DEBUG Display valori
    boolean fDEBUG = false;
    if (fDEBUG) {
        Serial.print("[PIN ");Serial.print(pin, HEX);Serial.print("] - ");
        for (readInx = 0; readInx < MAX_READS; readInx++) {
            Serial.print(" ");Serial.print(readings[readInx], DEC);
        }
        Serial.print(" avgValue = ");Serial.print(avgValue, DEC);
        float Voltage = avgValue * (5.0 / 1023.0);
        Serial.print(" Voltage = ");Serial.println(Voltage, 2);
        Serial.println();
    }
    #if 0
    #endif


    return avgValue;
}
