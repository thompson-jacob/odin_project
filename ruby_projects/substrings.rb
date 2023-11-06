class SubStrings 
  def check_substrings(string, dict)
    occur =  Hash.new(0)
    
    dict.each do |word|
      # reg-ex ?=(#{word}) is a "lookahead" expression to account for "testest"
      # would count test once instead of twice without lookahead
      
      # A lookahead expression in regular expressions is a type of zero-width assertion that matches a group of characters only if they are followed by another group of characters. It's called "lookahead" because it looks ahead in the string to check for the presence of a specific pattern without actually consuming any of the characters for the match. This means that after a lookahead has been evaluated, the regex engine's current position in the string remains unchanged.
      count = string.downcase.scan(/(?=(#{word}))/).count
      occur[word] = count if count > 0
    end
      
    
    occur
  end

end




one = SubStrings.new


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

string =  "Howdy partner, sit down! How's it going?"
p one.check_substrings(string, dictionary)



