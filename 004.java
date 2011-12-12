class euler004 {
  static final int MIN=100, MAX=999;

  static boolean isPalindromic(Integer n) {
    String ns = n.toString();
    return ns.equals(new StringBuffer(ns).reverse().toString());
  }

  public static void main(String[] args) {
    int best = 0;
    for (int i = MIN; i <= MAX; i++) {
      for (int j = i; j <= MAX; j++) {
        int p = i*j;
        if (p > best && isPalindromic(p))
          best = p;
      }
    }

    System.out.println(best);
  }
}
