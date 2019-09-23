class Agent{
  Agent(PVector inPos, PVector inSpeed, float inRange){
    pos = inPos;
    speed = inSpeed;
    range = inRange;
    //speedRad = inSpeedRad;
   // speedMag = inSpeedMag;
  }
  
  Agent(Agent agent){
    pos = agent.pos;
    speed = agent.speed;
    range = agent.range;
    //speedRad = agent.speedRad;
    //speedMag = agent.speedMag;
  }
  PVector pos;
  PVector speed;
  //float speedRad;
  //float speedMag;
  float range;
}