# U2.W6: Testing Assert Statements

# I worked on this challenge by myself. 

# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# Line 13 returns nil
# Line 14 above returns a Runtime Error: Assertion Failed! 

#Pseudocode:

   #pass in an argument
   #IF the argument is equal to true (the boolean), do nothing (will return nil)
   #ELSE, the method will raise an argument error ("Assertion failed")

# 3. Copy your selected challenge here

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

#DRIVER CODE

card = CreditCard.new(4563960122001999)
puts ""
p "1. " + (card.doubleDigits == [8, 5, 12, 3, 18, 6, 0, 1, 4, 2, 0, 0, 2, 9, 18, 9]).to_s
puts ""
p "2. " + (card.sumAllDigits == 70).to_s
puts ""
p "3. " + (card.check_card == true).to_s



# 4. Convert your driver test code from that challenge into Assert Statements


assert { card.doubleDigits == [8, 5, 12, 3, 18, 6, 0, 1, 4, 2, 0, 0, 2, 9, 18, 9] }
assert { card.sumAllDigits == 70 }
assert { card.check_card == true }


# 5. Reflection

# Assert is a method used in conducting tests.
# Assert and the relevant argument will return nil if the expression inside is true, and raise an Argument Error otherwise.
# At present, I don't really see the value of assert relative to 1. true... etc (they seem equal in utility), but I presume it is valuable for Rspec purposes.

