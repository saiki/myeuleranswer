package jp.saiki.euler.problem;

import java.util.Set;
import java.util.HashSet;
import jp.saiki.euler.Problem;

public class Prob40 implements Problem {

  private final int target[] = {1, 10, 100, 1000, 10000, 100000, 1000000};

  public void calculate(String[] args) {

    int value = 1;
    int digitCounter = 1;

    Set<Integer> productTarget = new HashSet<Integer>();
    for (int i : target) {
      productTarget.add(i);
    }
    
    int answer = 1;

    while (digitCounter < 1000001) {
      String strValue = String.valueOf(value);
      String[] splitValue = strValue.split("");
      for (String v : splitValue) {
        if (v.isEmpty()) {
          continue;
        }
        if (productTarget.contains(digitCounter)) {
          answer *= Integer.parseInt(v);
        }
        digitCounter++;
      }
      value++;
    }
    System.out.printf("answer = %d\n", answer);
    return;
  }

}
