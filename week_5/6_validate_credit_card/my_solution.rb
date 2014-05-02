# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself. 

# 2. Pseudocode

# Input: Credit card numbers
# Output: True or false
# Steps: See below

#Step 0 - initialize card
#Make the card an instance variable equal to the passed in card as an array of numbers

#Step 1 
#Double all elements of array every other starting from first

#Step 2
#Add all digits in the array from step 1, breaking up double digits into single digits
#IF double digit element in array
  #Separate the element into two elements (one digit each)
  #Combine all elements into one
#Sum all elements in array

#Step 3
#IF the method defined in step 2 does not yield a remainder when divided by 2
  #return TRUE
#ELSE
  #return flase

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits

class CreditCard

def initialize(card)
	 unless card <= 9999999999999999 && card >= 1000000000000000
     raise ArgumentError.new("Your card must have 16 digits.") #now card must have 16 digits
 end
	@card = card.to_s.chars.map(&:to_i) #Converts number into array of digits
end

  
def doubleDigits
copy = @card.dup #make non-destructive

for num in 0... copy.length #changed method entirely here - before, was acting on elements rather than index

copy[num] = copy[num].to_i if num % 2 != 0
copy[num] = copy[num].to_i * 2 if num % 2 == 0

end

return copy

end

def sumAllDigits

doubledArray = doubleDigits
overTenArray = doubledArray.find_all{|i| i >= 10} #find double digit numbers
overTenArray.map!{|i| i.to_s.chars.map(&:to_i)} #now we have array of arrays for elements over ten, divided into their respective digits

i = 0
overTenArrayIndividual = []
    
while i < overTenArray.length #loop that pushes all elements into one array
	overTenArrayIndividual.push(overTenArray[i][0]) 
	overTenArrayIndividual.push(overTenArray[i][1])
	i +=1
end
    
sumOverTen = 0
overTenArrayIndividual.each{|num| sumOverTen += num} #sums all elements

underTenArrayIndividual = doubledArray.find_all{|i| i < 10} #go back to large array and find elements under 10
sumUnderTen = 0
underTenArrayIndividual.each{|num| sumUnderTen += num} #sum all elements

return sumOverTen + sumUnderTen
    
end

def check_card

if sumAllDigits % 10 == 0
   true
else
   false
end
end


end

# 4. Refactored Solution

#Please note the above is my refactoring and the initial solution was changed so many times I am describing the changes qualitatively below instead.
#doubleDigits was initially a destructive method and I failed a number of tests before I added dup and the copy variable.
#With doubleDigits, I also experimented with map and each before settling on a for loop. I found with map and each that my if statements were applying for elements rather than indices.
#On initialize, I found a nice way to ensure you can't pass in a number above or below 16 digits by thinking about it in terms of integers.
#I think you could have used .length with regard to the statement above, but I had issues getting it workable. 

#As noted in the reflection, sumAllDigits likely went through the most changes.
#Initially, I wanted all elements stored in one array.
#I changed my mind later to separate into two arrays because each requires significantly different treatment.
#I found the coding principle of separating large projects into small tasks to be useful here.

# 1. DRIVER TESTS GO BELOW THIS LINE

card = CreditCard.new(4563960122001999)
puts ""
p "1. " + (card.doubleDigits == [8, 5, 12, 3, 18, 6, 0, 1, 4, 2, 0, 0, 2, 9, 18, 9]).to_s
puts ""
p "2. " + (card.sumAllDigits == 70).to_s
puts ""
p "3. " + (card.check_card == true).to_s

# 5. Reflection 

#This assignment entailed one of the more challenging pieces of code I've ever had to do at DBC.
#If I could do it over again, I would have been better on planning my pseudo code (especially the aforementioned sumAllDigits method). 
#The idea on sumAllDigits to create two arrays came relatively late in the game, but overall I like it. 
#It is important when writing code of this nature to think about different steps and break them down into parts.
#It's easy to write pseudo code that sort of dismisses the difficulty of some of these steps.
#In the futre, I want to write more thorough pseduo code. 





