float scale = 2000;
float distance = 5;
float angle = 0;
float persFac = 1;
PVector[] points = new PVector[8];



void setup(){
  fullScreen(P2D);
  points[0] = new PVector(-1, -1, -1);
  points[1] = new PVector(1, -1, -1);
  points[2] = new PVector(1, 1, -1);
  points[3] = new PVector(-1, 1, -1);
  points[4] = new PVector(-1, -1, 1);
  points[5] = new PVector(1, -1, 1);
  points[6] = new PVector(1, 1, 1);
  points[7] = new PVector(-1, 1, 1);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(32);
  noFill();
  PVector[] projected2d = new PVector[8];
  for(int i = 0; i < 8; i++){
    PVector v = points[i];
    PVector rotated = matmul(rotateArrX(angle), v);
    rotated = matmul(rotateArrY(angle), rotated);
    rotated = matmul(rotateArrZ(angle), rotated);
    PVector projected = matmul(projectionArr(1/(distance+rotated.z*persFac)), rotated);
    projected.mult(scale);
    projected2d[i] = projected;
    point(projected.x, projected.y);
  }
  
  for (int i = 0; i < 4; i++){
    connect(i, (i+1)%4, projected2d);
    connect(i+4, (i+1)%4+4, projected2d);
    connect(i, i+4, projected2d);
  }
  angle+=0.01;
}

void connect(int i, int j, PVector[] points){
  PVector a = points[i];
  PVector b = points[j];
  strokeWeight(4);
  stroke(255);
  line(a.x, a.y, b.x, b.y);
}