# An iterator is a method which receives a block
# which is executed for each element of the object.

arr = [1,2,3,4,5]
arr.each {|x| puts x*x}

# Ranges also have iterators.
('a'..'e').each do |var|
	puts "Letra #{var}"
end

"Word a".each_byte do |b|
	puts "Byte #{b}, using chr mehtod #{b.chr}"
end
p "Wor".split

while true
	print "Tell me a phrase to count its 'a's: "
	word = gets.chomp.downcase.split("")
	if word.count == 0
		break
	end
	l = 0
	word.each do |b|
		l += b == "a" ? 1 : 0
	end
	puts "It has #{l} 'a's"
end