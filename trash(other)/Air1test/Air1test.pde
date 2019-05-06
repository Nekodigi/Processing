int decimation = 50;
int airwid;
int airhei;
int drawmode;
float rotX;

float[][] wavehei;
float[][] wavetran;
float[][] newWavehei;
float[][] newWavetran;

void setup(){
  fullScreen(P3D);
  frameRate(600);
  airwid=width/decimation;
  airhei=height/decimation;
  wavehei = new float[airwid][airhei];
  wavetran = new float[airwid][airhei];
  newWavehei = new float[airwid][airhei];
  newWavetran = new float[airwid][airhei];
  for(int x = 0; x < airwid; x++){
    for(int y = 0; y < airhei; y++){
      //vector airvec = airvecs[x][y];
      wavehei[x][y] = 0;
      wavetran[x][y] = 0;
      newWavehei[x][y] = 0;
      newWavetran[x][y] = 0;
    }
  }
}
void mousePressed(){
  if(mouseButton == RIGHT){
    drawmode++;
  }
}

void keyPressed(){
  rotateY(rotX);
  if(keyCode == UP){
    rotX+=0.1;
  }
  if(keyCode == DOWN){
    rotX-=0.1;
  }
}

void draw(){
  println(rotX);
  background(200);
  if(mousePressed){
  spoint();
  }
  translate(0, 1000, -1000);
  rotateX(rotX);
  box(150, 150, 150);
  for(int x = 1; x < airwid-1; x++){
    for(int y = 1; y < airhei-1; y++){
      //vector airvec = airvecs[x][y];
      float force = 0;
      force += wavehei[x+1][y]-wavehei[x][y];
      force += wavehei[x-1][y]-wavehei[x][y];
      force += wavehei[x][y+1]-wavehei[x][y];
      force += wavehei[x][y-1]-wavehei[x][y];
      force += wavehei[x+1][y+1]-wavehei[x][y];
      force += wavehei[x+1][y-1]-wavehei[x][y];
      force += wavehei[x-1][y+1]-wavehei[x][y];
      force += wavehei[x-1][y-1]-wavehei[x][y];
      force -= wavehei[x][y+1]/8;
      stroke(0);
      switch(drawmode){
        case 0:
          line(x*decimation, y*decimation, wavehei[x][y], (x+1)*decimation, y*decimation, wavehei[x+1][y]);
          line(x*decimation, y*decimation, wavehei[x][y], x*decimation, (y+1)*decimation, wavehei[x][y+1]);
          break;
        case 1:
          ellipse(x*decimation, y*decimation, wavehei[x][y]+10, wavehei[x][y]+10);
          break;
        case 2:
          line(x*decimation, y*decimation, wavehei[x][y], (x+1)*decimation, y*decimation, wavehei[x+1][y]);
          line(x*decimation, y*decimation, wavehei[x][y], x*decimation, (y+1)*decimation, wavehei[x][y+1]);
          ellipse(x*decimation, y*decimation, wavehei[x][y]+10, wavehei[x][y]+10);
          break;
        default:
          drawmode=0;
          
      }
      noStroke();
      fill(0);
      newWavetran[x][y] = wavetran[x][y]*0.95+force/100;
      wavetran[x][y] = newWavetran[x][y];
      newWavehei[x][y] = wavehei[x][y]+newWavetran[x][y];
      wavehei[x][y] = newWavehei[x][y];
    }
  }
}

void spoint(){
  int mposX = mouseX/decimation;
  int mposY = mouseY/decimation;
  if(mposX>0 && mposX<airwid-1 && mposY>0 && mposY<airhei-1){
    wavehei[mposX][mposY] = 40;
    wavehei[mposX+1][mposY] = 20;
    wavehei[mposX-1][mposY] = 20;
    wavehei[mposX][mposY+1] = 20;
    wavehei[mposX][mposY-1] = 20;
    wavehei[mposX+1][mposY+1] = 10;
    wavehei[mposX+1][mposY-1] = 10;
    wavehei[mposX-1][mposY+1] = 10;
    wavehei[mposX-1][mposY-1] = 10;
    wavetran[mposX][mposY] = 40;
    wavetran[mposX+1][mposY] = 40;
    wavetran[mposX-1][mposY] = 40;
    wavetran[mposX][mposY+1] = 40;
    wavetran[mposX][mposY-1] = 40;
    wavetran[mposX+1][mposY+1] = 40;
    wavetran[mposX+1][mposY-1] = 40;
    wavetran[mposX-1][mposY+1] = 40;
    wavetran[mposX-1][mposY-1] = 40;
  }
}