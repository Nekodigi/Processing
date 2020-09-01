int interval;
float thickness;

void setup(){
  size(500, 500);
  background(0);
  interval = width/3;
  thickness = height/20;
  noFill();
  strokeWeight(10);
  translate(0, height/2);
  drawUnit();
  translate(interval, 0);
  drawUnit();
  translate(interval, 0);
  drawUnit();
}

void draw(){
  
}

void drawUnit(){
  stroke(255, 100, 100);
  beginShape();
  for(int i=0; i<interval/4; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3))*thickness);
  }
  endShape();
  stroke(0, 255, 0);
  beginShape();
  for(int i=0; i<interval/2; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3)+TWO_PI/3)*thickness);
  }
  endShape();
  stroke(100, 100, 255);
  beginShape();
  for(int i=0; i<interval/2; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3)+TWO_PI/3*2)*thickness);
  }
  endShape();
  
  stroke(255, 100, 100);
  beginShape();
  for(int i=interval/4; i<interval/4*3; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3))*thickness);
  }
  endShape();
  stroke(0, 255, 0);
  beginShape();
  for(int i=interval/2; i<interval; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3)+TWO_PI/3)*thickness);
  }
  endShape();
  stroke(100, 100, 255);
  beginShape();
  for(int i=width/6; i<width/3; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3)+TWO_PI/3*2)*thickness);
  }
  endShape();
  stroke(255, 100, 100);
  beginShape();
  for(int i=interval/4*3; i<interval; i+=10){
    vertex(i, sin(map(i, 0, width, 0, TWO_PI*3))*thickness);
  }
  endShape();
}
