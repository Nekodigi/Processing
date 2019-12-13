
PVector intersection(PVector s1, PVector e1, PVector s2, PVector e2){
  s1 = new PVector(s1.x, s1.y);
  e1 = new PVector(e1.x, e1.y);
  s2 = new PVector(s2.x, s2.y);
  e2 = new PVector(e2.x, e2.y);
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