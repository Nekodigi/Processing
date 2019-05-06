ArrayList<Splash> splashs = new ArrayList<Splash>();
float off;

void setup(){
  fullScreen();
  for(int i = 0; i < 100; i++){
    float angle = random(0, 2*PI);
    float speed = random(1, 10);
    float zangle = random(0, PI/2);
    float radius = random(1, 50);
    Splash splash = new Splash();
    splash.pos.x = width/2;
    splash.pos.y = height/2;
    splash.speed.x = cos((float)i/100*2*PI);
    splash.speed.y = sin((float)i/100*2*PI);
    splash.speed.z = sin(zangle);
    splash.speed.setMag(speed);
    splash.radius = radius;
    splashs.add(splash);
  }
}

void draw(){
  ArrayList<Splash> nsplashs = new ArrayList<Splash>();
  fill(200, 10);
  float originaloff = 0;
  beginShape();
  for(Splash splash: splashs){
    curveVertex(splash.pos.x, splash.pos.y);
    //ellipse(splash.pos.x, splash.pos.y, splash.radius, splash.radius);
    Splash nsplash = new Splash();
    nsplash = splash;
    nsplash.pos.x += splash.speed.x+map(noise(off, originaloff), 0, 1, -10, 10);
    nsplash.pos.y += splash.speed.y;
    nsplash.pos.z += splash.speed.z;
    nsplash.speed.z += 0.01;
    originaloff += 0.01;
  }
  endShape(CLOSE);
  off+=0.01;
}

class Splash{
  PVector pos = new PVector();;
  PVector speed = new PVector();
  float radius;
};