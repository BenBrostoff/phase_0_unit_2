# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself. 


# Original Solution

# The work below is my original solution.
# As I read others' code (Kris Shanks and Josh Jeong, specifically) it became clear that my code could undergo significant refactoring. 
# I have used their code in part to refactor my own solution. 

# class CreditCard

# def initialize(card)
# 	 unless card <= 9999999999999999 && card >= 1000000000000000
#      raise ArgumentError.new("Your card must have 16 digits.") #now card must have 16 digits
#  end
# 	@card = card.to_s.chars.map(&:to_i) #Converts number into array of digits
# end

  
# def doubleDigits
# copy = @card.dup #make non-destructive

# for num in 0... copy.length #changed method entirely here - before, was acting on elements rather than index

# copy[num] = copy[num].to_i if num % 2 != 0
# copy[num] = copy[num].to_i * 2 if num % 2 == 0

# end

# return copy

# end

# def sumAllDigits

# doubledArray = doubleDigits
# overTenArray = doubledArray.find_all{|i| i >= 10} #find double digit numbers
# overTenArray.map!{|i| i.to_s.chars.map(&:to_i)} #now we have array of arrays for elements over ten, divided into their respective digits

# i = 0
# overTenArrayIndividual = []
    
# while i < overTenArray.length #loop that pushes all elements into one array
# 	overTenArrayIndividual.push(overTenArray[i][0]) 
# 	overTenArrayIndividual.push(overTenArray[i][1])
# 	i +=1
# end
    
# sumOverTen = 0
# overTenArrayIndividual.each{|num| sumOverTen += num} #sums all elements

# underTenArrayIndividual = doubledArray.find_all{|i| i < 10} #go back to large array and find elements under 10
# sumUnderTen = 0
# underTenArrayIndividual.each{|num| sumUnderTen += num} #sum all elements

# return sumOverTen + sumUnderTen
    
# end

# def check_card

# if sumAllDigits % 10 == 0
#    true
# else
#    false
# end
# end


# end

# Refactored Solution

#MAJOR CHANGE OVERVIEW
	# Indented correctly
	# Made 16 digit check simpler and clearer 
	# Made if/else as opposed to if/if on doubleDigits
	# Significantly shortened sumAllDigits via collapsing three arrays into one
		#Instead of overTenArray concept, in one fell swoop, make double digits single digits and add to master array
		#Accomplished via split, separate array holder (char_array) and to_i back to master array
		#Credit Kris Shanks and Josh Jeong for helping me to this solution

class CreditCard

	def initialize(card)
		@card = card.to_s.chars.map(&:to_i) #Converts number into array of digits
     	raise ArgumentError.new("Your card must have 16 digits.") if @card.length != 16 #now card must have 16 digits
	end

  
	def doubleDigits
		copy = @card.dup #make non-destructive
		for num in 0... copy.length 
			if num % 2 == 0
				copy[num] = copy[num].to_i * 2 if num % 2 == 0
			else #previously was if statement
				copy[num] = copy[num].to_i  
			end
		end
		return copy
	end

	def sumAllDigits
		doubles_array = doubleDigits
		single_digit_array = []
		doubles_array.each do |i|
			if i < 10 
				single_digit_array << i
			else
				char_array = i.to_s.split('')
				single_digit_array << char_array[0].to_i
				single_digit_array << char_array[1].to_i
			end
		end
		sum = 0
		single_digit_array.each{|i| sum += i}
		return sum
	end

	def check_card
		if sumAllDigits % 10 == 0
   			true
		else
   			false
		end
	end

end




# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

#Changed tests to assert statements

card = CreditCard.new(4563960122001999)
card2 = CreditCard.new(6096736306969264)

assert { card.doubleDigits == [8, 5, 12, 3, 18, 6, 0, 1, 4, 2, 0, 0, 2, 9, 18, 9] }
assert { card.sumAllDigits == 70 }
assert { card.check_card == true }
assert { card2.doubleDigits == [12, 0, 18, 6, 14, 3, 12, 3, 0, 6, 18, 6, 18, 2, 12, 4] }
assert { card2.sumAllDigits == 71 }
assert { card2.check_card == false}

# Reflection 

# This exercise forced me to reflect on how I write code - I often like to break things up into too many subroutines at the cost of more concise code.
# Looking at the solutions of Kris and Josh, each only had one class method.
# I kept my three methods as I still want to hold true to single responsibility and believe this way is easier to understand.
# However, I significantly refactored sumAllDigits by removing the multiple array concept.
# Instead, I used conditionals and
  #pushed all digits (including > 10) into the master array (single_digit_array)
  #broke down the double digits into arrays of single digit strings
  #converted each element into an integer and pushed into the master array
# Working with one array instead of multiple allowed me to eliminate significant code and come up with a more concise solution