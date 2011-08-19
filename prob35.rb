
$primes = Array.new
$circular = Array.new

def divisible?(num, mod)
  return (num % mod == 0) ? true : false
end

def isPrime?(num)
  return true if $primes.index(num) != nil
  for i in $primes
    break if i >= num
    if divisible?(num, i)
      return false
    end
  end
  if $primes.last != nil and $primes.last < num
    for i in ($primes.last+1)..(num-1)
      if divisible?(num, i)
        return false
      end
    end
  end
  $primes.push(num)
  $primes.sort!
  return true
end

def rotate(ls)
  ls.push(ls.shift)
end

def isCircularPrime?(num)
  return true if $circular.index(num) != nil
  ls = num.to_s.split("")
  while rotate(ls).join != num.to_s
    if !isPrime?(ls.join.to_i)
      return false
    end
  end
  $circular.push(num)
  while rotate(ls).join != num.to_s
    $circular.push(ls.join.to_i)
  end
  $circular.uniq!
  $circular.sort!
  return true
end

count = 0

for i in 2..1000000
  next if !isPrime?(i) or !isCircularPrime?(i)
  print i, "\n"
  count += 1
end

print count, "\n"
