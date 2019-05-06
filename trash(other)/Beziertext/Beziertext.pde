float[] posx = {100, 200, 300, 400, 500};
float[] posy = {100, 200, 100, 200, 100};

void setup(){
  fullScreen();
  background(0);
  linq(posx, posy);
}

void linq(float[] px, float[] py){
  float[] Tpx = new float[4];
  float[] Tpy = new float[4];
  for(int i = 0; i < 3; i++){
    Tpx[i] = px[i];
    Tpy[i] = py[i];
  }
  TVectorBezier(Tpx, Tpy);
  for(int a = 0; a < px.length -4; a++){
    for(int i = 0; i < 4; i++){
      Tpx[i] = px[i + a];
      Tpy[i] = py[i + a];
    }
      FVectorBezier(Tpx, Tpy);
  }
}

void TVectorBezier(float[] px, float[] py){
  stroke(255);
  strokeWeight(10);
  //point(px[0], py[0]);
  //point(px[1], py[1]);
  //point(px[2], py[2]);
  
  float cenx = px[0] + (px[2] - px[0]) / 2;
  float ceny = py[0] + (py[2] - py[0]) / 2;
  float angle = atan2(py[2] - py[0], px[2] - px[0]) + PI;
  float dist = dist(px[0], py[0], px[1], py[1]);
  float h1x = cos(angle) * dist / 2 + px[1];
  float h1y = sin(angle) * dist / 2 + py[1];
  //point(cenx, ceny);
  //point(h1x, h1y);
  strokeWeight(2);
  bezier(px[0], py[0], px[0], py[0], h1x, h1y, px[1], py[1]);
}

void FVectorBezier(float[] px, float[] py){
  stroke(255);
  strokeWeight(10);
  //point(px[0], py[0]);
  //point(px[1], py[1]);
  //point(px[2], py[2]);  
  point(px[3], py[3]);
  
  float cenx = px[0] + (px[2] - px[0]) / 2;
  float ceny = py[0] + (py[2] - py[0]) / 2;
  float angle = atan2(px[0] - px[2], py[0] - py[2]) + HALF_PI;
  float angle2 = atan2(px[1] - px[3], py[1] - py[3]);
  float dist = dist(px[1], py[1], px[2], py[2]);
  float h1x = cos(angle) * dist / 2 + px[1];
  float h1y = sin(angle) * dist / 2 + py[1];
  float h2x = cos(angle2) * dist / 2 + px[2];
  float h2y = sin(angle2) * dist / 2 + py[2];
  //point(cenx, ceny);
  point(h1x, h1y);
  point(h2x, h2y);
  strokeWeight(2);
  bezier(px[1], py[1], h1x, h1y, h2x, h2y, px[2], py[2]);
}