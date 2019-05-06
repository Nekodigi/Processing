float gridsize = 100;
float startpoint[] = new float[2];
float secondpoint[] = new float[2];
float cursorpos[] = new float[2];
int pin = 8;
boolean Keypressing;
boolean circledrawing = false;
void setup(){
  fullScreen();
}

void draw(){
  background(0);
  DrawGrid();
  if(Keypressing == false){
    cursorpos[0] = mouseX;
    cursorpos[1] = mouseY;
  }
  else if(keyCode == CONTROL){
    cursorpos[0] = round(mouseX / gridsize) * gridsize;
    cursorpos[1] = round(mouseY / gridsize) * gridsize;
  }
  if(circledrawing == false){
    fill(0);
    strokeWeight(3);
    stroke(255);
    float dist = dist(startpoint[0], startpoint[1], secondpoint[0], secondpoint[1]) * 2;
    ellipse(startpoint[0], startpoint[1], dist, dist);
    fill(255);
    strokeWeight(1);
    ellipse(cursorpos[0], cursorpos[1], 50, 50);
  }
  else{
    fill(0);
    strokeWeight(3);
    stroke(255);
    float dist = dist(startpoint[0], startpoint[1], mouseX, mouseY) * 2;
    ellipse(startpoint[0], startpoint[1], dist, dist);
  }
}

void mousePressed(){
  if(circledrawing == false){
  startpoint[0] = cursorpos[0];
  startpoint[1] = cursorpos[1];
  circledrawing = true;
  }
  else {
    secondpoint[0] = cursorpos[0];
    secondpoint[1] = cursorpos[1];
    circledrawing = false;
  }
}

void keyPressed(){
  Keypressing = true;
}

void keyReleased(){
  Keypressing = false;
}

void DrawGrid(){
  background(0);
  strokeWeight(1);
  for(int i = 0;i < width;i += gridsize){
    stroke(255);
    line( i, 0, i, height);
  }
  for(int i = 0;i < height;i += gridsize){
    stroke(255);
    line( 0, i, width, i);
  }
}