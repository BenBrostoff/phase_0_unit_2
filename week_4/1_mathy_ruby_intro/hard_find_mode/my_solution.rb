# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge with Armen. 

# 1. Pseudocode

# What is the input?

# An array of numbers.

# What is the output? (i.e. What should the code return?)

# The mode (highest frequency element) in the array.

# What are the steps needed to solve the problem?

#Sort the array
#Set frequency variable equal to 1
#if the nth element equals the nth + 1 element, add one
#if not, stop counting

#Note - this pseudo code was extremely far from what we ended up with
#I ended up doing some S/O and Google searches, and we found using a hash table was a far better solution
#I had not thought to use a hash table initially

# 2. Initial Solution

def mode(array)
  count = Hash.new(0)
  array.each {|x| count[x] += 1 }
  sortedHash = count.sort_by{|k,v| v}
  big = count.sort_by{|k,v| v}.last[1]
  array1 = sortedHash.map{ |k,v| v==big ? k : nil }.compact.sort
  return array1
end
    
   
# 3. Refactored Solution

#renamed significant number of variables and added comments 
#used collect instead of map; no effect, but method name is more intuitive 
#eliminated return since it's not necessary


def mode(array)
  count = Hash.new(0) # Creating a hash to sort the array
  array.each {|x| count[x] += 1 } # Hash{array: frequency}
  sortedHash = count.sort_by{|k,v| v} # Sorting the hash by the frequency
  modeValue = sortedHash.last[1] # modeValue = the frequency of the mode
  yourMode = sortedHash.collect{ |k,v| v==modeValue ? k : nil }.compact.sort # Comparing other numbers to see if they match the mode
end


# 4. Reflection 

#I found this challenge difficult but rewarding.
#I learned a lot about hashes and different methods to use on hashes here.
#You can sort a hash by values with sort_by.
#The last method will take the last value in the sorted hash; the [] parameter can be used to show the key ([0) or value ([1]).
#Armen and I googled for a while and settled on the collect / map methods (nearly the same) and the compact method.
#Compact eliminates all values in an array or hash with a certain value; we chose nil here.
#Our code asks the question "Are you a key with a value that is the max frequency?"
#If so, you can stay in the new array.
#If not, get out of my house.






