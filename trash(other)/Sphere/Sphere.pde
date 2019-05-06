float radius = 300;

void setup(){
  size(1280, 720, P3D);
  pixelDensity(displayDensity());
}

void draw(){
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.02);
  for (int a = 0; a <= 180; a += 10){
    float rada = radians(a);
    float z = radius * cos(rada);
    float multiradius = sin(rada);
    for (int i = 0; i < 360; i += 10){
      float rad = radians(i);
      float x = radius * cos(rad) * multiradius;
      float y = radius * sin(rad) * multiradius;
      stroke(0);
      strokeWeight(4);
      point(x, y, z);
    }
  }
}