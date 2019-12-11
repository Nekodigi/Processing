

void drawArm(float x, float y, boolean isX, int gen, String[] CSVs){
  float txa = Float.parseFloat(CSVs[gen])*cos(gen*PI*t/T);
  float tya = Float.parseFloat(CSVs[gen])*sin(gen*PI*t/T);
  float xa = 0;
  float ya = 0;
  if(isX){
    xa = txa;
    ya = tya;
  }
  else{
    xa = tya;
    ya = txa;
  }
  ellipse(x, y, 10, 10);
  line(x, y, x+xa*scale, y+ya*scale);
  if(gen < CSVs.length-1){
    drawArm(x+xa*scale, y+ya*scale, isX, gen+1, CSVs);
  }
}

public static String readAll(final String path) throws IOException {
  return Files.lines(Paths.get(path), Charset.forName("UTF-8"))
    .collect(Collectors.joining(System.getProperty("line.separator")));
}