PVector vecConstrain(PVector vec, float minx, float maxx, float miny, float maxy){
  return new PVector(constrain(vec.x, minx, maxx), constrain(vec.y, miny, maxy));
}

PVector vecConstrainMag(PVector vec, float mag){
  if(vec.mag() > mag){
    vec.setMag(mag);
  }
  return vec;
}

PVector rad2Vec(float rad){
  return new PVector(cos(rad), sin(rad));
}

PVector virVec(PVector vec){
  return new PVector(vec.x, vec.y);
}