//userSetting
int agentCount = 2000;
float initAgentSpeed = 0;
float noiseSpeed = 8;
float noiseScale = 0.001;
float agentSpeedMax = 20;
//var
ArrayList<Agent> agents = new ArrayList<Agent>();
float zoff = 0;
PImage img;

void setup(){
  fullScreen();
  img = loadImage("30pxBlur.png");
  colorMode(HSB, 360, 100, 100, 100);
  for(int i = 0; i < agentCount; i++){
    PVector pos = new PVector(random(0, width), random(0, height));
    PVector speed = new PVector(random(-initAgentSpeed, initAgentSpeed), random(-initAgentSpeed, initAgentSpeed));
    float range = 50;
    Agent agent = new Agent(pos, speed, range);
    agents.add(agent);
  }
  background(360);
}

void draw(){
  fill(360, 10);
  rect(0, 0, width, height);
  noStroke();
  zoff += 1;
  //println("zoff"+zoff/100+"Sin"+sin(zoff/100));
      println(noise(random(100), random(100), random(100)));
  ArrayList<Agent> Nagents = new ArrayList<Agent>();
  for(Agent agent : agents){
    Agent Nagent = new Agent(agent);
    PVector noiseVec = rad2Vec(noise(agent.pos.x * noiseScale, agent.pos.y * noiseScale, zoff * noiseScale)*PI*8);
    Nagent.speed.add(virVec(noiseVec).mult(noiseSpeed * 0.01));
    Nagent.pos.add(virVec(noiseVec).mult(noiseSpeed));
    if(mousePressed){
      Nagent.speed.sub(new PVector(mouseX, mouseY).sub(Nagent.pos).div(1000));
    }
    else{
      Nagent.speed.add(new PVector(mouseX, mouseY).sub(Nagent.pos).div(1000));
    }
    Nagent.speed = vecConstrainMag(Nagent.speed, agentSpeedMax);
    Nagent.pos.add(Nagent.speed);
    Nagent.pos = vecConstrain(Nagent.pos, 0, width, 0, height);
    Nagents.add(Nagent);
    tint(100 + Nagent.speed.mag() * 10, 100, 100, 10);
    //rect(agent.pos.x, agent.pos.y, agent.range, agent.range);
    image(img, agent.pos.x, agent.pos.y);
  }
  agents = Nagents;
}