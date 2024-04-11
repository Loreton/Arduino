
#include <Servo.h> // include la Libreria Servo.h

Servo myservo;  // crea l’oggetto di tipo Servo, myservo sarà l’oggetto su cui opererai


int pos = 0;    // inizializza una variabile di tipo intero pos il cui valore sarà la posizione da impartire al servo

void setup() {
    myservo.attach(8);  // lega l’oggetto myservo al pin a cui abbiamo collegato il nostro servo, in questo caso il pin 8
    Serial.begin(9600);  // Debug

}


void servo_Gradi() {
    int MAX_POS=180;
    delay(3000);                       // imposta un ritardo di 15 millesimi di secondo per ogni ciclo del for.
    Serial.println("  sono a 0");
    myservo.write(0);              // con il metodo write() passi all’oggetto myservo la posizione che deve raggiungere,
    delay(3000);                       // imposta un ritardo di 15 millesimi di secondo per ogni ciclo del for.
    Serial.println("  sono a 180");
    myservo.write(180);              // con il metodo write() passi all’oggetto myservo la posizione che deve raggiungere,


    #if 0
    delay(3000);                       // imposta un ritardo di 15 millesimi di secondo per ogni ciclo del for.
    Serial.println("  inizio avanzamento 0 - 180");
    for(pos = 0; pos < MAX_POS; pos++) { // imposta un ciclo con valori che vanno da 0 a 180, sarano i gradi di spostamento del nostro servo
        myservo.write(pos);              // con il metodo write() passi all’oggetto myservo la posizione che deve raggiungere,
                                     // il servo si sposterà gradualmente dalla sua posizione 0° alla posizione 180°
        delay(15);                       // imposta un ritardo di 15 millesimi di secondo per ogni ciclo del for.
                                     // Più sarà alto il ritardo più il servo sarà lento.
    }

    Serial.println("  inizio avanzamento 180 - 0");
    for(pos = MAX_POS; pos>=1; pos--) {    // In questo caso imposta un ciclo con valori che vanno da 180 a 0
        myservo.write(pos);
        delay(15);
    }
    #endif
}


void loop() {
    servo_Steve();
    // servo_uS();
    // servo_Gradi();
}

void servo_Steve() {
    int uSec;
    uSec = 1500;Serial.println( uSec );myservo.writeMicroseconds( uSec );delay(2000);
    uSec = 500;Serial.println( uSec );myservo.writeMicroseconds( uSec ); delay(2000);
    uSec = 2000;Serial.println( uSec );myservo.writeMicroseconds( uSec ); delay(2000);
    uSec = 500;Serial.println( uSec );myservo.writeMicroseconds( uSec ); delay(2000);
    uSec = 1500;Serial.println( uSec );myservo.writeMicroseconds( uSec ); delay(2000);
}

void servo_uS() {
   for ( int i=1500; i<2500; i+=100 ) {
     Serial.println( i );
     myservo.writeMicroseconds( i );
     delay(1000);
   }

   delay(2000);

   for ( int i=1500; i>500; i-=100 ) {
     Serial.println( i );
     myservo.writeMicroseconds( i );
     delay(1000);
   }
}