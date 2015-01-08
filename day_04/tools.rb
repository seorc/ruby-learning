time1 = Time.new

puts "// Time object examples"
puts "Current date and time are: #{time1.inspect}"
puts "Year #{time1.year}, month #{time1.month}, day #{time1.day}"
puts "DOW (sunday-0-based) #{time1.wday}"
puts "DOY #{time1.yday}"
puts "Hour #{time1.hour}, minute #{time1.min}, seccond #{time1.sec}"
puts "TZ #{time1.zone}"
puts "Is it monday? #{time1.monday?}"
puts "Is it thursday? #{time1.thursday?}"
#puts time1.methods

t2 = Time.new(2014, 12, 31, 20, 10, 11, '-04:00')
puts "Custom time #{t2}"

tarr = time1.to_a

puts "Time.to_i #{time1.to_i}, Time.to_f #{time1.to_f}"
puts "Time.at(200) #{Time.at(200)}"
puts "Now #{time1.inspect}, Past (minus 15 secs) #{time1 - 15}"
puts "Now <=> Past (-10) -> #{time1 <=> time1 - 10}"

puts "Time formating (http://www.ruby-doc.org/core-2.2.0/Time.html#method-i-strftime)"
puts "Formated time #{time1.strftime("%04d %04m %04Y")}"
