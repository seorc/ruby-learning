print "Write me a number: "
num = gets.chomp.to_i

a, prime = num - 1, true
while a > 1
	if num % a == 0
		prime = false
		break
	end
	a -= 1
end

puts "#{num} is#{prime ? '' : ' NOT'} prime"