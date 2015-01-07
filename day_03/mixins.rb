require_relative 'mimodulo'

MiModulo.meth

puts Math.sqrt(2)

p MiModulo::CO

puts MiModulo.fact(4)

module A
	attr :atributo

	def atributo_set
		@atributo = 1
	end

	def say_hi
		puts "Hello"
	end

	def say_gb
		puts "Goodbye"
	end

end

module B
	def stop
		puts "Stopped"
	end

	def say_gb
		puts "Ciao (OVERRIDES a.say_gb)"
	end
end

class C
	include A
	include B


end

cc = C.new

cc.say_hi
cc.say_gb
cc.cc

stop.atributo_set
puts cc.atributo