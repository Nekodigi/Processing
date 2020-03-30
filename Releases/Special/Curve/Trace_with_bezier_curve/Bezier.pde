class Bezier{
  ArrayList<PVector> poss = new ArrayList<PVector>();
  
  void show(float t){
    for(int i = 0; i < poss.size()-2; i++){
      if(i < t && t < i+1){
        PVector p = PVector.lerp(poss.get(i),poss.get(i+1),t-i);
        PVector p2 = PVector.lerp(poss.get(i+1),poss.get(i+2),t-i);
        line(p.x, p.y, p2.x, p2.y);
      }
    }
    stroke(300);
    beginShape();
    for(PVector pos : poss){
      vertex(pos.x, pos.y);
    }
    endShape();
  }
}