public static String readAll(final String path) throws IOException {
  return Files.lines(Paths.get(path), Charset.forName("UTF-8"))
    .collect(Collectors.joining(System.getProperty("line.separator")));
}

public static long str2UTC(String str){
  SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy:M:d:h:m");
  Date date = new Date();
  try{
  date = sdFormat.parse(str);
  //println(date);
  } catch (ParseException e) {
      e.printStackTrace();
  }
  return date.getTime();
}