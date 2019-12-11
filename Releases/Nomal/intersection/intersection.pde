void setup(){
  fullScreen();
  translate(width/2, height/2);
  background(0);
  stroke(255);
  PVector s1 = new PVector(-100, 0);
  PVector e1 = new PVector(100, 0);
  PVector s2 = new PVector(0, -100);
  PVector e2 = new PVector(0, 100);
  strokeWeight(1);
  line(s1.x, s1.y, e1.x, e1.y);
  line(s2.x, s2.y, e2.x, e2.y);
  print(lineDist(s2, s1, e1));
  PVector result = intersection(s1, e1, s2, e2);
  strokeWeight(16);
  point(result.x, result.y);
}

PVector intersection(PVector s1, PVector e1, PVector s2, PVector e2){
  float d1 = lineDist(s1, s2, e2);
  float d2 = lineDist(e1, s2, e2);
  float t = d1 / (d1 + d2);
  PVector dl1 = PVector.sub(e1,s1);
  return s1.add(dl1.mult(t));
}




float lineDist(PVector c, PVector a, PVector b) {
  PVector norm = scalarProjection(c, a, b);
  return PVector.dist(c, norm);
}

PVector scalarProjection(PVector p, PVector a, PVector b) {
  PVector ap = PVector.sub(p, a);
  PVector ab = PVector.sub(b, a);
  ab.normalize(); // Normalize the line
  ab.mult(ap.dot(ab));
  PVector normalPoint = PVector.add(a, ab);
  return normalPoint;
}