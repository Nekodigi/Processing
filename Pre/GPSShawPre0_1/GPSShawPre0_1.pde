import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.Charset;
import java.util.stream.Collectors;
import java.util.Queue;
import java.util.ArrayDeque;


float sWeight = 10;


String[] CSVs;
ArrayList<GPSData> gpsDatas = new ArrayList<GPSData>();
float xmin=1000;
float xmax=0;
float ymin=1000;
float ymax=0;
void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  try {
    CSVs = readAll(dataPath("GPSData.txt")).split("\n");
  }
  catch(IOException e) {
    print("LoadFiled");
  }
  for(String str : CSVs){
    String[] datas = str.split(",");
    if(float(datas[0]) != 0){
      gpsDatas.add(new GPSData(datas));
      if(float(datas[0]) < xmin){
        xmin = float(datas[0]);
      }
      if(float(datas[0]) > xmax){
        xmax = float(datas[0]);
      }
      if(float(datas[1]) < ymin){
        ymin = float(datas[1]);
      }
      if(float(datas[1]) > ymax){
        ymax = float(datas[1]);
      }
    }
  }
  print(xmin);
  print(xmax);
  print(ymin);
  print(ymax);
}

void draw() {
  fill(360, 100);
  rect(0, 0, width, height);
  float px = 0;
  float py = 0;
  strokeWeight(sWeight);
  for(GPSData gpsData : gpsDatas){
    float x = map(gpsData.x, xmin, xmax, 0, width);
    float y = map(gpsData.y, ymin, ymax, 0, height);
    if(px!=0){
      float dx = x-px;
      float dy = y-py;
      stroke(sqrt(dx*dx+dy*dy), 100, 100);
      line(px, py, x, y);
    }
    px = x;
    py = y;
  }

}