=begin

This program must calculate:

- sum
- extraction
- multiplication
- division
- polar
- exp

=end

class String
	def is_f?
		/\A[-+]?\d+(.\d)?\z/ === self
	end
end

class Complexx
	def rad_to_deg(radians)
		(radians / Math::PI) * 180
	end

	def initialize(r, i)
		@real = r
		@imaginary = i
		@angle = rad_to_deg Math.atan(@imaginary.abs / @real.abs)
	end

	def polar
		"#{@angle}"
	end

	def exponential
	end

	def to_s
		"#{@real}#{@imaginary >= 0 ? '+' : ''}#{@imaginary}i, Polar: #{@angle}"
	end
end

def prompt(msg)
	print "#{msg} ('bye' to exit): "
	r = gets.chomp
	if r == "bye"
		puts "See ya!"
		exit
	end
	r
end

while true
	complex = prompt "Write a complex number in the form 'r,i'"
	complex = complex.split(",")
	if complex.length != 2
		puts "The number must have a real and imaginary part"
		next
	end
	res = []
	complex.each do |x|
		if !x.is_f?
			puts "Elements entered must be floats"
			next
		end
		res.push(x.to_f)
	end
	c = Complexx.new *res
	puts c
end

