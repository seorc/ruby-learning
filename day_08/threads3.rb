require "thread"

q = Queue.new

# Productor - Consumer problem.
prod = Thread.new do
	20.times do |i|
		sleep rand(0.2)
		q << i
		puts "Produced #{i} time(s)."
	end
end


cons = Thread.new do
	20.times do |i|
		puts "Consumed #{q.pop}"
	end
end

prod.join
cons.join