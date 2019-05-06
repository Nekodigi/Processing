PImage img;
float scaleingX;
float scaleingY;
float searchIntervalX=1;
float searchIntervalY=1;
float totalSearchPointX;
float totalSearchPointY;
float[][] rangemap;
boolean[][] searchedmap;
float hueTolerance=50;
float saturationTolerance=50;
float brightnessTolerance=50;

void setup(){
  size(1280, 720);
  rangemap = new float[width][height];
  searchedmap = new boolean[width][height];
  img=loadImage("1920_1080_20091126090927427353.jpg");
  colorMode(HSB, 255);
  image(img, 0, 0, width, height);
  loadPixels();
  scaleingX = width/img.width;
  scaleingY = height/img.height;
  createMap();
}

void createMap(){
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      rangemap[x][y] = map(brightness(pixels[y*width+x]), 0, 255, 0, 10);
      //rangemap[x][y] = 15;
      /*if(searchedmap[x][y]==false){
        boolean changeing=true;
        int range=2;
        while(changeing){
          changeing=false;
          for(int i=0; i<range; i++){
            if(x+range-1<width && y+i<height){
              changeing = changeing&&samecol(x, y, x+range, y+i);
              //println(samecol(x, y, x+range-1, y+i));
            }
            if(x+i<width && y+range-1<height){
              changeing = changeing&&samecol(x, y, x+i, y+range-1);
            }
          }
          range++;
        }
        rangemap[x][y] = range-2;
      if(rangemap[x][y]>=2){
        println(rangemap[x][y]);
      }
      }
      */
    }
  }
}

boolean samecol(int pos1X, int pos1Y, int pos2X, int pos2Y){
  color col1 = pixels[pos1Y*width+pos1X];
  color col2 = pixels[pos2Y*width+pos2X];
  boolean bool = abs(hue(col1)-hue(col2))<hueTolerance/* || abs(brightness(col1)-brightness(col2))<brightnessTolerance || abs(saturation(col1)-saturation(col2))>saturationTolerance*/;
  searchedmap[pos2X][pos2Y] = !bool;
  return bool;
}

void draw(){
  background(0);
  println("printing");
  for(int y=0; y<height; y+=10){
    for(int x=0; x<width; x+=10){
      float hsbcol = hue(pixels[y*width+x]);
      float saturationcol = saturation(pixels[y*width+x]); 
      color fullcol = color(hsbcol, saturationcol, 255);
      noStroke();
      fill(fullcol);
      //ellipse(x, y, rangemap[x][y], rangemap[x][y]);
      ellipseMode(CORNERS);
      print(rangemap[x][y]);
      ellipse(x, y, x+rangemap[x][y], y+rangemap[x][y]);
    }
  }
}