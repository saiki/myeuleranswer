# -*- coding: utf-8 -*-

ans = []

# mが分子,dが分母
def isProb33?(i, j)
  m = i.to_s.split("")
  d = j.to_s.split("")
  return false if m[0].to_i == 0 || d[1].to_i == 0
  return false if m[1].to_i != d[0].to_i
  return false if i.to_f / j.to_f != m[0].to_i.to_f / d[1].to_i.to_f
  return true
end

for i in 10..99
  next if i % 10 == 0
  for j in 10..99
    next if j % 10 == 0
    next if i == j
    ans << [i, j] if isProb33?(i, j)
  end
end

ans_m = 1
ans_d = 1

p ans

ans.each{|lst|
  ans_m = ans_m * lst[0]
  ans_d = ans_d * lst[1]
}
print ans_m, " / ", ans_d, "\n"
p ans_d / ans_m.gcd(ans_d)
