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

def getprob26max(cnt)
  max = 0
  for i in 2..cnt
    tmp = prob26(i)
    max = (max >= tmp) ? max : tmp
    # printf("i=%d max=%d\n", i, max)
  end
  return max
end

if ARGV[0] == "max"
  p getprob26max(ARGV[1].to_i)
else
  p prob26(ARGV[0].to_i)
end
