require "thread"

#bus_q = Queue.new
passenger_q = Queue.new

class Bus
	def initialize(id, capacity)
		@capacity = capacity
		@id = id
		@passengers = []
		sleep 1
		puts "#{self} is ready"
	end

	def go
		puts "#{self} has gone"
		return true
	end

	def add_passenger(pass)
		@passengers.push(pass)
		puts "Passenger #{pass} aborded #{self}"
		return @passengers.count < @capacity
	end

	def to_s
		"Bus #{@id}"
	end
end

class Passenger
	def initialize(id)
		@id = id
		puts "#{self} is waiting for a bus"
	end

	def to_s
		"Passenger #{@id}"
	end
end


t_pass = Thread.new do
	130.times do |pass|
		sleep(0.4)
		passenger_q << Passenger.new(pass)
	end
end

t_bus = Thread.new do
	5.times do |bus|
		sleep 2
		b = Bus.new(bus, 20)
		while b.add_passenger(passenger_q.pop)
			next
		end
		b.go
	end
end

t_pass.join
t_bus.join