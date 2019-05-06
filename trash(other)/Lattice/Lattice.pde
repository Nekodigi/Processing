ArrayList<PVector> poss = new ArrayList<PVector>();
PImage img;
int[] bg;
//13
//24
void setup(){
  fullScreen();
  img = loadImage("KAERU.jpg");
  PVector pos=new PVector(300, 300);
  poss.add(0,pos);
  pos=new PVector(300, 700);
  poss.add(1,pos);
  pos=new PVector(700, 300);
  poss.add(2,pos);
  pos=new PVector(700, 700);
  poss.add(3,pos);
  background(255);
  loadPixels();
  img.loadPixels();
  bg=new int[height*width];
  for(int i = 0; i < height*width; i++){
    bg[i] = pixels[i];
  }
}

void draw(){
  PVector pos = poss.get(0);
  pos.add(new PVector(10, 100));
  PVector tlpos = new PVector(poss.get(0).x, poss.get(0).y);
  PVector blpos = new PVector(poss.get(1).x, poss.get(1).y);
  PVector trpos = new PVector(poss.get(2).x, poss.get(2).y);
  PVector brpos = new PVector(poss.get(3).x, poss.get(3).y);
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x <img.width; x++){
      float ratiox = (float)x/img.width;
      float ratioy = (float)y/img.height;
      PVector guidel = tlpos.mult(1-ratioy).add(blpos.mult(ratioy));
      PVector guider = trpos.mult(1-ratioy).add(brpos.mult(ratioy));
      PVector finalPos = guidel.mult(ratiox).add(guider.mult(1-ratiox));
      print(finalPos.x, finalPos.y);
      if(finalPos.x<width && finalPos.x>0&&finalPos.y<height && finalPos.y>0){
      pixels[(int)finalPos.y*width+(int)finalPos.x] = img.pixels[y*img.width+x];
      }
      tlpos = new PVector(poss.get(0).x, poss.get(0).y);
      blpos = new PVector(poss.get(1).x, poss.get(1).y);
      trpos = new PVector(poss.get(2).x, poss.get(2).y);
      brpos = new PVector(poss.get(3).x, poss.get(3).y);
    }
  }
  updatePixels();
  fill(0);
  ellipse(tlpos.x, tlpos.y, 10, 10);
  fill(255, 0, 0);
  ellipse(trpos.x, trpos.y, 10, 10);
  fill(0, 255, 0);
  ellipse(blpos.x, blpos.y, 10, 10);
  fill(0, 0, 255);
  ellipse(brpos.x, brpos.y, 10, 10);
}

void keyPressed(){
  for(int i = 0; i < height*width; i++){
    pixels[i] = bg[i];
  }
    //background(255);
    //loadPixels();
    PVector pos=new PVector(mouseX, mouseY);
    poss.set(int(str(key)),pos);
}