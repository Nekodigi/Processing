float Rote;
float Rote1;
int RoteChange1;
int DataSpace = 30;
float Data[][] = new float[DataSpace][DataSpace];
float circuitHore = 10;
float ofset = 500 + circuitHore / 2;

void setup() {
  fullScreen();
  background(0);
  strokeCap(0);
  for(int i = 0; i < DataSpace/2; i++){
      Data[i][0] = random(50,600);//PathGen
      Data[i][1] = random(50,180);//PathColor
      Data[i][2] = random(100,250);//PathLongth
      Data[i][3] = random(360);//PathRotate
      Data[i][4] = random(10,40);//PathWidth
      Data[i][5] = random(0.1,3);//PathSpeed;
  }
  for(int i = DataSpace/2; i < DataSpace/4*3; i++){
      Data[i][0] = random(500,800);//PathGen
      Data[i][1] = random(50,100);//PathColor
      Data[i][2] = random(10,180);//PathLongth
      Data[i][3] = random(360);//PathRotate
      Data[i][4] = random(50,100);//PathWidth
      Data[i][5] = random(0.1,2);//PathSpeed;
  }
  for(int i = DataSpace/4*3; i < DataSpace; i++){
      Data[i][0] = random(800,1000);//PathGen
      Data[i][1] = random(50,180);//PathColor
      Data[i][2] = random(50,150);//PathLongth
      Data[i][3] = random(360);//PathRotate
      Data[i][4] = random(10,40);//PathWidth
      Data[i][5] = random(0.1,1);//PathSpeed;
  }
}

void draw(){
  background(0);
  noFill();
  circuitRen();
  for(int i = 0;i < DataSpace;i++){
  Data[i][6] += Data[i][5];
  if(Data[i][6] >= 360){
    Data[i][6] = 0;
  }
  stroke(0,255,0,Data[i][1]);
  strokeWeight(Data[i][4]);
  strokeCap(0);
  Rote = Data[i][6] + Data[i][3];
  Rote1 = Data[i][2] + Data[i][6] + Data[i][3];
  arc(width /2,height / 2,Data[i][0],Data[i][0], radians(Rote), radians(Rote1) );
  }
  Hexagon(width /2 + sin(radians(14*180/40))*ofset+94,height /2 + cos(radians(14*180/40))*ofset+8,6,50);
  Hexagon(width /2 + sin(radians(26*180/40))*ofset+94,height /2 + cos(radians(26*180/40))*ofset-8,6,50);
  Hexagonline(width /2 + sin(radians(26*180/40))*ofset+94,height /2 + cos(radians(26*180/40))*ofset-8,6,45,1,3);
  Hexagonline(width /2 + sin(radians(26*180/40))*ofset+94,height /2 + cos(radians(26*180/40))*ofset-8,6,45,3,5);
  Hexagonline(width /2 + sin(radians(26*180/40))*ofset+94,height /2 + cos(radians(26*180/40))*ofset-8,6,45,5,7);
  Hexagonline(width /2 + sin(radians(14*180/40))*ofset+94,height /2 + cos(radians(14*180/40))*ofset+8,6,45,0,2);
  Hexagonline(width /2 + sin(radians(14*180/40))*ofset+94,height /2 + cos(radians(14*180/40))*ofset+8,6,45,2,4);
  Hexagonline(width /2 + sin(radians(14*180/40))*ofset+94,height /2 + cos(radians(14*180/40))*ofset+8,6,45,4,6);
  line(width /2 + sin(radians(10*180/40))*ofset+150,height /2 + cos(radians(10*180/40))*ofset+150,1600,height /2 + cos(radians(10*180/40))*ofset+150);
}
void CyberPath(float Fac,float longth,String iff){
    strokeCap(ROUND);
    stroke(0,255,0,255);
    strokeWeight(circuitHore/2);
    ellipse(width /2 + sin(radians(Fac*180/40))*500,height /2 + cos(radians(Fac*180/40))*500,circuitHore,circuitHore);
    strokeWeight(circuitHore/4);
    if(iff == "up"){
    line(width /2 + sin(radians(Fac*180/40))*ofset,height /2 + cos(radians(Fac*180/40))*ofset,width /2 + sin(radians(Fac*180/40))*ofset+longth,height /2 + cos(radians(Fac*180/40))*ofset-longth);
    }
    if(iff == "center"){
    line(width /2 + sin(radians(Fac*180/40))*ofset,height /2 + cos(radians(Fac*180/40))*ofset,width /2 + sin(radians(Fac*180/40))*ofset+longth,height /2 + cos(radians(Fac*180/40))*ofset);
    }
    if(iff == "down"){
    line(width /2 + sin(radians(Fac*180/40))*ofset,height /2 + cos(radians(Fac*180/40))*ofset,width /2 + sin(radians(Fac*180/40))*ofset+longth,height /2 + cos(radians(Fac*180/40))*ofset+longth);
    }
}

void Hexagon (float DrawStartX, float DrawStartY, int num,float Dia){
  pushMatrix();
  translate(DrawStartX, DrawStartY);
  strokeWeight(circuitHore/4);
  stroke(0,255,0,255);
  beginShape();
  for(int i = 0; i < num; i++){
    float x = Dia * cos(radians(360/num * i));
    float y = Dia * sin(radians(360/num * i)); 
    vertex(x, y);
  }
  endShape(CLOSE);
  
  popMatrix();
}
void Hexagonline (float DrawStartX, float DrawStartY, int num,float Dia,int start,int end){
  pushMatrix();
  translate(DrawStartX, DrawStartY);
  strokeWeight(circuitHore/4);
  stroke(0,255,0,255);
  beginShape();
  for(int i = start; i < end; i++){
    float x = Dia * cos(radians(360/num * i));
    float y = Dia * sin(radians(360/num * i)); 
    vertex(x, y);
  }
  endShape();
  
  popMatrix();
}
void circuitRen(){
  CyberPath(10,200,"down");
  CyberPath(11,150,"down");
  CyberPath(12,100,"down");
  CyberPath(13,100,"down");
  CyberPath(14,0,"down");
  CyberPath(15,50,"center");
  CyberPath(16,100,"center");
  CyberPath(17,150-circuitHore,"center");
  CyberPath(18,200-circuitHore/2,"center");
  CyberPath(19,350,"center");
  CyberPath(20,50-circuitHore/2,"center");
  CyberPath(21,350,"center");
  CyberPath(22,200-circuitHore/2,"center");
  CyberPath(23,150-circuitHore,"center");
  CyberPath(24,100,"center");
  CyberPath(25,50,"center");
  CyberPath(26,0,"up");
  CyberPath(27,103,"up");
  CyberPath(28,100,"up");
  CyberPath(29,150,"up");
  CyberPath(30,200,"up");
  strokeCap(ROUND);
  line(width /2 + sin(radians(10*180/40))*ofset+150,height /2 + cos(radians(10*180/40))*ofset+150,1600,height /2 + cos(radians(10*180/40))*ofset+150);
  line(1600,height /2 + cos(radians(10*180/40))*ofset+150,1625,height /2 + cos(radians(10*180/40))*ofset+175);
  line(width /2 + sin(radians(10*180/40))*ofset+175,height /2 + cos(radians(10*180/40))*ofset+175,1920,height /2 + cos(radians(10*180/40))*ofset+175);
  line(width /2 + sin(radians(11*180/40))*ofset+150,height /2 + cos(radians(11*180/40))*ofset+145,1920,height /2 + cos(radians(11*180/40))*ofset+145);
  strokeWeight(circuitHore/2);
  ellipse(1650,height /2 + cos(radians(10*180/40))*ofset+150,circuitHore,circuitHore);
  strokeWeight(circuitHore/4);
  line(1650+circuitHore/2,height /2 + cos(radians(10*180/40))*ofset+150,1800-circuitHore,height /2 + cos(radians(10*180/40))*ofset+150);
  strokeWeight(circuitHore/4);
  ellipse(1800,height /2 + cos(radians(10*180/40))*ofset+150,circuitHore*2,circuitHore*2);
  strokeWeight(circuitHore/4);
  line(width /2 + sin(radians(12*180/40))*ofset+100,height /2 + cos(radians(12*180/40))*ofset+100,1600,height /2 + cos(radians(12*180/40))*ofset+100);
  line(1600,height /2 + cos(radians(12*180/40))*ofset+100,1625,height /2 + cos(radians(12*180/40))*ofset+125);
  line(1625,height /2 + cos(radians(12*180/40))*ofset+125,1800,height /2 + cos(radians(12*180/40))*ofset+125);
  line(1800,height /2 + cos(radians(12*180/40))*ofset+125,1850,height /2 + cos(radians(12*180/40))*ofset+75);
  line(1850,height /2 + cos(radians(12*180/40))*ofset+75,1920,height /2 + cos(radians(12*180/40))*ofset+75);
  strokeWeight(circuitHore/2);
  ellipse(width /2 + sin(radians(12*180/40))*ofset+125,height /2 + cos(radians(12*180/40))*ofset+125,circuitHore,circuitHore);
  strokeWeight(circuitHore/4);
  line(width /2 + sin(radians(12*180/40))*ofset+125+circuitHore/2,height /2 + cos(radians(12*180/40))*ofset+125+circuitHore/2,width /2 + sin(radians(12*180/40))*ofset+150,height /2 + cos(radians(12*180/40))*ofset+150);
  line(width /2 + sin(radians(12*180/40))*ofset+150,height /2 + cos(radians(12*180/40))*ofset+150,1920,height /2 + cos(radians(12*180/40))*ofset+150);
  line(width /2 + sin(radians(13*180/40))*ofset+100,height /2 + cos(radians(13*180/40))*ofset+95,1750-circuitHore,height /2 + cos(radians(13*180/40))*ofset+95);
  line(width /2 + sin(radians(13*180/40))*ofset+75,height /2 + cos(radians(13*180/40))*ofset+70,1600,height /2 + cos(radians(13*180/40))*ofset+70);
  strokeWeight(circuitHore/4);
  ellipse(1750,height /2 + cos(radians(13*180/40))*ofset+95,circuitHore*2,circuitHore*2);
  strokeWeight(circuitHore/4);
  line(1600,height /2 + cos(radians(13*180/40))*ofset+70,1650,height /2 + cos(radians(13*180/40))*ofset+20);
  line(1650,height /2 + cos(radians(13*180/40))*ofset+20,1920,height /2 + cos(radians(13*180/40))*ofset+20);
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  line(width /2 + sin(radians(30*180/40))*ofset+150,height /2 + cos(radians(30*180/40))*ofset-150,1600,height /2 + cos(radians(30*180/40))*ofset-150);
  line(1600,height /2 + cos(radians(30*180/40))*ofset-150,1625,height /2 + cos(radians(30*180/40))*ofset-175);
  line(width /2 + sin(radians(30*180/40))*ofset+175,height /2 + cos(radians(30*180/40))*ofset-175,1920,height /2 + cos(radians(30*180/40))*ofset-175);
  line(width /2 + sin(radians(29*180/40))*ofset+148,height /2 + cos(radians(29*180/40))*ofset-153,1920,height /2 + cos(radians(29*180/40))*ofset-153);
  strokeWeight(circuitHore/2);
  ellipse(1650,height /2 + cos(radians(30*180/40))*ofset-150,circuitHore,circuitHore);
  strokeWeight(circuitHore/4);
  line(1650+circuitHore/2,height /2 + cos(radians(30*180/40))*ofset-150,1800-circuitHore,height /2 + cos(radians(30*180/40))*ofset-150);
  strokeWeight(circuitHore/4);
  ellipse(1800,height /2 + cos(radians(30*180/40))*ofset-150,circuitHore*2,circuitHore*2);
  strokeWeight(circuitHore/4);
  line(width /2 + sin(radians(28*180/40))*ofset+100,height /2 + cos(radians(28*180/40))*ofset-100,1600,height /2 + cos(radians(28*180/40))*ofset-100);
  line(1600,height /2 + cos(radians(28*180/40))*ofset-100,1625,height /2 + cos(radians(28*180/40))*ofset-125);
  line(1625,height /2 + cos(radians(28*180/40))*ofset-125,1800,height /2 + cos(radians(28*180/40))*ofset-125);
  line(1800,height /2 + cos(radians(28*180/40))*ofset-125,1850,height /2 + cos(radians(28*180/40))*ofset-75);
  line(1850,height /2 + cos(radians(28*180/40))*ofset-75,1920,height /2 + cos(radians(28*180/40))*ofset-75);
  strokeWeight(circuitHore/2);
  ellipse(width /2 + sin(radians(28*180/40))*ofset+125,height /2 + cos(radians(28*180/40))*ofset-125,circuitHore,circuitHore);
  strokeWeight(circuitHore/4);
  line(width /2 + sin(radians(28*180/40))*ofset+125+circuitHore/2,height /2 + cos(radians(28*180/40))*ofset-125-circuitHore/2,width /2 + sin(radians(28*180/40))*ofset+150,height /2 + cos(radians(28*180/40))*ofset-150);
  line(width /2 + sin(radians(28*180/40))*ofset+150,height /2 + cos(radians(28*180/40))*ofset-150,1920,height /2 + cos(radians(28*180/40))*ofset-150);
  line(width /2 + sin(radians(27*180/40))*ofset+100,height /2 + cos(radians(27*180/40))*ofset-105,1750-circuitHore,height /2 + cos(radians(27*180/40))*ofset-105);
  line(width /2 + sin(radians(27*180/40))*ofset+75,height /2 + cos(radians(27*180/40))*ofset-80,1600,height /2 + cos(radians(27*180/40))*ofset-80);
  strokeWeight(circuitHore/4);
  ellipse(1750,height /2 + cos(radians(27*180/40))*ofset-105,circuitHore*2,circuitHore*2);
  strokeWeight(circuitHore/4);
  line(1600,height /2 + cos(radians(27*180/40))*ofset-80,1650,height /2 + cos(radians(27*180/40))*ofset-30);
  line(1650,height /2 + cos(radians(27*180/40))*ofset-30,1920,height /2 + cos(radians(27*180/40))*ofset-30);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  line(width /2 + sin(radians(21*180/40))*ofset+300,height /2 + cos(radians(21*180/40))*ofset-4,width /2 + sin(radians(21*180/40))*ofset+325,height /2 + cos(radians(21*180/40))*ofset-29);
  line(width /2 + sin(radians(21*180/40))*ofset+325,height /2 + cos(radians(21*180/40))*ofset-29,1920,height /2 + cos(radians(21*180/40))*ofset-29);
  line(width /2 + sin(radians(19*180/40))*ofset+300,height /2 + cos(radians(19*180/40))*ofset-4,width /2 + sin(radians(19*180/40))*ofset+325,height /2 + cos(radians(19*180/40))*ofset+21);
  line(width /2 + sin(radians(19*180/40))*ofset+325,height /2 + cos(radians(19*180/40))*ofset+21,1920,height /2 + cos(radians(19*180/40))*ofset+21);
  strokeWeight(circuitHore/2);
  ellipse(width /2 + sin(radians(20*180/40))*ofset+50,height /2 + cos(radians(20*180/40))*ofset,circuitHore,circuitHore);
  strokeWeight(circuitHore/4);
  line(1800+circuitHore,height /2 + cos(radians(20*180/40))*ofset,1920,height /2 + cos(radians(20*180/40))*ofset);
  ellipse(1800,height /2 + cos(radians(20*180/40))*ofset,circuitHore*2,circuitHore*2);
  strokeWeight(circuitHore/2);
  ellipse(width /2 + sin(radians(22*180/40))*ofset+200,height /2 + cos(radians(22*180/40))*ofset,circuitHore,circuitHore);
  ellipse(width /2 + sin(radians(18*180/40))*ofset+200,height /2 + cos(radians(18*180/40))*ofset,circuitHore,circuitHore);
  strokeWeight(circuitHore/4);
  line(width /2 + sin(radians(22*180/40))*ofset+200+circuitHore/2,height /2 + cos(radians(22*180/40))*ofset-circuitHore/2,width /2 + sin(radians(22*180/40))*ofset+250,height /2 + cos(radians(22*180/40))*ofset-50);
  line(width /2 + sin(radians(18*180/40))*ofset+200+circuitHore/2,height /2 + cos(radians(18*180/40))*ofset+circuitHore/2,width /2 + sin(radians(18*180/40))*ofset+250,height /2 + cos(radians(18*180/40))*ofset+50);
  line(width /2 + sin(radians(22*180/40))*ofset+250,height /2 + cos(radians(22*180/40))*ofset-50,1920,height /2 + cos(radians(22*180/40))*ofset-50);
  line(width /2 + sin(radians(18*180/40))*ofset+250,height /2 + cos(radians(18*180/40))*ofset+50,1920,height /2 + cos(radians(18*180/40))*ofset+50);
  line(width /2 + sin(radians(22*180/40))*ofset+225,height /2 + cos(radians(22*180/40))*ofset-25,1775,height /2 + cos(radians(22*180/40))*ofset-25);
  line(width /2 + sin(radians(18*180/40))*ofset+225,height /2 + cos(radians(18*180/40))*ofset+25,1775,height /2 + cos(radians(18*180/40))*ofset+25);
  line(1775,height /2 + cos(radians(22*180/40))*ofset-25,1800,height /2 + cos(radians(22*180/40))*ofset-50);
  line(1775,height /2 + cos(radians(18*180/40))*ofset+25,1800,height /2 + cos(radians(18*180/40))*ofset+50);
  strokeWeight(circuitHore/4);
  ellipse(width /2 + sin(radians(23*180/40))*ofset+150,height /2 + cos(radians(23*180/40))*ofset-4,circuitHore*2,circuitHore*2);
  ellipse(width /2 + sin(radians(17*180/40))*ofset+152,height /2 + cos(radians(17*180/40))*ofset-4,circuitHore*2,circuitHore*2);
  line(width /2 + sin(radians(24*180/40))*ofset+100,height /2 + cos(radians(24*180/40))*ofset,width /2 + sin(radians(24*180/40))*ofset+150,height /2 + cos(radians(24*180/40))*ofset-50);
  line(width /2 + sin(radians(16*180/40))*ofset+100,height /2 + cos(radians(16*180/40))*ofset,width /2 + sin(radians(16*180/40))*ofset+150,height /2 + cos(radians(16*180/40))*ofset+50);
  line(width /2 + sin(radians(24*180/40))*ofset+150,height /2 + cos(radians(24*180/40))*ofset-50,1800,height /2 + cos(radians(24*180/40))*ofset-50);
  line(width /2 + sin(radians(16*180/40))*ofset+150,height /2 + cos(radians(16*180/40))*ofset+50,1800,height /2 + cos(radians(16*180/40))*ofset+50);
  line(1800,height /2 + cos(radians(24*180/40))*ofset-50,1825,height /2 + cos(radians(24*180/40))*ofset-25);
  line(1800,height /2 + cos(radians(16*180/40))*ofset+50,1825,height /2 + cos(radians(16*180/40))*ofset+25);
  line(1825,height /2 + cos(radians(24*180/40))*ofset-25,1920,height /2 + cos(radians(24*180/40))*ofset-25);
  line(1825,height /2 + cos(radians(16*180/40))*ofset+25,1920,height /2 + cos(radians(16*180/40))*ofset+25);
}