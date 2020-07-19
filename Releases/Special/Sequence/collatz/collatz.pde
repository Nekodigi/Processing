//Based on this site
//https://www.youtube.com/watch?time_continue=788&v=EYLWxwo1Ed8&feature=emb_logo

float angleL = 0.15;
float angleR = 0.15;
float thickness = 10;
float len;
int iter = 1000;

void setup(){
  //fullScreen();
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  len = height/100.0;
}

void draw(){
  angleL = map(mouseX, 0, width, 0, 0.2);
  angleR = map(mouseY, 0, height, 0, 0.2);
  background(0);
  for(int i = iter; i >= 1 ; i--){
    int n = i;
    IntList sequence = new IntList();
    do{
      sequence.append(n);
      n = collatz(n);
    }while(n != 1);
    sequence.append(1);
    sequence.reverse();
    resetMatrix();
    translate(width/2, height);
    for(int j = 0; j < sequence.size(); j++){
      int value = sequence.get(j);
      if(value % 2 == 0){
        rotate(angleR);
      }else{
        rotate(-angleL);
      }
      stroke(160+(float)i/iter*200, 100, 100);
      strokeWeight((float)(sequence.size()-j)/sequence.size()*thickness);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
}

void keyPressed(){
  if(key=='r'){
    if(iter == 1000){
      iter = 10000;
    }else{
      iter = 1000;
    }
  }
}

int collatz(int n){
  if(n % 2 == 0){
    return n/2;
  }else{
    return (3*n+1)/2;
  }
}
