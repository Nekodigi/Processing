ArrayList<Agent> agents = new ArrayList<Agent>();
int sampling = 5;
boolean disptotal;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  
}

void draw(){
  background(360);
  noStroke();
  for(Agent agent: agents){
    agent.x += agent.vec.x;
    agent.y += agent.vec.y;
  }
  for(int y = 0; y < height; y+=sampling){
    for(int x = 0; x < width; x+=sampling){
      float totaldiff = 0;
      for(Agent agent: agents){
        totaldiff+=sin(dist(x, y, agent.x, agent.y)/agent.fn)*360r;
      }
      if(disptotal){
        fill(totaldiff);
      }else{
        fill(sin(totaldiff/100)*360);
      }
      rect(x, y, sampling, sampling);
    }
  }
}

void mousePressed(){
  Agent agent = new Agent();
  agent.x = mouseX;
  agent.y = mouseY;
  agent.fn=random(50, 100);
  agent.vec = new PVector(random(-2, 2), random(-2, 2));
  agents.add(agent);
}

void keyPressed(){
  if(key=='r'){
    agents = new ArrayList<Agent>();
  }
  if(key=='t'){
    disptotal = !disptotal;
  }
}