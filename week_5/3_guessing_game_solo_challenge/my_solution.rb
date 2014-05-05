# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself. 

# 2. Pseudocode

# Input: A "guess" input from the user

# Output: A message indicating higher, lower or correct

# Steps:

#Initialize guess and answer as instance variables
#Conditional statements depending on guess relationship to answer
  #IF guess > answer, high
  #IF guess < answer, low
  #IF guess = answer, correct 
#Condition statements for solved
  #If guess = answer, true
  #else false


# 3. Initial Solution

class GuessingGame

  def initialize(answer)
  	unless answer.is_a? Integer 
  		raise ArgumentError.new("The answer has to be a whole number!") #makes it impossible to guess non-integer
  		end
  		@answer = answer
  	end

  def guess(guess) #instructions a bit unclear here - it's an instance method that does things beyond initialize? 
  	unless guess.is_a? Integer 
  		raise ArgumentError.new("The guess has to be a whole number!")
  		end
  		@guess = guess #my assumption is this saves the last guess in memory? But is guess an object? It's really just an argument -> how do we remember the last guess? 
  		return :high if @guess > @answer
  		return :low if @guess < @answer
  		return :correct if @guess == @answer
  	end

  def solved?
  	return true if @guess == @answer 
  	return false if @guess != @answer
  end

end


# 4. Refactored Solution

#In general, this code was difficult to refactor due to its brevity, and I did not complete refactoring here.

# 1. DRIVER TESTS GO BELOW THIS LINE

game = GuessingGame.new(10)

puts game.solved? == false   

puts game.guess(5) == :low 
puts game.guess(20) == :high 
puts game.solved? == false   

puts game.guess(10) == :correct 
puts game.solved? == true  #these driver tests were copied from the readme

game = GuessingGame.new rand(10) #this code, taken from the readme, makes the game interactive
last_guess  = nil 
last_result = nil

until game.solved? #keep asking user for input until they've solved the game
  unless last_guess.nil? #don't execute until the user has a "first guess"
    puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
    puts "" #skip a line
  end

  print "Enter your guess: "
  last_guess  = gets.chomp.to_i
  last_result = game.guess(last_guess)
end

# 5. Reflection 

#The guessing game is instructive when I think about how you could make a fun fact-based guessing game (e.g. "How many home runs did David Ortiz have in 2007?")
#I liked how the readme showed how to make the game interactive. 
#I fooled around with trying to get the user a message if they don't enter an integer.
#I got warning: already initialized constant Integer -> I want to come back to this at some point.
