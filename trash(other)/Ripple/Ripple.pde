ArrayList<ripple> rposs = new ArrayList<ripple>();

void setup(){
  fullScreen();
  strokeWeight(1);
  background(0);
}

void draw(){
  fill(0, 200);
  rect(0, 0, width, height);
  stroke(255);
  noFill();
    if(random(0, 5) <= 1){
      ripple rpos = new ripple();
      rpos.x = random (0, width);
      rpos.y = random(0, height);
      rpos.speed = 10;
      rpos.endrange = random(10, 2000);
      rposs.add(rpos);
    }
  ArrayList<ripple> nrposs = new ArrayList<ripple>();
  for(ripple rpos: rposs){
    stroke(255-rpos.range/rpos.endrange*255);
    println(rpos.range);
    ellipse(rpos.x, rpos.y, rpos.range, rpos.range);
    float ring2diff = 20;
    stroke(200-(rpos.range+ring2diff)/rpos.endrange*200);
    ellipse(rpos.x, rpos.y, rpos.range+ring2diff, rpos.range+ring2diff);
    float ring3diff = 20;
    stroke(150-(rpos.range+ring2diff+ring3diff)/rpos.endrange*150);
    ellipse(rpos.x, rpos.y, rpos.range+ring2diff+ring3diff, rpos.range+ring2diff+ring3diff);
    rpos.range += rpos.speed;
    if(rpos.range <= rpos.endrange)nrposs.add(rpos);
  }
  rposs = nrposs;
}

class position{
  float x;
  float y;
}

class ripple extends position{
  float speed;
  float range = 0;
  float endrange;
}