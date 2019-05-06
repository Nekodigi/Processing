int Value = 10;
float Data[][] = new float[Value+10000][6];
int add;
int savemousePoint[] = new int[2];
void setup(){
  fullScreen();
  background(0);
  for(int i = 0;i < Value;i++){
    Data[i][0] = random(0,width);
    Data[i][1] = random(0,height-100);
    Data[i][2] = random(10,150);
    Data[i][3] = random(100,255);
  }
}

void draw(){
  background(0);
  noStroke();
  for(int i = 0;i < Value;i++){
    fill(255,255,255,Data[i][3]);
    ellipse(Data[i][0],Data[i][1],Data[i][2],Data[i][2]);
    Data[i][4] += 0.1;
    Data[i][1] += Data[i][4];
    if(Data[i][1]+Data[i][2]/2 >= height){
      Data[i][4] = -abs(Data[i][4]/1.2-0.15);
    }
  }
  if (add > 0){
    ellipse(savemousePoint[0],savemousePoint[1],add,add);
    add -= 5;
  }
}

void mousePressed(){
  add = 100;
  savemousePoint[0] = mouseX;
  savemousePoint[1] = mouseY;
  Data[Value][0] = savemousePoint[0];
  Data[Value][1] = savemousePoint[1];
  Data[Value][2] = random(10,150);
  Data[Value][3] = random(100,255);
  Value++;
}