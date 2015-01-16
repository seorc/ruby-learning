m1 = /Ruby/.match "This is Ruby"  # Rerturn a MatchData or nil.
p m1

m2 = "Also Rubey Ruby" =~ /Ruby/  # Return where the match starts.
p m2

m3 = /\?/.match "Is this escaped?"  # Yes, with symbol "\".
p m3


b = Proc.new do |regexp, words|
	puts "----"
	words.each { |w| p regexp.match w}
end

words = %w[hola cola adios si no ola]
words_b = %w[casa tasa masa lasa rasa Casa Tasa Masa Lasa Rasa 2asa]

b.call /.ola/, words
b.call /[CcMm]/, words_b
b.call /[A-Z]/, words_b
b.call /[^A-Z]/, words_b
b.call /casa|perro/, words_b
b.call /\wasa/, words_b  # Equivalent to /[A-Za-z0-9_]asa/.

p /\d\s*\d/.match "1    1"
p /\d\s+\d/.match "1    1"
p /\d\s?\d/.match "1    1"
p /\w*s$/.match "uno dos"