//based on this wikipedia jp https://ja.wikipedia.org/wiki/%E9%81%8A%E6%98%9F%E6%AD%AF%E8%BB%8A%E6%A9%9F%E6%A7%8B

Gear g1;
Gear[] g2s = new Gear[3];
Gear g3;
float r1 = 100;
float r2;
float r3;

void setup(){
  size(500, 500);
  r3 = height/2;
  r2 = (r3 - r1)/2;
  g1 = new Gear(new PVector(width/2, height/2), r1, color(255));
  g2s[0] = new Gear(new PVector(width/2, height/2), r2, color(255, 0, 0));
  g2s[1] = new Gear(new PVector(width/2, height/2), r2, color(255, 0, 0));
  g2s[2] = new Gear(new PVector(width/2, height/2), r2, color(255, 0, 0));
  g3 = new Gear(new PVector(width/2, height/2), r3, color(230, 153, 21));
}

void draw(){
  background(0);
  g1.theta += 0.01;
  float t2 = g1.theta*g1.r/(g3.r+g2s[0].r);
  float t1 = t2-(t2)*g3.r/g2s[0].r;
  g2s[0].theta = t1;
  g2s[0].pos = new PVector(width/2, height/2).add(PVector.fromAngle(t2).mult(r1+r2));
  g2s[1].theta = t1;
  g2s[1].pos = new PVector(width/2, height/2).add(PVector.fromAngle(t2+TWO_PI/3).mult(r1+r2));
  g2s[2].theta = t1;
  g2s[2].pos = new PVector(width/2, height/2).add(PVector.fromAngle(t2+TWO_PI/3*2).mult(r1+r2));
  //g3.theta = t3;
  g3.show();
  for(Gear g2 : g2s){
    g2.show();
  }
  g1.show();
}

class Gear{
  color col;
  PVector pos;
  float r;//gear rate
  float theta;//rotation
  
  Gear(PVector pos, float r, color col){
    this.pos = pos;
    this.r = r;
    this.col = col;
  }
  
  void show(){
    fill(col);
    strokeWeight(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    ellipse(0, 0, r*2, r*2);
    fill(255);
    rectMode(CENTER);
    rect(0, 0, r/2, r/2);
    strokeWeight(10);
    noFill();
    for(int i=0; i<20; i++){
      arc(0, 0, r*2, r*2, map(i, 0, 20, 0, TWO_PI), map(i+0.01, 0, 20, 0, TWO_PI));
    }
    popMatrix();
  }
}
