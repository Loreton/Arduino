unsigned long int global_counter;
void setup() {
  Serial.begin(9600);
  global_counter = 0;
  // initialize Timer1
  cli();             // disable global interrupts
  TCCR1A = 0;        // set entire TCCR1A register to 0
  TCCR1B = 0;
  // Set CS10 and CS12 bits so timer runs at clock speed /1024:
  TCCR1B |= (1 << CS12)|(1 << CS10);

  // enable Timer1 overflow interrupt:
  TIMSK1 = (1 << TOIE1);
  // enable global interrupts:
  sei();
}
void loop() {
  delay(1000); // delay uses timer0
  Serial.print("counter: ");
  Serial.println(global_counter);
}
ISR(TIMER1_OVF_vect)
{
  global_counter++;
}