# U2.W6: Create a Car Class from User Stories

# I worked on this challenge by myself.


# 2. Pseudocode

# Create Car class
	# Attributes need to feed into methods
# stop resets speed to zero
# turn_right and turn_left change overall direction conditional on direction (default to north)
# accelerate / decelerate change speed by argument passed)
# recompensate calculates how much driver is owed
	# initialize mpg and gas price
# display_action 
  # initialize empty string array @action_log
  # in all methods, keep pushing into array

# 3. Initial Solution

class Car

	attr_accessor :model, :color, :speed, :distance_traveled, :direction, :action_log

	def initialize(model, color, direction = "north", mpg = 30)
		@model = model
		@color = color 
		@speed = 0 #mph
		@distance_traveled = 0 #miles
		@direction = direction #default to north: user to set
		@action_log = []
		@mpg = mpg
		@gas = 3.00 #per gallon in dollars
		@price_per_mile = @gas / @mpg
	end

	def stop
		@speed = 0
		@action_log.push("Car came to a stop.")
	end

	def turn_right
		case @direction
			when "north"
				@direction = "east"
			when "east"
				@direction = "south"
			when "south"
				@direction = "west"
			when "west"
				@direction = "north"
		end
		@action_log.push("Car turned right and headed #{@direction}.")
	end

	def turn_left
		case @direction
			when "north"
				@directon = "west"
			when "west"
				@direction = "south"
			when "south"
				@direction = "east"
			when "east"
				@direction = "north"
		end
		@action_log.push("Car turned left and headed #{@direction}.")
	end

	def accelerate(num)
		@speed += num
		@action_log.push("Car accelerated by #{num} mph to #{@speed} mph.")
	end

	def decelerate(num)
		@speed -= num
		@action_log.push("Car decelerated by #{num} mph to #{@speed} mph.")
	end

	def drive(speed, distance)
		@speed = speed
		@distance_traveled += distance
		@action_log.push("Car drove #{distance} miles at an initial speed of #{speed} mph.")
	end

	def recompensate
		@distance_traveled * @price_per_mile
	end

	def display_action
		@action_log.push("Car has in total driven #{@distance_traveled} miles.")
		@action_log.push("Company owes driver $#{self.recompensate}.")
		@action_log.each {|action| puts action}
	end

end

# 4. Refactored Solution

# I refactored significantly as I wrote / tested here.
# Largest changes:
  # Case statement in turning methods (used to be if / else) - made my logic easier to follow.
  # display_action changed such that at end total miles driven and amount due are displayed.
  # These two pieces of information are to some degree the point of the prorgram.

# 1. DRIVER TESTS GO BELOW THIS LINE

car = Car.new("Honda", "Silver")
car.drive(25, 0.25)

"1. " + (car.speed == 25).to_s
"2. " + (car.distance_traveled == 0.25).to_s

car.stop
car.turn_right

"3. " + (car.speed == 0).to_s
"4. " + (car.direction == "east").to_s 

car.drive(35, 1.5)

"5. " + (car.speed == 35).to_s
"6. " + (car.distance_traveled == 1.75).to_s

car.decelerate(20)

"7. " + (car.speed == 15).to_s

car.drive(15, 0.25)

"8. " + (car.distance_traveled == 2.00).to_s

car.turn_left

"9. " + (car.direction == "north").to_s

car.drive(35, 1.4)

"10. " + (car.distance_traveled == 3.40).to_s

car.stop

"11. " + (car.speed == 0).to_s

car.turn_right
car.drive(35, 2.0)
car.turn_right
car.drive(25, 2.0)
car.accelerate(10)

"12. " + (car.direction == "south").to_s

car.stop
car.display_action

# 5. Reflection 

# I wrote this solution on a plane from Charlotte to Boston and was pleasantly surprised by my productivity.
# The idea of overhauling the turn_left and turn_right methods in order to show compass directions came late in the game and was a welcome change.
# Additionally, I have not used case statements very often in my Ruby experience and this exercise was a good time to practice.
# The next upgrade here I think would be a time element. 
