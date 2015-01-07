module  MiModulo
	CO = 44
	def MiModulo.meth
		puts "Meth"
	end

	def MiModulo.fact(n)
		if n == 0
			1
		else
			n * fact(n - 1)
		end
	end
end