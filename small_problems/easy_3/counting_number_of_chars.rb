# Counting the Number of Characters

# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# print "Please write a word or multiple words: "
# input_string = gets.chomp.strip
# p input_string

# stripped_string = input_string.delete(' ')
# p stripped_string
# char_count = stripped_string.length
# p char_count

# puts "There are #{char_count} characters in \"#{input_string}\""

# alternate shorter version

print "Please write a word or multiple words: "
input_string = gets.chomp.strip

puts "There are #{input_string.delete(' ').length} characters " \
      "in \"#{input_string}\""
