void lineDraw(){
  ArrayList<Ring> Nrings = new ArrayList<Ring>();
  float x = mouseX;
  float y = mouseY;
  for(Ring ring: rings){
    x += cos(ring.angle)*ring.size;
    y += sin(ring.angle)*ring.size;
    ring.angle += ring.speed;
    Nrings.add(ring);
    branchx = x;
    branchy = y;
    line(oldbranchx, oldbranchy, branchx, branchy);
    oldbranchx = branchx;
    oldbranchy = branchy;
  }
  rings = Nrings;
  //line(oldx, oldy, x, y);
  oldx = x;
  oldy = y;
}

void ringCreate(){
  Ring ring = new Ring();
  ring.size = 100 + frameCount/1;
  ring.speed = 0.001+frameCount/1000;
  rings.add(ring);
  ring = new Ring();
  ring.size = 50;
  ring.speed = 0.0066;
  rings.add(ring);
  ring = new Ring();
  ring.size = 100;
  ring.speed = 0.0111;
  rings.add(ring);
  ring = new Ring();
}