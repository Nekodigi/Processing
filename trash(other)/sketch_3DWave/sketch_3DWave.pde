int cols, rows;
int scl = 20;
float ymov;
float[][] terrain;
int drawmode;

void setup(){
  fullScreen(P3D);
  cols = width/scl;
  rows = height/scl;
  terrain = new float[cols][rows];
}

void mousePressed(){
  drawmode++;
}

void draw(){
  background(200);
  ymov+=0.1;
  float yoff = ymov;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff+=0.1;
    }
    yoff+=0.1;
  }
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-width/2, -height/2);
  for(int y = 0; y < rows-1; y++){
    switch(drawmode){
      case 0:
        fill(255);
        stroke(0);
        beginShape(TRIANGLE_STRIP);
        for(int x = 0; x < cols; x++){
          vertex(x*scl, y*scl, terrain[x][y]);
          vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
        }
        endShape();
        break;
      case 1:
        for(int x = 0; x < cols; x++){
          fill(255);
          noStroke();
          ellipse(x*scl, y*scl, terrain[x][y], terrain[x][y]);
        }
        break;
      case 2:
        for(int x = 0; x < cols; x++){
          noStroke();
          if(terrain[x][y]>0){
            fill(255);
          }
          else{
            fill(0);
          }
          ellipse(x*scl, y*scl, 10, 10);
        }
        break;
      default:
        drawmode=0;
        break;
    }
  }
  yoff+=0.01;
}