class Cuenta
	attr_reader :num
	def initialize(num, nip, saldo)
		@num = num
		@nip = nip
		@saldo = saldo
	end

	def depositar(dep)
		@saldo += dep
	end

	def retirar(ret)
		@saldo -= ret
	end

	def nip_correcto?(nip)
		return @nip == nip
	end

	def resumen

		puts "El saldo de la cuenta es $#{@saldo}"
	end
end

class Banco

	BREAK_OPTION = 9

	def initialize(nombre)
		@nombre = nombre
		@cuentas = Hash.new
		@current_nip = nil
	end

	def say_hi
		puts "\n\nBienvenido a #{@nombre}"
		puts "Elige una opción"
		puts "1. Consultar una cuenta"
		puts "2. Depositar dinero"
		puts "3. Retirar dinero"
		puts "8. Registrar una cuenta"
		puts "#{BREAK_OPTION}. Salir"

		print "\nTu elección: "
		# rescue is for exception handling.
		op = Integer(gets) rescue nil

		return op
	end

	def acceder_cuenta?
		print "\n\nEscribe el número de cuenta: "
		ncta = gets.chomp.to_i
		print "Escribe el nip: "
		nip = gets.chomp
		cta = acceder(ncta)
		r = cta && cta.nip_correcto?(nip)
		if !r
			puts "No fue posible acceder a la cuenta. Verifica tus datos."
			return false
		end
		return cta
	end

	def consultar_cuenta
		if cta = acceder_cuenta?
			cta.resumen
		end
	end

	def depositar
		if cta = acceder_cuenta?
			cta.resumen
			print "Cantidad a depositar (sin centavos): "
			monto = gets.chomp.to_i
			cta.depositar(monto)
			cta.resumen
		end
	end

	def retirar
		if cta = acceder_cuenta?
			cta.resumen
			print "Cantidad a retirar (sin centavos): "
			monto = gets.chomp.to_i
			cta.retirar(monto)
			cta.resumen
		end
	end

	def go
		op = 0
		times = 0
		while op != 9
			op = say_hi
			case op
			when 1
				consultar_cuenta
			when 2
				depositar
			when 3
				retirar
			when BREAK_OPTION
				break
			end

			if (times += 1) > 100
				break
			end
		end
	end

	def acceder(num)
		@cuentas[num]
	end

	def registrar(cuenta)
		@cuentas[cuenta.num] = cuenta
	end
end

b = Banco.new("Bancomer S.A. de C.V.")

b.registrar(Cuenta.new(1, '0001', 100_000))
b.registrar(Cuenta.new(2, '2019', 12_000))

b.go
