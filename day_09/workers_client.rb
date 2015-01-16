require "socket"

host, port = ARGV

begin
	STDOUT.print "Connecting..."
	STDOUT.flush
	socket = TCPSocket.open host, port
	STDOUT.puts " Connection was successful \\(^_^)/"

	local, host = socket.addr, socket.peeraddr
	STDOUT.print "Connection form here (#{local[2]}:#{local[1]}) to host #{host[2]}:#{host[1]}"

	begin
		sleep 0.5
		msg = socket.read_nonblock 4096
		STDOUT.puts msg.chop
	rescue SystemCallError
		puts "Hands up! Something is not working (._.)!"
	end

	loop do
		STDOUT.print ">> "
		STDOUT.flush
		local = STDIN.gets
		break if !local
		socket.puts local
		socket.flush
		response = socket.readpartial 4096
		puts response.chop
	end
rescue
	puts $!
ensure
	socket.close if socket
end