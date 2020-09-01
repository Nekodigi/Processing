class SederbergFFD {//based on this site https://www.researchgate.net/publication/314261522_FREE_FORM_DEFORMATION_METHODS_-_THE_THEORY_AND_PRACTICE
  int n;//
  int m;//
  PVector[][] P;

  SederbergFFD(int n, int m, PVector tl, PVector br) {//top left, bottom right 
    this.n = n;
    this.m = m;
    P = new PVector[n+1][m+1];
    for (int j=0; j<=m; j++) {
      for (int i=0; i<=n; i++) {
        P[i][j] = new PVector(map(i, 0, n, tl.x, br.x), map(j, 0, m, tl.y, br.y));
      }
    }
  }

  PVector getPos(float u, float v) {
    PVector sum = new PVector();
    for (int j=0; j<=m; j++) {
      for (int i=0; i<=n; i++) {
        sum.add(PVector.mult(P[i][j], binom(m, j)*pow(1-v, m-j)*pow(v, j)*binom(n, i)*pow(1-u, n-i)*pow(u, i)));
      }
    }
    return sum;
  }

  void show() {
    for (int j=0; j<=m; j++) {
      for (int i=0; i<=n; i++) {
        ellipse(P[i][j].x, P[i][j].y, 10, 10);
      }
    }
  }
}
