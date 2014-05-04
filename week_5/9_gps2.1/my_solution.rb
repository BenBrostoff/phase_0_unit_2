# U2.W5: Bakery Challenge GPS

# I worked on this challenge with Colin Trent. 

# Our Refactored Solution

 # This is the file you should end up editing. 
 
# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Ben Brostoff
# 2) Colin Trent

 # This is the file you should end up editing. 
 
def bakery_num(num_of_people, fav_food) 
  
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} 
  
  has_fave = false 

  my_list.each_key do |k| 
    if k == fav_food
      has_fave = true
    end
  end
  
  if has_fave == false
    raise ArgumentError.new("You can't make that food")#raise error if has_fave is #false will catch items that are not included in program
  
  else fav_food_qty = my_list[fav_food]  #setting fav_food_qty equal to value in my_list
  
    if num_of_people % fav_food_qty == 0  #if perfectly divisible...
      num_of_food = num_of_people / fav_food_qty
      return "You need to make #{num_of_food} #{fav_food}(s)."
    
    else #the scenario where the favorite food is not perfectly divisible
      final_hash = my_list 
      my_list.each do |k, v|
          final_hash[k] = num_of_people / v
          num_of_people %= v
      end

      stringOut = "You need to make "
      stringMod = ""
      stringEnd = ""
      mod_hash = final_hash.dup.delete_if {|k, v| k == "cookie" } #Assumes that cookies always feeds one 
      last_hash = final_hash.dup.delete_if {|k, v|k  != "cookie" } #See above

      mod_hash.each do |k,v| 
      stringMod += "#{v}" + " " + "#{k}(s)" + "," + " "
      end

      last_hash.each do |k,v|
      stringEnd += "and #{v}" + " " + "#{k}(s)" + "."
      end
    end
  end
  return stringOut + stringMod + stringEnd #purpose of this is to return as String
end
 


 



#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake! [changed accordingly]
 

#  Reflection 

#While I think this challenge was a good exercise in refactoring, I don't know that Colin and I immediately grasped some of the necessary changes and we struggled a bit initially.
#The largest change we eventually realized we should make is removing a lot of the local variables (e.g. pie_qnty) and the conditionals.
#Indeed, by removing a lot of the conditionals entirely, the tests still passed.
#Jonathan came up with the suggestion to add another hash with the keys as the food items and the values as the output values.
#I think Colin and I did a good job implementing this idea, especially Colin's use of %= (which saved us several lines of code).
#I like my own work here on making the string output, although I don't like the delete_if searching for "cookie" as a key, as it "feels" too specific.  

