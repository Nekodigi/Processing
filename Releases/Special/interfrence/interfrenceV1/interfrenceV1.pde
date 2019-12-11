ArrayList<Agent> agents = new ArrayList<Agent>();

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  
}

void draw(){
  background(360);
  noStroke();
  for(int y = 0; y < height; y+=10){
    for(int x = 0; x < width; x+=10){
      float totaldiff = 0;
      for(Agent agent: agents){
        totaldiff+=sin(dist(x, y, agent.x, agent.y)/100)*360;
      }
      fill(totaldiff%360);
      rect(x, y, 10, 10);
    }
  }
}

void mousePressed(){
  Agent agent = new Agent();
  agent.x = mouseX;
  agent.y = mouseY;
  agents.add(agent);
}