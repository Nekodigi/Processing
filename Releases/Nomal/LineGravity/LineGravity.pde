float theta;
float mu = 0.3;
float mudash = 0.25;
float xpos;
float m = 100;
float v = 0;
float g = 0.98;

void setup(){
  fullScreen();
}

void draw(){
  if(mousePressed){
    xpos = 0;
    v = 0;
  }
  background(200);
  theta = atan2(mouseY-height/2, mouseX-width/2)+PI/2;
  textSize(50);
  textAlign(LEFT, TOP);
  text("theta"+degrees(theta), 0, 0);
  translate(width/2, height/2);
  rotate(theta);
  rectMode(CENTER);
  line(-width, 0, width, 0);
  float f0 = mu*m*g*cos(theta);
  float f = m*g*sin(theta);
  float fdash =  mudash*m*g*cos(theta);
  if(abs(f0) < max(abs(v*m), abs(f))){
    v += (f - fdash)/m;
  }
  else{
    v = 0;
  }
  xpos += v/10;
  translate(xpos, 0);
  triangle(-100, 0, 100, 0, 0, -100);
}