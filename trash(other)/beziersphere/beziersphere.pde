float[] radius = {100, 200, 300};
float[] allocation = {0, 10, 30};
int vector = 200;
int vectordrawed = 0;
float placecorrection = 50;
float basecol;
float colrange;
color bgcol;
point[] pos;
float maxdist = 100;

void setup(){
  size(1280, 720, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  //pixelDensity(displayDensity());
  smooth(32);
  //blendMode(ADD);
  reset();
  //noLoop();
}

void reset(){
  pos = new point[vector];
  basecol = random(0, 360 - colrange);
  bgcol = color(basecol, 30, 90, 100);
  for(int i = 0; i < vector; i++){
    pos[i] = new point();
  }
}

void draw(){
  background(bgcol);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.002);

  linqpos();
  for(int i = 0; i < vector; i ++){ 
    stroke(255);
    strokeWeight(8);
    point(pos[i].x, pos[i].y, pos[i].z);
  }
}

void linqpos(){
  strokeWeight(4);
  noFill();
  beginShape();
  vertex(30, 20);
  for(int i = 0; i < pos.length -2; i++){   
    point bpos = pos[i];
    point mpos = pos[i + 1];
    point spos = pos[i + 2];
    stroke(bpos.col);
    bezierVertex(bpos.x, bpos.y, bpos.z, mpos.x, mpos.y, mpos.z, spos.x, spos.y, spos.z);
  }
  endShape(CLOSE);
}

void mousePressed(){
  reset();
}

class point{
  float x, y, z;
  float incx, incy, incz;
  color col;
  
  
  point(){
    float correction = random(0, placecorrection);
    float xseed = random(0, 180);
    float yseed = random(0, 360);
    if(xseed < 90){
      xseed += correction;
    }
    else
    {
      xseed -= correction;
    }
    
    float radx = radians(xseed);
    float rady = radians(yseed);
    
    int bandsw = 100;
    int sw = 0;
    for(int i = 0; i < allocation.length; i++){
      if(bandsw > allocation[i]){
        sw = i;
      }
    }
    vectordrawed++;
    x = radius[sw] * sin(radx) * cos(rady);
    y = radius[sw] * sin(radx) * sin(rady);
    z = radius[sw] * cos(radx);
    
    col = color(basecol + random(0, colrange), random(0, 80), random(60, 100), random(50, 100));
  }
  
  void move(float speed){
    incx = random(-speed, speed);
    incy = random(-speed, speed);
    incz = random(-speed, speed);
    x += incx;
    y += incy;
    z += incz;
  }
}