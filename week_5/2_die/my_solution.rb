# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself. 

# 2. Pseudocode

# Input: A die with arbitrary sides

# Output: A random sides

# Steps:

#Create die class
#Initialize instance of die
#Sides methods returns # of sides (length of array)
#Roll gives random side


# 3. Initial Solution

class Die
  
  def initialize(sides)
  unless sides > 0
  raise ArgumentError.new("A die needs at least one side!") #now makes it impossible to create 0 sided or negative die
  end
      @sides = sides.length
  end
  
  def sides
    return @sides
  end
  
  def roll
  	return sides[1 + rand(@sides)]
  end
end



# 4. Refactored Solution

#The main change in the refactoring was to specificy instance variables and differentiate between sides and @sides
class Die
  def initialize(sides)
  unless sides.length > 0
  raise ArgumentError.new("A die needs at least one side!") #now makes it impossible to create 0 sided or negative die
  end
      @sides = sides
  end
  
  def sides
    return @sides.length
  end
  
  def roll
      return @sides[rand(@sides.length)] #sides is a method and an argument, so in that sense have to us instance variable
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

#Simiar tests to 1_die

newDie = Die.new(["Ben", "Josh", "Henry", "Will", "Jake", "Anna"]) #creates new object die with six sides
newDie.sides == 6 #checks to see if sides method returns 6 for new sides
newDie.roll.is_a? String  #for this array, ensures elements are being returned

falseDie = Die.new([]) #should return error




# 5. Reflection 

#I found this exercise to be very much similar to die_1. 
#The only change I needed to make was to account for sides being an array input.
#I changed the roll function such that rand() is now inside the array element parameter of @sides.
#Again, I am still grasping when to use sides and when to use @sides. 
#I don't know if this was done on purpose, but sides is a method and an object, and it was necessary to use the instance variable to differentiate. 