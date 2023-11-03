class Caesar_Cypher

  def cypher_message(message, shift)
    shifted_message = []
    message.chars do |char|
      if char.ord.between?(65, 90) 
        if char.ord + shift <= 90 && char.upcase == char 
          shifted_message << (char.ord + shift).chr
        elsif char.upcase == char
          shifted_message << ((char.ord + shift) - 26).chr
        end

      elsif char.ord.between?(97, 122) 
        if char.ord + shift <= 122 && char.downcase == char 
          shifted_message << (char.ord + shift).chr
        elsif char.downcase == char
          shifted_message << ((char.ord + shift) - 26).chr
        end
      else
        shifted_message << char
      end
    end
    return shifted_message.join
  end
end





