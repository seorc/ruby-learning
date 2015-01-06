letra = "c"

if letra == "a"
	x = 1
elsif letra == "b"
	x = 2
elsif letra == "c"
	x = 3
else
	x = 4
end
x = if letra == "a" then 1
	elsif letra == "b" then 2
	elsif letra == "c" then 3
	else 4
	end

puts x

a = nil
puts a if a

a = 5
puts a if a


# Case

x = 2
case x
when 1
	puts "uno"
when 2
	puts "dos"
end

num = case x
when 1 then "uno"
when 2 then "dos"
end

puts "Equis es #{num}"

case x + 30
when 1..10
	puts "Number is between 1 and 10"
when 11..20
	puts "Number is between 11 and 20"
else
	puts "Number is greater than 20"
end


# unless

x = 10
unless x > -1
	puts "#{x} is a negative number"
else
	puts "#{x} is a positive number"
end


# Ternary operator

puts x > 0 ? "x is greater than 0" : "x is less than 0"


# while
a = 0
while a < 10
	puts a
	a += 2
end


# until
	
b = 10
until b < 1
	puts b
	b -= 1
end


# Ranges

b = (1..5).to_a  # Inclusive range. to_a means "to array"
p b

b = (1...5).to_a # Exclusive range.
p b

range = -5..10
puts range.include?(7)
puts range.include?(20)
puts range.min
puts range.max

puts (1...15) === 13  # Another way to test if an element is in a range.
puts (1...3) === 3
puts ("a".."d") === "a"  # Ranges can also be alphabetic.
puts ("a".."d") === "e"


# times

5.times do |x|
	print x, " "
end

puts
for i in 0...10 do
	print i, " "
end
p i
puts 0..10


# Methods
def sayhi
	puts "Hi!"
end
sayhi

def sayhi_again(who="Nobody")
	puts "Hi #{who}!"
end
sayhi_again("Daniel")
sayhi_again
sayhi_again()


def multipleOf3?(num)
	if num % 3 == 0
		return true
	else
		return false
	end
end
puts "4 is #{multipleOf3?(4) ? '' : 'not '}multiple of 3"
puts "6 is #{multipleOf3?(6) ? "" : "not "}multiple of 3"

def sumof(a, b)
	return a, b, a + b
end
p sumof(3, 4)
x, y, res = sumof(6, 2)
puts "Sumof #{x} + #{y} = #{res}"

# Variable arguments.
def hi_all(msg, *whoes)
	whoes.each	do |w|
		puts "#{msg} #{w}"
	end
end

hi_all("Hello", "Raul", "Miguel", "Jake")
hi_all("Hi")  # Variable argument represent 0 or more elements.


# String manipulation.
text = "anita lava la tina"
puts text
aa = text.split
p aa
b = ""
aa.each { |x| b << x }
puts b
