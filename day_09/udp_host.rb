require "socket"

port = ARGV[0]
socket = UDPSocket.new

socket.bind(nil, port)

loop do
	request, address = socket.recvfrom(1024)
	response = request.upcase
	client_address = address[3]
	client_name = address[2]
	client_port = address[1]
	socket.send response, 0, client_address, client_port

	puts "Connection with #{client_name} at #{client_address}:#{client_port}"
end