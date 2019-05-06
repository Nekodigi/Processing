float radius = 300;

void setup(){
  size(1280, 720, P3D);
  pixelDensity(displayDensity());
}

void draw(){
  background(0);
  translate(width/2, height/2, 0);
  rotateX(frameCount * 0.02);
  rotateY(frameCount * 0.02);
  
  float a = 0, b = 0;
  float arad;
  float brad;
  float x, y, z;
  float oldx = 0, oldy = 0, oldz = 0;
  
  while(a <= 180){
    arad = radians(a);
    brad = radians(b);
    x = radius * cos(brad) * sin(arad);
    y = radius * sin(brad) * sin(arad);
    z = radius * cos(arad);
    
    stroke(255);
    strokeWeight(4);
    if(oldx != 0){
      line(x, y, z , oldx, oldy, oldz);
    }
    strokeWeight(8);
    point(x, y, z);
    oldx = x;
    oldy = y;
    oldz = z;
    a++;
    b += frameCount * 0.1;
  }
}