#!/usr/bin/ruby

def palindromic?(num, base)
	v = num.to_s(base).split('')
	for i in 0..((v.length-1)/2)
		if v[i] != v[(v.length-1)-i]
			return false
		end
	end
	return true
end

ans = 0
for i in 1..1_000_000
	if palindromic?(i, 10) and palindromic?(i, 2)
		ans += i
	end
end

p ans
