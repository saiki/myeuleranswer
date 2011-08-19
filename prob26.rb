#!/usr/bin/ruby

def prob26(num)
  val = 1
  ans = Array.new
  mod = Array.new
  while (true)
    ans << (val / num)
    if val / num < 1
      val = val * 10
    else
      val = (val % num) * 10
    end
    if mod.index(val) != nil
      mod << val
      break
    end
    mod << val
  end
  return mod.rindex(val) - mod.index(val)
end


max = 0
ans = 0
for i in 2..1000
  tmp = prob26(i)
  if max < tmp
    max = tmp
    ans = i
  end
  # printf("i=%d max=%d\n", i, max)
end

p ans

