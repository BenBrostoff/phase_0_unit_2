# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1 (Gabe)
def my_array_finding_method(source, thing_to_find)
    run = source.find_all{|i| i.is_a? String}
    run.find_all{|i| i.include? thing_to_find}

end

def my_hash_finding_method(source, thing_to_find)
    run = source.find_all{|i,j| j == thing_to_find}
    run = run.map{|i,j| i}
end

  # Your code here!
end

# Identify and describe the ruby method you implemented. 
#find_all takes all elements in an array with certain characteristics (specified in a block of code) and returns a new array. 
#
#

# Person 2 (Antonio)
def my_array_modification_method(array, number)
	array = array.map! do |x|
		if x.is_a?(Integer)
			x + number
		else
	  	x
	  end
end
end

def my_hash_modification_method(hash, number)
	hash = hash.merge(hash) do |k, v|
		if v.is_a?(Integer)
			hash[k] = v + number
		else
	  	v
	  end
end
end

#If you want to transform each element in an array but don't want to modify the array, basically you want a transformed copy of the array without altering the original, then #map is your method.
#The Enumerable method #map (also referred to as #collect) takes an enumerable object and a block and evaluates the block for each element and then returns a new array with the calculated values.
#So the outcome of  [1,2,3].map { |n| n*2 } will be [2,4,6].
#However, if you DO want #map to modify an array, then you can use #map! (with exclamation sign at the end of map).
 

# Person 3 (Ben Brostoff)
def my_array_sorting_method(source, thing_to_sort = nil)
	source = source.uniq
	sourceString = source.map{|i| i.to_s}
	sourceString.sort_by{|num| num}
  # Your code here!
end

print my_array_sorting_method(i_want_pets)

def my_hash_sorting_method(source, thing_to_sort = nil)
	source.sort_by{|key,value| value}
  # Your code here!
end

# This may be false depending on how your method deals with ordering the animals with the same ages.

# Identify and describe the ruby method you implemented. 
# I was Person #3 here and responsible for the sorting methods. 
#I used the sort_by method on both the array and hash. 
#Sort_by takes in an object (could be an array or hash) and then a block that is the sorting parameter (e.g. the value in a key-value pair).
#If no block is specified, it will do the standard sort.
# Note that I also used the uniq method for the array sorting method, as some of the tests require that duplicate elements are stripped out of the array. 

# Person 4 (Ian)
def my_array_deletion_method(source, thing_to_delete)
	source.each do |word| if word.to_s.split("").include? thing_to_delete
		source.delete word
	end
end
	 source 
end

def my_hash_deletion_method(source, thing_to_delete)
	source.each_key do |key| if key.include? thing_to_delete
		source.delete key 
	end
end
	source
end

# Identify and describe the ruby method you implemented. 
# I used a simple Include and Delete Method. In both cases, Ruby scans the data structure, and if it finds "The thing to delete" it will delete the index, 
# in the array's case, and the key in the hashes case. 

################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
puts my_array_finding_method(i_want_pets, "t")
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
puts my_hash_finding_method(my_family_pets_ages, 3)
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
puts my_array_sorting_method(i_want_pets)
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]]
puts my_hash_sorting_method(my_family_pets_ages)
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
puts my_array_deletion_method(i_want_pets, "a") 
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
puts my_hash_deletion_method(my_family_pets_ages, "George")




# Reflect!
# This was a great exercise that included researching new methods, refactoring code and debugging.
# I learned a significant amount of new methods (find_all, delete, etc.).
# One issue I know intimately now is you can't use map on hashes - there's a workaround by using each (actually the subject of my blog post).
# Our group could have been slightly better in communicating and debugging together (I wish we had started earlier in the week), but overall a good effort.
# 