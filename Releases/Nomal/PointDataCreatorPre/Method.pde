void addPoint(){
  PVector mousePos = new PVector(mouseX, mouseY);
  float moveAmountMag = (mousePos.x-previousPos.x)*(mousePos.x-previousPos.x)+(mousePos.y-previousPos.y)*(mousePos.y-previousPos.y);
  if(moveAmountMag > 1000){
    previousPos = mousePos;
    Point point = new Point();
    point.pos = mousePos;
    point.enable = mousePressed;
    points.add(point);
  }
}

void drawPoint(){
  for(Point point : points){
    if(point.enable){
      fill(0);
    }else{
      fill(360);
    }
    ellipse(point.pos.x, point.pos.y, 10, 10);
  }
}