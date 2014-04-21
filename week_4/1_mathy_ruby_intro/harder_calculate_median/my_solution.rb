# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?

# An array of numbers.

# What is the output? (i.e. What should the code return?)

# The median number in the array. 

# What are the steps needed to solve the problem?

#Develop conditionals for an array with an odd-number of elements and even-number of elements.

#IF odd number of elements
#Add total elements and 1
#Divide by two
#Subtract 1
#Take this element in array

#IF even number of elements
#Divide total elements by two
#Hold onto this element in array (MEDIAN 1)
#Divide total elements by two
#Subtract 1
#Hold onto this element in array (MEDIAN 2)
#Take average of MEDIAN 1 and MEDIAN 2

# 2. Initial Solution

def median(array)
    float_array = array.collect {|i| i.to_f}
    if array.length % 2 != 0
        return float_array[(array.length + 1) / 2 - 1]
end
if array.length % 2 === 0
    m1 = array.length / 2
    m2 = array.length / 2 - 1 
    return (float_array[m1] + float_array[m2])/2
    
end
end


# 3. Refactored Solution

def median(array)
	sortedarray = array.sort #sorted array here
    float_array = sortedarray.collect {|i| i.to_f}
    if array.length % 2 != 0
        return float_array[(array.length + 1) / 2 - 1]
end
if array.length % 2 === 0
    m1 = array.length / 2
    m2 = array.length / 2 - 1 
    return (float_array[m1] + float_array[m2])/2
    
end
end



# 4. Reflection 

#I significantly struggled with the bonus test here (trying to get median of array of strings). The error I kept getting was class or module required when I tried to build in a condition (is_a? String)
#I think I'd like to find a way and bring this into office hours.
#This solution I've done in JavaScript, so I was familiar with a plan of attack. 

