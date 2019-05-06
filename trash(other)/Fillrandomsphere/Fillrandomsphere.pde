float[] radius = {100, 200, 300};
float[] allocation = {0, 10, 30};
int vector = 500;
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
  blendMode(ADD);
  reset();
  //noLoop();
}

void reset(){
  pos = new point[vector];
  basecol = random(0, 360 - colrange);
  bgcol = color(basecol, 30, 60, 100);
  for(int i = 0; i < vector; i++){
    pos[i] = new point();
  }
}

void draw(){
  background(bgcol);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.002);

  nearpos();
  for(int i = 0; i < vector; i ++){ 
    stroke(255);
    strokeWeight(8);
    point(pos[i].x, pos[i].y, pos[i].z);
    pos[i].move(1);
  }
}

void nearpos(){
  for(int i = 0; i < vector; i ++){
    point pos1 = pos[i];
    ArrayList<point> nearpos = new ArrayList<point>();
    for(int a = 0; a < vector; a++){
      point pos2 = pos[a];
      
      float distance = dist(pos1.x, pos1.y, pos1.z, pos2.x, pos2.y, pos2.z);
      if(distance < maxdist){
        nearpos.add(pos2);
      }
    }
    
    strokeWeight(0.5);
    stroke(255);
    fill(pos1.col);
    beginShape();
    for(point p : nearpos){
      vertex(p.x, p.y, p.z);
    }
    endShape(CLOSE);
  }
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
    
    int bandsw = int(random(0, 100));
    int sw = 0;
    for(int i = 0; i < allocation.length; i++){
      if(bandsw > allocation[i]){
        sw = i;
      }
    }
    x = radius[sw] * sin(radx) * cos(rady);
    y = radius[sw] * sin(radx) * sin(rady);
    z = radius[sw] * cos(radx);
    
    col = color(basecol + random(0, colrange), random(0, 80), random(60, 100), random(10, 30));
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