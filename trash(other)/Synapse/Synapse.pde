ArrayList<synapselay> slays = new ArrayList<synapselay>();
float layer = 10;
float chance = 200;
float themecol;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100);
}

void mousePressed(){
  layer = random(2, 20);
  chance = random(10, 400);
  slays = new ArrayList<synapselay>();
  themecol = random(0, 360);
  for(int i = 0; i < layer; i++){
    synapselay slay = new synapselay();
    for(int a = 0; a < random(0, chance)*(1-(i/(layer))); a++){
      float interval = width/(layer+1);
      synapse sobj = new synapse();
      sobj.x = interval+i*interval;
      sobj.weight = random(0.1, 2);
      sobj.col = color(themecol, random(0, 100), 100);
      sobj.y = random(height/2 - height*(1-(i/(layer)))/2, height/2 + height*(1-(i/(layer)))/2);
      slay.onelay.add(sobj);
    }
    slays.add(slay);
  }
}

void draw(){
  background(0, 0, 0);
  noFill();
  for(int i = 0; i < slays.size(); i++){
    synapselay slay = slays.get(i);
    if(i+1 < slays.size()){
      synapselay nslay = slays.get(i+1);
      for(synapse sobj: slay.onelay){
        strokeWeight(sobj.weight);
        stroke(sobj.col);
        for(synapse nsobj: nslay.onelay){
          bezier(sobj.x, sobj.y, lerp(sobj.x, nsobj.x, 0.5), sobj.y, lerp(sobj.x, nsobj.x, 0.5), nsobj.y, nsobj.x, nsobj.y);
        }
        fill(0, 0, 100);
        ellipse(sobj.x, sobj.y, 10, 10);
        noFill();
      }
    }
  }
}

class position{
  float x;
  float y;
}

class synapse extends position{
  float weight;
  color col;
}

class synapselay{
  ArrayList<synapse> onelay = new ArrayList<synapse>();
}