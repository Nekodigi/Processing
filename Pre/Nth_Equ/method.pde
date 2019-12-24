float[] solve(){
  int n = x.size();
  float[][] A = new float[n][n];
  for (int ys = 0; ys < n; ys++){
    for (int xs = 0; xs < n; xs++){
      A[xs][ys] = pow(x.get(xs), ys);
    }
  }
  //identity matrix
  float[][] Ainv = invArray(A);
  return dotArrayVec(Ainv, y);
}

float nthEquation(float xv, float[] fac){
  float result = 0;
  for(int i = 0; i < fac.length; i++){
    result += pow(xv, fac.length)*fac[i];
  }
  return result;
}


float[] dotArrayVec(float[][] a, ArrayList<Float> b){
  int n = b.size();
  float[] result = new float[n];
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      result[i] += a[i][j]*b.get(i);
    }
  }
  return result;
}

float[][] invArray(float[][] A) {
  int n = A.length;
  float[][] Ainv = new float[n][n];
  for (int xs=0; xs<n; xs++) {
    for (int ys=0; ys<n; ys++) {
      Ainv[xs][ys]=(xs==ys)?1.0:0.0;
    }
  }
  //sweep out method
  for (int i=0; i<n; i++) {
    float buf=1/A[i][i];
    for (int j=0; j<n; j++) {
      A[i][j]*=buf;
      Ainv[i][j]*=buf;
    }
    for (int j=0; j<n; j++) {
      if (i!=j) {
        buf=A[j][i];
        for (int k=0; k<n; k++) {
          A[j][k]-=A[i][k]*buf;
          Ainv[j][k]-=Ainv[i][k]*buf;
          
        }
      }
    }
  }
  for (int xs=0; xs<n; xs++) {
    for (int ys=0; ys<n; ys++) {
      println(Ainv[xs][ys]);
    }
  }
  return Ainv;
}