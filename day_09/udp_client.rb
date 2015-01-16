require "socket"

host, port, request = ARGV

socket = UDPSocket.new

socket.connect host, port

socket.send request, 0

response, addres = socket.recvfrom 1024

puts response