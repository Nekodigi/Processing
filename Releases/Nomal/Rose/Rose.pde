float n = 3.0/4.0; // Vertex number
float d = 1; // skip point
float radius = 500;

void setup(){
  colorMode(HSB, 360, 100, 100, 100);
  fullScreen();
  
}

void draw(){
  background(360);
  //n+=0.003;
  if(mousePressed){
    n = (float)mouseX/1000;
    d = (float)mouseY/100;
  }
  beginShape();
  for(float i = 0; i < TWO_PI*10; i+= (TWO_PI / 360)){
    float k = i * d;
    float x = cos(n*k)*cos(k)*radius;
    float y = cos(n*k)*sin(k)*radius;
    vertex(x+width/2, y+height/2);
  }
  endShape();
}

void keyPressed(){
  n=0;
}