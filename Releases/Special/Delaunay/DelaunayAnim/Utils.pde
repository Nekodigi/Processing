import java.util.Comparator;

float[][] extractPos(Vertex ... vertices){
  float[][] result = new float[vertices.length][];
  for(int i = 0; i < vertices.length; i++){
    result[i] = vertices[i].pos;
  }
  return result;
}

ArrayList<Vertex> getNotIth(ArrayList<Vertex> vs, int i){
  ArrayList<Vertex> result = new ArrayList<Vertex>();
  for(int j = 0; j < vs.size(); j++){
    if(j == i){continue;}
    result.add(vs.get(j));
  }
  return result;
}

class VertexIdComparator implements Comparator<Vertex> {
  @Override
  public int compare(Vertex a, Vertex b) {
    return a.id - b.id;
  }
}

Simplex[] remove(Simplex[] simplexes, Simplex simplex){
  Simplex[] result = new Simplex[simplexes.length-1];
  for(int j = 0, c = 0; j < simplexes.length; j++){
    if(simplexes[j] == simplex){continue;}
    c++;
    if(c < simplexes.length - 1){
      result[c]=simplexes[j];
    }
  }
  return result;
}

float EaseInOutCubic(float start, float end, float t){
  end -= start;//calculate difference
  return t<0.5 ? end*4*t*t*t+start : end*(4*(t-1)*(t-1)*(t-1)+1)+start;
}