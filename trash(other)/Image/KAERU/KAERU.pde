
PImage src;

void setup() {
  src = loadImage( "KAERU.jpg" );
  size( src.width, src.height );
  image( src, 0, 0 );
  noLoop();
}

void draw() {
}

void mousePressed() {
  int idx = mouseX + mouseY * src.width;
  color c = src.pixels[idx];
  println( "r = " + red( c ) + ", g = " + green( c ) + 
           ", b = " + blue( c ) );
}