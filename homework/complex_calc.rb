# -*- encoding: utf-8 -*-
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
		/\A[-+]?\d+(.\d*)?\z/ === self
	end
end

class Complexx

	attr_reader :real, :imaginary

	PRECISION = 2
	DEGREES_PRECISION = 2

	def rad_to_deg(radians)
		(radians / Math::PI) * 180
	end

	def initialize(r, i)
		@real = r
		@imaginary = i

		# Derivated values
		in_ri = in_ri_plane_radians_proc
		@radians = in_ri.call Math.atan(@imaginary.abs / @real.abs)
		@angle = (rad_to_deg @radians)
		@vector_lenght = Math.sqrt(@real ** 2 + @imaginary ** 2)
	end

	def in_ri_plane_radians_proc
		# Determine which operation to use to determine the radians acording
		# to this number's parts taken as coordinates on a plane.
		case
		when @real < 0 && @imaginary >= 0  # 2nd cuadrant.
			return Proc.new { |r| Math::PI - r }
		when @real < 0 && @imaginary < 0  # 3rd cuadrant.
			return Proc.new { |r| Math::PI + r }
		when @real >= 0 && @imaginary < 0 # 4th cuadrant.
			return Proc.new { |r| 2 * Math::PI - r }
		else  # 1st cuadrant.
			return Proc.new { |r| r }
		end
	end

	def polar
		"  >>Pol #{@vector_lenght.round(PRECISION)} ∠ #{@angle.round(DEGREES_PRECISION)}°"
	end

	def exponential
		"  >>Exp #{@vector_lenght.round(PRECISION)}e ^ #{@radians.round(PRECISION)}i"
	end

	def rectangular
		"  >>Rec #{@real}#{@imaginary >= 0 ? ' + ' : ' - '}#{@imaginary.abs	}i"
	end

	def to_s
		"#{rectangular}" \
		"\n#{polar}" \
		"\n#{exponential}"
	end

	def +(b)
		if b.class == self.class
			return self.class.new(self.real + b.real, self.imaginary + b.imaginary)
		end
		raise "Wrong object type"
	end

	def -(b)
		if b.class == self.class
			return self.class.new(self.real - b.real, self.imaginary - b.imaginary)
		end
		raise "Wrong object type"
	end

	def /(b)
		if b.class == self.class
			conjugate = self.class.new(b.real, -1 * b.imaginary)  # Conjutate of b.
			numerator = self * conjugate
			denominator = b * conjugate
			res = self.class.new(
				numerator.real / denominator.real,
				numerator.imaginary / denominator.real)
			return res
		end
		raise "Wrong object type"
	end

	def *(b)
		if b.class == self.class
			return self.class.new(
				(self.real * b.real) - (self.imaginary * b.imaginary),
				(self.real * b.imaginary) + (self.imaginary * b.real))
		end
		raise "Wrong object type"
	end
end

def prompt(msg)
	print "#{msg} (? for help)> "
	r = gets.chomp
	if r == "bye"
		puts "See ya!"
		exit
	elsif r == "?"
		show_help
		return ""
	end
	r
end

def show_help
	puts
	puts "\tEnter a comma-separated complex number, like so:"
	puts
	puts "\t  2,-3.2\tThis one represents 2 - 3.2i"
	puts
	puts "\tYou can also perform operations with complex numbers by entering a symbol:"
	puts
	puts "\t  +, -, *, /\tSum, substract, multyply, divide"
	puts "\t  r, p, e\tShow the entered number in rectangular, polar or exponential form"
	puts
	puts "\tSpaces are ignored in your expresion."
	puts
	puts "\tWrite 'bye' to exit."
	puts
end

b_operations = {
	"+" => lambda { |a, b| return a + b },
	"-" => lambda { |a, b| return a - b },
	"*" => lambda { |a, b| return a * b },
	"/" => lambda { |a, b| return a / b },
	
}

u_operations = {
	"r" => lambda { |a| a.rectangular },
	"p" => lambda { |a| a.polar },
	"e" => lambda { |a| a.exponential },
}

operations = b_operations.merge u_operations

current = nil
operation = nil

while true
	complex = prompt "Complex calc#{operation.nil? ? "" : " [#{operation[1]}]"}"
	complex = complex.split.join ""

	if complex == ""
		next
	end

	if operations.keys.include? complex
		if current.nil?
			puts "You must have entered a number to perform some operations"
			next
		end
		operation = operations[complex], complex
		if u_operations.include? complex
			puts "#{operation[0].call current}"
			operation = nil
		end
		next
	end

	op = complex.split

	complex = complex.split(",")
	
	res = []
	complex.each do |x|
		if !x.is_f?
			next
		end
		res.push(x.to_f)
	end

	if res.length != 2
		puts "Write a complex number"
		next
	end

	previous = current
	current = Complexx.new *res
	if !operation.nil? && b_operations.include?(operation[1])
		current = operation[0].call previous, current
		puts current.rectangular
		operation = nil
	else
		puts current.rectangular
	end
end

