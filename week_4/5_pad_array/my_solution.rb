# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge with Armen, Sam, Kris and Ronald. 

# 1. Pseudocode

# What is the input?

# An array length and a value for empty slots in the array the method is acting on.

# What is the output? (i.e. What should the code return?)

# Either (i) the same array (the method was called upon), if the padding specification (number of elements in array) is less than or equal the array's length
# Or (ii), the padded array with new elements occupied by a user-entered value.

# What are the steps needed to solve the problem?

#Create conditional statements
#IF array's length is more than or equal to padding value
	#RETURN array
#IF array's length is less than padding value
    #Add (padding value - array length) elements to array
    #Specify the elements be the given value entered into the function

#READER NOTE - I strayed signifcantly from my pseudo after pairing with several students/


# 2. Initial Solution



 class Array #extend class
      def pad(l, output)
        amount = l - self.length
        if amount > 0
          amount.times.self.push(output)
        else
          return self.array
        end
      end
  end
  


# 3. Refactored Solution

#I built the pad! method
#I modified the Array class
#I removed conditionals as they were not necessary
#I changed the structure of my arguments (setting second parameter to nil) to make optional

class Array #extend class
      def pad(l, output = nil) #setting output to nil makes second arg optional
          amount = l - self.length
          copy = self.dup #make non-destructive via duplication
          amount.times{copy.push(output)} 
          return copy
          end
       def pad!(l, output = nil)
       	amount = l - self.length
          amount.times{self.push(output)} #value of self is permanently changed
          return self
          end

end



# 4. Reflection 

#This was a fairly difficult challenge in that we had to (i) change the class Array and (ii) duplicate an object to make a method non-destructive.
#Both (i) and (ii) I had not previously done before.
#I learned the dup method from Ronald, which was key in making my pad method work.
#My pad! method was actually what I previously wrote for my pad method - I realized after some testing that pad was inherently destructive and needed the dup method.
#Special thanks to Armen, Sam, Kris and Ronald for their help here.




