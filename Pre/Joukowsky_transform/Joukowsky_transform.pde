float r = 1.2;
float a = -0.15;
float b = -0.3;

float figsize = 300;
float n = 1000;

boolean detail = false;

void setup(){
  fullScreen();
}

void keyPressed(){
  if(key=='d'){
    detail = !detail;
  }
}

void draw(){
  background(255);
  if(mousePressed){
    a = (float)(mouseX-width/2) / 1000;
    b = (float)(mouseY-width/2) / 1000;
  }
  translate(width/2, height/2);
  strokeWeight(5);
  for (float i = 0; i < n; i++){
    float x = cos(i/n*TWO_PI)*r+a;
    float y = sin(i/n*TWO_PI)*r+b;
    float nx = x + x / (x*x+y*y);
    float ny = y - y / (x*x+y*y);
    if(detail){
      point(x*figsize, y*figsize);
    }
    point(nx*figsize, ny*figsize);
  }
}