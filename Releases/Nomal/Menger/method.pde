//Method
void sponge_init(float off, float size){
  Bsponge = new ArrayList<Box>();
  Tsponge = new ArrayList<Tetra>();
  Osponge = new ArrayList<Octa>();
  Box b = new Box(new PVector(-off,0,0), size);
  Bsponge.add(b);
  Tetra t = new Tetra(new PVector(0,0,0), size);
  Tsponge.add(t);
  Octa o = new Octa(new PVector(off,0,0), size);
  Osponge.add(o);
}

void div_sponge(){
  ArrayList<Tetra> Tnext = new ArrayList<Tetra>();
  for (Tetra t : Tsponge){
    ArrayList<Tetra> nextBoxes = t.generate();
    Tnext.addAll(nextBoxes);
  }
  Tsponge = Tnext;
  ArrayList<Box> Bnext = new ArrayList<Box>();
  for (Box b : Bsponge){
    ArrayList<Box> nextBoxes = b.generate();
    Bnext.addAll(nextBoxes);
  }
  Bsponge = Bnext;
  ArrayList<Octa> Onext = new ArrayList<Octa>();
  for (Octa o : Osponge){
    ArrayList<Octa> nextBoxes = o.generate();
    Onext.addAll(nextBoxes);
  }
  Osponge = Onext;
}

void show_sponge(){
  for (Tetra t : Tsponge){
    if(dispType==1 || dispType==3){
      t.show();
    }
  }
  for (Box b : Bsponge){
    if(dispType==0 || dispType==3){
      b.show();
    }
  }
  for (Octa o : Osponge){
    if(dispType==2 || dispType==3){
      o.show();
    }
  }
}

void multiRot(){
  if(userRot){
    rotateX((float)mouseY/1000);
    rotateY((float)mouseX/1000);
  }
  else{
    if(dispType == 3){
      rotateX(angle);
    }
    else{
    rotateX(angle);
    rotateY(angle*0.4);
    rotateZ(angle*0.1);
    }
  }
}