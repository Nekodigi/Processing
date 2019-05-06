float Rote;
float Rote1;
int RoteChange1;
int DataSpace = 10;
float Data[][];

void setup() {
  fullScreen();
  background(0);
  strokeCap(0);
}

void draw(){
  background(0);
  noFill();
  stroke(0,255,0);
  strokeWeight(20);
  Rote = RoteChange1;
  Rote1 = 100 + RoteChange1;
  arc(width /2,height / 2,500,500, radians(Rote), radians(Rote1) );
  RoteChange1++;
  if(RoteChange1 >= 360){
    RoteChange1 = 0;
  }
}
