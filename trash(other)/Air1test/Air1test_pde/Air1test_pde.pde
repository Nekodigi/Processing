int airwid=192;
int airhei=108;

vector[][] airvecs = new vector[airwid][airhei];

void setup(){
  fullScreen();
  for(int lx = 0; lx < airwid; lx++){
    for(int ly = 0; ly < airhei; ly++){
      //println(ly);
      airvecs[lx][ly] = new vector();
      airvecs[lx][ly].x = lx*10;
      airvecs[lx][ly].y = ly*10;
      airvecs[lx][ly].vecx = (float)lx/200;
      airvecs[lx][ly].vecy = (float)ly/200;
    }
  }
}

void mousePressed(){
  int baseposX = (int)(mouseX/(float)width*airwid);
  int baseposY = (int)(mouseY/(float)height*airhei);
  println(dist(mouseX, mouseY, baseposX*(float)width/airwid, baseposY*(float)height/airhei));
  airvecs[baseposX][baseposY].z = 400/dist(mouseX, mouseY, baseposX*(float)width/airwid, baseposY*(float)height/airhei);
  airvecs[baseposX][baseposY].vecx = mouseX - baseposX*(float)width/airwid;
  airvecs[baseposX][baseposY].vecy = mouseY - baseposY*(float)height/airhei;
  airvecs[baseposX+1][baseposY].vecx = mouseX - (baseposX+1)*(float)width/airwid;
  airvecs[baseposX+1][baseposY].vecy = mouseY - (baseposY)*(float)height/airhei;
  airvecs[baseposX][baseposY+1].vecx = mouseX - (baseposX)*(float)width/airwid;
  airvecs[baseposX][baseposY+1].vecy = mouseY - (baseposY+1)*(float)height/airhei;
  airvecs[baseposX+1][baseposY+1].vecx = mouseX - (baseposX+1)*(float)width/airwid;
  airvecs[baseposX+1][baseposY+1].vecy = mouseY - (baseposY+1)*(float)height/airhei;
}

void draw(){
  colorMode(RGB, 255, 255, 255);
  background(200);
  for(int x = 0; x < airwid; x++){
    for(int y = 0; y < airhei; y++){
      vector airvec = airvecs[x][y];
      noStroke();
      fill(valueToCol(airvec.z, 0, 1));
      ellipse(airvec.x, airvec.y, 2, 2);
      stroke(valueToCol(airvec.z, 0, 1));
      line(airvec.x, airvec.y, airvec.x+airvec.vecx, airvec.y+airvec.vecy);
    }
  }
}

color valueToCol(float value, float threshold, float multipow){
  color outcol;
  if(value >= threshold){
    colorMode(RGB, 400, 400, 400);
    outcol = color(value*multipow, 0, 0);
  }
  else{
    colorMode(RGB, 400, 400, 400);
    outcol = color(0, 0, abs(value*multipow));
  }
  return outcol;
}

class position{
  float x;
  float y;
  float z;
}

class vector extends position{
  float vecx;
  float vecy;
}