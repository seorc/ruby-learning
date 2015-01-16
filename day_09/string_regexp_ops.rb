str = "Dog and cat"
puts str

str2 = str.sub /a/, "*"
puts str2

str3 = str.gsub /a/, "+"
puts str3

loop do
	print "Write a phone number: "
	tel = gets.chomp
	break if tel == ""

	tt = tel.gsub /[\s-]/, ""

	if /^\d+$/.match(tel).nil?
		puts "Not a phone number!"
	else
		puts tt
	end
end

loop do
	print "Write your phone like this: (lada) dddd-dddd: "
	tel = gets.chomp
	break if tel == ""

	tt = /\((\d{2,3})\) (\d{4})-(\d{4})/.match(tel)

	if tt.nil?
		puts "Wrong!"
	else
		puts "Great! #{tel} (Lada: #{tt[1]}, Phone: #{tt[2]}#{tt[3]})"
	end
end

loop do
	print "Write an IP address: "
	ip = gets.chomp
	break if ip == ""

	iipp = /^(\d{1,2}|1\d{2}|2[0-5]{2})(\.(\d{1,2}|1\d{2}|2[0-5]{2})){3}$/.match(ip)
	iipp = /^(\d{1,2}|1\d{2}|2[0-4]\d|25[0-5])$/.match(ip)

	if iipp.nil?
		puts "Invalid IP!"
	else
		puts "#{ip} is a valid IP!"
	end
end