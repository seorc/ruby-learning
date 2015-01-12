begin
	print "Write a number: "
	x = gets.chomp.to_i
	print "Write another number: "
	y = gets.chomp.to_i
	puts "Result: #{x/y}"
rescue ZeroDivisionError => e
	puts e.class
	puts e.message
	puts e.backtrace.inspect
	puts "The second number must not be 0."
	retry
else
	puts "Ran without errors!"
ensure
	puts "This always runs, but when we make a retry."
end

END {puts "I always run at the end"}
BEGIN {puts "I always run first"}
BEGIN {puts "I always run first BIS"}
