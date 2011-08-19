#!/usr/bin/env ruby

def fact(n)
  sum = 1
  for v in 1..n
    sum *= v
  end
  return sum
end

p fact(9)
p fact(8)
p fact(7)

def sumOfFact(val)
    sum = 0
    tmp = val
    for i in 1..val.to_s.length
        sum += fact((tmp % 10**i) / 10**(i-1))
        tmp -= tmp % 10**i
    end
    return sum
end

sum = 0
for n in 3..fact(9)
    v = sumOfFact(n)
    sum += v if n == v
    p v if n == v
end

p sum
