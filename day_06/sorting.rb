paises = {:Mexico => "DF", :Argentina => "Buenos Aires", :Alemania => "Berlin", :Canada => "Ottawa"}
p paises
p paises.sort_by {|k,v| k}
p paises.sort_by {|k,v| v}

while true
	print "Write some text: "
	phrase = gets.chomp.downcase.split
	if phrase.length == 0
		break
	end

	di = {}
	phrase.each do |p|
		if !di.keys.include? p
			di[p] = 0
		end
		di[p] += 1
	end

	puts "Results:"
	di = di.sort_by {|k,v| v}
	di.each {|k,v| puts " '#{k}' is contained #{v} times."}
end