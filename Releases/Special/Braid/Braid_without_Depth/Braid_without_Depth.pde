void setup(){
  size(500, 500);
  noFill();
  blendMode(ADD);
  strokeWeight(10);
  background(0);
  
  stroke(255, 100, 100);
  beginShape();
  for(int i=0; i<width; i+=10){
    vertex(i, sin(map(i, 0, width, 0, 20))*height/20+height/2);
  }
  endShape();
  stroke(0, 255, 0);
  beginShape();
  for(int i=0; i<width; i+=10){
    vertex(i, sin(map(i, 0, width, 0, 20)+TWO_PI/3)*height/20+height/2);
  }
  endShape();
  stroke(100, 100, 255);
  beginShape();
  for(int i=0; i<width; i+=10){
    vertex(i, sin(map(i, 0, width, 0, 20)+TWO_PI/3*2)*height/20+height/2);
  }
  endShape();
}

void draw(){
  
}
