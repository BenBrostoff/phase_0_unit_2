# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge with Armen.


boggle_board =  [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]

$boggle_universal = boggle_board


# Part 1: Access multiple elements of a nested array

# Pseudocode

#Take coordinates on a grid in an array of arrays format
#Get the row of the nth coordinate
#Get the column of the nth coordinate
#Store sequentially
#Convert the output to a string such that the letters specified form a word

# Initial Solution

def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution

#The above was in the readme and represents one line of code 
#I do not see an easy way to refactor

# DRIVER TESTS GO BELOW THIS LINE
p "1. " + 
if (create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code")  
"True"
else "False"
end

p "2. " + 
if (create_word(boggle_board, [0,1], [0,2], [1,2]) == "rad")
"True"
else "False"
end

# Reflection 

#Part 1 was easy in that the solution was in the readme - however, I still learned a good amount from the *coords.
#* and plural makes an argument parameter allow for multiple arguments.
#As a result, *coords can take multiple coordinates.
#Note that you can only use .first and .last since this a 2D board (although 3D you could do the same and have a coord[1])
#Basically, you're taking array[][] notation and making a function that allows you to do [arrayoutside[], arrayinside[]]

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode

#Return the nth element in the array of arrays (equal to the row in boggle)

# Initial Solution

def get_row(row)
	$boggle_universal[row] #used global variable
end

# Refactored Solution

#One line of code as it -> refactoring not possible (in my opinion)
#Note that I did technically refactor as my first attempt at this exercise was to create a boggle class
#Only after some work with other students did I realize I should make a global variable

# DRIVER TESTS GO BELOW THIS LINE
p "3. " + 
if (get_row(0) == ["b", "r", "a", "e"])
"True"
else "False"
end 

p "4. " + 
if (get_row(0) == ["a", "c", "l", "r"])
"True"
else "False"
end 


# Reflection 

#Very simple in that each row is just the nth element of the array of arrays

#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode

#Get the nth element in an array nested within an array for all nested arrays
#Keep the nth element constant (e.g. you're pulling 2nd element in all nested arrays)
#Increase the higher-level array element until the end of the array

#Said another way:

#Keep the column constant
#Increase the row number

# Initial Solution

def get_col(col)
colArray = []
i = 0
j = col
while i < $boggle_universal.length
colArray.push($boggle_universal[i][j]) #used global variable
i += 1
end
colArray
end

# Refactored Solution

def get_col(col)
colArray = []
i = 0
while i < $boggle_universal.length
colArray.push($boggle_universal[i][col]) #used global variable
i += 1
end
colArray
end

#There's no need to create the variable j - just use col


# DRIVER TESTS GO BELOW THIS LINE

p "5. " + 
if (get_col(1) == ["r", "o", "c", "a"])
"True"
else "False"
end 

p "6. " + 
if (get_col(2) == ["a", "d", "l", "k"])
"True"
else "False"
end 


# Reflection 

#The hardest of the three challenges in that you really have to think about nesting
#You have an array of arrays wherein the nth element of the array of arrays needs to be accessed
#You can do this by keeping the column number constant and increasing the row #