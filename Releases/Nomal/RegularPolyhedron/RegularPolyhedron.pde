float pointSize = 64;
float lineWidth = 8;

void setup(){
  fullScreen(P3D);
  ortho();
}

void draw(){
  background(0);
  stroke(255);
  translate(width/2, height/2);
  rotateX((float)mouseY/1000);
  rotateY((float)mouseX/1000);
  noFill();
  octa(400);
}