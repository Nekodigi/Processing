SederbergFFD sederbergFFD;

void setup(){
  size(500, 500);
  sederbergFFD = new SederbergFFD(3, 3, new PVector(0, 0), new PVector(width, height));
  
  
}

void draw(){
  background(255);
  sederbergFFD.P[0][1] = new PVector(mouseX, mouseY);
  for(int i=0; i<=100; i++){
  //float u = map(i, 0, 100, 0, 1);
  //float v = 0.5;
  //float u = map(mouseX, 0, width, 0, 1);
  //float v = map(mouseY, 0, height, 0, 1);
  float theta = map(i, 0, 100, 0, TWO_PI);
  float u = cos(theta)*0.5+0.5;
  float v = sin(theta)*0.5+0.5;
  PVector result = sederbergFFD.getPos(u, v);
  ellipse(result.x, result.y, 20, 20);
  sederbergFFD.show();
  }
}
