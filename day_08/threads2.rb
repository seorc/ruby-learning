a = Thread.new {print "a"; Thread.pass; print "b"}
x = Thread.new {print "x"; Thread.pass; print "y"}
m = Thread.new {print "m"; Thread.pass; print "n"}
a.join
x.join
m.join

class T1 < Thread
	def initialize
		puts "A thread has been initialized"
		super
	end

	# In Thread sub-classes, start() must be implemented.
	def start
		puts "A thread has been started"
	end
end

t1 = T1.new {}
t1.start

class Account
	attr_reader :money
	def initialize(money)
		@money = money
		#super
	end

	def withdraw(amount)
		@money -= amount
	end
end

$c = Account.new(2000)
$locker = Mutex.new

# Mutex are semaphore-like objects of 1 thread. Ruby doesnt' have sempahores.
# https://gist.github.com/pettyjamesm/3746457

def client(name)
	$locker.lock  # Prevents other threads from executing these inscructions.
	if $c.money > 0
	#	sleep(0.001)
		puts "#{name} withdraws $100"
		$c.withdraw(100)
	end
	$locker.unlock
end

def fun(name)
	while $c.money > 0
		client(name)
		puts "It lefts $#{$c.money} in the account"
	end
end

h1 = Thread.new {fun("Alex")}
h2 = Thread.new {fun("Aldo")}
h3 = Thread.new {fun("Jake")}

h1.join
h2.join
h3.join