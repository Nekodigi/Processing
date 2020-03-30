class Simplex{
  int dim;
  // The simplexs adjacent to this simplex
  // For 2D a simplex will be a segment and it with have two adjacent segments joining it.
  // For 3D a simplex will be a triangle and it with have three adjacent triangles joining it.
  Simplex[] adjacent;
  // The vertices that make up the simplex.
  // For 2D a face will be 2 vertices making a line.
  // For 3D a face will be 3 vertices making a triangle.
  Vertex[] vertices;
  ArrayList<Vertex> beyondVertices;//vertices that positive side this face (same side as normal)
  Vertex furthestVertex;
  float maxDist;
  // The simplexs normal.
  float[] normal;
  boolean isNormalFlipped;
  // The simplexs centroid.
  float[] centroid;
  // The simplexs offset from the origin.
  float offset;
  int tag;
  
  Simplex(int dim){
    if(dim < 2 || dim > 4){ throw new IllegalArgumentException("Invalid number of dimension for Simplex:"+dim);}
    this.dim = dim;
    adjacent = new Simplex[dim];
    normal = new float[dim];
    centroid = new float[dim];
    vertices = new Vertex[dim];
  }
  
  void calcCentroid(){
    centroid = avg(extractPos(vertices));
  }
  
  void setAllVerticesTag(int tag){
    for(int i = 0; i < dim; i++){
      vertices[i].tag = tag;
    }
  }
  
  void clearBeyond(){
    beyondVertices = new ArrayList<Vertex>();
    maxDist = Float.NEGATIVE_INFINITY;
    furthestVertex = null;
  }
  
  void Itriangle(int a, int b, int c){
    triangle(vertices[a].pos, vertices[b].pos, vertices[c].pos);
  }
  
  void show(){
    switch(vertices.length){
      case 2:
        line(vertices[0].pos, vertices[1].pos);
        break;
      case 3:
        Itriangle(0, 1, 2);
        break;
      case 4:
        Itriangle(0, 1, 2);
        Itriangle(1, 2, 3);
        Itriangle(2, 3, 0);
        Itriangle(3, 0, 1);
        break;
    }
  }
  
}