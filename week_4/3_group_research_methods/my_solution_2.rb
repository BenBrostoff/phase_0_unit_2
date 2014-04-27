
i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]

def my_array_sorting_method(source, thing_to_sort = "pets")
	source.sort_by{|num| thing_to_sort}
  # Your code here!
end

print my_array_sorting_method(i_want_pets)