phrase = nil
while phrase.nil? || phrase != ""
	print "Write a phrase to tell whether it is a palindrome (empty to exit): "
	phrase = gets.chomp

	wospaces = phrase.split.join.downcase

	puts "The prase \"#{phrase}\" is #{wospaces == wospaces.reverse ? '' : 'NOT'} a palindrome."
	puts
end