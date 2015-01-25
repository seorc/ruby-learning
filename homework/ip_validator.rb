loop do
	print "Write an IP address: "
	ip = gets.chomp
	break if ip == ""

	# To match the IP we add a dot at the end of it in order to simplify
	# the regular expression.
	iipp = /^((\d{1,2}|1\d{2}|2[0-4]\d|25[0-5])\.){4}$/.match("#{ip}.")

	if iipp.nil?
		puts "Invalid IP!"
	else
		puts "#{ip} is a valid IP!"
	end
end