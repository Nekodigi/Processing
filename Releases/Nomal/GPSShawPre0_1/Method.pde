

public static String readAll(final String path) throws IOException {
  return Files.lines(Paths.get(path), Charset.forName("UTF-8"))
    .collect(Collectors.joining(System.getProperty("line.separator")));
}