
def sum_sub(ma, mb, operation='sum')
	if ma.length != mb.length
		puts "The matrixes are not the same size"
		return
	end

	res = []
	for n in 0...ma.length
		if ma[n].length != mb[n].length
			puts "The matrixes are not the same size"
			return
		end
		r = []
		for m in 0...ma[n].length
			if operation == 'sum'
				r[m] = ma[n][m] + mb[n][m]
			elsif operation == 'sub'
				r[m] = ma[n][m] - mb[n][m]
			else
				puts "The operation indicated '#{operation}' is unknown"
			end
		end
		res[n] = r
	end

	return res
end


def transpose(mat)
	res = []
	for n in 0...mat.length
		
		for m in 0...mat[n].length
			if res.length == m
				res[m] = []
			end
			res[m][n] = mat[n][m]
		end
		
	end
	return res
end

def mul(ma, mb)
	ta = transpose ma
	if ta.length != mb.length
		puts "Number of columns in mA must match number of rows in mB"
		return
	end

	#tb = transpose mb
	res = []
	for n in 0...ma.length

		for m in 0...ma[n].length
			if res.length == n
				res[n] = []
			end
			for o in 0...mb.length
				if res[n].length == o
					res[n][o] = 0
				end
				res[n][o] += ma[n][m] * mb[m][o]
			end
		end
	end

	return res
end

m1 = [
	[1, 2, 3],
	[4, 5, 6],
	[7, 7, 8],
]

m2 = [
	[1, 2, 1],
	[5, 6, 5],
	[7, 8, 7],
]

puts "// m1"
p m1

puts "// m2"
p m2

puts "// Transposition m1"
p transpose m1

puts "// Sum"
p sum_sub m1, m2, 'sum'

puts "// Substraction"
p sum_sub m1, m2, 'sub'

puts "// Multiplication"
p mul m1, m2


puts
puts


class MatrixReader
	def load_matrix(rows, cols)
		matrix = []
		for r in 0...rows
			matrix.push(load_row(r, cols))
		end
	end

	def load_row(num, cols)
		while true
			print "Row #{num}: write a comma-separated row of #{cols} elements: "
			els = gets.chomp.split.join.split(",")  # Remove spaces and then separate by commas.
			if els.length == cols
				return els
			else
				puts "Wrong!!"
			end
		end
	end
end



mrd = MatrixReader.new
while true
	print "Tell a matrix size of at least 1x2 (write 'bye' to exit): "
 	rc = gets.chomp
 	if rc == "bye"
 		break
 	end
 	r, c = rc.split("x")
 	r = r.to_i
 	c = c.to_i
 	if r > 0 && c > 0 && r + c > 2
 		mrd.load_matrix(r, c)
 	else
 		puts "Wrong!!"
 	end
end

