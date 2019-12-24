ArrayList<Float> x = new ArrayList<Float>();
ArrayList<Float> y = new ArrayList<Float>();

void setup(){
  fullScreen();
  background(255);
  for(int i = 0; i < x.size(); i++){
    ellipse(x.get(i), y.get(i), 10, 10);
  }
  x.add(-100.001);
  y.add(100.001);
  x.add(0.001);
  y.add(0.001);
  x.add(100.001);
  y.add(100.001);
  float[] ans = solve();
  for(int i = 0; i < ans.length; i++){
    println(ans[i]);
  }
  for(int xv = 0; xv < width; xv++){
    ellipse(xv, nthEquation(xv, ans), 10, 10);
  }
}

void mousePressed(){
  background(255);
  x.add((float)mouseX);
  y.add((float)mouseY);
  
  for(int i = 0; i < x.size(); i++){
    ellipse(x.get(i), y.get(i), 10, 10);
  }
  float[] ans = solve();
  for(int i = 0; i < ans.length; i++){
    println(ans[i]);
  }
  for(int xv = 0; xv < width; xv++){
    ellipse(xv, nthEquation(xv, ans), 10, 10);
    
  }
}

void draw(){
  
}