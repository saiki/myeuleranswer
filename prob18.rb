#!/usr/bin/env ruby

ans = 0
max = 0
piramid = Array.new

open("prob67.txt").each {|line|
  piramid << line.split.map {|str| str.to_i}
}
piramid.reverse!
p piramid
piramid.each {|v|
	
}
