require "twitter"

# https://sferik.github.io/twitter/
# https://apps.twitter.com/app/new/

client = Twitter::REST::Client.new do |config|
	config.consumer_key = "here-goes-the-key"
	config.consumer_secret = "here-goes-the-secret"
	config.access_token = "here-goes-the-token"
	config.access_token_secret = "here-goes-the-tokens-secret"
end

tweet = ""
#print "Tweet what? "
#tweet = gets.chomp
#tweet = "Testing a twitter gem from my Ruby course! @proteco #cursosPROTECO"
#tweet = "About PROTECO http://proteco.fi-b.unam.mx/ @proteco #cursosPROTECO"
#tweet = "About PROTECO http://proteco.fi-b.unam.mx/ @proteco #cursosPROTECO"
#tweet = "@proteco Buen curso! #cursosPROTECO"
if tweet != ""
	client.update tweet
	#client.update tweet
	#client.update_with_media tweet, File.new("/home/seorc/Downloads/banner.png")
end

client.search("to:seorc", result_type:"recent").take(20).each do |t|
	puts "#{t.text} #{t.created_at}"
end