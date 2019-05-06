Section[][] sections;
int interval = 10;
float alimit = 10;
float blimit = 0;
float climit = 0;

void setup(){
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 100);
  sections = new Section[(int)(width/interval)+2][(int)(height/interval)+2];
  setupGrid();
}

void draw(){
  fill(360, 100);
  rect(0, 0, width, height);
  if(mousePressed){
    Section section = sections[(int)(mouseX/interval)+1][(int)(mouseY/interval)+1];
    if(section.a < 360 && section.c > 0);
    section.spawnerAmount+=100;
    sections[(int)(mouseX/interval)+1][(int)(mouseY/interval)+1] = section;
  }
  drawGrid();
}