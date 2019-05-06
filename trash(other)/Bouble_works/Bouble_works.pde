import generativedesign.*;

float groundInterval = 50;
float[] ground;
PImage boubleI;
PImage grassI;
float gravity = 0.1;
ArrayList<Bouble> boubles = new ArrayList<Bouble>();
PVector oldMouse;

void setup(){
  fullScreen(P3D);
  ground = new float[(int)(width/groundInterval)+1];
  colorMode(HSB, 360, 100, 100);
  oldMouse=new PVector();
  boubleI = loadImage("ca177c09eb82f45c6d42ce00c2f48450.png");
  grassI = loadImage("grass_PNG4922.png");
}

void draw(){
  background(360);
  if(mousePressed){
  mousePressing();
  }
  oldMouse = new PVector(mouseX,mouseY);
  boubleDraw();
  for(int x = 0; x < (int)(width/groundInterval); x++){
    float groundData = ground[x];
    imageMode(CENTER);
    image(grassI, x*groundInterval, height-groundData/2, groundData, groundData);
  }
}

void mousePressing(){
  for(int i = 0; i < 1; i++){
    Bouble bouble = new Bouble();
    bouble.x = mouseX;
    bouble.y = mouseY;
    float angle = random(0, PI*2);
    float pow = random(3, 10);
    bouble.speed.x=sin(angle)*pow+(mouseX-oldMouse.x);
    bouble.speed.y=cos(angle)*pow+(mouseY-oldMouse.y);
    bouble.size = random(10, 50);
    boubles.add(bouble);
  }
}

void boubleDraw(){
  ArrayList<Bouble>nboubles = new ArrayList<Bouble>();
  for(Bouble bouble: boubles){
    bouble.speed.y += gravity;
    bouble.x += bouble.speed.x;
    bouble.y += bouble.speed.y;
    if(bouble.y > height-100 && bouble.x > 0 && bouble.x < width){
      ground[(int)(bouble.x/groundInterval)]+=10;
    }
    else if(bouble.y < height){
      nboubles.add(bouble);
    }
    image(boubleI, bouble.x, bouble.y, bouble.size, bouble.size);
    boubles = nboubles;
  }
}

void mousePressed(){
  for(int i = 0; i < 100; i++){
    Bouble bouble = new Bouble();
    bouble.x = mouseX;
    bouble.y = mouseY;
    float angle = random(0, PI*2);
    float pow = random(3, 10);
    bouble.speed.x=sin(angle)*pow;
    bouble.speed.y=cos(angle)*pow;
    bouble.size = random(10, 50);
    boubles.add(bouble);
  }
}