ArrayList<magnet> mags = new ArrayList<magnet>();
ArrayList<Part> parts = new ArrayList<Part>();
float maxMagPow = 30;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  magnet mag = new magnet();
  mag.x = width/2;
  mag.y = height/2;
  mag.power = 10;
  mags.add(mag);
  magnet mag2 = new magnet();
  mag2.x = width/2 + 500;
  mag2.y = height/2 + 500;
  mag2.power = -10;
  mags.add(mag2);
  background(360);
  frameRate(1000);
}

void draw(){
  fill(255);
  for(magnet mag: mags){
    if(mag.power > 0){
      Part part = new Part();
      part.x = mag.x + random(-10, 10);
      part.y = mag.y + random(-10, 10);
      part.col = color(0+mag.power/maxMagPow*50, random(0, 100), 100, random(100, 100));
      part.clone = 1;
      if(random(0, 10) < 1){
        parts.add(part);
      }
    }
    else{
      Part Npart = new Part();
      Npart.x = mag.x + random(-1, 1);
      Npart.y = mag.y + random(-1, 1);
      //Npart.col = color(240-mag.power/maxMagPow*50, random(0, 100), 100, random(10, 100));
      Npart.col = color(0+mag.power/maxMagPow*50, random(0, 100), 100, random(100, 100));
      Npart.clone = -1;
      if(random(0, 10) < 1){
        parts.add(Npart);
      }
    }
    noStroke();
    fill(valueToColor(mag.power, maxMagPow, 0));
    ellipse(mag.x, mag.y, mag.power/maxMagPow*100, mag.power/maxMagPow*100);
    fill(0);
    stroke(255);
    strokeWeight(2);
  }
  ArrayList<Part> newparts = new ArrayList<Part>();
  for(Part part: parts){
    noStroke();
    fill(part.col);
    boolean destroy = false;
    for(magnet mag: mags){
        float distance = dist(mag.x, mag.y, part.x, part.y);
        float angle = atan2(part.y-mag.y, part.x-mag.x);
        part.x += part.clone*(cos(angle)/pow(2, distance / 100))*mag.power;
        part.y += part.clone*(sin(angle)/pow(2, distance / 100))*mag.power;
        if(distance <= 10 && part.clone >= 0 && mag.power <= 0){
          destroy = true;
          break;
        }
        if(distance <= 10 && part.clone <= 0 && mag.power >= 0){
          destroy = true;
          break;
        }
    }
    if(destroy == false){
      ellipse(part.x, part.y, 3, 3);
      newparts.add(part);
    }
  }
  parts = newparts;
}

color valueToColor(float value, float range, float TH){
  colorMode(RGB, 255, 255, 255);
  println(value);
  println(range);
  println(255-255*value/range);
  color col = color(0);
  if(value > TH){
    col = color(100+155*value/range, 100, 100);
  }
  else{
    col = color(100, 100, 100-155*value/range);
  }
  colorMode(HSB, 360, 100, 100);
  return col;
}

void keyPressed(){
  if(key == 'r'){
    mags = new ArrayList<magnet>();
    parts = new ArrayList<Part>();
    background(360);
  }
}

void mousePressed(){
  magnet mag = new magnet();
  mag.x = mouseX;
  mag.y = mouseY;
  if(mouseButton == LEFT){
    //mag.power = random(maxMagPow/10, maxMagPow);
    mag.power = 10;
    mags.add(mag);
  }
  else if(mouseButton == RIGHT){
    //mag.power = -random(maxMagPow/10, maxMagPow);
    mag.power = -10;
    mags.add(mag);
  }
  else{
    parts = new ArrayList<Part>();
    background(360);
  }
}

class position{
  float x;
  float y;
}

class Part extends position{
  color col;
  float clone;
}

class magnet extends position{
  float power;
}