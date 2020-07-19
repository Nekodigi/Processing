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
    println();
    do{
      //print(n);print(" ");
      sequence.append(n);
      n = original(n);
    }while(n != 1);
    sequence.append(1);
    sequence.reverse();
    resetMatrix();
    translate(width/2, height);
    for(int j = 0; j < sequence.size(); j++){
      int value = sequence.get(j);
      if(value % 3 == 0){
        rotate(angleR);
      }else if(value % 3 == 2){
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

int original(int n){
  if(n % 3 == 0){
    return n/3;
  }else if(n % 3 == 1){
    return (4*n-1)/3;
  }else{
    return (4*n+1)/3;
  }
}
