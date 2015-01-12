def method
	begin
		raise Exception.new "My error"
	rescue Exception => e
		puts "An excpetion was raised: #{e}"	
	end
end

method

errors = 0
begin
	puts "Trying something"
	raise "The errorsrror"
rescue  => e
	errors += 1
	puts "Error rescued (#{errors} times): #{e}"
	retry if errors < 3
end

begin
	print "Divide integer a... $ "
	a = gets.chomp.to_i
	print "...by integer b $ "
	b = gets.chomp.to_i
	puts "The integer division result is #{a/b}"
rescue ZeroDivisionError => e
	puts "Pop! Division by 0"
end