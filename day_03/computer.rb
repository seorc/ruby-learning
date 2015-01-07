class Computer
	attr :cpu, :capability

	def initialize(cpu, capability)
		@cpu = cpu
		@capability = capability
	end
end

module Celphone
	attr :tel, :company

	def init_phone(tel, company)
		@tel = tel
		@company = company
	end

	def call
		puts "Riing riing"
	end
end

class Smartphone < Computer
	include Celphone

	def initialize(cpu, capability, touchpad, tel, company)
		super(cpu, capability)
		@touchpad = touchpad
		init_phone(tel, company)
	end

	def sendBT
		puts "Sent by BT"
	end

	def method_missing(m, *args)
		puts "The method '#{m}' doesn't exist"
	end
end

sm = Smartphone.new("ARM", "2GB", "3.7", "Nexus", "Mobila")
sm.call
sm.stop
sm.sendBT
p sm.tel