# Blocks are written between braces.
[1,2,3,4].each {|x| puts x}

def method
	puts "Comienza"
	yield  # Executes a block passed to the mehtod.
	yield
	puts "final"
end

method {puts "Ejecutando bloque"}

def method2
	yield('hola', 100) # Block with arguments.
end

method2 {|cadena, numero| puts cadena + ' ' + numero.to_s}

# Pasar un proc a un método
sum = Proc.new do |x, y|
	puts "Sum of #{x} + #{y} = #{x + y}"
end
sum.call(1,2)


def sum
	yield(2, 3)
end
sum {|m, n| puts n + m}


# A method can return a proc.
def build_proc(proc1, proc2)
	Proc.new do |x|
		proc2.call(proc1.call(x))
	end
end

cuadrado = Proc.new do |x|
	x * x
end

# This syntax makes the same thing.
doble = Proc.new {|x| x + x}

doble_cuadrado = build_proc(doble, cuadrado)
cuadrado_doble = build_proc(cuadrado, doble)

puts doble_cuadrado.call(5)
puts cuadrado_doble.call(5)