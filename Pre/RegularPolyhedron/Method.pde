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
  pointVec(points[0]);
  pointVec(points[1]);
  pointVec(points[2]);
  pointVec(points[3]);
  pointVec(points[4]);
  pointVec(points[5]);
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
  pointVec(points[0]);
  pointVec(points[1]);
  pointVec(points[2]);
  pointVec(points[3]);
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

void pointVec(PVector pos){
  strokeWeight(pointSize);
  point(pos.x, pos.y, pos.z);
}