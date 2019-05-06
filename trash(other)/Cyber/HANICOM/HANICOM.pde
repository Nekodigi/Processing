int ofset;
void setup(){
  fullScreen();
  background(0);
  strokeCap(0);
}
  
void draw(){
  background(0);
  for(int a = 0;a < 1200;a += 200){
    for(int i = 0;i < 2000;i +=350){
    Hexagon(i+ofset,a,6,100);
    }
    ofset += 175;
    for(int i = 0;i < 20002;i +=350){
    Hexagon(i+ofset,a + 100,6,100);
    }
    ofset -= 175;
  }
}
void Hexagon (float DrawStartX, float DrawStartY, int num,float Dia){
  pushMatrix();
  translate(DrawStartX, DrawStartY);
  strokeWeight(20);
  fill(0,255,0,100);
  beginShape();
  for(int i = 0; i < num; i++){
    float x = Dia * cos(radians(360/num * i));
    float y = Dia * sin(radians(360/num * i)); 
    vertex(x, y);
  }
  endShape(CLOSE);
  
  popMatrix();
}