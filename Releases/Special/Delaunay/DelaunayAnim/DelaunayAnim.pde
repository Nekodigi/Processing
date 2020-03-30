//based on this code https://github.com/Scrawk/Hull-Delaunay-Voronoi

boolean mode3D = true;

ExampleDelaunay delaunay2D = new ExampleDelaunay(2);

void setup(){
  //fullScreen(P3D);
  size(500, 500, P3D);
  //ortho();
}

void keyPressed(){
  if(key == 'r'){
    delaunay2D = new ExampleDelaunay(2);
  }
  if(key == 'm'){
    mode3D = !mode3D;
  }
}

void draw(){
  lights();
  background(200);
  translate(width/2, height/4*3);
  if(mode3D){
    rotateX(HALF_PI);
    //rotateX(float(frameCount)/1000);
    rotateZ(float(frameCount)/100);
    //rotateZ(float(frameCount)/500);
    delaunay2D.show();
  }else{
  }
}