# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge with Armen.



class Boggle

def initialize(board)
	@board = board
end



# Part 1: Access multiple elements of a nested array

# Pseudocode

# Initial Solution

def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution
#The above was in the readme

# DRIVER TESTS GO BELOW THIS LINE



# Reflection 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode

# Initial Solution

def get_row(row)
	@board[row] #used instance variable
end
# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE


# Reflection 



#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode

# Initial Solution

def get_col(col)
colArray = []
i = 0
j = col
while i < @board.length
colArray.push(@board[i][j])
i += 1
end
colArray
end

end


boggle_board = Boggle.new([["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]])
# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE

puts "1." + create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code" #=> returns "code"  
puts "2." + create_word(boggle_board, [0,1], [0,2], [1,2]) == "rad"
puts "3." + boggle_board.get_row(0) == ["b", "r", "a", "e"] 
puts "4." + boggle_board.get_row(3) == ["t", "a", "k", "e"]
puts "5." + boggle_board.get_col(1) == ["r", "o", "c", "a"] 
puts "6." + boggle_board.get_col(2) == ["a", "d", "l", "k"]


# Reflection 