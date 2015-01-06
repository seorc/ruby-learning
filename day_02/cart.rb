class Articulo

	attr_reader :nombre, :precio

	def initialize(id, nombre, precio)
		@id = id
		@precio = precio
		@nombre = nombre
	end

end

class Ropa < Articulo

	attr_reader :marca, :talla

	def initialize(id, nombre, precio, marca, talla)
		super(id, nombre, precio)
		@marca = marca
		@talla = talla
	end

	def to_s
		"Ropa: #{@marca}, #{@nombre}, #{@talla}, $#{@precio}"
	end
end

class Vino < Articulo

	attr_reader :marca, :contenido

	def initialize(id, nombre, precio, marca, contenido)
		super(id, nombre, precio)
		@marca = marca
		@contenido = contenido
	end

	def to_s
		"Vino: #{@marca}, #{@nombre}, #{@contenido}, $#{@precio}"
	end
end

class Carrito
	def initialize
		@lista = []
	end

	def agreagar(item)
		@lista.push(item)
	end

	def quitar(pos)
		@lista.delete_at(pos)
	end

	def to_s
		puts "Contenido del carrito:"
		@lista.each	do |l|
			puts "#{l}"
		end
	end
end

v1 = Vino.new(1, "Gato negro", 200.0, "Royal", 700)

r1 = Ropa.new(2, "Chamarra", 500.0, "Reebook", "M")
p r1.methods

c = Carrito.new
c.agreagar(v1)
c.agreagar(r1)

puts "#{c}"
c.quitar(1)
puts "#{c}"
