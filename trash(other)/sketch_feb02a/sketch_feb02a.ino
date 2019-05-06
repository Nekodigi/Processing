bool DIR;
const int limX=12;
const int limY=11;
const int limZ=10;
const int motXdir=9;
const int motXpu=8;
int motYdir=7;
int motYpu=6;
int motZdir=5;
int motZpu=4;
int motEdir=3;
int motEpu=2;
int Speed = 1000;

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  DIR = !DIR;
  digitalWrite(motXdir, DIR);
  for(int i = 0; i < 200; i++){
    digitalWrite(motXpu, HIGH);
    delayMicroseconds(Speed);
    digitalWrite(motXpu, LOW);
    delayMicroseconds(Speed);
  }
  delay(1000);
  digitalWrite(motYdir, DIR);
  for(int i = 0; i < 200; i++){
    digitalWrite(motYpu, HIGH);
    delayMicroseconds(Speed);
    digitalWrite(motYpu, LOW);
    delayMicroseconds(Speed);
  }
  delay(1000);
  digitalWrite(motZdir, DIR);
  for(int i = 0; i < 200; i++){
    digitalWrite(motZpu, HIGH);
    delayMicroseconds(Speed);
    digitalWrite(motZpu, LOW);
    delayMicroseconds(Speed);
  }
  delay(1000);
  digitalWrite(motEdir, DIR);
  for(int i = 0; i < 200; i++){
    digitalWrite(motEpu, HIGH);
    delayMicroseconds(Speed);
    digitalWrite(motEpu, LOW);
    delayMicroseconds(Speed);
  }
  delay(1000);
}
