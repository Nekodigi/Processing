ArrayList<ball> balls = new ArrayList<ball>();
ArrayList<grav> gravs = new ArrayList<grav>();
float maxgrav = 50;
float mingrav = 0;
float maxdrag = 1.01;

void setup(){
  fullScreen();
  for(int i = 0; i < 100; i++){
    ball Ball = new ball();
    Ball.x = random(0, width);
    Ball.y = random(0, height);
    Ball.drag = random(1.001, 1.01);
    Ball.vecX = random(-10, 10);
    Ball.vecY = random(-10, 10);
    Ball.mass = 100;
    balls.add(Ball);
  }
  grav Grav = new grav();
  Grav.x = width/2;
  Grav.y = height/2;
  Grav.mass = 50;
  gravs.add(Grav);
}

void draw(){
  fill(0, 10);
  rect(0, 0, width, height);
  strokeWeight(5);
  for(grav Grav: gravs){
    noStroke();
    fill(Grav.mass/maxgrav*255, 100, 100);
    ellipse(Grav.x, Grav.y, 50, 50);
  }
  for(ball Ball: balls){
    //ellipse(Ball.x, Ball.y, 3, 3);
    Ball.x += Ball.vecX;
    Ball.y += Ball.vecY;
    Ball.vecX /= Ball.drag;
    Ball.vecY /= Ball.drag;
    if(Ball.x < 0 || Ball.x > width){
      Ball.vecX = -Ball.vecX;
    }
    if(Ball.y < 0 || Ball.y > height){
      Ball.vecY = -Ball.vecY;
    }
    float speed = dist(0, 0, Ball.vecX, Ball.vecY);
    for(grav Grav: gravs){
      float angle = atan2(Ball.y-Grav.y, Ball.x-Grav.x);
      float distance = dist(Ball.x, Ball.y, Grav.x, Grav.y) + 5;
      stroke(255 - distance / 10, (Ball.drag-1)/(maxdrag-1)*255, speed*10);
      line(Ball.x, Ball.y, Ball.x + Ball.vecX * 10, Ball.y + Ball.vecY * 10);
      Ball.vecX -= cos(angle) * Ball.mass*Grav.mass/pow(distance, 2);
      Ball.vecY -= sin(angle) * Ball.mass*Grav.mass/pow(distance, 2);
    }
  }
}

void mousePressed(){
  grav Grav = new grav();
  Grav.x = mouseX;
  Grav.y = mouseY;
  Grav.mass = random(mingrav, maxgrav);
  gravs.add(Grav);
}

class position{
  float x;
  float y;
}

class movepos extends position{
  float vecX;
  float vecY;
}

class grav extends position{
  float mass;
}

class ball extends movepos{
  color col;
  float mass;
  float drag;
}