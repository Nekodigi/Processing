ArrayList<Agent> agents = new ArrayList<Agent>();

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
    agent.off += agent.increase;
  }
  for(int y = 0; y < height; y+=10){
    for(int x = 0; x < width; x+=10){
      float totaldiff = 0;
      for(Agent agent: agents){
        totaldiff+=sin(dist(x, y, agent.x, agent.y)/agent.fn+agent.off)*360;
      }
      fill(sin(totaldiff/100)*360);
      //fill(totaldiff);
      rect(x, y, 10, 10);
    }
  }
}

void mousePressed(){
  Agent agent = new Agent();
  agent.x = mouseX;
  agent.y = mouseY;
  agent.fn=random(10, 40);
  agent.increase=-0.5;
  //agent.increase=0.5;
  agent.vec = new PVector(random(-2, 2), random(-2, 2));
  agents.add(agent);
}