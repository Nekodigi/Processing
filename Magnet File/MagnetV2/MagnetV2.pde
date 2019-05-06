ArrayList<magnet> mags = new ArrayList<magnet>();
ArrayList<Part> parts = new ArrayList<Part>();

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  magnet mag = new magnet();
  mag.x = width/2;
  mag.y = height/2;
  mag.angle = radians(45);
  mag.size = 100;
  mag.power = 100;
  mags.add(mag);
  background(0);
  frameRate(10000);
}

void draw(){
  fill(0, 1);
  rect(0, 0, width, height);
  fill(255);
  for(magnet mag: mags){
    float firstposX = mag.x - cos(mag.angle)*mag.size/2;
    float firstposY = mag.y - sin(mag.angle)*mag.size/2;
    float secondposX = mag.x + cos(mag.angle)*mag.size/2;
    float secondposY = mag.y + sin(mag.angle)*mag.size/2;
    Part part = new Part();
    part.x = secondposX + random(-1, 1);
    part.y = secondposY + random(-1, 1);
    part.col = color(random(250, 200), random(0, 100), 100);
    part.clone = 1;
    if(random(0, 1) < 1){
      parts.add(part);
    }
    Part Npart = new Part();
    Npart.x = firstposX + random(-1, 1);
    Npart.y = firstposY + random(-1, 1);
    Npart.col = color(random(250, 200), random(0, 100), 100);
    Npart.clone = -1;
    if(random(0, 1) < 1){
      parts.add(Npart);
    }
    stroke(255);
    strokeWeight(2);
    ellipse(firstposX, firstposY, 10, 10);
    line(firstposX, firstposY, secondposX, secondposY);
  }
  int i = 0;
  ArrayList<Part> newparts = new ArrayList<Part>();
  for(Part part: parts){
    noStroke();
    fill(part.col);
    ellipse(part.x, part.y, 3, 3);
    for(magnet mag: mags){
      float firstposX = mag.x - cos(mag.angle)*mag.size/2;
      float firstposY = mag.y - sin(mag.angle)*mag.size/2;
      float secondposX = mag.x + cos(mag.angle)*mag.size/2;
      float secondposY = mag.y + sin(mag.angle)*mag.size/2;
        float distance = dist(secondposX, secondposY, part.x, part.y) + 100;
        float angle = atan2(part.y-secondposY, part.x-secondposX);
        float distance2 = dist(firstposX, firstposY, part.x, part.y) + 100;
        float angle2 = atan2(part.y-firstposY, part.x-firstposX);
        part.x += part.clone*(cos(angle)/pow(2, distance / 100))*mag.power;
        part.y += part.clone*(sin(angle)/pow(2, distance / 100))*mag.power;
        part.x -= part.clone*(cos(angle2)/pow(2, distance2 / 100))*mag.power;
        part.y -= part.clone*(sin(angle2)/pow(2, distance2 / 100))*mag.power;
        if(distance2 <= 110 && part.clone >= 0){
          continue;
        }
        if(distance <= 110 && part.clone <= 0){
          continue;
        }
      newparts.add(part);
    }
    i++;
  }
  parts = newparts;
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
  float angle;
  float power;
  float size;
}