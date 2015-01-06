class A
	def initialize()
		puts "Hello, I've just been created."
	end
end

a = A.new


class Person

	# Class variables: they belong to the class, not the instances.
	# This atributes are shared between all instances of the class.
	@@num = 0

	# These are called accessors
	attr_reader :name
	attr_writer :name
	attr_accessor :age # Implies read & write.

	def initialize(name, age)
		# Instance variables: used to refer to this class objects' properties.
		# Each instance has access only to its instance vars.
		@name = name
		@age = age
		@@num += 1
	end

	def say_hi
		puts "hi"
	end

	def count
		@@num
	end
end

p = Person.new("Daniel", 31)
p.say_hi

puts p.name
p.name = "Daniel A"  # It's possible thanks to the attr_writer accessor.
puts p.name

p.age -= 1  # We can modify this var since whe have an attr_accessor for it.
puts p.age

# The class can be modified dinamically.
class Person

	def say_bye
		puts "Goodbye"
	end

	# You can even override existing methods.
	def say_hi
		puts "Hello"
	end
end

p.say_hi
p.say_bye
puts p.age

p1 = Person.new("Mica", 3)

puts p1.count


# Mixins.

class B

	# Private and protected methos work like in java: the former aren't

	def m1
		puts "Method 1"
		m2
		#m3
		puts "==="
	end

	private	def m2
		puts "Method 2"
	end

	protected def m3
		puts "Method 3"
	end

	def m4
		puts "Method 4"
	end

	# In a signle line, the modifier affects al subsecuent methos.
	private

	def mp1
	end

	def mp2
	end

end

bb = B.new
bb.m1
#bb.m2  # Cannot be accessed.
#bb.m3  # Cannot be accessed.


class C < B

end

cc = C.new
cc.m1
#cc.m2
#cc.m3
cc.m4


class Poligono
	def initialize(lados, longitud)
		if !@name
			@name = ""
		end
		@lados = lados
		@longitud = longitud
		puts "#{@name} created"
	end

	def perimetro
		return @lados * @longitud
	end
end

class Hexagono < Poligono
	def initialize(longitud, apotema)
		@name = "Hexagono"
		@apotema = apotema
		super(6, longitud)
	end

	def area
		slef.perimetro * @apotema / 2
	end
end

hx = Hexagono.new(4, 3)
puts "Permietro #{hx.perimetro}"
puts "Area #{hx.area}"
