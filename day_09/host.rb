require 'socket'

servidor = TCPServer.open(3200)

loop {
	client = servidor.accept
	puts "A request from #{client} was attended"
	client.puts "Hello. Thime is: ", Time.now.ctime
	client.close
}