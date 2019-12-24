int blobCount = 10;
float metaRange = 100;
ArrayList<Point> points = new ArrayList<Point>();
int sampling = 8;
void setup(){
 fullScreen(P2D);
 for(int i = 0; i < blobCount; i++){
    points.add(new Point(new PVector(random(0,width), random(0,height)), random(50, 150)));
 }
}

void draw(){
  background(255);
  noStroke();
  for (int y = 0; y < height; y+=sampling){
    for (int x = 0; x < width; x+=sampling){
      float totaldist = 0;
      for (Point p : points){
        totaldist += metaRange * p.r / dist(p.pos.x, p.pos.y, x, y);
      }
      int index = x + y*width;
      if(totaldist < 255){
        fill(0);
      }
      else{
        fill(255);
      }
      fill(pow(10, totaldist/100));
      rect(x, y, sampling, sampling);
    }
  }
  fill(255);
  for (Point p : points){
    p.update();
  }
  
}

void mousePressed(){
  points.add(new Point(new PVector(mouseX, mouseY), random(50, 150)));
}