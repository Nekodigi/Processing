float radius = 300;
int vector = 100;
float randomseed[][] = new float[vector][2];

void setup(){
  size(1280, 720, P3D);
  pixelDensity(displayDensity());
  for(int i = 0; i < vector; i++){
    randomseed[i][0] = random(0, 180);
    randomseed[i][1] = random(0, 360);
  }
}

void draw(){
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.02);
  
  float x, y, z;
  for(int i = 0; i < vector; i ++){
    x = radius * sin(randomseed[i][0]) * cos(randomseed[i][1]);
    y = radius * sin(randomseed[i][0]) * sin(randomseed[i][1]);
    z = radius * cos(randomseed[i][0]);
    
    stroke(0);
    strokeWeight(8);
    point(x, y, z);
  }
}