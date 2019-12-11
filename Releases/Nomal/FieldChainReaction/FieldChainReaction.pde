ArrayList<Agent> agents = new ArrayList<Agent>();
int gridinterval = 50;
float fieldSize = 0.001;
float zoff;
float fieldRotate = 30;
float collisionRange = 15;


void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  for(int i = 0; i < 10000; i++){
    Agent agent = new Agent();
    agent.pos = new PVector(random(0, width), random(0, height));
    agent.speed = new PVector(0,0);
    boolean collision = false;
    for(Agent Tagent : agents){
      float diffX = agent.pos.x - Tagent.pos.x;
      float diffY = agent.pos.y - Tagent.pos.y;
      if(agent != Tagent && diffX*diffX+diffY*diffY<collisionRange*collisionRange){
        collision = true;
      }
    }
    if(!collision){
      agents.add(agent);
    }
  }
}

void draw(){
  //zoff += 0.001;
  ArrayList<Agent> Nagents = new ArrayList<Agent>();
  fill(360, 100);
  rect(0, 0, width, height);
  fill(0, 100);
  noStroke();
  if(mousePressed){
    for(int i = 0; i < 100; i++){
      Agent agent = new Agent();
      float posX = mouseX + randomGaussian()*100;
      float posY = mouseY + randomGaussian()*100;
      agent.speed.add(getFieldVec(posX, posY, 10));
      agent.pos.add(posX, posY);
      agent.lifeTime = 30 + (int)random(0, 30);
      agents.add(agent);
    }
  }
  for(Agent agent : agents){
    rect(agent.pos.x, agent.pos.y, 30, 30);
    for(Agent Tagent : agents){
      float diffX = agent.pos.x - Tagent.pos.x;
      float diffY = agent.pos.y - Tagent.pos.y;
      if(agent != Tagent && diffX*diffX+diffY*diffY<collisionRange*collisionRange){
        agent.lifeTime = 30 + (int)random(0, 30);
        agent.speed.add(getFieldVec(agent.pos.x, agent.pos.y, 10).mult(0.5));
      }
    }
    //agent.speed.add(getFieldVec(agent.pos.x, agent.pos.y, 10).mult(0.01));
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