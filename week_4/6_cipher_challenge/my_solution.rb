# U2.W4: Cipher Challenge


# I worked on this challenge with Ian.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  #We take our argument, downcase the whole thing and split it into array, with elements divided by "".
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",   # You could use ranges in Ruby and make use of the a.. z. We did not use hashes in our solution, instead using the index method to "shift" all alphabet elements over by four.
            "i" => "e",   # A hash could be useful here for mapping the a.. z keys to e.. d values. 
            "j" => "f",   # The pros of hashes are that you get keys and values as opposed to just the limitations of arrays (only keys).
            "k" => "g",   # On the con side, you can only call certain methods in the Hash class and have to create it and write extra code.
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here?
    #Taking each element in the input
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    #Your natural assumption is that your cipher won't have the element you're working with. 
    cipher.each_key do |y| # What is #each_key doing here?
      #Taking each key in the hash.
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        #We're comparing the element in the cipher to the key in the hash. X is from input; y is from the hash.
        #These variables are really the elements (characters) in input and the keys in the hash. 
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here? 
        #x will always equal y in the cases this is true. You need to break to move on, or else you have an infinite loop.
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        #Looking for instances of unique characters, in which case your code will just treat them as spaces.
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        #An array of 10 elements with the digits 0 to 9.
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for?
      #Cases where found match is false. In this case, just return the element as is. 
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    # It is matching for digits. 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  return decoded_sentence # What is this returning? Originally, decoded sentence was an empty array. Now it's filled with the changed elements you modified through your code.     
end

#Your Re-Factored Solution

 def north_korean_cipher(sentence)
punctuation = sentence.split("").pop #Assign new variable punctuation as last element of sentence array (split by "")
sentence_with_spaces = sentence.scan(/\w+/) #
sentence_with_spaces = (sentence_with_spaces.map{|word| north_korean_word(word)}.join(" ") + punctuation).to_s
if /\d+/.match(sentence_with_spaces)
sentence_with_spaces.gsub!(/\d+/) { |num| num.to_i / 100 }
end
return sentence_with_spaces
end

def north_korean_word(word)
  arrayAlphabet =[*('a'..'z')]  
  decoded = word.split("").map do |x| 
  	if arrayAlphabet.include? x 
  	arrayAlphabet[arrayAlphabet.index(x) - 4]
  else 
    x
  end
end
   decoded.join("")
end

p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 1000000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape flavored toffee don t tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake gen ri yong gil you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop south korea then japan then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 10000 bags of cool ranch doritos?"
