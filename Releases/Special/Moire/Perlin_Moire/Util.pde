color cmin(color A, color B){
  return color(min(red(A), red(B)), min(green(A), green(B)), min(blue(A), blue(B)));
}
