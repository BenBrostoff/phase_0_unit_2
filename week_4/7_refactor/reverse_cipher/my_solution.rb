# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself, with: ].


# 1. Solution
# Write your comments on what each thing is doing. 

#The method begins with the statement of three variables. 
#Alphabet is an array of all letters in the alphabet (26 elements).
#Cipher is a hash table that takes the alphabet as keys and the shifted alphabet as values (each is shifted by 4 [a -> e]).
#Spaces is an array that takes 7 elements (@...*).
#original_sentence is the downcased argument (the argument is supposed to be an English sentence).
#encoded_sentence is the coded sentence (which will look like jibber jabber but is just shifted alphabet).
#The conditionals translate normal alphabet into shifted alphabet; non-alphabet characters are made into random space characters.

# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] #Effectively, create hash wherein a >> e, b >> f, etc. 
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    original_sentence = sentence.downcase
    encoded_sentence = []
    original_sentence.each_char do |element| #take argument and divide into individual characters
      if cipher.include?(element) #are the characters in the argument in the cipher? 
        encoded_sentence << cipher[element]  #take |element| and decode using the hash (the cipher) -> the value is the |element|, and the key is the deciphering
      elsif element == ' '
        encoded_sentence << spaces.sample #take a random spaces element and put it between ciphered words
      else 
        encoded_sentence << element #if unidentified, just take as is
      end
     end
    
    return encoded_sentence.join #join all |elements| together to make sentence
end


# Questions:
# 1. What is the .to_a method doing?

# It converts the alphabet into an array. 

# 2A. How does the zip method work?

#Zip organizes like positioned elements in the same array. Examples from the official Ruby documentation are best for explaining here. 
#a = [ 4, 5, 6 ]
#b = [ 7, 8, 9 ]
#[1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]] # The "0th" elements are 1,4 and 8. The "1st" elements are 2,5 and 8. 
#[1, 2].zip(a, b)      #=> [[1, 4, 7], [2, 5, 8]]
#a.zip([1, 2], [8])    #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]] # Nil as placeholder if elements aren't available. 

# 2B. How does the rotate method work? What does it work on?

#Rotate reorders the first through array.length elements of an array based on the argument passed in. 
#rotate(1) will take array(1) as the first element of the array and begin counting from there. rotate(0) is now the last element.
#Thus, the alphabet now begins at alphabet(4), or "e". alphabet(0) == "e", alphabet(1) == "f", etc.

# 3. What is `each_char` doing?

#each_char passes each character in a string to the given block. Alternatively, exString.each_char.to_a makes a string an array of characters, where exArray is a string.

# 4. What does `sample` do?

#Where x is an array of numbers, x.sample(y) will take a random sampling of y elements. 
#In effect, x.sample(x.length) is the same as x.shuffle.

# 5. Are there any other methods you want to understand better?
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# 7. Is this good code? What makes it good? What makes it bad?


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")

#The alphabet elements are the same; however, because of the sample method, the space separators are different.
#Examples: m^aerx#gssomiw v. m#aerx$gssomiw


# 5. Reflection 

#I learned a significant amount of new methods from this challenge: zip and rotate are particularly interesting (I had to read the docs a few times and write it out myself to understand).
#I like this method because it teaches you to read code.
#I think reading code and writing code are unique skills within themselves. There is no question (and it's relatively obvious) reading code makes you a better writer of code.
#I very much want to make a concerted effort in my free-time to explore the open-source (and other) communities and read as much code as I can.
#I see it as no different from watching a great athlete and trying to emulate the skills they do well.
#Reading code can be scary for lack of a better word. You often see methods and practices you're not familiar with.
#This exercise taught me how to deal with this "scariness" -> you have to be pro-active about looking things up and searching for answers.
#You have to be self-dependent. Reading code is by no means easy, but it's extremely important. 



