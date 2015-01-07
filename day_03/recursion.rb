def factorial(n)
	f = 1
	if n == 0
		f = 1
	else
		for i in 1..n
			f *= i
		end
	end
	return f
end
puts factorial(4)

def fact(n)
	if n == 0
		1
	else
		n * fact(n - 1)
	end
end
puts fact(4)

a = [1, 2, 3]
p a
p a.pop
p a

def recsum(*args)
	if args.count > 0
		a = args.pop
		return a + recsum(*args)
	else
		return 0
	end
end
puts recsum(4, 5, 6, 8, 3, 1, 6, 3)