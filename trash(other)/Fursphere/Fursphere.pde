ArrayList<furposition>furposs = new ArrayList<furposition>();
ArrayList<pressreposition>pressreposs = new ArrayList<pressreposition>();
float sweight = 2;

void setup(){
  fullScreen();
  colorMode(HSB,360,100,100);
  for(float i = 0; i < 360; i += 1){
    furposition fpos = new furposition();
    fpos.x = width/2;
    fpos.y = height/2;
    fpos.col = color(30, random(10, 50), 100, random(20, 890));
    fpos.vecX = cos(radians(i))*random(30, 50);
    fpos.vecY = sin(radians(i))*random(30, 50);
    fpos.refrection = (int)random(3, 30);
    furposs.add(fpos);
  }
  pressreposition ppos = new pressreposition();
  ppos.x = width/2+100;
  ppos.y = height/2+100;
  ppos.power = 0;
  pressreposs.add(ppos);
}

void draw(){
  background(0);
  stroke(255);
  for(pressreposition pressrepos: pressreposs){
    ellipse(pressrepos.x , pressrepos.y, 10, 10);
  }
  if(mousePressed){
    pressreposition ppos = new pressreposition();
    ppos.x = mouseX;
    ppos.y = mouseY;
    ppos.power = 10;
    pressreposs.set(0, ppos);
  }
  for(furposition furpos: furposs){
    float firstposX = furpos.x;
    float firstposY = furpos.y;
    float furvecX = furpos.vecX;
    float furvecY = furpos.vecY;
    float distance = dist(0, 0, furpos.vecX, furvecY);
    ArrayList<position> furline = new ArrayList<position>();
    position pos = new position();
    pos.x = firstposX;
    pos.y = firstposY;
    furline.add(pos);
    for(int i = 0; i < furpos.refrection; i++){
      float angle = atan2(furvecX, furvecY); 
      float secondposX = firstposX + cos(angle) * distance;
      float secondposY = firstposY + sin(angle) * distance;
      pos = new position();
      pos.x = secondposX;
      pos.y = secondposY;
      furline.add(pos);
      strokeWeight(lerp(sweight, 1.0, i/furpos.refrection));
      
      //line(firstposX, firstposY, secondposX, secondposY);  
      firstposX = secondposX;
      firstposY = secondposY;
      for(pressreposition pressrepos: pressreposs){
        float distan = dist(secondposX, secondposY, pressrepos.x, pressrepos.y);
        furvecY -=  (pressrepos.x - firstposX) * pressrepos.power / distan;
        furvecX -=  (pressrepos.y - firstposY) * pressrepos.power / distan;
        line(300, 300, 300 + furvecX, 300 + furvecY);  
      }
    }
    println(furline.get(1).x);
    println(furline.get(2).x);
    onefur sendfur = new onefur();
    sendfur.pos = furline;
    sendfur.col = furpos.col;
    sendfur.refrection = furpos.refrection;
    bezierLine(sendfur);
  }
  line(200, 200, 0, 0);
}

position mid_point(position pos0, position pos1){
  position npos = new position();
  npos.x = pos0.x * 0.5f + pos1.x * 0.5f;
  npos.y = pos0.y * 0.5f + pos1.y * 0.5f;
  /*noStroke();
  fill(255);
  //ellipse(npos.x, npos.y, 5, 5);
  noFill();
  stroke(255);*/
  return npos;
}

void threeP_bezier(position pos0, position pos1, position pos2, color col) { //bezierposition
  noFill();
  stroke(col);
  println(col);
  bezier(mid_point(pos0, pos1).x, mid_point(pos0, pos1).y, pos1.x, pos1.y, pos1.x, pos1.y, mid_point(pos1, pos2).x, mid_point(pos1, pos2).y);
}

void bezierLine(onefur furdata){
  ArrayList<position> datas = new ArrayList<position>();
  datas = furdata.pos;
  strokeWeight(1);
  stroke(255);
  position pos0 = new position();
  position pos1 = new position();
  position eposb = new position();
  position epos = new position();
  pos0 = datas.get(0);
  pos1 = datas.get(1);
  eposb = datas.get(datas.size()-2);
  epos = datas.get(datas.size()-1);
      line(pos0.x, pos0.y, mid_point(pos0, pos1).x, mid_point(pos0, pos1).y);
      line(mid_point(eposb, epos).x, mid_point(eposb, epos).y, epos.x, epos.y);
      for(int a = 0; a < datas.size(); a++){
        strokeWeight(lerp(sweight, 1.0, a/furdata.refrection));
        if(a >= 2){
          position mpos = new position();
          mpos = datas.get(a);
          position mpos1 = new position();
          mpos1 = datas.get(a - 1);
          position mpos2 = new position();
          mpos2 = datas.get(a - 2);
          threeP_bezier(mpos, mpos1, mpos2, furdata.col);
        }
      }
}

class position{
  float x;
  float y;
}

class onefur{
  ArrayList<position> pos = new ArrayList<position>();
  int refrection;
  color col;
}

class furposition extends position{
  float vecX;
  float vecY;
  int refrection;
  color col;
}

class pressreposition extends position{
  float power;
}