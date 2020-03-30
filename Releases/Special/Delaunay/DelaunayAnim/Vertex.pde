class Vertex{
  int dim;
  int id;
  int tag;
  float[] pos;
  float[] posT;
  
  Vertex(int id, float ... pos){
    dim = pos.length;
    this.pos = pos;
    this.id = id;
  }
  
  void posBlend(float fac){
    pos = posT.clone();
    pos[dim] = EaseInOutCubic(0, pos[dim], abs(fac%2 - 1));
  }
}