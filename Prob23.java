import java.util.List;
import java.util.ArrayList;

class Prob23 {
    
    private List<Integer> abundants = new ArrayList<Integer>();

    public static final int MAX = 28123;

    public Prob23() {
	
    }

    private int sum(List<Integer> lst) {
	int sum = 0;
	for (Integer i : lst) {
	    sum += i;
	}
	return sum;
    }
    
    private List<Integer> devisors(int num) {
	List<Integer> divisors = new ArrayList<Integer>();
	for (int i = 1; i < (num/2+1); i++) {
	    divisors.add(i);
	}
	return divisors;
    }

    private int abundantNum(int num) {
	if (num == 2) {
	    return 1;
	}
	int sum = 0;
	for (int i = 1; i < (num/2+1); i++) {
	    if (num % i == 0) {
		sum += i;
	    }
	}
	return sum;
    }
    
    private boolean isAbundant(int num) {
	return num < abundantNum(num);
    }

    public int answer() {
	List<Integer> abundants = new ArrayList<Integer>();
	for (int i = 1; i < MAX; i++) {
	    if (!isAbundant(i)) {
		continue;
	    }
	    abundants.add(i);
	}
	System.out.println(abundants.size());
	List<Integer> sumofabundants = new ArrayList<Integer>();
	for (int i : abundants) {
	    for (int j : abundants) {
		if ((i+j) < MAX && !sumofabundants.contains(i+j)) {
		    sumofabundants.add(i+j);
		}
	    }
	    sumofabundants.remove(i);
	}
	System.out.println(sumofabundants.size());
	int sum = 0;
	for (int i = 1; i < MAX; i++) {
	    if (!sumofabundants.contains(i)) {
		sum += i;
	    }
	}
	return sum;
    }

    public static void main(String[] args) {
	Prob23 p = new Prob23();
	System.out.println(p.answer());
    }
}

