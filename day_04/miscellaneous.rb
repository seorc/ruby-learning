puts "// String methods"

st = "This is a string"
puts st

st.concat " and this is another string"
puts st

st.insert(5, " more ")  # Concate at a given possition.
puts st

puts st.slice(0, 10)

puts st.eql?("yay")

puts st.length
puts st.size

puts st.empty?
puts "".empty?

puts st.index("is")
puts st.index("is", 4)
p st.index("not found")

puts st.start_with? "ii"
puts st.end_with? "ing"

puts st.include? "stringa"

p st.split
p st.split "s"  # Pass a separator to use.

p st.partition "s"

puts st.sub "This", "THOSE"
puts st.gsub "in", "IN"
puts st.sub "in", "IN"

puts st.upcase
puts st.downcase
puts st.downcase.capitalize
puts "hO hO hO!".capitalize

puts st.swapcase
puts "hO hO hO!".swapcase

puts st.chomp "ing"

p "  stripped   #{st}     ".strip
p "  lstripped  #{st}     ".lstrip
p "  rstripped  #{st}     ".rstrip

puts "10".to_i

puts "a".succ
puts "ab".succ
puts "ac".next
puts "anita lava la tina".reverse

puts st.split.join.reverse
puts "anita lava la tina".split.join.reverse

puts st.delete("this")
puts st.count("ae")
puts st.tr("aeiou", "AEIOU")


puts "\n\n// Numbers"
puts "Is even #{2.even?}"
puts "Is odd #{2.odd?}"
puts 1.1.ceil
puts 1.1.floor
puts 2.4.truncate
puts 0.6.round
puts 0.5.round
puts 0.3.round

puts -3.abs
puts Complex(1, 2)
p Complex(1, 2)
puts Complex(3, 4).abs

puts Math::PI
puts Math::E
puts Math.log10(10)
puts Math.log2(8)
puts Math.log(32)
puts Math.sin(Math::PI/2)
puts Math.cos(0)
puts Math.tan(Math::PI/4)
puts Math.hypot(3, 4)

puts rand(2)
puts rand(-10..13)
puts rand(0...2)
