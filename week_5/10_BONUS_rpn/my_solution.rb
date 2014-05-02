# U2.W5: Implement a Reverse Polish Notation Calculator

# I worked on this challenge by myself (but I in part looked at some pre existing algorithms on Wikipidia).

# 2. Pseudocode


# Input: RPN notation
# Output: A number
# Steps:

#create separate methods for addition, subtraction and multiplication once you have two operands and an operator

#if args include multiple operators
#search for an operator
#take preceding two elements and operator
#make one element
#put it back in position in array
#search for next operator
#repeat cycle 

# 3. Initial Solution

class RPNCalculator 

def initialize
end

def add(args)
args = args.split()
nums = args.delete_if{|a| a == "+"}
nums = nums.map{|a| a.to_i}
sum = 0
nums.each {|i| sum += i} 
sum 
end

def subtract(args)
args = args.split()
nums = args.delete_if{|a| a == "-"}
nums = nums.map{|a| a.to_i}
difference = nums[0] + nums[0] #establish start
nums.each {|i| difference -= i} 
difference 
end

def multiply(args)
args = args.split()
nums = args.delete_if{|a| a == "*"}
nums = nums.map{|a| a.to_i}
product = 1 #setting to 0 will just end up at 0
nums.each {|i| product *= i} 
product 
end

def evaluate(args)

args = args.split(" ")

return args.join.to_i if args.length == 1 #in case of only one digit given

while args.length > 3

position_ops = args.find_index{|i| i == "+" || i == "-" || i == "*"}
trips = [args[position_ops-2], args[position_ops -1], args[position_ops]] #correct order, or else for subtraction this will have an impact
triplet = multiply(trips.join(" ")) if trips.include?("*")
triplet = add(trips.join(" ")) if trips.include?("+")
triplet = subtract(trips.join(" ")) if trips.include?("-")

args.delete_at(position_ops)
args.delete_at(position_ops -1)
args.delete_at(position_ops -2)
args.insert(position_ops-2, triplet.to_s)

end

args = args.join(" ") #allow argument to be passed into respective methods

return add(args) if args.include?("+") 
return multiply(args) if args.include?("*")
else return subtract(args) #eliminates negative problem (or else subtract will pick up "-" in ngetive numbers in include?)

end

end



# 4. Refactored Solution

#Due to the significant number of changes this code went through, I'm going to describe my refactoring below:
#Changed order in triplets such that the subtraction method works - it's necessary to work "forward" in the array
#Changed final part of evaluation method such that subtract is now an else statement - previously, it was picking up negative number symbols in include?



# 1. DRIVER TESTS GO BELOW THIS LINE

calc = RPNCalculator.new

"1. " + (calc.evaluate('0') == 0).to_s
"2. " + (calc.evaluate('-1') == -1).to_s
"3. " + (calc.evaluate('1 2 + 3 4 + *') == 21).to_s
"4. " + (calc.evaluate('20 10 5 4 + * -') == -70).to_s
"5. " + (calc.evaluate('3 7 - 10 *') == -40).to_s



# 5. Reflection 

#I spent a long time on this challenge, and it was a great test in "stepping through" code.
#Again, I think I need to get better at pseudo code as opposed to "thinking things through" as I go.
#I actually mocked up the triplets idea and solved it on paper a few times.
#Sometimes, for more complex solutions, I find thinking them out on paper is best.

