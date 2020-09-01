class MeshDeform{
  PVector[][] ctrPoss;
  PVector[][] ctrUV;
  PImage img;
  PVector tl, br;
  
  MeshDeform(PImage img, PVector tl, PVector br){//top left, bottom right
    this.img = img;
    this.tl = tl;
    this.br = br;
    resetCoord();
  }
  
  void resetCoord(){
    ctrPoss = new PVector[img.width][img.height];
    ctrUV = new PVector[img.width][img.height];
    for(int i=0; i<img.width; i++){
      for(int j=0; j<img.height; j++){
        float x = map(i, 0, img.width-1, tl.x, br.x);
        float y = map(j, 0, img.height-1, tl.y, br.y);
        float u = map(i, 0, img.width-1, 0, 1);
        float v = map(j, 0, img.height-1, 0, 1);
        ctrPoss[i][j] = new PVector(x, y);
        ctrUV[i][j] = new PVector(u, v);
      }
    }
  }
  
  void show(){
    deformed.noStroke();
    deformed.beginDraw();
    deformed.textureMode(NORMAL);
    for(int i=0; i<ctrPoss.length-1; i++){
      deformed.beginShape(TRIANGLE_STRIP);
      deformed.texture(img);
      for(int j=0; j<ctrPoss[0].length; j++){
        deformed.vertex(ctrPoss[i][j].x, ctrPoss[i][j].y, ctrUV[i][j].x, ctrUV[i][j].y);
        deformed.vertex(ctrPoss[i+1][j].x, ctrPoss[i+1][j].y, ctrUV[i+1][j].x, ctrUV[i+1][j].y);
      }
      deformed.endShape();
    }
    deformed.endDraw();
  }
}
