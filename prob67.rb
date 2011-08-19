#!/usr/bin/ruby

def max(current, piramid)
	val = Array.new
	if piramid.length <= 1
		for i in 0..(current.length-1)
			val.push(current[i] + piramid[0][0])
		end
		return val
	end
	tmp = max(piramid.pop, piramid)
	tmp.unshift(0).push(0)
	for i in 0..(current.length-1)
		val << ((current[i] + tmp[i] > current[i] + tmp[i+1]) ? current[i] + tmp[i] : current[i] + tmp[i+1])
	end
	return val
end

ans = 0
max = 0
piramid = Array.new

open("prob67.txt").each {|line|
	piramid << line.split.map {|str| str.to_i}
}

ans = max(piramid.pop, piramid).sort.pop
print ans
print "\n"
