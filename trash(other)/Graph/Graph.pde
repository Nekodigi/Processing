ArrayList<Float> gdatas = new ArrayList<Float>();
ArrayList<pattern> pat = new ArrayList<pattern>();
int smoothd = 0;
int style = 0;

void setup() {
  fullScreen();
  dfo_data();
}

void dfo_data() {
  for (int i = 0; i < width; i+= 1) {
    float ram = height / 2;
    gdatas.add(ram);
  }
  pattern inpat0 = new pattern();
  inpat0.size = random(50, 100);
  pat.add(0, inpat0);
  pattern inpat1 = new pattern();
  inpat1.size = random(0, 10);
  pat.add(1, inpat1);
  pattern inpat2 = new pattern();
  inpat2.size = random(100, 200);
  pat.add(2, inpat2);
}

void data_update() {
  pattern pat0 = pat.get(0);
  pattern pat1 = pat.get(1);
    print(pat.get(2).size);
  pattern pat2 = pat.get(2);
  float ram = mouseY + sin(pat0.radian) * pat0.size + sin(pat1.radian) * pat1.size + sin(pat2.radian) * pat2.size;
  gdatas.add(0, ram);
  gdatas.remove(192);
  pat0.radian += random(0, 1);
  pat1.radian += random(0, 5);
  pat2.radian += random(0, 0.5);
  pat0.size += random(-2, 2);
  pat0.size = constrain(pat0.size, 50f, 100f);
  pat.set(0, pat0);
  pat1.size += random(-1, 1);
  pat1.size = constrain(pat1.size, 0f, 10f);
  pat.set(1, pat1);
  pat2.size += random(-4, 4);
  pat2.size = constrain(pat2.size, 100f, 200f);
  pat.set(2, pat2);
}

void draw() {
  background(0);
  switch(style){
    case 0:
      Linegraph();
      break;
    case 1:
      bezierLine();
      break;
    case 2:
      bargraph();
      break;
    case 3:
      difbargraph();
      break;
    default:
      style = 0;
      break;
  }
  if(smoothd >= 10){
    smoothd = 0;
    data_update();
  }
  smoothd++;
}

color valtocol(float value, float multip){
  color col;
  if(value >= 0){
    col = color(100 + abs(value * multip), 100, 100);
  }
  else {
    col = color(100, 100, 100 + abs(value / multip));
    
  }
  return col;
}

void Linegraph() {
  strokeWeight(2);
    for (int i = 0; i < gdatas.size(); i++) {
    noStroke();
    fill(gdatas.get(i) - height / 2, 100, 100);
    ellipse(i * 10 + smoothd, gdatas.get(i), 5, 5);
    if(i != 0){
      stroke(255);
      line(i * 10 + smoothd, gdatas.get(i), (i * 10) - 10 + smoothd , gdatas.get(i - 1));
    }
  }
}
void bargraph() {
    for (int i = 0; i < gdatas.size(); i++) {
    if(i != 0){
      stroke(valtocol(gdatas.get(i) - height / 2, 0.5));
      strokeWeight(5);
      line(i * 10 + smoothd, height / 2, i * 10 + smoothd , gdatas.get(i));
    }
  }
}
void difbargraph() {
    for (int i = 0; i < gdatas.size(); i++) {
    if(i != 0){
      stroke(valtocol(gdatas.get(i - 1) - gdatas.get(i), 2));
      strokeWeight(5);
      line(i * 10 + smoothd, gdatas.get(i - 1), i * 10 + smoothd , gdatas.get(i));
    }
  }
}

void mousePressed() {
  style++;
}

pos mid_point(pos pos0, pos pos1){
  pos npos = new pos();
  npos.x = pos0.x * 0.5f + pos1.x * 0.5f;
  npos.y = pos0.y * 0.5f + pos1.y * 0.5f;
  noStroke();
  fill(255);
  ellipse(npos.x, npos.y, 5, 5);
  noFill();
  stroke(255);
  return npos;
}

void threeP_bezier(pos pos0, pos pos1, pos pos2) { //bezierposition
  noFill();
  stroke(255);
  bezier(mid_point(pos0, pos1).x, mid_point(pos0, pos1).y, pos1.x, pos1.y, pos1.x, pos1.y, mid_point(pos1, pos2).x, mid_point(pos1, pos2).y);
}

void bezierLine(){
  strokeWeight(2);
  stroke(255);
  pos pos0 = new pos();
  pos pos1 = new pos();
  pos eposb = new pos();
  pos epos = new pos();
  pos0.x = 0 + smoothd;
  pos0.y = gdatas.get(0);
  pos1.x = 10 + smoothd;
  pos1.y = gdatas.get(1);
  eposb.x = 1910 + smoothd;
  eposb.y = gdatas.get(190);
  epos.x = 1920 + smoothd;
  epos.y = gdatas.get(191);
      line(pos0.x, pos0.y, mid_point(pos0, pos1).x, mid_point(pos0, pos1).y);
      line(mid_point(eposb, epos).x, mid_point(eposb, epos).y, epos.x, epos.y);
      for(int a = 0; a < gdatas.size(); a++){
        if(a + 2 < gdatas.size() && a >= 2){
          pos mpos = new pos();
          mpos.x = a * 10 + smoothd;
          mpos.y = gdatas.get(a);
          pos mpos1 = new pos();
          mpos1.x = a * 10 - 10 + smoothd;
          mpos1.y = gdatas.get(a - 1);
          pos mpos2 = new pos();
          mpos2.x = a * 10 - 20 + smoothd;
          mpos2.y = gdatas.get(a - 2);
          threeP_bezier(mpos, mpos1, mpos2);
        }
      }
}

class pattern{
  float radian;
  float size;
}

class pos {
  float x, y, speedx, speedy;
}