require 'socket'
host, port = ARGV

socket = TCPSocket.open host, port

while line = socket.gets
	puts line.chop
end

socket.close