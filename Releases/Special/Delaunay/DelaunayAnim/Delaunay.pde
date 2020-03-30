class Delaunay{
  int dim;
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  ArrayList<Simplex> simplexes = new ArrayList<Simplex>();
  float[] centroid;
  ConvexHull hull;//3D convex hull shadow is 2D delaunay triangulation
  
  Delaunay(int dim){
    this.dim = dim;
    hull = new ConvexHull(dim + 1);
  }
  
  void Generate(ArrayList<Vertex> input){
    vertices = input;
    clear();
    if(input.size() <= dim + 1) return;
    
    for(int i = 0; i < input.size(); i++){
      float lenSq = sqrMag(input.get(i).pos);
      
      input.get(i).pos = append(input.get(i).pos, lenSq);
    }
    
    hull.Generate(input);//input reference are kept
    centroid = hull.centroid;
    
    for(int i = 0; i < input.size(); i++){
      input.get(i).posT = input.get(i).pos;
      input.get(i).posT[dim] = input.get(i).posT[dim]/300;
    }
    
    for(int i = 0; i < hull.simplexes.size(); i++){
      Simplex simplex = hull.simplexes.get(i);
      if(simplex.normal[dim] >= 0){//delete simplex reference
        for(int j = 0; j < simplex.adjacent.length; j++){
          if(simplex.adjacent[j] != null){
            simplex.adjacent = remove(simplex.adjacent, simplex);
          }
        }
      }else{//select valid face
        simplexes.add(simplex);
      }
    }
  }
  
  void clear(){
    
  }
  
}