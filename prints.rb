puts "Hello world" # Adds a line break at the end.
print "hello" # Doesn't add a line break at the end.
p "Yay" # It prints the object as is.

puts 1+10

puts 45.class # To know an object's type.
puts "string".class

puts 1_000_000 # This notation can be used to make it clearer.
puts 0b1111_1111 # A binary.
puts 0377 # Octal notation.
puts 0xFF # Hexadecimal.

puts 2+3
puts 2-3
puts 2*3
puts 2/3
puts 2.0/3
puts 5%2
puts 1.5%0.2
puts 2**3 # Two power 3.
puts 16**(1.0/2)


puts 1.5%0.2 == 0.1 # Not equal! Take care with rationals.
puts 1.4-1.3 == 0.1 # Not equal!

puts 3.23e10 # Scientific notation.

puts "hola"
puts 'adios' # The single language takes the raw string.
puts `ls` # Run a system command.
puts # Alone, puts writhes just a \n.

puts "la suma de 2 + 3 es #{2+3}" # This is called interpollation.
puts 'la suma de 2 + 3 es #{2+3}' # This is NOT interpollation.

puts "A string is concatenated" + " like this"

# Using vars
a = 34
puts "This is a: #{a}"

a = "Thirty four"
puts "Now this is #{a}"

b = 4
puts b += 1 # You can't use b++
puts b -= 1 # NOr b--

x,y = 1,2 # Parallel asignation. You can even return values from methods in this way.
puts "x: #{x}, y: #{y}"
x,y = y,x # To invert two vars' values.

z = 1,2,4
p z # It is an array!

a,b,c = [1, "two", true]
puts "a: #{a}, b: #{b}, c: #{c}"
a,b,c = 1, "two", true  # This makes the same thing.

x,y,z = 1,2,3
puts "x: #{x}, y: #{y}, z: #{z}"
x,y = 1,2,3 # The 3 is discarded.
puts "x: #{x}, y: #{y}, z: #{z}"
x,y,z = 1,2 # z is assinged a nil.
puts "x: #{x}, y: #{y}, z: #{z}"

PI = 3.14159 # A constant.
puts PI
PI = 3.1416 # It is interpreted, but throws a warning.
puts PI


verdadero = true
falso = false
nulo = nil # Represents value absense. It is evaluated as false.

puts verdadero.class
puts falso.class
puts nulo.class

puts 5 > 4
puts 6 < 4
puts "6 es menor que 2? #{6 < 2}"
puts "2 es mayor o igual que 1? #{2 >= 1}"

puts 6 <=> 2
puts 2 <=> 6
puts 3 <=> 3

puts "Hola" == "hola"
puts "Hola" != "hola"

puts true && true
puts (true and false)
puts (true and not false)
puts (true and not true)

puts !true

list = []
p list
list = [1,2,3,"a", [10, 20], false]
p list

p list[1]
p list[-1]
p list[-3]

empty_list = Array.new()
p empty_list

other_list = Array.new(4) # Full of nils.
p other_list

init_list = Array.new(4, 0) # Full of zeroes.
p init_list

copied_list = Array.new(init_list)
p copied_list

iterated_list = Array.new(5){|x| x+1}
p iterated_list

p iterated_list.size
p iterated_list[-iterated_list.size]

c = [1,2,3] + ["cuatro"]
p c

c += [5, "seis"]
p c

c = c + [10] # YOu cannot append like this: c + 10
p c

l = []
p l
l << 1
p l
l << 2
p l

a = [2, 3, 4, 5, 6, -1, -2]
a.each do |num|
	puts num
end

puts "a contents"
puts a.length
puts a.first
puts a.last
puts a.delete(1)

p a
p a.sort
p a
p a.sort! # Sort and keep changes
p a

paises = %w(Mexico Brasil Colombia)
p paises