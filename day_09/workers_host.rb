require "socket"

log = STDOUT

host = TCPServer.open(3202)
sockets = [host]

while true
	ready = select sockets
	reading = ready[0]  # First array, readable objects.
	reading.each do |socket|
		if socket == host
			client = host.accept
			sockets << client
			client.puts "You are connected to canopus at #{Socket.gethostname}"
			log.puts "#{client.peeraddr[2]} Connection established"
		else
			input = socket.gets
			if !input
				log.puts "Connection closed by client #{socket.peeraddr[2]}"
				sockets.delete socket
				socket.close
				next
			end

			input.chop!

			if input == "bye"
				socket.puts "Goodbye #{socket.peeraddr[2]}"
				log.puts "#{socket.peeraddr[2]} Requested disconnect"
				sockets.delete socket
				socket.close
			else
				socket.puts "Hi, this is your phrase reversed: #{input.reverse}"
			end
		end
	end
end