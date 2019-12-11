void showRay(PVector pos, float angle, float len, boolean enablePoint){
  float dz = cos(angle)*len;
  float dy = sin(angle)*len;
  strokeWeight(lineWidth);
  line(pos.x, pos.y-dy, pos.z-dz, pos.x, pos.y+dy, pos.z+dz);
  if(enablePoint){
    pointVec(pos);
  }
}

PVector intersection(PVector a, PVector b, float angleA, float angleB, boolean debug){
  PVector ta = new PVector(a.z, a.y);
  PVector tb = new PVector(b.z, b.y);
  PVector da = new PVector(cos(angleA)*10000, sin(angleA)*10000);
  PVector db = new PVector(cos(angleB)*10000, sin(angleB)*10000);
  PVector tResult = intersection(PVector.sub(ta, da), PVector.add(ta, da), PVector.sub(tb, db), PVector.add(tb, db));
  PVector result = new PVector(a.x, tResult.y, tResult.x);
  if(debug){
    showRay(a, angleA, 1000 , true);
    showRay(b, angleB, 1000 , true);
    pointVec(result);
  }
  return result;
}

void pointVec(PVector pos){
  strokeWeight(pointSize);
  point(pos.x, pos.y, pos.z);
}