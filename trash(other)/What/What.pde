int interval = 50;
int dotsize = 5;
int vectorWidth = 2;
float viscosity = 0.99;
PVector oldMouse = new PVector();
Cell[][] cells;

void setup(){
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 100);
  cells = new Cell[(int)(width/interval)+2][(int)(height/interval)+2];
  cellReset();
}

void draw(){
  background(360);
  strokeWeight(vectorWidth);
  stroke(50);
  fill(50);
  if(mousePressed){
    Cell cell = cells[(int)((mouseX+interval/2)/interval)+1][(int)((mouseY+interval/2)/interval)+1];
    cell.vector = new PVector(-(oldMouse.x - mouseX)*10, -(oldMouse.y - mouseY)*10);
    cell.fluid = 100;
    //cell.fluid = 50;
    oldMouse.set(mouseX, mouseY);
  }
  cellUpdate();
}

void cellUpdate(){
  for(int y = 1; y < (int)(height/interval)+1; y++){
    for(int x = 1; x < (int)(width/interval)+1; x++){
      Cell cell = cells[x][y];
      rect(x*interval-cell.fluid/2-interval-dotsize/2, y*interval-cell.fluid/2-interval-dotsize/2, dotsize+cell.fluid, dotsize+cell.fluid);
      line(x*interval-interval, y*interval-interval, x*interval+cell.vector.x-interval, y*interval+cell.vector.y-interval);
      vectorMath(x, y, cell);
      if(cell.fluid<0){
        cell.fluid = 0;
      }
      if(cell.fluid>interval){
        cell.fluid = interval;
      }
      if(cell.vector.mag()<0){
        cell.vector.setMag(0);
      }
      if(cell.vector.mag()>interval){
        cell.vector.setMag(interval);
      }
      cells[x][y] = cell;
    }
  }
}

void cellReset(){
  for(int y = 0; y < (int)(height/interval)+2; y++){
    for(int x = 0; x < (int)(width/interval)+2; x++){
      Cell cell = new Cell();
      cell.vector = new PVector(0, 0);
      cell.fluid = 0;
      cells[x][y] = cell;
    }
  }
}

void vectorMath(int x, int y, Cell cell){
  Cell ncell = cells[x][y+1];
  Cell scell = cells[x][y-1];
  Cell wcell = cells[x-1][y];
  Cell ecell = cells[x+1][y];
  Cell nwcell = cells[x-1][y+1];
  Cell necell = cells[x+1][y+1];
  Cell swcell = cells[x-1][y-1];
  Cell secell = cells[x+1][y-1];
  PVector totalVector = new PVector();
  totalVector.add(ncell.vector);
  totalVector.add(scell.vector);
  totalVector.add(wcell.vector);
  totalVector.add(ecell.vector);
  totalVector.add(nwcell.vector);
  totalVector.add(necell.vector);
  totalVector.add(swcell.vector);
  totalVector.add(secell.vector);
  totalVector.div(8);
  cell.vector = totalVector;
  float totalFluid = 0;
  //totalFluid += ncell.fluid;
  totalFluid += ncell.fluid;
  totalFluid += wcell.fluid;
  //totalFluid += ecell.fluid;
  totalFluid += nwcell.fluid;
  //totalFluid += necell.fluid;
  //totalFluid += swcell.fluid;
  //totalFluid += necell.fluid;
  totalFluid += cell.fluid;
  totalFluid /= 4;
  ncell.fluid = lerp(totalFluid, ncell.fluid, viscosity);
  wcell.fluid = lerp(totalFluid, wcell.fluid, viscosity);
  nwcell.fluid = lerp(totalFluid, nwcell.fluid, viscosity);
  cell.fluid = lerp(totalFluid, cell.fluid, viscosity);
  cell.fluid -= cell.vector.y;
  if(cell.fluid > 0 && ncell.fluid > 0){
  ncell.fluid += cell.vector.y;
  }
  //cell.fluid += cell.vector.y;
  if(cell.fluid > 0 && scell.fluid > 0){
  //scell.fluid -= cell.vector.y;
  }
  cell.fluid += cell.vector.x;
  if(cell.fluid > 0 && wcell.fluid > 0){
  wcell.fluid -= cell.vector.x;
  }
  //cell.fluid -= cell.vector.x;
  if(cell.fluid > 0 && ecell.fluid > 0){
  //ecell.fluid += cell.vector.x;
  }
}

class Cell{
  PVector vector;
  float fluid;
}