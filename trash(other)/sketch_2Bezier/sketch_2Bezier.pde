float p_x;
float p_y;
float p0_x = 0;
float p0_y = 0;
float p1_x = 100;
float p1_y = 100;
float p2_x = 100;
float p2_y = 200;
void setup(){
  size(500, 500);
  background(0);
  strokeWeight(2);
  stroke(255);
  for(float t = 0;t <= 1; t = t + 0.01){
    p_x = (1-t)*(1-t)*p0_x + 2*(1-t)*t*p1_x + t*t*p2_x;
    p_y = (1-t)*(1-t)*p0_y + 2*(1-t)*t*p1_y + t*t*p2_y;
    point(p_x, p_y);
  }
}