# = Using RDOC
#
# Author:: Daniel
# 
# == A header
# Here are some hints on:
# - Using *rdoc*
# - Improving a project code
#
# Generate using something like:
#
# $ rdoc --main -o docs using_rdoc.rb
#
# === Computer Class
#
# Class definition
# * initialize method
# * start method

class Computer
	def initialize(model)
		@model = model
	end

	def start
		puts "Starting..."
	end
end
