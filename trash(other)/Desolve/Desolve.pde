ArrayList<HPP> HPPoints = new ArrayList<HPP>();
int xline = 1;
int yline = 1;
ArrayList<dataset> Lines = new ArrayList<dataset>();

void setup(){
  dfoLine();
  fullScreen();
  frameRate(500);
  setHPP();
}

void dfoLine() {
  for(int i = 0; i < width; i+=10){
    pos newpos = new pos();
    newpos.x = i;
    newpos.y = height/2;
    Lines.add(multiadd(newpos));
  }
}

dataset multiadd(pos tpos){
  dataset dset = new dataset();
  for(int x = 0; x < xline; x++){
    for(int y = 0; x < yline; y++){
      pos apos = tpos;
      apos.x += x * 10;
      apos.y += y * 10;
      dset.dataset.add(apos);
    }
  }
  return dset;
}

void draw(){
  if(mousePressed){
    dataset dset = Lines.get(0);
    pos Nowmpos = dset.dataset.get(dset.dataset.size() - 1);
    if(dist(Nowmpos.x, Nowmpos.y, mouseX, mouseY) > 10){
      pos mpos = new pos();
      mpos.x = mouseX;
      mpos.y = mouseY;
      Lines.add(multiadd(mpos));
    }
  }
    background(0);
    pos oldmpos = new pos();
    strokeWeight(1);
    for(HPP HPPoint: HPPoints){
      ellipse(HPPoint.x, HPPoint.y, 1, 1);
    }
    for(dataset mposs: Lines){
      int i = 0;
      for(pos mpos: mposs.dataset){
        stroke(255);
        //ellipse(mpos.x, mpos.y, 2, 2);
        if(oldmpos.x != 0){
          //line(oldmpos.x, oldmpos.y, mpos.x, mpos.y);
        }
        pos nmpos = mpos;
        nmpos.x += nmpos.speedx;
        nmpos.y += nmpos.speedy;
        mposs.dataset.set(i, nmpos);
        oldmpos = mpos;
        float xs = 0, ys = 0;
        ellipse(mpos.x, 0, 10, 10);
        ellipse(0, mpos.y, 1, 1);
        for(HPP HPPoint: HPPoints){
          float distance = dist(HPPoint.x, HPPoint.y, mpos.x, mpos.y);
          float angle = atan2(mpos.x - HPPoint.x, mpos.y - HPPoint.y);
          xs += sin(angle) * HPPoint.presre / (distance * HPPoint.decay + 1); 
          ys += cos(angle) * HPPoint.presre / (distance * HPPoint.decay + 1); 
          fill(255);
        }
        line(oldmpos.x, oldmpos.y, mpos.x, mpos.y);
        mpos.speedx = xs;
        mpos.speedy = ys;
        mposs.dataset.set(i, mpos);
      i++;
      }
    }
  bezierLine(Lines);
  
}

void mousePressed(){
  Lines = new ArrayList<dataset>();
  pos mpos = new pos();
  mpos.x = mouseX;
  mpos.y = mouseY;
  Lines.add(multiadd(mpos));
}

void setHPP(){
  for(int i = 0; i < 100; i++) {
    HPP HPPoint = new HPP();
    HPPoint.x = random(0, width);
    HPPoint.y = random(0, height);
    HPPoint.presre = random(0, 100);
    HPPoint.decay = random(2, 5);
    HPPoints.add(HPPoint);
  }
}

pos mid_point(pos pos0, pos pos1){
  pos npos = new pos();
  npos.x = pos0.x * 0.5 + pos1.x * 0.5;
  npos.y = pos0.y * 0.5 + pos1.y * 0.5;
  return npos;
}

void threeP_bezier(pos pos0, pos pos1, pos pos2) {
  noFill();
  bezier(mid_point(pos0, pos1).x, mid_point(pos0, pos1).y, pos1.x, pos1.y, pos1.x, pos1.y, mid_point(pos1, pos2).x, mid_point(pos1, pos2).y);
}

void bezierLine(ArrayList<dataset> Lines){
  for(dataset Line: Lines){
    ArrayList<pos> mposs = Line.dataset;
    pos pos0 = new pos();
    pos pos1 = new pos();
    pos epos = new pos();
    pos eposbefore = new pos();
    if(mposs.size() == 0){
      //none
    }
    else if(mposs.size() == 1){
      pos0 = mposs.get(0);
      ellipse(pos0.x, pos0.y, 4, 4);
    }
    else if(mposs.size() == 2){
      pos1 = mposs.get(1);
      eposbefore = mposs.get(mposs.size()-1);
      line(pos0.x, pos0.y, pos1.x, pos1.y);
    }
    else if(mposs.size() == 3){
      epos = mposs.get(mposs.size()-2);
      line(pos0.x, pos0.y, mid_point(pos0, pos1).x, mid_point(pos0, pos1).y);
      threeP_bezier(pos0, pos1, epos);
      line(mid_point(pos1, epos).x, mid_point(pos1, epos).y, epos.x, epos.y);
    }
    else {
      line(pos0.x, pos0.y, mid_point(pos0, pos1).x, mid_point(pos0, pos1).y);
      line(mid_point(eposbefore, epos).x, mid_point(eposbefore, epos).y, epos.x, epos.y);
      for(int i = 0; i < mposs.size(); i++){
        if(i + 2 < mposs.size()){
          threeP_bezier(mposs.get(i), mposs.get(i + 1), mposs.get(i + 2));
        }
      }
    }
  }
}

class dataset {
  ArrayList<pos> dataset = new ArrayList<pos>();
}

class pos {
  float x, y, speedx, speedy;
}

class HPP{
  float x, y, presre, decay;
}