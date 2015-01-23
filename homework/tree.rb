=begin

Build the unix tree command.
It must show sub-trees.

Usage:

	$ ruby tree.rb [path]

=end

def tree_this(expr="", level=0)
	Dir.glob("#{expr}#{expr.empty? ? '' : File::SEPARATOR}*") do |f|
		puts "#{"\t" * level} #{File.directory?(f) ? '+' : '|'} #{f} [#{File.ftype f}]"
		if File.directory? f
			tree_this("#{f}", level + 1)
		end
	end
end

tree_this ARGV[0] || ""
		