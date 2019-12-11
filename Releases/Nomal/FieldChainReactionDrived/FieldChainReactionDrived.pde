ArrayList<Agent> agents = new ArrayList<Agent>();
int gridinterval = 50;
float fieldSize = 0.001;
float zoff;
float fieldRotate = 30;
float collisionRange = 10;


void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw(){
  //zoff += 0.001;
  ArrayList<Agent> Nagents = new ArrayList<Agent>();
  fill(360, 5);
  rect(0, 0, width, height);
  fill(0, 5);
  noStroke();
  if(mousePressed){
    for(int i = 0; i < 1000; i++){
      Agent agent = new Agent();
      float posX = mouseX + randomGaussian()*100;
      float posY = mouseY + randomGaussian()*100;
      agent.speed.add(getFieldVec(posX, posY, 10));
      agent.pos.add(posX, posY);
      agent.lifeTime = 10 + (int)random(0, 10);
      agents.add(agent);
    }
  }
  for(Agent agent : agents){
    rect(agent.pos.x, agent.pos.y, 10, 10);
    agent.pos.add(agent.speed);
    if(frameCount - agent.bornTime > agent.lifeTime && agent.lifeTime != 0){
      
    }
    else if(constrain(agent.pos.x , 0, width) == agent.pos.x && constrain(agent.pos.y , 0, height) == agent.pos.y){
      Nagents.add(agent);
    }
  }
  agents = Nagents;
  showField();
}