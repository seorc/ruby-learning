=begin
	
return
break
next Skip the remaining code  and goes to the next item.
redo Redo the current iteration.
retry Restart a block.
	
=end

for i in 0..5
	if i == 3
		next
	else
		puts "Num #{i}"
	end
end

c = 3
as = [1, 2, 3, 4, 5]
for i in as
	if c < 1
		break
	end
	print "# => {i} "
	if i > c
		c -= 1
		puts
		redo
	end
end