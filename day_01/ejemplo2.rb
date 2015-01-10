a = gets
p a
p a.chomp # Remove the \n at the end
p a.to_s.chomp

b = 1
b.to_s
p b

p "100".to_i

sss = "a\n s\n"
p sss
p sss.chomp

num = gets().chomp
p num
p 4 * (num.to_i)
p sss.to_c # To complex.

print "Ingresa un numero para convertirlo en binario: "
a = gets.chomp.to_i

residuo = ""
while a > 0 do
	if a % 2 == 0
		residuo += "0"
	else
		residuo += "1"
	end

	a /= 2
end
puts "Binario: #{residuo.reverse}"