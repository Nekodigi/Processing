float posdata[][] = new float[4][2];
float randomseed[][] = new float[1000][10];
int totalpos = 0;
int totalcount = 200;

void setup(){
  background(0);
  fullScreen();
  for(int i = 0; i < 1000; i++){
    randomseed[i][0] = random(1, 10);
    //randomseed[i][1] = random(1, 5);
    //randomseed[i][2] = random(-50, 50);
    //randomseed[i][3] = random(-50, 50);
  }
}

void draw(){
  background(0);
  float totaldif = 0;
  if(totalpos == 4){
    for(int i = 0; i < totalcount; i++){
    float pos1x = posdata[0][0];
    float pos1y = posdata[0][1];
    float pos2x = posdata[1][0];
    float pos2y = posdata[1][1] + totaldif;
    float pos3x = posdata[2][0];
    float pos3y = posdata[2][1] + totaldif;
    float pos4x = posdata[3][0];
    float pos4y = posdata[3][1];
    totaldif += randomseed[i][0];
    noFill();
    stroke(i + 50, 150, 150);
    strokeWeight(2);
    bezier(pos1x, pos1y, pos2x, pos2y, pos3x, pos3y, pos4x, pos4y);
    }
  }
}

void mousePressed(){
  if(totalpos <= 3){
    posdata[totalpos][0] = mouseX;
    posdata[totalpos][1] = mouseY;
    totalpos++;
  }
  else
  {
    totalpos = 0;
    posdata[totalpos][0] = mouseX;
    posdata[totalpos][1] = mouseY;
    totalpos++;
  }
}