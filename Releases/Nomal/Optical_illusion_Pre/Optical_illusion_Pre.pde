ArrayList<Agent> agents = new ArrayList<Agent>();
int gridinterval = 50;
float fieldSize = 0.001;
float zoff;
float fieldRotate = 30;


void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  for(int i = 0; i < 10000; i++){
    Agent agent = new Agent();
    agent.pos = new PVector(random(0, width), random(0, height));
    agent.speed = new PVector(100,100);
    agents.add(agent);
  }
}

void draw(){
  background(360);
  fill(0);
  stroke(0);
  strokeWeight(5);
  for(Agent agent : agents){
    ellipse(agent.pos.x, agent.pos.y, 10, 10);
    if(mousePressed){
      agent.speed.add(getFieldVec(agent.pos.x, agent.pos.y, 10));
    }
    //agent.pos.add(getFieldVec(agent.pos.x, agent.pos.y, 10));
  }
  showField();
}