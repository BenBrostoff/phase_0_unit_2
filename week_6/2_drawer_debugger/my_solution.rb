# U2.W6: Drawer Debugger


# I worked on this challenge [by myself, with: ].

#What errors are encountered before any changes are made?
  #Initially, unexpected end --> CORRECTED
  #Next, wrong number of arguments on add_item --> CORRECTED
  #Next, error for undefined method clean_silverware for object --> CORRECTED
  #Next, error for undefined method eat or nil: NilClass (because fork is empty) --> CORRECTED

# 2. Original Code
class Drawer 

attr_reader :contents, :open, :clean

# Are there any more methods needed in this class?

def initialize
@contents = []
@open = true
@clean = false
end

#def open #Redundant if we just add to attr_reader
#@open = true
#end

def reopen #rename to differentiate variables
@open = true
end

def close
@open = false
end 

def add_item(item = @contents.push) 
@contents << item
end

def remove_item(item = @contents.pop) #what is `#pop` doing? Taking off the last element in the drawer
if @contents.include?(item) 
@contents.delete(item) #this actually returns you the deleted item (per defn of delete) if you enter an argument
#If you remove an item when there's no items to begin with, @contents becomes nil
else #create conditional for case wherein you're removing item that does not exist
Silverware.new("EMPTY", "N/A - no utensil")
end
end

def dump  # what should this method return? It should clear all contents instead of just putting an output message
puts "Your drawer is empty."
@contents = [] #make empty
end

def view_contents
puts "The drawer contains:"
@contents.each {|silverware| puts "- " + silverware.type }
end


end #Added as this was first error encountered 

class Silverware
attr_reader :type, :clean

# Are there any more methods needed in this class?

def initialize(type = nil, clean = true)
@type = type
@clean = clean
end

def eat
if @type == "EMPTY"
	puts "You have no utensil to eat with!"
else
puts "eating with the #{type}"
@clean = false
end

end

def clean_silverware
	if @clean == "N/A - no utensil"
		@clean
	else
	@clean = true
end
end

end



knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item #fork is now gone
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife) #removed_knife is an instance of Silverware
removed_knife.class #returns Silverware
removed_knife.eat
removed_knife.type.class #returns String
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return? Nothing - no more contents left


fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
#fork.type #returns undefined method for nil:NilClass prior to changing code
fork.class #returned Nil class prior to changing code
fork.eat

#BONUS SECTION
puts fork.clean

def assert
  raise "Assertion failed!" unless yield
end

# DRIVER TESTS GO BELOW THIS LINE
# Recreated testing variables for ease of understanding

knife_test = Silverware.new("knife")
spoon_test = Silverware.new("spoon")
fork_test = Silverware.new("fork")
silverware_drawer_test = Drawer.new

silverware_drawer_test.add_item(knife_test) 
silverware_drawer_test.add_item(spoon_test)
silverware_drawer_test.add_item(fork_test) 

assert { silverware_drawer_test.open == true}
assert { silverware_drawer_test.close == false}
assert { silverware_drawer_test.reopen == true}
assert { silverware_drawer_test.contents == [knife_test, spoon_test, fork_test] }

removed_knife_test = silverware_drawer_test.remove_item(knife_test)

assert {silverware_drawer_test.contents ==  [spoon_test, fork_test] }
assert {removed_knife_test.class == knife_test.class}
assert {removed_knife_test.clean_silverware == true}
assert {removed_knife_test.type == "knife"}

silverware_drawer_test.remove_item

assert {silverware_drawer_test.contents ==  [spoon_test] }

removed_fork_test = silverware_drawer_test.remove_item(fork_test) #no fork to remove

assert {removed_fork_test.type == "EMPTY" }
assert {removed_fork_test.clean_silverware == "N/A - no utensil"}

silverware_drawer_test.dump

assert {silverware_drawer_test.contents == []}


# 5. Reflection 

#I had a "Eureka" moment on this exercise - coming to the conclusion that the delete method returned the deleted item.
#Once I knew that, I understood remove_item was returning nil in scenarios where there was no matching item to delete.
#That realize in turn made me create a conditional statement.
#If there's no item to remove, creae a new silverware object called Empty with a clean value of N/A.
#It was a new experience calling for the creation of another instance within a class for a class method of a different class.
#It just goes to show in programming you can do anything "within the rules" --> and the rules aren't so strict to begin with.
#I do need to check up on devising a testing method using asserts for methods with puts in them.
