# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself. 

# 1. Pseudocode

# total => 
# take all elements in given array
# compute sum

# sentence maker =>
# convert all elements into strings
# upcase first letter of first element
# concatenate strings together
# add period at end

# What is the input?

# An array of numbers

# What is the output? (i.e. What should the code return?)

#If the method used is total, the sum of all elements in the array.
#If the method is sentence maker, a sentence with the words in sequential order and a period at the end.

# What are the steps needed to solve the problem?



# 2. Initial Solution

def total(array) 
	sum = 0
	i = 0
	for i in 0.. array.length
	array.each { |i| sum += i}
	return sum
end
end


def sentence_maker(array)
    sentence = array[0]
    sentence[0] = array[0][0].upcase
    array.shift
	array.each { |i| sentence = sentence + " " + i}
	return sentence + "."
end




# 3. Refactored Solution

# Eliminated i = 0
def total(array) 
	sum = 0
	for i in 0.. array.length
	array.each { |i| sum += i}
	return sum
end
end


#Updated such that integers can go into sentence


def sentence_maker(array)
  str_array = array.collect{|i| i.to_s} #collect method returns entire array or hash; we are converting all elements of array into string
    sentence = array[0] #converts first element of array into new array
    sentence[0] = str_array[0][0].upcase #makes first letter uppercase
    str_array.shift
	str_array.each { |i| sentence = sentence + " " + i.to_s}
	return sentence + "."
end






# 4. Reflection 
# I found total to be a relatively easy method to write; sentence_maker gave me a fair amount of trouble.
# Two issues were at play here, the first being how to convert the first letter of the first element to uppercase.
# I accomplished this easily enough by redefining the first element within the first element (e.g. I made the first element of the array an array).
# Converting all elements into strings was my next problem.
# I found a handy solution on S/O using the collect method.
