require "nyaplot"

x, y = [], []

for i in 0..10
	x.push i
	y.push i
end

plot = Nyaplot::Plot.new
line = plot.add :line, x, y
plot.export_html "chart1.html"

a, b = [], []

for i in 0..100
	a.push(Math::cos((Math::PI * i) / 2))
	b.push(i)
end

pb = Nyaplot::Plot.new
pb.add :line, a, b
pb.export_html "chartb.html"

