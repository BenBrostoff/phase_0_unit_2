# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself

# 1. Release 0

# class BoggleBoard cannot create an object without an initialize method. 
# In order for boggle_board to exist, BoggleBorad needs an initialize method.

# 2. Pseudocode

# Create three methods - create_word, get_row and get_col
# create_word should take multiple arguments
  #Each argument is structured as a two element array
  #First element is row coordinate
  #Second is column coordinate
  #Convert arguments to coordinates and push into new array
  #Make the new array a string (want to return string output)
# get_row should take integer as argument
  #Output is simply grid[argument]
# get_col works same as get_row, just transpose the grid (rows as cols and vice versa)

# Bonus - get diagonal method
  #Takes starting coordinate  
  #Check that diagonal starts at corner coordinate (per my rule, only way to get diagonal)
     #IF top left, go down left to right
     #IF top right, go down right to left
     #IF bottom left, go up left to right
     #IF bottom right, go up right to left   




# 3. Initial Solution
class BoggleBoard

attr_reader :grid
 
def initialize(grid)
	unless ((grid.length == grid[0].length) == true)
	raise ArgumentError.new("Board must be a square.")
	end
	@grid = grid #array of arrays
	@cols = grid.length #with first being 0
	@rows = grid[0].length #assumption being you always work with a square
end

def create_word(*args)
	word_array = []
	args.each do |coord|
		row = coord[0]
		column = coord[1]
		word_array.push(@grid[row][column])
	end
	return word_array.join("")
end

def get_row(row)
	@grid[row]
end

def get_col(col) 
	transposed_board = @grid.dup.transpose #non-destructive
	transposed_board[col]
end

def get_coord(coord)
	@grid[coord[0]][coord[1]]
end

def get_diagonal(coord)
 word_array = "Not valid coordinates for diagonal"

 if (coord[0] == 0 && coord[1] == 0) #top left
	i = 0
	word_array = []
	while i < @grid.length
		word_array.push(self.get_coord([i,i]))
		i += 1
	end
end

if (coord[0] == @grid.length - 1 && coord[1] == 0) #bottom left
 	i = @grid.length - 1
 	j = 0
 	word_array = []
	while i >= 0 and j < @grid.length
		word_array.push(self.get_coord([i,j]))
 		i -= 1
		j += 1
	 	end
	 end


if (coord[0] == 0 && coord[1] == @grid.length - 1) #top right
	i = 0
	j = @grid.length - 1
	word_array = []
 	while i < @grid.length && j >= 0
 		word_array.push(self.get_coord([i,j]))
 		i += 1
 		j -= 1
		end
	end

if (coord[0] == @grid.length - 1 && coord[1] == @grid.length - 1) #bottom right
	i = @grid.length - 1
	word_array = []
	while i >= 0 
		word_array.push(self.get_coord([i,i]))
		i -= 1
	end
end

return word_array

end

def allPossibleWords

i = 0

while i < @grid.length
p self.get_row(i).join("")
p self.get_col(i).join("")
i += 1
end

max = @grid.length - 1 

p self.get_diagonal([0,0]).join("")
p self.get_diagonal([0,max]).join("")
p self.get_diagonal([max,0]).join("")
p self.get_diagonal([max,max]).join("")

end

end

# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
boggle_board.create_word([1,2], [1,1], [2,1], [3,2])

#Rows, cols and diagonals as words

boggle_board.allPossibleWords

#Take is the only actual word of all possible combos here

# create driver test code to retrieve a value at a coordinate here:

p "1. " + (boggle_board.get_coord([3,2]) == "k").to_s

# implement tests for each of the methods here:

p "2. " + (boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock").to_s
p "3. " + (boggle_board.get_row(0) == ["b", "r", "a", "e"]).to_s
p "4. " + (boggle_board.get_col(0) == ["b", "i", "e", "t"]).to_s
p "5. " + (boggle_board.get_diagonal([0,0]) == ["b", "o", "l", "e"]).to_s
p "6. " + (boggle_board.get_diagonal([3,0]) == ["t", "c", "d", "e"]).to_s
p "7. " + (boggle_board.get_diagonal([0,3]) == ["e", "d", "c", "t"]).to_s
p "8. " + (boggle_board.get_diagonal([3,3]) == ["e", "l", "o", "b"]).to_s
p "9. " + (boggle_board.get_diagonal([2,3]) == "Not valid coordinates for diagonal").to_s


# Try randomizing and searching for other words

alpha = ('a'..'z').to_a
alpha.shuffle

dice_grid = []

for i in 1.. 16 do 
dice_grid.push(alpha[rand(26)])
end

dice_grid = dice_grid.each_slice(4).to_a
 
random_board = BoggleBoard.new(dice_grid)
random_board.allPossibleWords

# 5. Reflection 

# OOP compared to procedural programming gives the programmer significantly more control.
# I like how at any point I can add or eliminate methods, add attr_ methods, change parameter defaults, etc.
# OOP is way more of an intellectual challenge than procedural programming, which is additionally fun.
# One of the harder parts of OOP is writing tests - what may seem like a "pass" or difficult tests to the programmer may differ for another set of eyes.

# I liked this exercise and thought building the diagonals was relatively difficult. I had to draw them out on a separate piece of paper.
# As you're working with an array of arrays here, it's somewhat simple to keep track of the board and row/column coordinates.
# I learned more about using *args here in writing the #create_word - multiple argument methods generally need to use #each. 



# Note that the boggle board above does not get you very many word combos. Including diagonals (which I say can go backwards), there are 12 possible four letter words:
# "brae"
# "biet"
# "iodt"
# "roca"
# "eclr"
# "adlk"
# "take" => only real word
# "etre"
# "bole"
# "tcde"
# "edct"
# "elob"

# I tried randomizing and seeing if any other words came up.

# "msuk"
# "mzol"
# "zmcn"
# "smus"
# "ouan"
# "ucaf"
# "lsft"
# "knnt"
# "mmat"
# "kcul"
# "luck" => coincidentally, I got luck here
# "tamm"




