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
  //bgcol = color(basecol, 30, 90, 100);
  bgcol = color(basecol, 30, 50, 100);
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
    for(int b = 0; b < nearpos.size() -2; b++){
      point p1 = nearpos.get(b);
      point p2 = nearpos.get(b + 1);
      point p3 = nearpos.get(b + 2);
      point p12 = centorpos(p1, p2);
      point p23 = centorpos(p2, p3);
      vertex(p12.x, p12.y, p12.z);
      bezierVertex(p12.x, p12.y, p12.z, p2.x, p2.y, p2.z, p23.x, p23.y, p23.z);
    }
    int last = nearpos.size();
    if(last > 2){
      point p1 = nearpos.get(last - 2);
      point p2 = nearpos.get(last - 1);
      point p3 = nearpos.get(0);
      point p4 = nearpos.get(1);
      point p12 = centorpos(p1, p2);
      point p23 = centorpos(p2, p3);
      point p34 = centorpos(p3, p4);
      bezierVertex(p12.x, p12.y, p12.z, p2.x, p2.y, p2.z, p23.x, p23.y, p23.z);
      bezierVertex(p23.x, p23.y, p23.z, p3.x, p3.y, p3.z, p34.x, p34.y, p34.z);
    }
    endShape(CLOSE);
  }
}

point centorpos(point p1, point p2){
  point p12 = new point();
  float p12x = p1.x + (p2.x - p1.x) / 2;
  float p12y = p1.y + (p2.y - p1.y) / 2;
  float p12z = p1.z + (p2.z - p1.z) / 2;
  p12.x = p12x;
  p12.y = p12y;
  p12.z = p12z;
  return p12;
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
    
    col = color(basecol + random(0, colrange), random(0, 80), random(60, 100), random(10, 20));
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