float scale = 400;
float distance = 2;
float persFac = 1;


float angle = 0;
P4Vector[] points = new P4Vector[16];



void setup(){
  fullScreen(P3D);
  points[0] = new P4Vector(-1, -1, -1, 1);
  points[1] = new P4Vector(1, -1, -1, 1);
  points[2] = new P4Vector(1, 1, -1, 1);
  points[3] = new P4Vector(-1, 1, -1, 1);
  points[4] = new P4Vector(-1, -1, 1, 1);
  points[5] = new P4Vector(1, -1, 1, 1);
  points[6] = new P4Vector(1, 1, 1, 1);
  points[7] = new P4Vector(-1, 1, 1, 1);
  points[8] = new P4Vector(-1, -1, -1, -1);
  points[9] = new P4Vector(1, -1, -1, -1);
  points[10] = new P4Vector(1, 1, -1, -1);
  points[11] = new P4Vector(-1, 1, -1, -1);
  points[12] = new P4Vector(-1, -1, 1, -1);
  points[13] = new P4Vector(1, -1, 1, -1);
  points[14] = new P4Vector(1, 1, 1, -1);
  points[15] = new P4Vector(-1, 1, 1, -1);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateY((float)mouseX/500);
  rotateX((float)mouseY/500);
  stroke(255);
  strokeWeight(32);
  noFill();
  
  PVector[] projected3d = new PVector[16];
  for(int i = 0; i < points.length; i++){
    P4Vector v = points[i];
    
    float[][] rotationXY = {
      {cos(angle),-sin(angle),0,0},
      {sin(angle),cos(angle),0,0},
      {0,0,1,0},
      {0,0,0,1}
    };
    
    float[][] rotationXZ = {
      {cos(angle),0,-sin(angle),0},
      {0,1,0,0},
      {sin(angle),0,cos(angle),0},
      {0,0,0,1}
    };
    
    float[][] rotationXW = {
      {cos(angle),0, 0, -sin(angle)},
      {0,1,0,0},
      {0,0,1,0},
      {sin(angle),0,0,cos(angle)}
    };
    
    float[][] rotationZW = {
      {1,0,0,0},
      {0,1,0,0},
      {0,0,cos(angle),-sin(angle)},
      {0,0,sin(angle),cos(angle)}
    };
    
    P4Vector rotated = matmul(rotationZW, v, true);
    rotated = matmul(rotationXY, rotated, true);
    //rotated = matmul(rotationZW, rotated, true);
    
    float w = 1 / (distance - rotated.w);
    
    float[][] projection = {
      {w, 0, 0, 0},
      {0, w, 0, 0},
      {0, 0, w, 0}
    };
    
    PVector projected = matmul(projection, rotated);
    projected.mult(scale);
    projected3d[i] = projected;
    
    point(projected.x, projected.y, projected.z);
  }
  
  for (int i = 0; i < 4; i++){
    connect(i, (i+1)%4, projected3d);
    connect(i+4, ((i+1)%4)+4, projected3d);
    connect(i+8, (i+1)%4+8, projected3d);
    connect(i+12, ((i+1)%4)+12, projected3d);
    connect(i, i+4, projected3d);
    connect(i+8, i+12, projected3d);
    connect(i, i+8, projected3d);
    connect(i+4, i+12, projected3d);
  }
  
  
  angle+=0.01;
}

void connect(int i, int j, PVector[] points){
  PVector a = points[i];
  PVector b = points[j];
  strokeWeight(4);
  stroke(255);
  line(a.x, a.y, a.z, b.x, b.y, b.z);
}