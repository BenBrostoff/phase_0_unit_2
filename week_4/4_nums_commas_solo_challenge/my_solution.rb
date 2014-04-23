# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input?

# A number

# What is the output? (i.e. What should the code return?)

#A comma separated number (with the same value).

# What are the steps needed to solve the problem?

#IF the number is below 1000, return the number
#IF the number if above or equal to 1000
   #make the number a string
   #separate into characters and make array
   #starting from last element in array
      #add comma every three elements from left


# 2. Initial Solution

def separate_comma(num) 
	if num < 1000 
		newnum = num.to_s
		return newnum
		end
	if num >= 1000
		newnum = num.to_s
		newnum1 = newnum.split('')
		spacer = 3
		bounter = 0

		while newnum1.length - 1 - bounter >= spacer
		newnum1.insert(newnum.length - spacer,",") 
		spacer += 3
		bounter += 1
		end

		i = 0
		string = ""
		while i < newnum1.length do
		string += newnum1[i]
		i += 1
		end
		return string
		end
end

# 3. Refactored Solution

#Main change was to eliminate counter variable (bounter)
#Old num variable was more intuitive and efficient solution

def separate_comma(num) 
	if num < 1000 
		return num.to_s #eliminated newnum variable (redundant)
		end

	if num >= 1000
		oldnum = num.to_s #renaming
		newnum = num.to_s.split('') #renaming 
		spacer = 3
		bounter = 0
		
		while oldnum.length > spacer
		newnum.insert(oldnum.length - spacer,",") #adds comma three to left and makes array one element longer; old num ensures non-moving target
		spacer += 3 #preparing for next comma insertion
		end

		i = 0
		string = ""
		while i < newnum.length do
		string += newnum[i]
		i += 1
		end
		return string
		end
end

# 4. Reflection 
#This challenge represents one of my first satisfying experiences in refactoring.
#I removed a counter variable and wrote a solution that would make much more sense to the reader.
#My initial solution worked - however, code was meant to be read as much as it was "used".
#This code is better for anyone who might want to change it down the line.
#By eliminating my counter variable and creating an old length variable, we remove the idea of a growing array.
#Instead, oldnum takes 1,000,000 and says it has seven digits.
#The while condition specifies "do not add additional commas after you go beyond the sixth place to the left (7 > 6).
#I think as a rule of thumb, conditional statements are ripe for refactoring most of th etime. 
