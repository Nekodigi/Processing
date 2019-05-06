ArrayList<Agent> agents1 = new ArrayList<Agent>();
ArrayList<Agent> agents2 = new ArrayList<Agent>();
ArrayList<Agent> agents3 = new ArrayList<Agent>();
ArrayList<Agent> agents4 = new ArrayList<Agent>();
ArrayList<Agent> randomagents = new ArrayList<Agent>();
float acceleration = 1;
float noiseTransion = 0.001;
float rotationMulti = 4;
float speedDecay = 0.5;
int noiseScale = 1000;

float zoff = 0.01;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  agentReset();
}

void draw(){
  zoff+=noiseTransion;
  fill(360, 10);
  rect(0, 0, width, height);
  noStroke();
  ArrayList<Agent> nagents1 = new ArrayList<Agent>();
  ArrayList<Agent> nagents2 = new ArrayList<Agent>();
  ArrayList<Agent> nagents3 = new ArrayList<Agent>();
  ArrayList<Agent> nagents4 = new ArrayList<Agent>();
  nagents1 = agentUpdate(agents1, 0, 150, true);
  nagents2 = agentUpdate(agents2, 10, 200, true);
  nagents3 = agentUpdate(agents3, 0, 300, true);
  nagents4 = agentUpdate(agents4, 10, 250, true);
  for(int i = 0; i < random(0, 100); i++){
    nagents1.add(createAgent(1));
  }
  for(int i = 0; i < random(0, 100); i++){
    nagents2.add(createAgent(1));
  }
  if(frameCount%10==0){
    nagents3.add(createAgent(10));
  }
  if(frameCount%10==0){
    nagents4.add(createAgent(10));
  }
  ArrayList<Agent> Nrandomagents = new ArrayList<Agent>();
  for(Agent ragent: randomagents){
    switch((int)random(3, 5)){
      case 1:
        //nagents1.add(ragent);
        break;
      case 2:
        //nagents2.add(ragent);
        break;
      case 3:
        nagents3.add(ragent);
        break;
      case 4:
        nagents4.add(ragent);
        break;
      default:
        break;
    }
  }
  agents1 = nagents1;
  agents2 = nagents2;
  agents3 = nagents3;
  agents4 = nagents4;
  randomagents = Nrandomagents;
}

ArrayList<Agent> agentUpdate(ArrayList<Agent> agents, int noiseOff, float colOff, boolean main){
  ArrayList<Agent> pagents = new ArrayList<Agent>();
  for(Agent agent: agents){
    float angle = map(noise(agent.x/noiseScale, agent.y/noiseScale, zoff+noiseOff), 0, 1, 0, PI*rotationMulti);
    agent.speed.x += sin(angle)*acceleration/agent.mass;
    agent.speed.y += cos(angle)*acceleration/agent.mass;
    agent.x += agent.speed.x;
    agent.y += agent.speed.y;
    fill(colOff, agent.speed.mag()*10, 100);
    ellipse(agent.x, agent.y, agent.size*agent.speed.mag(), agent.size*agent.speed.mag());
    if(main){
      agent.speed.mult(0.9);
    }else{
      agent.speed.mult(speedDecay);
    }
    if(random(0, 1000)< 1){
      
    }
    else if(frameCount%100==0){
        randomagents.add(agent);
    }
    else{
      pagents.add(agent);
    }
  }
  return pagents;
}

void agentReset(){
  for(int i = 0; i < 100; i++){
    agents1.add(createAgent(1));  
  }
  for(int i = 0; i < 100; i++){
    agents2.add(createAgent(1));  
  }
  for(int i = 0; i < 1; i++){
    agents3.add(createAgent(10));  
  }
  for(int i = 0; i < 1; i++){
    agents4.add(createAgent(10));  
  }
}

Agent createAgent(int size){
  Agent agent = new Agent();
  agent.speed = new PVector();
  agent.x = random(0, width);
  agent.y = random(0, height);
  agent.size = size;
  agent.mass = random(1, 10);
  agent.col = color(150, 100, 100, 100);
  return agent;
}