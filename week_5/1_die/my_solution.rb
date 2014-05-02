# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# Output:
# Steps:


# 3. Initial Solution

class Die
  def initialize(sides)
  	@sides = sides
  end
  
  def sides
    return @sides
  end
  
  def roll
  	return 1 + rand(5)
  end
end



# 4. Refactored Solution


class Die
  def initialize(sides)
  unless sides > 0
  raise ArgumentError.new("A die needs at least one side!") #now makes it impossible to create 0 sided or negative die
  end
      @sides = sides
  end
  
  def sides
    return @sides
  end
  
  def roll
  	return 1 + rand(@sides)
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE

newDie = Die.new(6) #creates new object die with six sides
newDie.sides == 6 #checks to see if sides method returns 6 for new sides
newDie.roll <= 6  #checks to see that max roll is below or equal to sides
newDie.roll > 0 #checks to see that 0 and negatives are not possible rolls

falseDie = Die.new(0) #should return error



# 5. Reflection 

#A good basic introduction to classes.
#I think I am still struggling a bit with the difference between @sides and sides.
#Sides is an a argument or local variable, whereas @sides is an instance variable.
#However, I only know these as terms as supposed to what they actually "mean". 