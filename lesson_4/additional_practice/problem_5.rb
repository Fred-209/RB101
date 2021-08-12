# Practice Problem 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

name_index = nil
flintstones.each_with_index do |name, index|
  break if name_index
  name_index = index if name.start_with?("Be")
end

p name_index


