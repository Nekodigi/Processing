import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.Charset;
import java.util.stream.Collectors;
import java.util.Queue;
import java.util.ArrayDeque;

final float T = 1;
final float scale = 1;
final float amplitude = 2000;
final float lineWidth = 5;
final float queueSize = 10000;

float t = 0;
float ofsetX;
float ofsetY;

Queue<PVector> previousPos = new ArrayDeque();

String xCSVPath;
String yCSVPath;
String xCSV;
String[] xCSVs;
String yCSV;
String[] yCSVs;
void setup() {
  fullScreen();
  ofsetX = width/2;
  ofsetY = height/2;
  colorMode(HSB, 360, 100, 100, 100);
  xCSVPath = dataPath("x.txt");
  yCSVPath = dataPath("y.txt");
  try {
    xCSV = readAll(xCSVPath);
    xCSVs = xCSV.split("\n");
    yCSV = readAll(yCSVPath);
    yCSVs = yCSV.split("\n");
  }
  catch(IOException e) {
    print("LoalFiled");
  }
}

void draw() {
  fill(360, 100);
  rect(0, 0, width, height);
  t += 0.003;
  if(t > T){
    t = 0;
  }
  float x = 0;
  float y = 0;
  for(int i = 0; i < xCSVs.length; i++){
    x += Float.parseFloat(xCSVs[i])*cos(i*PI*t/T);
    y += Float.parseFloat(yCSVs[i])*cos(i*PI*t/T);
  }
  stroke(0);
  strokeWeight(lineWidth);
  drawArm(width/2, amplitude*scale, true, 0, xCSVs);
  drawArm(amplitude*scale, height/2, false, 0, yCSVs);
  
  
  line(width/2+x*scale, 0, width/2+x*scale, height);
  line(0, height/2+y*scale, width, height/2+y*scale);
  previousPos.add(new PVector(x, y));
  int i = 0;
  if(previousPos.size() > queueSize){
    previousPos.poll();
  }
  noStroke();
  fill(0);
  for(PVector pos : previousPos){
    ellipse(width/2+pos.x*scale, height/2+pos.y*scale, 10, 10);
    i++;
  }


}