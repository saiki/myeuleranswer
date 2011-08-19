#!/usr/bin/ruby

def fact(n)
  return n > 1 ? n * fact(n-1) : 1
end

items = "0123456789".split('').sort
ans = Array.new

cur_val = 0
while items.length > 0
  for i in 1..items.length
    if cur_val + fact(items.length-1)*i >= 1000000
      cur_val += fact(items.length-1)*(i-1)
      ans << items[i-1]
      items.delete_at(i-1)
      break
    end
  end
end

p ans.to_s
