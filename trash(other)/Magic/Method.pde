void setupGrid(){
  for(int y = 0; y < (int)(height/interval)+2; y++){
    for(int x = 0; x < (int)(width/interval)+2; x++){
      Section section = new Section();
      section.a = 0;
      section.b = 0;
      section.c = 0;
      sections[x][y] = section;
    }
  }
}

void drawGrid(){
  colorMode(RGB, 360, 360, 360, 100);
  noStroke();
  for(int y = 1; y < (int)(height/interval)+1; y++){
    for(int x = 1; x < (int)(width/interval)+1; x++){
      if(frameCount%1==0){
      spread(x, y);
      }
      Section section = sections[x][y];
      if(section.spawnerAmount>0){
        section.a+=360;
        section.spawnerAmount--;
      }
      if(section.c < 360){
        section.c+=2;
      }
      float atob = 0;
      if(section.a > section.c){
        atob = section.c/100; 
      }
      else{
        atob = section.a/100;
      }
      section.a -= atob;
      section.c -= atob;
      section.b += atob;
      section.b*=0.995;
      section.d*=1.005+1;
      float btoa = 0;
      if(section.b > section.d){
        btoa = section.d/100; 
      }
      else{
        btoa = section.b/100;
      }
      section.b -= btoa;
      section.d -= btoa;
      section.a += btoa;
      
      fill(section.a, section.b, section.c);
      rect(x*interval-interval, y*interval-interval, interval, interval);
    }
  }
}

void spread(int x, int y){
  Section section = sections[x][y];
  Section nsection = sections[x][y+1];
  Section ssection = sections[x][y-1];
  Section esection = sections[x+1][y];
  Section wsection = sections[x-1][y];
  Section nesection = sections[x+1][y+1];
  Section nwsection = sections[x-1][y+1];
  Section sesection = sections[x+1][y-1];
  Section swsection = sections[x-1][y-1];
  float totala = 0;
  totala += nsection.a;
  totala += ssection.a;
  totala += esection.a;
  totala += wsection.a;
  totala += nesection.a;
  totala += nwsection.a;
  totala += sesection.a;
  totala += swsection.a;
  section.a = totala/8;
  float totalb = 0;
  totalb += nsection.b;
  totalb += ssection.b;
  totalb += esection.b;
  totalb += wsection.b;
  totalb += nesection.b;
  totalb += nwsection.b;
  totalb += sesection.b;
  totalb += swsection.b;
  section.b = totalb/8;
  float totalc = 0;
  totalc += nsection.c;
  totalc += ssection.c;
  totalc += esection.c;
  totalc += wsection.c;
  totalc += nesection.c;
  totalc += nwsection.c;
  totalc += sesection.c;
  totalc += swsection.c;
  section.c = totalc/8;
}