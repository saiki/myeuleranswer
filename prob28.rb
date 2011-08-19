#!/usr/bin/env ruby

def fn(n)
    return n*n + (n*n - (n -1)) + (n*n - (n - 1) * 2) + (n*n - (n - 1) * 3)
end

sum = 1

for n in 2..1001
    next if n % 2 == 0
    sum += fn(n)
end

p sum
