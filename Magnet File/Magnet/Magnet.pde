ArrayList<magnet> mags = new ArrayList<magnet>();
ArrayList<position> parts = new ArrayList<position>();

void setup(){
  fullScreen();
  magnet mag = new magnet();
  mag.x = width/2;
  mag.y = height/2;
  mag.angle = radians(45);
  mag.size = 500;
  mag.power = 0.1;
  mags.add(mag);
  background(0);
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
    position part = new position();
    part.x = firstposX + random(-100, 100);
    part.y = firstposY + random(-100, 100);
    part.isN = false;
    float randomAngle = random(0, 360);
    float randomPower = random(0, 1);
    //part.vecX = cos(radians(randomAngle))*randomPower;
    //part.vecY = sin(radians(randomAngle))*randomPower;
    if(random(0, 100) < 1){
      parts.add(part);
    }
    stroke(255);
    strokeWeight(2);
    ellipse(firstposX, firstposY, 10, 10);
    line(firstposX, firstposY, secondposX, secondposY);
  }
  
  for(position part: parts){
    ellipse(part.x, part.y, 3, 3);
    part.vecX /= 1.003;
    part.vecY /= 1.003;
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
        if(distance <= 105){
          println(distance);
          part.isN = false;
        }
      }
      else{
        float distance2 = dist(firstposX, firstposY, part.x, part.y) + 100;
        float angle2 = atan2(part.y-firstposY, part.x-firstposX);
        part.vecX += (cos(angle2)/pow(1.001, distance2))*mag.power;
        part.vecY += (sin(angle2)/pow(1.001, distance2))*mag.power;
        if(distance2 <= 105){
          part.isN = true;  
        }
      }
      part.x -= part.vecX;
      part.y -= part.vecY;
    }
  }
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