Bezier bezier = new Bezier();

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  //size(500, 500);
  strokeWeight(10);
  background(360);
}

void draw(){
  noStroke();
  fill(360, 2);
  rect(0, 0, width, height);
  float t = float(frameCount)/20%(bezier.poss.size()-2);
  stroke(frameCount/5%360, 100, 100);
  bezier.show(t);
}

void mousePressed(){
  bezier.poss.add(new PVector(mouseX, mouseY));
}

void keyPressed(){
  if(key == 'r'){
    bezier = new Bezier();
  }
}