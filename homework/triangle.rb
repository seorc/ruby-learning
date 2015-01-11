=begin
	
Homework

Using functions

1) Pass three args: symbol, height, and figure (triangle, rhombus)

     *
    ***
   *****
  *******
 *********
***********
   
   *
  ***
 *****
*******
 *****
  ***
   *

=end


def write_triangle(symbol, height, full_rhombus=false)
  width = 1
  width_step, height_step = 2, 1
  puts
  while (height -= height_step) >= 0 && width > 0
    
    if(height == 0 && full_rhombus)
      # Invert the figure width increment.
      width_step, height_step = -width_step, -height_step
    end

    height.times do
      print "\s"
    end
    width.times do
      print symbol
    end

    width += width_step
    puts  # Linkebreak to the next level.
  end
  puts
end

def catch_bye(txt)
  if txt == "bye"
    puts "See ya!"
    exit
  end
end


def go
  while true
    num = 0

    sym = ""
      while sym.length != 1
        print "Chose any symbol ('bye' to exit): "
        sym = gets.chomp
        catch_bye sym
      end

    while num < 2
      print "What height should the triangle be: "
      num = gets.chomp
      catch_bye num
      num = num.to_i
    end

    r = "-"
    while !(["y","n",""].include?(r))
      print "Would you like to print a rhombus? (y/N): "
      r = gets.chomp.downcase.strip
      catch_bye r
    end

    full_rhombus = r == "y"
    write_triangle(sym, num, full_rhombus)
  end
end

go