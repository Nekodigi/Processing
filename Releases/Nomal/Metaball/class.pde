class Point{
  PVector pos;
  PVector vel = new PVector(random(-20, 20), random(-20, 20));
  float r;
  Point(PVector pos, float r){
    this.r = r;
    this.pos = pos;
  }
  
  void update(){
    pos.add(vel);
    if (this.pos.x > width || this.pos.x < 0) this.vel.x *= -1;
    if (this.pos.y > height || this.pos.y < 0) this.vel.y *= -1;
  }
}