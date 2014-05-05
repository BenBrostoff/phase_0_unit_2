# U2.W5: VirusPredictorirus Predictor

# I worked on this challenge with Armen.


#RELEASE 0 - CODE OUTPUT

#Running the code below before any changes creates a report for Alabama, Jersey, California and Alaska detailing (i) the number of deaths from a virus and (ii) the speed of the spread of the virus.


require_relative 'state_data'


# RELEASE 1 - EXPLANATION OF require_relative
#require_relative allows the programmer to load a file relative to the file you are using require_relative in.
#original_code.rb and state_data.rb are in the same directory, so require_relative works here. 
#require often isn't as effective here if certain files aren't in Ruby's library path.
#To be clear, I'm still figuring out the distinction myself, and mainly am drawing on this S/O post 
#http://stackoverflow.com/questions/3672586/what-is-the-difference-between-require-relative-and-require-in-ruby
#Either way, the idea of require is that it allows you to use a variable or constant, etc. from a different file in your file, thus saving you space and allowing for easier accessibility.


# RELEASE 2 - STATE DATA

#STATE_DATA is a constant (hence the all caps notation) in the form of a hash. 
#The syntax here is interesting and actually only works for Ruby 2.0.0 and up (I kept getting unitialized constant using 1.9.3 and had to update)
#One sort of has a "hash within a hash here". 
#The first form of hash syntax here is {state1 => attributes1, state2 =>attributes2, ...} (which is a hash in itself) 
#The second form of hash syntax is within the attributes, which looks like {attribute1: value1, attribute2: value2, etc.}
#The hash holds all the states with their various data attributes (pop, pop density and regional spread).
#The driver code draws on STATE_DATA in creating instances of VirusPredictor.

# RELEASE 3 - COMMENT EACH METHOD
#See below


class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread) #initialize instance variables
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread

  end


  def virus_effects  #instance variables can be accessed by any method in the class
    #in contrast, local variables / arguments can be only accessed by one method
    #draw on other two methods (basically, just a combination of the two methods below it) - output predicted deaths and speed of spread for an object (a US state
    predicted_deaths
    speed_of_spread
  end

 
 private  #what is this?  what happens if it were cut and pasted above the virus_effects method
  #these are private so you cannot call on these methods
  #making virus_effects private renders it unusable - you get a private method error since because you made it private, you can't call it on objects

  def predicted_deaths #predict deaths based on population density and population
    #removed arguments
    #generalize middle three cases

    pop_multiplier = (@population_density / 50).floor
    pop_factor = 0.1 

    number_of_deaths = (@population * 0.4).floor if @population_density >= 200 #upper bound
    
    number_of_deaths = (@population * 0.05).floor if @population_density < 50 #lower bound

    else number_of_deaths = (@population * (pop_multiplier * pop_factor)).floor


  

    #if @population_density >= 200 #specify conditions - basically, higher pop density and population means more deaths
      #number_of_deaths = (@population * 0.4).floor
    #elsif @population_density >= 150
      #number_of_deaths = (@population * 0.3).floor
    #elsif @population_density >= 100
      #number_of_deaths = (@population * 0.2).floor
    #elsif @population_density >= 50
      #number_of_deaths = (@population * 0.1).floor
    #else 
      #number_of_deaths = (@population * 0.05).floor
    #end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak" #print output to console

  end

  def speed_of_spread #predict speed of virus spread
    #removed arguments
    #generalize cases

    #speed = 0.0 #assume speed is 0 to begin with
    speed = 0.5 #assume speed is 0.5 and that pop density is above or equal to 200

    speed = 2.5 - ((@population_density/50).floor * 0.5) if @population_density < 200 #generalized function
  



    # #if @population_density >= 200 #again, higher pop density means more speed in spread of virus
    #   #speed += 0.5
    # #elsif @population_density >= 150
    #   #speed += 1
    # #elsif @population_density >= 100
    #   #speed += 1.5
    # #elsif @population_density >= 50
    #   #speed += 2
    # else 
    #   speed += 2.5
    # end

    puts " and will spread across the state in #{speed} months.\n\n" #print output to console 

  end



end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


STATE_DATA.each do |k,v| 
  current_state = VirusPredictor.new(k, STATE_DATA[k][:population_density], STATE_DATA[k][:population], STATE_DATA[k][:region], STATE_DATA[k][:regional_spread])
  current_state.virus_effects
end

#Generates report for each state

#alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
#alabama.virus_effects

#jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
#jersey.virus_effects

#california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
#california.virus_effects

#alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
#alaska.virus_effects


# Reflection

# Another good exercise in refactoring - the private methods lent themselves to correction here in that they mostly had linear relationships.
# I probably took longer than I should have trying to find this relationship by drawing out a scatter plot and remembering y = mx + b.
# Additionally, with regard to hash syntax, this exercise taught me the value of upgrading to Ruby 2.0.0. 
# As syntax in languages change, it's important to make sure you're using the most recent version.

