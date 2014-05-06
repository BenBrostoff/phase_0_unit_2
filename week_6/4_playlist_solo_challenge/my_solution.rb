# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode

# Create two classes - Song and Playlist

# Song needs the following instance variables: @title and @artist
# Song needs a play method that sets play to true or false

# Playlist needs to be able to take multiple song arguments in initialize method 
	# Also need counter keeping track of number of songs created
	# Counter should be class (@@) variable
# Playlist needs the following class methods: play, play_all, display, remove and num of num_of_tracks
# play - set @play to true
# play_all - sequentially go through and set play to true for song playing, then true, then false when done
# remove - 
# 	IF song is on playlist
# 	delete item from playlist
#   ELSE
# 	message to user that song is not on playlist to begin with
# display - console output that shows songs in Playlist
# num_of_tracks - count song objects in Playlist instance


# Initial Solution

class Song

	attr_reader :title, :artist, :playStatus

	def initialize(title, artist)
		@title = title
		@artist = artist
		@playStatus = false
	end

	def play
		@playStatus = true
	end

	def stop_play
		@playStatus = false
	end

end

class Playlist

	attr_reader :songs, :contents, :num_of_tracks

	def initialize(*songs)
		@songs = songs
		@contents = []
		@num_of_tracks = 0
		# @@play_list += 1
		songs.each do |num|
			@num_of_tracks += 1
			contents.push(num)
			num.stop_play
		end
	end

	def add(*song)
		song.each do |num|
			@num_of_tracks += 1
			contents.push(num)
		end
	end

	def remove(*song)
		song.each do |num|
			@num_of_tracks -= 1
			@contents.delete(num)
		end
	end

	def includes?(song)
		@contents.include?(song)
	end

	def play_all #I'm not quite sure how to introduce the element of time here - how do we play songs sequentially?
		@contents.each do |song|
			song.play
		end
	end

	def display
		puts "Songs on this playlist:"
		@contents.each {|song| puts "- " + song.title}
	end


# Refactored Solution

# Added concept of empty playlist warning messages
# Created clear_all method in part to allow for better tests (see above)


	def remove(*song)
		song.each do |num|
			if @contents.include?(num) == false #order matters here or else you get statement due to delete destructiveness
				puts "You don't have this song in your playlist to delete."
			end
			if @contents.include?(num)
				@num_of_tracks -= 1
				@contents.delete(num)
			end
		end
	end

	def clear_all 
	 	@contents = []
	 	@num_of_tracks = 0
	end

end


# DRIVER TESTS GO BELOW THIS LINE (ORIGINAL)
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display


#REVISED DRIVER TEST CODE
#Added new variables to differentiate tests
this_is_africa = Song.new("This is Africa", "Shakira")
hey_papi = Song.new("Hey Papi", "Jennifer Lopez") 
in_too_deep = Song.new("In Too Deep", "Phil Collins")
streets_have_no_name = Song.new("Streets Have No Name", "U2")
ganstas_paradise = Song.new("Gangsta's Paradise", "Coolio")



#SONG METHODS 

p "1. " + (this_is_africa.title == "This is Africa").to_s
p "2. " + (streets_have_no_name.artist == "U2").to_s
p "3. " + (in_too_deep.play == true).to_s

#PLAYLIST METHODS 

ben_playlist = Playlist.new(this_is_africa, hey_papi, in_too_deep, streets_have_no_name, ganstas_paradise)

p "4. " + (ben_playlist.num_of_tracks == 5).to_s

ben_playlist.remove(this_is_africa, in_too_deep)

p "5. " + (ben_playlist.num_of_tracks == 3).to_s
p "6. " + (ben_playlist.includes?(this_is_africa) == false).to_s
p "7. " + (ben_playlist.includes?(hey_papi) == true).to_s

ben_playlist.play_all

p "8. " + (streets_have_no_name.playStatus == true).to_s
p "9. " + (in_too_deep.playStatus == false).to_s

ben_playlist.clear_all
ben_playlist.remove(hey_papi)#=> This command should return message 
#In the future, I'd like how to know how to "test" messages like this that put to the console

p "10. " + (ben_playlist.num_of_tracks == 0).to_s

# Reflection 

# I found this challenge somewhat similar to 2_drawer_debugger 
# It called for similar organization of classes and similar interpretation of errors.
# As noted above, I am having trouble developing tests for messages that put statements to the console.
# I think through exercises like this one, I am getting a better "feel" for instance variables, class organization, method reliance, etc.





