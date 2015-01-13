pols = File.new "filesystem-tests/polinoms.csv", "w+"
res = File.new "filesystem-tests/results.csv", "w+"

10.times do
	its = Random.new.rand(1..6)
	p = []
	its.times do
		p.push(Random.new.rand(-9..9))
	end
	pols.puts(p.join ",")
end
pols.rewind

begin
	while l = pols.readline.chomp
		r, power = 0, 0
		for it in l.split ","
			r += (it.to_i ** power)
			power += 1
		end
		res.puts "#{r}"
	end
rescue EOFError
 	nil
end
res.rewind
puts res.readlines