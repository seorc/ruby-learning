p Thread.main
t1 = Thread.new {puts "New thread"}

Thread.list.each {|t| p t}

puts "Current thread: #{Thread.current.to_s}"

Thread.kill (t1)
Thread.list.each {|t| p t}

def thread1
	for i in 0..10
		puts "Thread 1: #{i}"
		sleep 0.1
	end
end

def thread2
	for i in 0..10
		puts "Thread 2: #{i}"
		sleep 0.1
	end
end


t11 = Thread.new {thread1}
t12 = Thread.new {thread2}

t11.join
t12.join