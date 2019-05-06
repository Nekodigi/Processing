ArrayList<Ring> rings = new ArrayList<Ring>();
float oldx;
float oldy;
float branchx;
float branchy;
float oldbranchx;
float oldbranchy;

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  ringCreate();
  lineDraw();
  background(300);
  frameRate(100);
}

void draw(){
  fill(300, 0.1);
  rect(0, 0, width, height);
  strokeWeight(1);
  stroke(frameCount/100, 100, 100, 10);
  lineDraw();
}