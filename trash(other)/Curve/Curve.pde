float data[][] = new float [4][2];
int linenum = 200;
float linedata[][] = new float [linenum][8];//0=Width,1=col,2=longh,3=progress
int count = 0;
float p_x;
float p_y;

void setup(){
  fullScreen();
  background(0);
  strokeWeight(2);
  stroke(255);
  frameRate(60);
  fill(0);
  for(int i = 0;i < linenum; i++){
    linedata[i][0] = random(1, 30);
    linedata[i][1] = random(0, 255);
    linedata[i][2] = random(0.01, 0.1);
    linedata[i][3] = random(0, 1);
    linedata[i][4] = random(-100, 100);
    linedata[i][5] = random(-100, 100);
    linedata[i][6] = random(0, 255);
    linedata[i][7] = random(0, 255);
  }
}
void draw(){
  background(0);
  noFill();
  for(int i = 0;i < linenum; i++){
    strokeWeight(linedata[i][0]);
    stroke(linedata[i][1], linedata[i][6], linedata[i][7]);
    strokeCap(SQUARE);
    bezier(bezierfunX(linedata[i][3])+linedata[i][4], bezierfunY(linedata[i][3])+linedata[i][5], bezierfunX(linedata[i][3]+linedata[i][2]/3)+linedata[i][4], bezierfunY(linedata[i][3]+linedata[i][2]/3)+linedata[i][5], bezierfunX(linedata[i][3]+linedata[i][2]/3*2)+linedata[i][4], bezierfunY(linedata[i][3]+linedata[i][2]/3*2)+linedata[i][5], bezierfunX(linedata[i][3]+linedata[i][2])+linedata[i][4], bezierfunY(linedata[i][3]+linedata[i][2])+linedata[i][5]);
    linedata[i][3] += 0.003;
    if(linedata[i][3] > 1){
      linedata[i][3] = 0;
    }
  }
}

void mousePressed() {
    data[count][0] = mouseX;
    data[count][1] = mouseY;
    count++;
  } 
  
float bezierfunX(float t){
    float x = (1-t)*(1-t)*(1-t)*data[0][0] + 3*(1-t)*(1-t)*t*data[1][0] + 3*(1-t)*t*t*data[2][0] + t*t*t*data[3][0];
    return x;
}

float bezierfunY(float t){
    float y = (1-t)*(1-t)*(1-t)*data[0][1] + 3*(1-t)*(1-t)*t*data[1][1] + 3*(1-t)*t*t*data[2][1] + t*t*t*data[3][1];
    return y;
}