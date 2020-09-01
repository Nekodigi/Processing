int binom(int n, int k)  
{ 
  // Base Cases 
  if (k == 0 || k == n) 
      return 1; 
    
  // Recur 
  return binom(n - 1, k - 1) + binom(n - 1, k); 
} 
