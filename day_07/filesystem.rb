puts Dir.pwd()
puts File.exists?("filesystem.rb")
puts File.exists?("filesystem-no.rb")
puts "If file? #{File.file? "filesystem-tests/things.txt"}"
puts "If directory? #{File.directory? "filesystem-tests/things.txt"}"
puts "If directory? #{File.directory? "filesystem-tests"}"
puts "Is a #{File.ftype "filesystem-tests"}"
puts "Is a #{File.ftype "filesystem-tests/things.txt"}"
puts "Size of file: #{File.size "filesystem-tests/things.txt"}"
puts "Is empty? #{File.zero? "filesystem-tests/things.txt"}"

puts "\n// File permission"
f = "filesystem-tests/things.txt"
puts "Readable #{File.readable? f}"
puts "Writable #{File.writable? f}"
puts "Executable #{File.executable? f}"

puts "\n// Wrtiting files"
g = "filesystem-tests/el-file.txt"
# On file opening options:
# http://ruby-doc.org/core-2.2.0/IO.html#method-c-new-label-IO+Open+Mode
fg = File.new(g, "w+")
fg.puts "This line"
fg.puts "That line"
fg.write "File.write method doesn't add a line-break at the end of the string"
fg.puts "That line 2"
fg.puts "That line 3"
fg.rewind
puts "After rewind()ing we are at line #{fg.lineno} in the file"
puts fg.read
fg.rewind
puts fg.readline
puts "After readline()ing we are at line #{fg.lineno} in the file."
puts fg.readline
puts "After readline()ing we are at line #{fg.lineno} in the file"
puts fg.readlines



# Excercise
fh = File.new("filesystem-tests/randoms.txt", "w+")
20.times do
	r = Random.new
	x = r.rand(-10..10)
	fh.puts "x is #{x}, y = 2 + x^3 - x = #{2 + x**3 - x}"
end

puts "\n// Directory brownsing"
Dir.chdir("/home/seorc")
puts Dir.pwd()
puts Dir.chdir("prog")  # Paths can be relative.
p Dir.glob("*")
p Dir.glob("*", File::FNM_DOTMATCH)

