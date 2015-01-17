# Build and install with

# gem build myowngem.gemspec
# sudo gem install ./myowngem-1.0.0.gem

Gem::Specification.new do |x|
	x.name = "myowngem"
	x.version = "1.0.0"
	x.date = "2015-01-16"
	x.summary = "This is my own gem"
	x.description = "My own gem, made by me!"
	x.authors = ["Daniel Abraján"]
	x.email = "seorc.d@gmail.com"
	x.files = ["lib/example.rb"]
	x.homepage = "http://proteco.fi-b.unam.mx/"
end