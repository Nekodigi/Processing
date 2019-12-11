
int pCount = 0;
String lines[];
float datas[][] = new float[1000000][3];
void setup(){
  fullScreen(P3D);
  lines = loadStrings("result.txt")[0].split(",");
  pCount = lines.length;
  print(pCount);
  for(int i = 0; i < lines.length; i++){
    String[] subLines = lines[i].split(" ");
    for(int j = 0; j < 3; j++){
      datas[i][j] = float(subLines[j]);
    }
  }
  
}

void draw(){
  ortho();
  background(0);
  noStroke();
  translate(width/2, height/2);
  pushMatrix();
  for(int i = 0; i < pCount; i++){
    popMatrix();
    pushMatrix();
    rotateX((float)mouseY/200);
    rotateY((float)mouseX/200);
    //rotateZ(frameCount*0.002);
    translate(datas[i][0]*500, datas[i][1]*500, datas[i][2]*500);
    box(5, 5, 5);
  }
  popMatrix();
}