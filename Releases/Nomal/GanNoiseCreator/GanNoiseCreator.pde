import hypermedia.net.*;

UDP udp;

final String IP = "localhost";
final int PORT = 4000;

int input_dim = 100;
int result_dim = 28;
float B_power = 0.1;
float B_size = 100;
float input_max = 3;
float result_max = 1;

float rCellSize = 0;
float iCellSize = 0;

float[] inputs = new float[input_dim];
float[][] results = new float[result_dim][result_dim];


void setup(){
  size(2000, 2020);
  iCellSize = width / (float)input_dim;
  rCellSize = width / (float)result_dim;
  udp = new UDP( this, 4001 );
  udp.listen(true);
  colorMode(HSB, 1, 1, 1 ,1);
}

void draw(){
  String str = "";
  for(int i = 0; i < input_dim; i++){
    float negPosi = 0;
    if(mouseButton == LEFT) negPosi = 1; else if(mouseButton == RIGHT) negPosi = -1; else negPosi = 0; 
    inputs[i] = constrain(inputs[i] + constrain(1-dist(mouseX, mouseY, i*iCellSize, 0)/B_size, 0, 1)*B_power*negPosi, 0, input_max);
    fill(inputs[i]/input_max);
    rect(i*iCellSize, 0, iCellSize, iCellSize);
    str += String.valueOf(inputs[i]) + " ";
  }
  str = str.substring(0, str.length()-1);
  udp.send(str,IP,PORT);
  for(int y = 0; y < result_dim; y++){
    for(int x = 0; x < result_dim; x++){
      fill(results[x][y]/result_max);
      rect(rCellSize*x, rCellSize*y+iCellSize, rCellSize, rCellSize);
    }
  }
}

void receive( byte[] data, String ip, int port ) {
  String[] message = new String( data ).split("\n");
  for(int y = 0; y < 28; y++){
    String[] datas = message[y].split(" ");
    for(int x = 0; x < 28; x++){
      results[x][y] = Float.parseFloat(datas[x]);
    }
  }
  //println( "receive: \""+message+"\" from "+ip+" on port "+port );
}