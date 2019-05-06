float baseX;
position oldpos = new position();
position olderpos = new position();
position oldestpos = new position();


void setup(){
  fullScreen();
}

void draw(){
  background(200);
  baseX+= 0.1;
  float yoff = baseX;
  for(int y=0; y<90; y++){
    float xoff=0;
    float radoff = cos(radians(y))*2000;
    oldpos.x = 0;
    oldpos.y = 0;
    for(int x=0; x<360; x++){
      fill(0);
      noStroke();
      float xpos = cos(radians(x))*map(noise(xoff, yoff), 0, 1, 0, radoff)+width/2;
      float ypos = sin(radians(x))*map(noise(xoff, yoff), 0, 1, 0, radoff)+height/2;
      //ellipse(xpos, ypos, 2, 2);
      stroke(0);
      strokeWeight(1);
      if(oldpos.x != 0 && oldpos.y != 0){
        line(xpos, ypos, oldpos.x, oldpos.y);
      }
      oldpos.x = xpos;
      oldpos.y = ypos;
      xoff+=0.02;
    }
    yoff+=0.02;
  }
}

class position{
  float x;
  float y;
}