MAX = 28123

class Prob23

  MAX = 28123

  @seed = 1..MAX

  def initialize
  end

  def divisors(num)
    divisors = Array.new
    for i in 1..(num/2+1)
      divisors << i if num % i == 0
    end
    return divisors
  end

  def sum(list)
    sum = 0
    list.map{|v|
      sum += v
    }
    return sum
  end

  def abundantNum(num)
    return 1 if num == 2
    abundantNum = 0
    for i in 1..(num/2+1)
      abundantNum += i if num % i == 0
    end
    return abundantNum
  end

  def isAbundant?(num)
    return num < abundantNum(num)
  end

  def main
    start = Time.new
    print start, "\n"
    @abundants = []
    for i in 1..MAX
      next if !isAbundant?(i)
      @abundants << i
    end
    print "abundants is solved.(", Time.new - start, ")\n"
    @sumofabundants = []
    @abundants.each{|i|
      @abundants.each{|j|
        @sumofabundants << i+j if i+j < MAX and @sumofabundants.index(i+j) == nil
      }
      @abundants.pop
    }
    print "sumofabundants is solved.(", Time.new - start, ")\n"
    sum = 0
    for i in 1..MAX
      sum += i if @sumofabundants.index(i) == nil
    end
    print sum
    print Time.new - start
  end
end

main = Prob23.new
main.main
