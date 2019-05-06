float cellsize = 20;
Agent[][] agents;

void setup(){
  fullScreen(P3D);
  agents = new Agent[width/10][height/10];
  for(int y = 0; y <= height/cellsize-1; y++){
    for(int x = 0; x <= width/cellsize-1; x++){
      Agent agent = new Agent();
      agent.size = 0;
      agent.tran = 0;
      agents[x][y] = agent;
    }
  }
}
void draw(){
  background(200);
  if(mousePressed){
    Agent agent = new Agent(); 
    agent.size = cellsize*10;
    agents[(int)((mouseX+cellsize/2)/cellsize)][(int)((mouseY+cellsize/2)/cellsize)] = agent;
  }
  for(int y = 1; y <= height/cellsize-2; y++){
    for(int x = 1; x <= width/cellsize-2; x++){
      Agent agent = agents[x][y];
      checkspawn(x, y);
      noStroke();
      fill(0);
      rect(x*cellsize, y*cellsize, cellsize/2+agent.size, cellsize/2+agent.size);
      agent.tran += agent.size/100;
      print(agent.tran);
      agent.size-=agent.tran;
      agents[x][y] = agent;
    }
  }
}

void checkspawn(int x, int y){
  Agent agent = agents[x][y];
  Agent Northagent = agents[x][y+1];
  Agent Eastagent = agents[x+1][y];
  Agent Southagent = agents[x][y-1];
  Agent Westagent = agents[x-1][y];
  Agent Northeastagent = agents[x+1][y+1];
  Agent Northwestagent = agents[x-1][y+1];
  Agent Southeastagent = agents[x+1][y-1];
  Agent Southwestagent = agents[x-1][y-1];
  float totalsize = 0;
  totalsize+=Northagent.size;
  totalsize+=Eastagent.size;
  totalsize+=Southagent.size;
  totalsize+=Westagent.size;
  totalsize+=Northeastagent.size;
  totalsize+=Northwestagent.size;
  totalsize+=Southeastagent.size;
  totalsize+=Southwestagent.size;
  agent.size=totalsize/8;
  agents[x][y]=agent;
}

class Agent{
  float size = 0;
  float tran = 0;
  
}