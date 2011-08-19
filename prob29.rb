#!/usr/bin/ruby

def prob29(from, to)
	ret = Array.new
	for a in from..to
		for b in from..to
			ret << a ** b
		end
	end
	return ret.uniq.sort
end

p prob29(2, 100).length
