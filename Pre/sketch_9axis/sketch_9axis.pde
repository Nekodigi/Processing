import hypermedia.net.*;

UDP udp;
String msg = "";

final String IP = "MainPC.local";//this PC IP
final int PORT = 5000;

void setup() {
  fullScreen(P3D);
  udp = new UDP(this, PORT);
  udp.listen( true );
}

void draw() {
  background(255);
  String[] datas = msg.split(",");
  if(datas.length == 12){
  translate(width / 2, height / 2, -20);
  fill(255);
  strokeWeight(10);
  stroke(0);
  rotateX(-float(datas[0]));
  //rotateY(float(datas[1]));
  rotateZ(float(datas[2]));
  box(50, 1000, 50);
  box(500, 500, 500);
  box(50, 50, 1000);
  }
}

void receive( byte[] data, String ip, int port ) {
  msg = new String( data );
  println(msg);
}