void showField(){
  stroke(1);
  for(int y = 0; y < height; y+=gridinterval){
    for(int x = 0; x < width; x+=gridinterval){
      PVector vec = getFieldVec(x, y, 50);
      line(x, y, x + vec.x, y + vec.y);
    }
  }
}

PVector getFieldVec(float x, float y, float mag){
  float angle = getField(x, y);
  return new PVector(cos(angle)*mag, sin(angle)*mag);
}

float getField(float x, float y){
  return noise(x*fieldSize, y*fieldSize, zoff)*fieldRotate;
}

PVector angle2Vec(float angle, float mag){
  return new PVector(cos(angle)*mag, sin(angle)*mag);
}