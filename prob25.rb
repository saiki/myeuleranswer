#!/usr/bin/env ruby

n = 1
m = 1
tmp = 0
ans = 2

while (n.to_s.length < 1000)
    t = n
    n = n + m
    m = t
    ans += 1
end

p n
p ans
