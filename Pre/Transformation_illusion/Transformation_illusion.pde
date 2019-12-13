float Pangle = radians(-20);
float Qangle = radians(20);
float pointCount = 80;
float figSize = 300;
float lineWidth = 1;
float pointSize = 8;
float aspect = 0.4;

ArrayList<PVector> ps = new ArrayList<PVector>();
ArrayList<PVector> qs = new ArrayList<PVector>();

void setup(){
  fullScreen(P3D);
  ortho();
  for (int i = 0; i <= pointCount; i++){
    PVector p = new PVector(cos(i/pointCount*TWO_PI)*figSize, sin(i/pointCount*TWO_PI)*figSize*aspect+figSize);
    float inv = -1;
    if(1 == (int)((i/pointCount*2)%2)){
      inv = 1;
    }
    PVector q = new PVector(cos(i/pointCount*TWO_PI)*figSize, inv*((1-abs(cos(i/pointCount*TWO_PI)))*figSize)*aspect-figSize);
    ps.add(p);
    qs.add(q);
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(-(float)(mouseY-height/2)/500);
  rotateY((float)(mouseX-width/2)/500);
  stroke(255);
  
  for(int i = 0; i <= pointCount; i++){
    PVector p = ps.get(i);
    PVector q = qs.get(i);
    pointVec(p);
    pointVec(q);
    //showRay(p, Pangle, 1000, true);
    pointVec(intersection(p, q, Pangle, Qangle, false));
  }
  
  PVector p = new PVector(0,figSize);
  PVector q = new PVector(0,-figSize);
  PVector result = intersection(p, q, Pangle, Qangle, true);
  
  
  strokeWeight(lineWidth);
  stroke(255,0,0);
  line(-10000, 0,0,10000,0,0);
  stroke(0,255,0);
  line(0,-10000,0,0,10000,0);
  stroke(0,0,255);
  line(0,0,-10000,0,0,10000);
}