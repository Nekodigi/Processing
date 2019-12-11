boolean[][] enable = new boolean[1][2];
int branchcount = 0;
int recursion = 12;
int totalbranch;

void setup(){
  fullScreen();
  totalbranch = int(pow(2, recursion));
  enable = new boolean[totalbranch * 2][2];
  for(int i = 0; i < totalbranch; i++){
    Treeseed(i);
  }
}

void draw(){
  background(255);
  pos spos = new pos();
  spos.x = width / 2;
  spos.y = height / 2;
  spos.angle = HALF_PI * 3;
  spos.len = height / 3;
  branchcount = 0;
  Tree(spos, recursion);
}

void Treeseed(int i){
  if(1 < random(0, 10)){
    enable[i][0] = true;
  }
  else{
    enable[i][0] = false;
  }
  if(1 < random(0, 10)){
    enable[i][1] = true;
  }
  else{
    enable[i][1] = false;
  }
}

void Tree(pos p1, int tier){
  if(tier > 0){
    float branch = frameCount * 0.01;
    pos p2 = new pos();
    p2.x = p1.x + cos(p1.angle) * p1.len;
    p2.y = p1.y + sin(p1.angle) * p1.len;
    pos p3 = new pos();
    p3.x = p2.x + cos(p1.angle + branch) * p1.len;
    p3.y = p2.y + sin(p1.angle + branch) * p1.len;
    pos p4 = new pos();
    p4.x = p2.x + cos(p1.angle - branch) * p1.len;
    p4.y = p2.y + sin(p1.angle - branch) * p1.len;
    stroke(0);
    strokeWeight(tier);
    noFill();
    bezier(p1.x, p1.y, p2.x, p2.y, p2.x, p2.y, p3.x, p3.y);
    bezier(p1.x, p1.y, p2.x, p2.y, p2.x, p2.y, p4.x, p4.y);
    pos rpos = new pos();
    rpos.x = p3.x;
    rpos.y = p3.y;
    rpos.len = p1.len / 1.4;
    rpos.angle = p1.angle + branch;
    if(enable[branchcount][0]){
      Tree(rpos, tier -1);
      branchcount++;
    }
    pos lpos = new pos();
    lpos.x = p4.x;
    lpos.y = p4.y;
    lpos.len = p1.len / 1.4;
    lpos.angle = p1.angle - branch;
    if(enable[branchcount][1]){
      Tree(lpos, tier -1);
    }
  }
}

class pos{
  float x, y;
  float angle;
  float len;
  pos(){
    x = 0;
    y = 0;
  }
}