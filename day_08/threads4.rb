$lock_gui = Mutex.new
$lock_lib = Mutex.new

#$lock_lib.lock
#$lock_gui.lock

def gui()
	#$lock_lib.lock
	puts "Loading GUI"
	#$lock_lib.unlock
	$lock_gui.lock
	sleep 3
	puts "The GUI loaded susccessfuly"
	#$lock_gui.unlock
end

def lib()
	#$lock_gui.lock
	puts "Loading libs"
	sleep 2
	puts "Libs where loaded"
	$lock_gui.unlock
end

g = Thread.new { gui }
l = Thread.new { lib }

g.join
l.join