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
#One thing I'd like to build in here is functionality making sure same groups aren't chosen







# 1. DRIVER TESTS GO BELOW THIS LINE

nyCohort = ["Ken Mendonca", "Antonio Perez", "Christian Moon", "Stella Kim", "Timoor Kurdi", "Armen Vartan", "Ben Brostoff", "Adrian Soghoian", "Brendan Susens-Jackson", "Drew Teter", "Ian Shuff", "Sid Patel", "Vivek M George", "Daniel Kim", "RJ Arena", "Yariv Kirschner", "Adam Hardy", "Gregory Piccolo", "Nick Giovacchini", "Gabe Garrett", "Jake Wayne", "Lexi Ernst", "Katie Reiner", "Matt Gavaudan"]

"1." + formGroups(nyCohort).length == 15 #specifies [15] arrays -> [5] for each unit
"2." + formGroups(nyCohort)[0].length == 3 || 4 #specifies groups of four








# 5. Reflection 


