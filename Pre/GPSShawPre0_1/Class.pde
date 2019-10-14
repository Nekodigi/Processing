
class GPSData{
  GPSData(String[] str){
    x = float(str[0]);
    y = float(str[1]);
    h = float(str[2]);
    time = str[3];
  }
  float x;
  float y;
  float h;
  String time;
}