class Box{
  PVector pos;
  float r;
  Box(PVector pos, float r){
    this.pos = pos;
    this.r = r;
  }
  
  ArrayList<Box> generate(){
    ArrayList<Box> boxes = new ArrayList<Box>();
    float newR = r/3;
    for (int x = -1; x <= 1; x++){
      for (int y = -1; y <= 1; y++){
        for (int z = -1; z <= 1; z++){
          if(1 < (abs(x)+abs(y)+abs(z))){
            PVector newPos = new PVector(pos.x+newR*x, pos.y+newR*y, pos.z+newR*z);
            Box b = new Box(newPos, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
  
  void show(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
}

class Tetra{
  float r;
  PVector pos;
  Tetra(PVector pos, float r){
    this.r = r;
    this.pos = pos;
  }
  
  ArrayList<Tetra> generate(){
    ArrayList<Tetra> tetras = new ArrayList<Tetra>();
    float newR = r/2;
    PVector[] points = tetraVecs(newR);
    for (int i = 0; i < points.length; i++){
      Tetra nTetra = new Tetra(PVector.add(pos, points[i]), newR);
      tetras.add(nTetra);
    }
    return tetras;
  }
  
  void show(){
    tetra(pos, r);
  }
}

class Octa{
  float r;
  PVector pos;
  Octa(PVector pos, float r){
    this.r = r;
    this.pos = pos;
  }
  
  ArrayList<Octa> generate(){
    ArrayList<Octa> Octas = new ArrayList<Octa>();
    float newR = r/2;
    PVector[] points = octaVecs(newR);
    for (int i = 0; i < points.length; i++){
      Octa nOcta = new Octa(PVector.add(pos, points[i]), newR);
      Octas.add(nOcta);
    }
    return Octas;
  }
  
  void show(){
    octa(pos, r);
  }
}

PVector[] octaVecs(float r){
  PVector[] points = new PVector[6];
  points[0] = new PVector(-r, 0, 0);
  points[1] = new PVector(0, -r, 0);
  points[2] = new PVector(r, 0, 0);
  points[3] = new PVector(0, r, 0);
  points[4] = new PVector(0, 0, r);
  points[5] = new PVector(0, 0, -r);
  return points;
}

void octa(PVector pos, float r){
  PVector[] points = octaVecs(r);
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  triangleVec(points[0], points[4], points[1]);
  triangleVec(points[1], points[4], points[2]);
  triangleVec(points[2], points[4], points[3]);
  triangleVec(points[3], points[4], points[0]);
  triangleVec(points[0], points[5], points[1]);
  triangleVec(points[1], points[5], points[2]);
  triangleVec(points[2], points[5], points[3]);
  triangleVec(points[3], points[5], points[0]);
  popMatrix();
}

PVector[] tetraVecs(float r){
  PVector[] result = new PVector[4];
  result[0] = new PVector(3*r/4, r/3, -sqrt(3)*r/4);
  result[1] = new PVector(-3*r/4, r/3, -sqrt(3)*r/4);
  result[2] = new PVector(0, r/3, sqrt(3)*r/2);
  result[3] = new PVector(0, -r, 0);
  return result;
}

void tetra(PVector pos, float r){
  PVector[] points = tetraVecs(r);
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  triangleVec(points[0], points[1], points[2]);
  triangleVec(points[0], points[3], points[1]);
  triangleVec(points[1], points[3], points[2]);
  triangleVec(points[2], points[3], points[0]);
  popMatrix();
}

void triangleVec(PVector a, PVector b, PVector c){
  strokeWeight(lineWidth);
  pushMatrix();
  beginShape();
  vertex(a.x, a.y, a.z);
  vertex(b.x, b.y, b.z);
  vertex(c.x, c.y, c.z);
  endShape(CLOSE);
  popMatrix();
}