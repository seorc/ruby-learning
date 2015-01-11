class MatrixCalc
	def self.sum_sub(ma, mb, operation='sum')
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


	def self.transpose(mat)
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

	def self.mul(ma, mb)
		tb = transpose mb
		if ma[0].length != tb[0].length
			puts "Number of columns in mA must match number of rows in mB"
			return
		end

		# Size of resulting array will be #ma.rows x #mb.columns (rows x columns).
		# Notice that this array is initialized to zeroes.
		res = Array.new(ma.length) { Array.new(tb.length, 0) }
		p res
		puts
		for n in 0...ma.length
			for m in 0...ma[n].length
				for o in 0...tb.length
					res[n][o] += ma[n][m] * mb[m][o]
				end
			end
		end

		return res
	end
end


class String
	# Taken from http://stackoverflow.com/a/1235990/629519
	# Used to determine if the string represents a valid integer.
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end


class Matrix
	attr_accessor :rows, :cols
	attr_reader :id, :matrix

	@@m_ids = 0

	def initialize(rows, cols)
		@rows = rows
		@cols = cols
		@id = @@m_ids += 1
		@matrix = []
	end

	def load
		@matrix = []
		for r in 0...@rows
			@matrix.push(load_row(r, @cols))
		end
		return @matrix
	end

	def load_from_list(l)
		@matrix = l
	end

	def load_row(num, cols)
		while true
			els = self.class.prompt "Row #{num}: write a comma-separated row of #{cols} elements"
			els = els.split.join.split(",")  # Remove spaces and then separate by commas.
			ints, are_ints = [], true
			els.each do |e|
				if e.is_i?
					ints.push e.to_i
				else
					next
				end
			end
			if ints.length == cols
				return ints
			else
				self.class.wrong
			end
		end
	end

	def to_s
		t = "matrix-#{id}"
		
	end

	def show
		t = "\nThis is #{self}\n"
		@matrix.each do |r|
			r.each do |c|
				t += "\t#{c}"
			end
			t += "\n"
		end
		puts t + "\n"
	end

	def self.wrong
		puts "Wrong! Please try again :-)"
	end

	def self.action_prompt(m)
		mb = Matrix.new 0, 0
		options = {
			"+" => "#{m} + #{mb}",
			"-" => "#{m} - #{mb}",
			"x" => "#{m} x #{mb}",
			"\\" => "trsnpose(#{m})",
			"b" => "Back"
		}
		while true
			puts
			puts "What do you want to do with #{m}?"
			options.each do |k,v|
				puts "\s#{k}) #{v}"
			end
			opt = prompt("Your choice")

			binary_operator = true

			case opt 
			when "+", "-"
				act = opt == "+" ? "sum" : "sub"
				puts "We need another matrix of #{m.rows}x#{m.cols}"
				mb.rows, mb.cols = m.rows, m.cols
				mb.load
				result = MatrixCalc.sum_sub(m.matrix, mb.matrix, act)
			when "x"
				puts "We need another matrix of #{m.cols}xN"
				while true
					nn = prompt "How many columns (N) do you want to use?"
					if nn.is_i?
						nn = nn.to_i
						break
					else
						wrong
					end
				end
				mb.rows, mb.cols =  m.cols, nn
				mb.load
				result = MatrixCalc.mul(m.matrix, mb.matrix)
			when "\\"
				result = MatrixCalc.transpose(m.matrix)
				binary_operator = false
			when "b"
				return
			else
				wrong
				next

			end
			puts "\n--------------------------"
			puts "Calaculated #{options[opt]}"
			m.show
			if binary_operator
				mb.show
			end
			
			mc = Matrix.new(m.rows, m.cols)
			mc.load_from_list(result)
			
			puts "\n===== RESULT ======"
			mc.show
			puts "--------------------------"

		end
	end

	def self.matrix_prompt
		while true
			rc = prompt("Enter a matrix size of at least 1x2")
		 	r, c = rc.split("x")
		 	r = r.to_i
		 	c = c.to_i

		 	if r > 0 && c > 0 && r + c > 2
		 		m = Matrix.new r, c
		 		m.load
		 		return m
		 	else
		 		wrong
		 	end
		end
	end

	def self.main_prompt
		while true
			m = matrix_prompt
		 	Matrix.action_prompt m
		end
	end

	def self.prompt(mesage)
		print "#{mesage} ('bye' to exit): "
		rc = gets.chomp
	 	if rc == "bye"
	 		exit(true)
	 	end
	 	rc
	end

	def self.exit(status)
		puts "Ok, goodbye."
		super.exit(status)
	end
end

Matrix.main_prompt
