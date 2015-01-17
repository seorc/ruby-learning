require "nyaplot"
require "nyaplot3d"

x, y, z = [], [], []

for i in 0..10
	for j in 0..10
		x.push i
		y.push j
		z.push 2
	end
end

pl = Nyaplot::Plot3D.new
pl.add :surface, x, y, z
pl.export_html "chart3d.html"
