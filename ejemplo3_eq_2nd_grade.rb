print "What is a? "
a = gets.chomp.to_i

print "What is b? "
b = gets.chomp.to_i

print "What is c? "
c = gets.chomp.to_i

puts "So #{a}x^2 + #{b}x + #{c} = 0, isn't it?"

if a == 0
	puts "a must be different from zero"
end	
		

x1 = (-b + ((b**2 - (4 * a * c))**(1.0/2))) / 2*a
x2 = (-b - ((b**2 - (4 * a * c))**(1.0/2))) / 2*a

puts "Te values of x are: #{x1}, #{x2}"