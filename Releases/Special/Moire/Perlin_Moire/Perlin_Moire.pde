//mesh good can deform without inverse formula,but not good when move a lot.

PGraphics base, deformed;
PImage deformedI, mixed;
MeshDeform meshDeform;
float noiseS = 300;//1000 noise scale
float noiseP = 0.03;//noise power
float stripeH = 2;//stripe height
float spaceH = 2;//stripe height
int w = 300;//1280
int h = 300;//720

void setup(){
  size(500, 500, P3D);
  //fullScreen(P3D);
  base = createGraphics(w, h);
  deformed = createGraphics(w, h, P3D);
  mixed = createImage(w, h, RGB);
  base.beginDraw();
  base.background(255);
  base.fill(0);
  base.noStroke();
  for(int y=0; y<base.height; y+=(stripeH+spaceH)){
    base.rect(0, y, base.width, stripeH);
  }
  base.endDraw();
  meshDeform = new MeshDeform(base, new PVector(0, 0), new PVector(w, h));
  base.loadPixels();
}

void keyPressed(){
  if(key == 'r'){
    meshDeform.resetCoord();
  }
}

void draw(){
  PVector[][] target = meshDeform.ctrPoss;
  for(int i=0; i<target.length; i++){
    for(int j=0; j<target[0].length; j++){
      float angle = noise(target[i][j].x/noiseS, target[i][j].y/noiseS)*TWO_PI*8;
      target[i][j].add(PVector.fromAngle(angle).mult(noiseP));
    }
  }
  meshDeform.show();
  deformed.loadPixels();
  for(int i=0; i<base.pixels.length; i++){
    mixed.pixels[i] = cmin(base.pixels[i], deformed.pixels[i]);
  }
  mixed.updatePixels();
  image(base, 0, 0, width, height);
  image(deformed, 0, 0, width, height);
  image(mixed, 0, 0, width, height);
}
