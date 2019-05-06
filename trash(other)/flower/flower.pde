float posdata[][] = new float[2][2];
float randomseed[][] = new float[100][10];
int totalpos = 0;
float maxangle = 30;
int petal = 5;

void setup(){
  background(0);
  fullScreen();
  for(int i = 0; i < 100; i++){
    randomseed[i][0] = random(-200, -400);
    randomseed[i][1] = random(-100, -200);
  }
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(2);
  if(totalpos == 2){
    line(posdata[0][0], posdata[0][1], posdata[1][0], posdata[1][1]);
    drawflower();
  }
}

void mousePressed(){
  if(totalpos <= 1){
    posdata[totalpos][0] = mouseX;
    posdata[totalpos][1] = mouseY;
    totalpos++;
  }
  else{
    totalpos = 0;
    posdata[totalpos][0] = mouseX;
    posdata[totalpos][1] = mouseY;
    totalpos++;
  }
}

void drawflower(){
  stroke(255);
  strokeWeight(2);
  noFill();
  float distance = dist(posdata[0][0], posdata[0][1], posdata[1][0], posdata[1][1]);
  float slope = atan2(posdata[1][0] - posdata[0][0], posdata[1][1] - posdata[0][1]);
  float midposx = posdata[0][0] + sin(slope) * (distance / 2);
  float midposy = posdata[0][1] + cos(slope) * (distance / 2);
  for(int i = 1; i < petal; i++){
    float upos1x = posdata[0][0];
    float upos1y = posdata[0][1];
    float upos2x = upos1x + sin(radians(maxangle / petal * i) + slope) * distance;
    float upos2y = upos1y + cos(radians(maxangle / petal * i) + slope) * distance;
    float upos3x = upos2x + sin(-radians(maxangle / petal * i) + slope) * randomseed[i][0];
    float upos3y = upos2y + randomseed[i][1] + cos(radians(maxangle / petal * i) + slope) * randomseed[i][0];
    float dpos1x = upos1x;
    float dpos1y = upos1y;
    float dpos2x = dpos1x + sin(-radians(maxangle / petal * i) + slope) * distance;
    float dpos2y = dpos1y + cos(-radians(maxangle / petal * i) + slope) * distance;
    float dpos3x = dpos2x + sin(-radians(maxangle / petal * i) + slope) * randomseed[i][0];
    float dpos3y = dpos2y + -randomseed[i][1] + cos(-radians(maxangle / petal * i) + slope) * randomseed[i][0];
    bezier(upos1x, upos1y, upos2x, upos2y, upos2x, upos2y, upos3x, upos3y);
    bezier(dpos1x, dpos1y, dpos2x, dpos2y, dpos2x, dpos2y, dpos3x, dpos3y);
  }
}