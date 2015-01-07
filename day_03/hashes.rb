paises = Hash.new

paises['México'] = ['DF', 'Guadalajara', 'Querétaro']
paises['Argentina'] = ['Buenos Aires']
paises['Uruguay'] = ['Montevideo']

p paises
puts paises['México']

frutas = {
	'rojas' => ['Manzana', 'Fresa'],
	'amarillas' => ['Plátano', 'Melón', 'Mango'],
	'moradas' => ['Mora'],
}
p frutas

for f, j in frutas

	j.each	do |fr|
		puts "#{fr} es #{f}"
	end

	# Otra forma de escribir lo anterior.
	j.each { |fr| puts "La/El #{fr} es #{f}" }
end

# También se puede usar.
frutas.each	do |k, v|
	puts "#{k} #{v}"
end


puts
puts "=== Symbols ==="

nums = {:uno => 1, :dos => 2, :tres => 3}
puts nums[:uno]
puts :uno.object_id
puts "uno".object_id  # Strings have different IDs each time we use themm, even de same.
puts "uno".object_id
puts :uno.object_id

