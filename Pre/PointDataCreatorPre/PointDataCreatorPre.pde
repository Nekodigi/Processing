ArrayList<Point> points = new ArrayList<Point>();
PVector previousPos = new PVector(0, 0);

boolean drawing = false;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  
}

void draw(){
  fill(360, 100);
  rect(0, 0, width, height);
  if(drawing){
    addPoint();
  }
  drawPoint();
}

void keyPressed(){
  if(key == 'd'){
    drawing = !drawing;
  }
  if(key == 'c'){
    points = new ArrayList<Point>();
  }
  if(key == 'e'){
    String x = "";
    String y = "";
    String enable = "";
    for(Point point : points){
      x += String.valueOf(point.pos.x)+"\n";
      y += String.valueOf(point.pos.y)+"\n";
      enable += String.valueOf(point.enable)+"\n";
    }
    print(x);
  }
}