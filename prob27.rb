# -*- coding: utf-8 -*-
def isPrime?(num)
  (2..(Math.sqrt(num).to_i)).each {|i|
    return false if num % i == 0
  }
  return true
end

def createFunc(a, b)
  return lambda {|n|
    n**2 + a * n + b
  }
end

max_count = 0
ans_a = 0
ans_b = 0

(3..999).each{|b|               # n = 0のときb>0でなければならない
  next if !isPrime?(b)          # n = 0の場合に素数にならない
  (1..b).each{|a|
    next if a % 2 == 0            # n = 1の場合に素数にならない(b+1は偶数)
    f = createFunc(a, b)
    g = createFunc(-a, b)
    max_fn = 0
    max_gn = 0
    (0..a).each{|n|
      fn = f.call(n)
      break if fn < 0 || !isPrime?(fn)
      max_fn = n
    }
    (0..a).each{|n|
      gn = g.call(n)
      break if gn < 0 || !isPrime?(gn)
      max_gn = n
    }
    if max_fn > max_gn
      if max_fn > max_count 
	max_count = max_fn
        ans_a = a
        ans_b = b
      end
    else
      if max_gn > max_count 
	max_count = max_gn
        ans_a = -a
        ans_b = b
      end
    end
  }
}

print "a = ", ans_a, " b = ", ans_b, "\n"
print "a * b = ", (ans_a * ans_b)
