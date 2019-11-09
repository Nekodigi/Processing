import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.Charset;
import java.util.stream.Collectors;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

String CSVs[];
ArrayList<Float> press = new ArrayList<Float>();
ArrayList<Float> temps = new ArrayList<Float>();
ArrayList<Float> hums = new ArrayList<Float>();
ArrayList<Long> times = new ArrayList<Long>();
float minPres = Float.POSITIVE_INFINITY;
float maxPres = Float.NEGATIVE_INFINITY;
float minTemp = Float.POSITIVE_INFINITY;
float maxTemp = Float.NEGATIVE_INFINITY;
float minHum = Float.POSITIVE_INFINITY;
float maxHum = Float.NEGATIVE_INFINITY;
long minTime = 9223372036854775807L;
long maxTime = -9223372036854775808L;

void setup(){
  colorMode(RGB, 255, 255, 255, 100);
  fullScreen(P2D);
  try{
    CSVs = readAll(dataPath("WeatherData.txt")).split("\n");
  }
  catch(IOException e) {
    print("LoadFiled");
  }
  for(String CSV : CSVs){
    String[] datas = CSV.split(",");
    long dataTime = Long.valueOf(int(float(datas[4])));
    if(dataTime != 0 && float(datas[0]) != 0){
    press.add(float(datas[0]));
    temps.add(float(datas[1]));
    hums.add(float(datas[2]));
    //if(float(datas[4])==0){println(datas[4]);}
    //long dataTime = str2UTC(datas[3]);
    times.add(dataTime);
    minPres = min(float(datas[0]), minPres);
    maxPres = max(float(datas[0]), maxPres);
    minTemp = min(float(datas[1]), minTemp);
    maxTemp = max(float(datas[1]), maxTemp);
    minHum = min(float(datas[2]), minHum);
    maxHum = max(float(datas[2]), maxHum);
    minTime = Math.min(dataTime, minTime);
    maxTime = Math.max(dataTime, maxTime);
    }
  }
}

void draw(){
  //println(minTime);
  //println(maxTime);
  
  background(255);
  noFill();
  
  strokeWeight(10000);
  beginShape();
  for(int i = 0; i < times.size(); i++){
    stroke(map(temps.get(i), minTemp, maxTemp, 0, 255), map(press.get(i), minPres, maxPres, 0, 255), map(hums.get(i), minHum, maxHum, 0, 255));
    vertex(map(i, 0, times.size(), 0, width), height/2);
  }
  endShape();
  strokeWeight(10);
  beginShape();
  stroke(0, 255, 0);
  for(int i = 0; i < press.size(); i++){
    vertex(map(times.get(i), minTime, maxTime, 0, width), map(press.get(i), minPres, maxPres, height, 0));
    //ellipse(map(times.get(i), minTime, maxTime, 0, width), map(press.get(i), minPres, maxPres, 0, height), 10, 10);
  }
  endShape();
  beginShape();
  stroke(255, 0, 0);
  for(int i = 0; i < press.size(); i++){
    vertex(map(times.get(i), minTime, maxTime, 0, width), map(temps.get(i), minTemp, maxTemp, height, 0));
    //ellipse(map(times.get(i), minTime, maxTime, 0, width), map(press.get(i), minPres, maxPres, 0, height), 10, 10);
  }
  endShape();
  beginShape();
  stroke(0, 0, 255);
  for(int i = 0; i < press.size(); i++){
    vertex(map(times.get(i), minTime, maxTime, 0, width), map(hums.get(i), minHum, maxHum, height, 0));
    //ellipse(map(times.get(i), minTime, maxTime, 0, width), map(press.get(i), minPres, maxPres, 0, height), 10, 10);
  }
  endShape();
}