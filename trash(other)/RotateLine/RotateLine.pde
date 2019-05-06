float progress;

void setup(){
  fullScreen();
  for(float i = 0; i < width; i++){
    float basex = i;
    float basey = (i-width/2)/40*(i-width/2)/40+300;
    ellipse(basex, basey, 10, 10);
  }
}

void draw(){
  fill(255, 2);
  rect(0, 0, width, height);
  for(float i = 0; i < width; i++){
    float basex = i;
    float basey = (i-width/2)/40*(i-width/2)/40+300;
    ellipse(basex, basey, 10, 10);
  }
  float basex = progress;
  float basey = (progress-width/2)/40*(progress-width/2)/40+300;
  float addx = cos(progress/300)*200;
  float addy = sin(progress/300)*200;
  float addx2 = cos(progress/300+PI)*200;
  float addy2 = sin(progress/300+PI)*200;
  ellipse(basex, basey, 10, 10);
  line(basex+addx, basey+addy, basex+addx2, basey+addy2);
  progress++;
}