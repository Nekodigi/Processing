import hypermedia.net.*;

UDP udp;

final String IP = "localhost";
final int PORT = 4000;


int grid_h = 32;
int grid_w = 32;

float[][] inputs = new float[grid_w][grid_h];
float[][][] results = new float[grid_w][grid_h][3];


void setup(){
  udp = new UDP( this, 4001 );
  udp.listen(true);
  size(2000, 1000);
  colorMode(RGB, 1, 1, 1 ,1);
}

void draw(){
  float grid_size_x = width / (float)grid_w / 2;
  float grid_size_y = height / (float)grid_h;
  String msg = "";
  noStroke();
  for(int y = 0; y < grid_h; y++){
    for(int x = 0; x < grid_w; x++){
      float px = x*grid_size_x;
      float py = y*grid_size_y;
      if(mousePressed){
        float distance = dist(px, py, mouseX, mouseY);
        inputs[x][y] = max(inputs[x][y], constrain((1-distance/30), 0, 1)*random(0, 1));
        //inputs[x][y] = constrain(inputs[x][y], 0, 1);
      }
      fill(inputs[x][y]);
      rect(x*grid_size_x , y*grid_size_y, grid_size_x, grid_size_y);
      fill(results[x][y][0], results[x][y][1], results[x][y][2]);
      rect(x*grid_size_x+width/2 , y*grid_size_y, grid_size_x, grid_size_y);
      msg += String.valueOf(inputs[x][y])+" ";
    }
    msg = msg.substring(0, msg.length()-1);
    msg += "\n";
  }
  msg = msg.substring(0, msg.length()-1);
  udp.send(msg,IP,PORT);
}

void keyPressed(){
  if(key=='r'){
    for(int y = 0; y < grid_h; y++){
      for(int x = 0; x < grid_w; x++){
        inputs[x][y] = 0;
      }
    }
  }
}

void receive( byte[] data, String ip, int port ) {
  String[] message = new String( data ).split("\n");
  for(int y = 0; y < grid_h; y++){
    String[] datas = message[y].split(" ");
    for(int x = 0; x < grid_w; x++){
      String[] subDatas = datas[x].split("/");
      for(int z = 0; z < 3; z++){
        results[y][x][z] = Float.parseFloat(subDatas[z]);
      }
    }
  }
  //println( "receive: \""+message+"\" from "+ip+" on port "+port );
}