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
		# Determine which operation to use to determine the angle acording
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
		"#{@vector_lenght.round(PRECISION)} ∠ #{@angle.round(DEGREES_PRECISION)}°"
	end

	def exponential
		"#{@vector_lenght.round(PRECISION)}e ^ #{@radians.round(PRECISION)}i"
	end

	def to_s
		"#{@real}#{@imaginary >= 0 ? ' + ' : ' - '}#{@imaginary.abs	}i" \
		"\n >> Polar: #{polar}" \
		"\n >> Exp: #{exponential}"
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
	
	res = []
	complex.each do |x|
		if !x.is_f?
			next
		end
		res.push(x.to_f)
	end

	if res.length != 2
		puts "The number must have a real and imaginary part"
		next
	end

	c = Complexx.new *res
	puts c
end

