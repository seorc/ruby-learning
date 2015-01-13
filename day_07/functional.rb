lam1 = lambda {puts "I'm lambda"}
lam1.call

sum = lambda {|x,y| x +  y}
puts sum.call 1, 2

multi = ->(x, y) {x * y}
puts multi.call 2, 3

puts sum.call(multi.call(4, 5), sum.call(4, 5))

division = ->(x, y=1) {x / y}
puts division.call(5)

puts division.call(5, 2.0)

lam2 = ->arg1, arg2 {puts "Args: #{arg1}, #{arg2}"}
lam2.call "abc", "def"


pos = 4


fibo = ->pos {
	if pos < 2
		return 0
	elsif pos == 2
		return 1
	else
		return (fibo.call(pos - 1) + fibo.call(pos - 2))
	end
}

puts fibo.call(10)
puts "123".split("")

sumdigits = ->num {
	if num == ""
		return 0
	else
		nums = num.split("")
		c = nums.pop
		return c.to_i + sumdigits.call(nums.join)
	end
}
puts sumdigits.call("")

sumdigits_mod = ->num {
	modof = 10
	if num == 0
		return 0
	end
	num % modof + sumdigits_mod.call(num / modof)

}

puts "% #{232%10}"
puts sumdigits_mod.call(122222)


def w
	lam = lambda {return "000"}
	lam.call
	return "1111"
end

def x
	proc = Proc.new {return "000"}
	proc.call
	return "111"
end

puts "Lambda #{w}, Proc #{x}"

class String
	def is_positive?
		/\A\d+\z/ === self
	end
end

while true
	print "Write positive number ('bye' to exit): "
	n = gets.chomp
	if n == "bye"
		break
	elsif !n.is_positive?
		next
	end
	puts "Sum is #{sumdigits.call(n)}"
end

