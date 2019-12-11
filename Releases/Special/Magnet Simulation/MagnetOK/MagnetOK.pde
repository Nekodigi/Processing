ArrayList<magnet> mags = new ArrayList<magnet>();
ArrayList<position> parts = new ArrayList<position>();
ArrayList<position> Nparts = new ArrayList<position>();

void setup(){
  fullScreen();
  magnet mag = new magnet();
  mag.x = width/2;
  mag.y = height/2;
  mag.angle = radians(45);
  mag.size = 1000;
  mag.power = 0.05;
  mags.add(mag);
  background(0);
}

void draw(){
  fill(0, 4);
  rect(0, 0, width, height);
  fill(255);
  for(magnet mag: mags){
    float firstposX = mag.x - cos(mag.angle)*mag.size/2;
    float firstposY = mag.y - sin(mag.angle)*mag.size/2;
    float secondposX = mag.x + cos(mag.angle)*mag.size/2;
    float secondposY = mag.y + sin(mag.angle)*mag.size/2;
    position part = new position();
    part.x = firstposX + random(-100, 100);
    part.y = firstposY + random(-100, 100);
    part.isN = false;
    if(random(0, 1) < 1){
      Nparts.add(part);
    }
    position Npart = new position();
    Npart.x = secondposX + random(-10, 10);
    Npart.y = secondposY + random(-10, 10);
    Npart.isN = false;
    float randomAngle;
    if(random(0, 2) < 1){
      randomAngle = random(120, 150);
    }
    else {
      randomAngle = random(300, 330);
    }
    float randomPower = random(4, 6);
    Npart.vecX = cos(radians(randomAngle))*randomPower;
    Npart.vecY = sin(radians(randomAngle))*randomPower;
    if(random(0, 10) < 1){
      parts.add(Npart);
    }
    stroke(255);
    strokeWeight(2);
    ellipse(firstposX, firstposY, 10, 10);
    line(firstposX, firstposY, secondposX, secondposY);
  }
  int i = 0;
  ArrayList<position> newparts = new ArrayList<position>();
  for(position part: parts){
    ellipse(part.x, part.y, 3, 3);
    part.vecX /= 1.002;
    part.vecY /= 1.002;
    for(magnet mag: mags){
      float firstposX = mag.x - cos(mag.angle)*mag.size/2;
      float firstposY = mag.y - sin(mag.angle)*mag.size/2;
      float secondposX = mag.x + cos(mag.angle)*mag.size/2;
      float secondposY = mag.y + sin(mag.angle)*mag.size/2;
      if(part.isN){
        float distance = dist(secondposX, secondposY, part.x, part.y) + 100;
        float angle = atan2(part.y-secondposY, part.x-secondposX);
        part.vecX += (cos(angle)/pow(1.001, distance))*mag.power;
        part.vecY += (sin(angle)/pow(1.001, distance))*mag.power;
        if(distance <= 300){
          println(distance);
          //part.isN = false;
          continue;
        }
      }
      else{
        float distance2 = dist(firstposX, firstposY, part.x, part.y) + 100;
        float angle2 = atan2(part.y-firstposY, part.x-firstposX);
        part.vecX += (cos(angle2)/pow(1.001, distance2))*mag.power;
        part.vecY += (sin(angle2)/pow(1.001, distance2))*mag.power;
        if(distance2 <= 500){
          part.isN = true;  
          part.vecX /= 5;//tataku
          part.vecY /= 5;//tataku
        }
      }
      part.x -= part.vecX;
      part.y -= part.vecY;
      newparts.add(part);
    }
    i++;
  }
  parts = newparts;
}

class position{
  float x;
  float y;
  float vecX;
  float vecY;
  boolean isN;
}

class magnet extends position{
  float angle;
  float power;
  float size;
}