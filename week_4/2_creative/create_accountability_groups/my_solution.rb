# U2.W4: Create Accountability Groups


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:

#Array of all NY students

# Output:

#Hash wherein keys: units values: groups
#Arrays of four students
#One set of arrays for each unit
#Formatted such that
   #Unit 1:
   #Unit 2:
   #Unit 3: 

# Steps:

#The idea here is basically to work with several separate loops that take care of repetitive tasks.
#We have a loop for the week.
#We have a loop for groups.
#And we have a loop for people numbers.
#I had this general framework in mind and then perfected as I went on.

# 3. Initial Solution

def formGroups(array) 
    randomArrayU1 = array.shuffle
    randomArrayU1 = randomArrayU1.each_slice(4).to_a
	unit1Data = Hash.new(0)
	unit1Data = randomArrayU1.each {|x| unit1Data[x] = 1}
	i = 1
	puts "UNIT 1"
	while i < unit1Data.length
	puts "Group " + i.to_s + " " + unit1Data[i].to_s
	i += 1
	end
    randomArrayU2 = array.shuffle
    randomArrayU2 = randomArrayU2.each_slice(4).to_a
	unit2Data = Hash.new(0)
	unit2Data = randomArrayU2.each {|x| unit2Data[x] = 2}
	j = 1
	puts ""
	puts "UNIT 2"
	while j < unit2Data.length
	puts "Group " + j.to_s + " " + unit2Data[j].to_s
	j += 1
	end
	
	randomArrayU3 = array.shuffle
    randomArrayU3 = randomArrayU3.each_slice(4).to_a
	unit3Data = Hash.new(0)
	unit3Data = randomArrayU3.each {|x| unit3Data[x] = 3}
	k = 1
	puts ""
	puts "UNIT 3"
	while k < unit3Data.length
	puts "Group " + k.to_s + " " + unit3Data[k].to_s
	k += 1
	end
    
end



# 4. Refactored Solution

#Eliminated copied and pasted code and built loop for units
#Hash removed (see reflection on why I would have liked to use hash)
#Variables renamed for clarity



def formGroups(array) 

	   unit_number = 1
	   
	   while unit_number <= 3
	    puts "" #spacing arrangement
	    randomArray = array.shuffle
	    randomArray = randomArray.each_slice(4).to_a
	    puts "Unit " + unit_number.to_s
	    unit_number += 1
	 
	    group_counter = -1 #set to -1 due to higher position in the nest 
	    person_counter = 0
	    group_number = 1
	    person_number = 1
	    

	    while group_counter < randomArray.length - 1 #to adjust for off by 1 error
	    puts ""
	    puts "Group " + group_number.to_s + ": "
	    group_counter += 1 if randomArray[group_counter].length > 0
	    group_number += 1
	    person_counter = 0 #resetting value for array
	    person_number = 1  #resetting value for output numbering
	    puts ""
	  
	    while person_counter < randomArray[group_counter].length
	    puts "Person " + person_number.to_s + ": " + randomArray[group_counter][person_counter]
	    person_counter += 1
	    person_number += 1
	    end
	    end
	end
	    
		puts " "
		puts "DRIVER TESTS"
		puts " "
	    puts "1. Are there 3 units overall? " + "There are " + (unit_number-1).to_s + " units."
	    puts "2. Are there 6 groups per unit for the NY cohort?" " There are " + randomArray.length.to_s + " groups per unit for the NY cohort."
	    puts "3. Is the largest number of people in any one group 4?" " The largest number of people in any one group is " + randomArray[0].length.to_s + "."
	    
         
	    end



# 1. DRIVER TESTS GO BELOW THIS LINE

nyCohort = ["Ken Mendonca", "Antonio Perez", "Christian Moon", "Stella Kim", "Timoor Kurdi", "Armen Vartan", "Ben Brostoff", "Adrian Soghoian", "Brendan Susens-Jackson", "Drew Teter", "Ian Shuff", "Sid Patel", "Vivek M George", "Daniel Kim", "RJ Arena", "Yariv Kirschner", "Adam Hardy", "Gregory Piccolo", "Nick Giovacchini", "Gabe Garrett", "Jake Wayne", "Lexi Ernst", "Katie Reiner", "Matt Gavaudan"]

puts formGroups(nyCohort)

##DRIVER TESTS ARE IN CONSOLE

## => ALL DRIVER TESTS ASSUME CURRENT NY COHORT SIZE AND GROUPS OF 4, PER ASSIGNMENT
##Number of units is equal to 3
##Number of groups per unit is equal to 6










# 5. Reflection 

#I found it difficult to write the driver test code here, as my output is simply a long sheet of text. It would have been easier if my output was an array or something of that sort.
#The way to check the test code is really to check the console. 
#Presumably, you could have done internal checks within the methods to see how many units were created as well as how many groups per unit.
#The major failing on this challenge was ensuring people who had been in the same group previously were never in the same group again.
#Using hashes and saving separate units would have been the way to do that here. 
#I do think writing this code was a good exercise in writing nested while loops and naming counter variables.

