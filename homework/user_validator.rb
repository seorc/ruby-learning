loop do
  print "Email: "
  email = gets.chomp.strip
  email_match = /\A[a-z0-9\._]+@((gmail|outlook|yahoo)\.com|proteco\.unam\.mx)\z/.match email
  if email_match.nil?
    puts "  Invalid email"
    next
  end

  print "Passwd: "
  pwd = gets.chomp
  pwd_re = {
    'must contain at least a capital letter' => /[A-Z]+/,
    'must contain at least a lower case letter' => /[a-z]+/,
    'must contain at least a number' => /[0-9]+/,
    'must contain at least a special character' => /[^A-Za-z0-9]+/,
    'must be at least 8 characters long' => /.{8,}/,
  }
  msgs = ""
  pwd_re.each do |msg, re|
    pwd_match = re.match pwd
    if pwd_match.nil?
      msgs += "  Your password #{msg}\n"
    end
  end

  if !msgs.empty?
    puts msgs
    next
  end

  break
end