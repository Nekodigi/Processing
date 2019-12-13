float pointSize = 32;
float lineWidth = 4;

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
  octa(new PVector(1000, 0, 0), 400);
  tetra(new PVector(-1000, 0, 0), 400);
}