def gcd(a, b)  # Greatest Common Divisor
  if a % b == 0
    return b
  else
    return gcd b, a % b
  end
end

p gcd 48, 18
p gcd 37, 15
p gcd 72, 28
p gcd 54, 24

def divide(a, b)
  c = a - b
  if c < 0
    return 0, a
  else
    q, r = divide(c, b)
    return q + 1, r
  end
end

p divide 4, 3
p divide 5, 2
p divide 8, 3
p divide 8, 2


def inverted(num)
  nums = num.to_s
  if nums.length == 1
    return nums
  else
    nums = nums.split ''
    return "#{nums.pop}#{inverted(nums.join)}".to_i
  end
end

p inverted 1234
p inverted 5678
p inverted 54323
p inverted 672691