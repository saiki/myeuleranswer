seed = [1,2,3,4,5,6,7,8,9]

ans = []

def pushAnswer(lst, ans)
  for i in 2..lst.length-1
    left = lst.slice(0, i)
    right = lst.slice(i, lst.length)
    for j in 1..left.length-1
      x = left.slice(0, j)
      y = left.slice(j, left.length)
      if x.join.to_i * y.join.to_i == right.join.to_i
        if ans.include?(right.join.to_i)
          return
        else
          ans << right.join.to_i
          return
        end
      end
    end
  end
end

start = Time.new

seed.permutation(9).each{|lst|
  pushAnswer(lst, ans)
}
sum = 0
ans.map {|n| sum += n}
p sum
p "time: ", Time.new - start

