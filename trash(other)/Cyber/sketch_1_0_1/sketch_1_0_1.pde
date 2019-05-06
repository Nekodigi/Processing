float Rote;
float Rote1;
int RoteChange1;
int DataSpace = 30;
int circuitDataSpace = 10;
float circuitData[][] = new float[circuitDataSpace][circuitDataSpace];
float Data[][] = new float[DataSpace][DataSpace];

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
  for(int i = 0; i < circuitDataSpace; i++){
      Data[i][0] = random(50,600);//PathGen
      Data[i][1] = random(50,180);//PathColor
      Data[i][2] = random(100,250);//PathLongth
      Data[i][3] = random(360);//PathRotate
      Data[i][4] = random(10,40);//PathWidth
      Data[i][5] = random(0.1,3);//PathSpeed;
  }
}

void draw(){
  background(0);
  noFill();
  for(int i = 0;i < DataSpace;i++){
  Data[i][6] += Data[i][5];
  if(Data[i][6] >= 360){
    Data[i][6] = 0;
  }
  stroke(0,255,0,Data[i][1]);
  strokeWeight(Data[i][4]);
  Rote = Data[i][6] + Data[i][3];
  Rote1 = Data[i][2] + Data[i][6] + Data[i][3];
  arc(width /2,height / 2,Data[i][0],Data[i][0], radians(Rote), radians(Rote1) );
  }
  for(int i = 0; i < 10; i++){
    
  }
  
}