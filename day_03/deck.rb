def sacar_carta
	palos = %w[ corazones treboles picas diamantes ]
	numeros = %w[ A 2 3 4 5 6 7 8 9 10 J Q K ]

	palo = rand(palos.length)
	num = rand(numeros.length)

	puts "#{numeros[num]} de #{palos[palo]}"
end

10.times do
	sacar_carta
end