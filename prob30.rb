#!/usr/bin/ruby

def prob30?(num, base)
	ar = num.to_s.split('')
	ans = 0
	for v in ar
		if ans > num
			return false
		end
		ans += v.to_i**base
	end
	return num == ans
end

ans = 0
for i in 2..236196
	ans += i if prob30?(i, 5)
end

p ans
