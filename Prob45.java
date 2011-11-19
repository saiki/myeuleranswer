package jp.saiki.euler.problem;

import jp.saiki.euler.Problem;

public class Prob45 implements Problem {

  public void calculate(String[] args) {

    long answer = 0;
    for (long n = 287;;n++) {
      answer = triangle(n);
      boolean penequals = false;
      long pentagonalDigit = 0;
      for (long i = n; i > 0; i--) {
        long v = pentagonal(i);
        if (answer == v) {
          penequals = true;
          pentagonalDigit = i;
          System.out.printf("triangle equals pentagonal triangle(n = %d, value = %d), pentagonal(n = %d, value = %d)\n", n, answer, i, v);
          break;
        } else if (v < answer) {
          break;
        }
      }
      if (!penequals) {
        continue;
      }
      boolean hexequals = false;
      for (long j = pentagonalDigit; j > 0; j--) {
        long v = hexagonal(j);
        if (answer == v) {
          hexequals = true;
          break;
        } else if (v < answer) {
          break;
        }
      }
      if (hexequals) {
        System.out.printf("n = %d, answer = %d\n", n, answer);
        break;
      }
    }
    System.out.printf("answer = %d\n", answer);
    return;
  }

  private long triangle(long n) {
    return (n * n + n) / 2L;
  }

  private long pentagonal(long n) {
    return (3L * n * n - n) / 2;
  }

  private long hexagonal(long n) {
    return 2L * n * n - n;
  }



}
