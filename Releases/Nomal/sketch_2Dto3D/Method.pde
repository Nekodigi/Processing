float[][] rotateArrX(float angle){
  float[][] result = {
    {1, 0, 0},
    {0, cos(angle), -sin(angle)},
    {0, sin(angle), cos(angle)}
  };
  return result; 
}

float[][] rotateArrY(float angle){
  float[][] result = {
    {cos(angle), 0, sin(angle)},
    {0, 1, 0},
    {-sin(angle), 0, cos(angle)}
  };
  return result; 
}

float[][] rotateArrZ(float angle){
  float[][] result = {
    {cos(angle), -sin(angle), 0},
    {sin(angle), cos(angle), 0},
    {0, 0, 1}
  };
  return result; 
}

float[][] projectionArr(float size){
  float[][] result = {
    {1*size, 0, 0},
    {0, 1*size, 0}
  };
  return result;
}